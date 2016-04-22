_ = require 'underscore'

basicRScriptPreValidation = (payload) ->
	result =
		hasError: false
		hasWarning: false
		errorMessages: []
		transactionId: null
		experimentId: null
		results: null

	if not payload.user?
		result.hasError = true
		result.errorMessages.push
			errorLevel: "error"
			message: "Username is required"

	return result

exports.runRFunction_HIDDEN = (request, rScript, rFunction, returnFunction, preValidationFunction) ->
	config = require '../conf/compiled/conf.js'
	serverUtilityFunctions = require './ServerUtilityFunctions.js'
	rScriptCommand = config.all.server.rscript
	if config.all.server.rscript?
		rScriptCommand = config.all.server.rscript
	else
		rScriptCommand = "Rscript"

	csUtilities = require '../src/javascripts/ServerAPI/CustomerSpecificServerFunctions.js'
	csUtilities.logUsage "About to call R function: "+rFunction, JSON.stringify(request.body), request.body.user
	if preValidationFunction?
		preValErrors = preValidationFunction.call @, request.body
	else
		preValErrors = basicRScriptPreValidation request.body

	if preValErrors.hasError
		console.log preValErrors
		returnFunction.call @, JSON.stringify(preValErrors)

		return

	exec = require('child_process').exec
	Tempfile = require 'temporary/lib/file'

	rCommandFile = new Tempfile
	requestJSONFile = new Tempfile
	stdoutFile =  new Tempfile
	requestJSONFile.writeFile JSON.stringify(request.body), =>

		rCommand = 'tryCatch({ '
		rCommand += '	out <- capture.output(.libPaths("r_libs")); '
		rCommand += '	out <- capture.output(require("rjson")); '
		rCommand += '	out <- capture.output(source("'+rScript+'")); '
		rCommand += '	out <- capture.output(request <- fromJSON(file='+JSON.stringify(requestJSONFile.path)+'));'
		rCommand += '	out <- capture.output(returnValues <- '+rFunction+'(request));'
		rCommand += '	cat(toJSON(returnValues));'
		rCommand += '},error = function(ex) {cat(paste("R Execution Error:",ex));})'
		rCommandFile.writeFile rCommand, =>
			console.log rCommand
			console.log stdoutFile.path
			command = rScriptCommand + " " + rCommandFile.path + " > "+stdoutFile.path+" 2> /dev/null"

			child = exec command,  (error, stdout, stderr) ->
				console.log "stderr: " + stderr
				console.log "stdout: " + stdout
				stdoutFile.readFile encoding: 'utf8', (err, stdoutFileText) =>
					if stdoutFileText.indexOf("R Execution Error") is 0
						message =
							errorLevel: "error"
							message: stdoutFileText
						result =
							hasError: true
							hasWarning: false
							errorMessages: [message]
							transactionId: null
							experimentId: null
							results: null
						returnFunction.call JSON.stringify(result)
						csUtilities.logUsage "Returned R execution error R function: "+rFunction, JSON.stringify(result.errorMessages), request.body.user
					else
						returnFunction.call @, stdoutFileText
						try
							if stdoutFileText.indexOf '"hasError":true' > -1
								csUtilities.logUsage "Returned success from R function with trapped errors: "+rFunction, stdoutFileText, request.body.user
							else
								csUtilities.logUsage "Returned success from R function: "+rFunction, "NA", request.body.user
						catch error
							console.log error

exports.runRFunction = (req, rScript, rFunction, returnFunction, preValidationFunction) ->
	testMode = req.query.testMode
	exports.runRFunctionOutsideRequest req.body.user, req.body, rScript, rFunction, returnFunction, preValidationFunction, testMode

