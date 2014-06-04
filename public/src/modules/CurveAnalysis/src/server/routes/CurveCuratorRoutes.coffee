
exports.setupRoutes = (app, loginRoutes) ->
	app.get '/api/curves/stubs/:exptCode', loginRoutes.ensureAuthenticated, exports.getCurveStubs
	app.get '/api/curve/detail/:id', loginRoutes.ensureAuthenticated, exports.getCurveDetail
	app.put '/api/curve/detail/:id', loginRoutes.ensureAuthenticated, exports.refitCurve
	app.get '/curveCurator/*', loginRoutes.ensureAuthenticated, exports.curveCuratorIndex

exports.getCurveStubs = (req, resp) ->
	if global.specRunnerTestmode
		curveCuratorTestData = require '../public/javascripts/spec/testFixtures/curveCuratorTestFixtures.js'
		resp.end JSON.stringify curveCuratorTestData.curveCuratorThumbs
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.rapache.fullpath+"/experimentcode/curveids/?experimentcode="
		request = require 'request'
		console.log baseurl+req.params.exptCode
		request(
			method: 'GET'
			url: baseurl+req.params.exptCode
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				console.log JSON.stringify json
				resp.end JSON.stringify json
			else
				console.log 'got ajax error trying to retrieve curve stubs'
				console.log error
				console.log json
				console.log response
				resp.end 'error'
		)

exports.getCurveDetail = (req, resp) ->
	if global.specRunnerTestmode
		curveCuratorTestData = require '../public/javascripts/spec/testFixtures/curveCuratorTestFixtures.js'
		resp.end JSON.stringify curveCuratorTestData.curveDetail
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.rapache.fullpath+"/curve/detail/?id="
		request = require 'request'
		request(
			method: 'GET'
			url: baseurl+req.params.id
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				console.log JSON.stringify json
				resp.end JSON.stringify json
			else
				console.log 'got ajax error trying to retrieve curve detail'
				console.log error
				console.log json
				console.log response
				resp.end 'error'
		)

exports.updateCurveUserApproval = (req, resp) ->
	if global.specRunnerTestmode
		curveCuratorTestData = require '../public/javascripts/spec/testFixtures/curveCuratorTestFixtures.js'
		resp.end JSON.stringify curveCuratorTestData.updateCurveUserApproval
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.rapache.fullpath+"/curve/detail/approval"
		request = require 'request'
		console.log JSON.stringify req.body
		request(
			method: 'POST'
			url: baseurl
			body: JSON.stringify req.body
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				resp.end JSON.stringify json
			else
				console.log 'got ajax error trying to refit curve'
				console.log error
				console.log json
				console.log response
				resp.end 'error'
		)

exports.refitCurve = (req, resp) ->
	if global.specRunnerTestmode
		curveCuratorTestData = require '../public/javascripts/spec/testFixtures/curveCuratorTestFixtures.js'
		resp.end JSON.stringify curveCuratorTestData.curveDetail
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.rapache.fullpath+"/curve/detail"
		request = require 'request'
		console.log JSON.stringify req.body
		request(
			method: 'POST'
			url: baseurl
			body: JSON.stringify req.body
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				resp.end JSON.stringify json
			else
				console.log 'got ajax error trying to refit curve'
				console.log error
				console.log json
				console.log response
				resp.end json
		)

exports.curveCuratorIndex = (req, resp) ->
	global.specRunnerTestmode = if global.stubsMode then true else false
	scriptPaths = require './RequiredClientScripts.js'
	config = require '../conf/compiled/conf.js'
	scriptsToLoad = scriptPaths.requiredScripts.concat(scriptPaths.applicationScripts)
	if config.all.client.require.login
		loginUserName = req.user.username
		loginUser = req.user
	else
		loginUserName = "nouser"
		loginUser =
			id: 0,
			username: "nouser",
			email: "nouser@nowhere.com",
			firstName: "no",
			lastName: "user"

	return resp.render 'CurveCurator',
		title: 'Curve Curator'
		scripts: scriptsToLoad
		AppLaunchParams:
			loginUserName: loginUserName
			loginUser: loginUser
			testMode: global.specRunnerTestmode
			moduleLaunchParams: if moduleLaunchParams? then moduleLaunchParams else null
			deployMode: global.deployMode
