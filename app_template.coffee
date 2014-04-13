csUtilities = require "./public/src/conf/CustomerSpecificServerFunctions.js"

startApp = ->
# Regular system startup
	config = require './conf/compiled/conf.js'
	express = require('express')
	user = require('./routes/user')
	http = require('http')
	path = require('path')

	# Added for logging support
	flash = require 'connect-flash'
	passport = require 'passport'
	util = require 'util'
	LocalStrategy = require('passport-local').Strategy
	global.deployMode = config.all.client.deployMode

	global.stubsMode = false
	testModeOverRide = process.argv[2]
	unless typeof testModeOverRide == "undefined"
		if testModeOverRide == "stubsMode"
			global.stubsMode = true
			console.log "############ Starting in stubs mode"


	global.app = express()
	app.configure( ->
		app.set('port', config.all.client.port)
		app.set('views', __dirname + '/views')
		app.set('view engine', 'jade')
		app.use(express.favicon())
		app.use(express.logger('dev'))
		app.use(express.bodyParser())
		app.use(express.methodOverride())
		app.use(express.static(path.join(__dirname, 'public')))
		# added for login support
		app.use(express.cookieParser())
		app.use(express.session({ secret: 'acas needs login', cookie: { maxAge: 365 * 24 * 60 * 60 * 1000 } }, ))
		app.use(flash())
		app.use(passport.initialize())
		app.use(passport.session())
		# It's important to start the router after everything else is configured
		app.use(app.router)

	)
	#TODO Do we need these next three lines? What do they do?
	app.configure('development', ->
		app.use(express.errorHandler())
		console.log "node dev mode set"
	)

	# login routes
	passport.serializeUser (user, done) ->
		done null, user.username
	passport.deserializeUser (username, done) ->
		csUtilities.findByUsername username, (err, user) ->
			done err, user
	passport.use new LocalStrategy csUtilities.loginStrategy

	loginRoutes = require './routes/loginRoutes'
	loginRoutes.setupRoutes(app, passport)

	# index routes
	indexRoutes = require('./routes/index.js')
	indexRoutes.setupRoutes(app, loginRoutes)
	###TO_BE_REPLACED_BY_PREPAREMODULEINCLUDES###

	if not config.all.client.use.ssl
		http.createServer(app).listen(app.get('port'), ->
			console.log("Express server listening on port " + app.get('port'))
		)
	else
		console.log "------ Starting in SSL Mode"
		https = require('https');
		fs = require('fs');
		sslOptions =
			key: fs.readFileSync config.all.server.ssl.key.file.path
			cert: fs.readFileSync config.all.server.ssl.cert.file.path
			ca: fs.readFileSync config.all.server.ssl.cert.authority.file.path
			passphrase: config.all.server.ssl.cert.passphrase
		https.createServer(sslOptions, app).listen(app.get('port'), ->
			console.log("Express server listening on port " + app.get('port'))
		)
		#TODO hack to prevent bug: https://github.com/mikeal/request/issues/418
		process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0"

	csUtilities.logUsage("ACAS Node server started", "started", "")

startApp()