exports.runRFunctionOutsideRequest = (username, argumentsJSON, rScript, rFunction, returnFunction, preValidationFunction, testMode) ->
	request = require 'request'
	config = require '../conf/compiled/conf.js'

	csUtilities = require '../src/javascripts/ServerAPI/CustomerSpecificServerFunctions.js'
	csUtilities.logUsage "About to call RApache function: "+rFunction, JSON.stringify(argumentsJSON), username
	if preValidationFunction?
		preValErrors = preValidationFunction.call @, argumentsJSON
	else
		preValErrors = basicRScriptPreValidation argumentsJSON

	if preValErrors.hasError
		console.log preValErrors
		returnFunction.call @, JSON.stringify(preValErrors)

		return

	requestBody =
		rScript:rScript
		rFunction:rFunction
		request: JSON.stringify(argumentsJSON)

	if testMode or global.specRunnerTestmode
		runRFunctionServiceTestJSON = require '../public/javascripts/spec/testFixtures/runRFunctionServiceTestJSON.js'
		console.log 'test'
		console.log JSON.stringify(runRFunctionServiceTestJSON.runRFunctionResponse.hasError)
		returnFunction.call @, JSON.stringify(runRFunctionServiceTestJSON.runRFunctionResponse)
	else
		request.post
			timeout: 6000000
			url: config.all.client.service.rapache.fullpath + "runfunction"
			json: true
			body: JSON.stringify(requestBody)
		, (error, response, body) =>
			@serverError = error
			@responseJSON = body
			if @serverError? or response?.statusCode != 200 or (@responseJSON? and @responseJSON["RExecutionError"]?)
				if response?.statusCode != 200
					messageText = "Internal error please contact administrator"
				else if (@responseJSON? && @responseJSON["RExecutionError"]?)
					messageText = @responseJSON["RExecutionError"]
				else
					messageText = @serverError
				message =
					errorLevel: "error"
					message: messageText
				result =
					hasError: true
					hasWarning: false
					errorMessages: [message]
					transactionId: null
					experimentId: null
					results:
						htmlSummary: messageText
				returnFunction.call @, JSON.stringify(result)
				csUtilities.logUsage "Returned R execution error R function: "+rFunction, JSON.stringify(result.errorMessages), username
			else
				returnFunction.call @, JSON.stringify(@responseJSON)
				try
					if @responseJSON.hasError
						csUtilities.logUsage "Returned success from R function with trapped errors: "+rFunction, JSON.stringify(@responseJSON), username
					else
						csUtilities.logUsage "Returned success from R function: "+rFunction, "NA", username
				catch error
					console.log error


exports.runRScript = (rScript) ->
	config = require '../conf/compiled/conf.js'
	serverUtilityFunctions = require './ServerUtilityFunctions.js'
	rScriptCommand = config.all.server.rscript
	if config.all.server.rscript?
		rScriptCommand = config.all.server.rscript
	else
		rScriptCommand = "Rscript"

	exec = require('child_process').exec
	command = "export R_LIBS=r_libs && "+ rScriptCommand + " " + rScript + " 2> /dev/null"
	console.log "About to call R script using command: "+command
	child = exec command,  (error, stdout, stderr) ->
		console.log "stderr: " + stderr
		console.log "stdout: " + stdout


### To allow following test routes to work, install this Module
	# ServerUtility function testing routes
	serverUtilityFunctions = require './public/src/modules/02_serverAPI/src/server/routes/ServerUtilityFunctions.js'
	serverUtilityFunctions.setupRoutes(app)

###
exports.setupRoutes = (app) ->
	app.post '/api/runRFunctionTest', exports.runRFunctionTest
	app.post '/api/runRApacheFunctionTest', exports.runRApacheFunctionTest

exports.runRFunctionTest = (request, response)  ->

	response.writeHead(200, {'Content-Type': 'application/json'});

	exports.runRFunction(
		request,
		"public/src/modules/ServerAPI/src/server/RunRFunctionTestStub.R",
		"runRFunctionTest",
		(rReturn) ->
			response.end rReturn
	)

exports.runRApacheFunctionTest = (request, response)  ->

	response.writeHead(200, {'Content-Type': 'application/json'});

	exports.runRApacheFunction(
		request,
		"public/src/modules/ServerAPI/src/server/RunRFunctionTestStub.R",
		"runRFunctionTest",
		(rReturn) ->
			console.log rReturn
			response.end rReturn
	)

exports.getFromACASServer = (baseurl, resp) ->
	request = require 'request'
	request(
			method: 'GET'
			url: baseurl
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				resp.end JSON.stringify json
			else
				resp.statusCode = 500
				resp.end "Could not get from ACAS Server"
				console.log 'got ajax error'
				console.log error
				console.log json
				console.log response
	)


exports.ensureExists = (path, mask, cb) ->
	fs = require 'fs'
	fs.mkdir path, mask, (err) ->
		if err
			if err.code is "EEXIST" # ignore the error if the folder already exists
				cb null
			else # something else went wrong
				cb err
		else # successfully created folder
			console.log "Created new directory: "+path
			cb null
		return

	return

exports.makeAbsolutePath = (relativePath) ->
	acasPath = process.env.PWD
	dotMatches = relativePath.match(/\.\.\//g)
	if dotMatches?
		numDotDots = relativePath.match(/\.\.\//g).length
		relativePath = relativePath.replace /\.\.\//g, ''
		for d in [1..numDotDots]
			acasPath = acasPath.replace /[^\/]+\/?$/, ''
	else
		acasPath+= '/'

	console.log acasPath+relativePath+'/'
	acasPath+relativePath+'/'

exports.getFileValuesFromEntity = (thing, ignoreSaved) ->
	fvs = []
	for state in thing.lsStates
		vals = state.lsValues
		for v in vals
			if (v.lsType == 'fileValue' && !v.ignored && v.fileValue != "" && v.fileValue != undefined)
				unless (ignoreSaved and v.id?)
					fvs.push v
	fvs

exports.getFileValuesFromCollection = (collection, ignoreSaved) ->
	fvs = []
	unless collection.lsStates?
		collection = JSON.parse collection
	for state in collection.lsStates
		vals = state.lsValues
		for v in vals
			if (v.lsType == 'fileValue' && !v.ignored && v.fileValue != "" && v.fileValue != undefined)
				unless (ignoreSaved and v.id?)
					fvs.push v
	if fvs.length > 0
		return fvs
	else
		return null

controllerRedirect= require '../src/javascripts/ServerAPI/ControllerRedirectConf.js'
exports.getRelativeFolderPathForPrefix = (prefix) ->
	if controllerRedirect.controllerRedirectConf[prefix]?
		entityDef = controllerRedirect.controllerRedirectConf[prefix]
		return entityDef.relatedFilesRelativePath + "/"
	else
		return null

exports.getPrefixFromEntityCode = (code) ->
	for pref, redir of controllerRedirect.controllerRedirectConf
		if code.indexOf(pref) > -1
			return pref
	return null

exports.createLSTransaction = (date, comments, callback) ->
	if global.specRunnerTestmode
		console.log "create lsTransaction stubsMode"
		callback
			comments: "test transaction"
			date: 1427414400000
			id: 1234
			version: 0
	else
		config = require '../conf/compiled/conf.js'
		request = require 'request'
		request(
			method: 'POST'
			url: config.all.client.service.persistence.fullpath+"lstransactions"
			json: true
			body:
				recordedDate: date
				comments: comments
		, (error, response, json) ->
			if !error && response.statusCode == 201
				callback json
			else
				console.log 'got connection error trying to create an lsTransaction'
				console.log error
				console.log json
				console.log response
				callback null
		)

exports.insertTransactionIntoEntity = (transactionid, entity) ->
	entity.lsTransaction = transactionid
	if entity.lsLabels?
		for lab in entity.lsLabels
			lab.lsTransaction = transactionid
	if entity.lsStates?
		for state in entity.lsStates
			state.lsTransaction = transactionid
			for val in state.lsValues
				val.lsTransaction = transactionid

	entity


exports.getStatesByTypeAndKind = (acasEntity, type, kind) ->
	_ = require 'underscore'
	_.filter acasEntity.lsStates, (state) ->
		(not state.ignored == true) and (state.lsType == type) and (state.lsKind == kind)

exports.getValuesByTypeAndKind = (state, type, kind) ->
	_ = require 'underscore'
	_.filter state.lsValues, (value) ->
		(not value.ignored == true) and (value.lsType == type) and (value.lsKind == kind)

exports.getStateValueByTypeAndKind = (acasEntity, stype, skind, vtype, vkind) ->
	value = null
	states = exports.getStatesByTypeAndKind acasEntity, stype, skind
	if states.length > 0
#TODO get most recent state and value if more than 1 or throw error
		values = exports.getValuesByTypeAndKind states[0], vtype, vkind
		if values.length > 0
			value = values[0]
	value


