### To install this Module
1) Add these lines to app.coffee:
	# GenericDataParser routes
	genericDataParserRoutes = require './public/src/modules/GenericDataParser/src/server/routes/GenericDataParserRoutes.js'
	genericDataParserRoutes.setupRoutes(app)

2) Add this line to public/src/modules/ModuleMenus/src/client/ModuleMenusConfiguration.coffee
{isHeader: false, menuName: "Load From Generic Format", mainControllerClassName: "GenericDataParserController"}

###
exports.setupRoutes = (app) ->
	app.post '/api/genericDataParser', exports.parseGenericData


exports.parseGenericData = (request, response)  ->
	request.connection.setTimeout 600000
	serverUtilityFunctions = require '../../../../02_serverAPI/src/server/routes/ServerUtilityFunctions.js'

	response.writeHead(200, {'Content-Type': 'application/json'});
	if global.specRunnerTestmode
		console.log "test mode: "+global.specRunnerTestmode
		serverUtilityFunctions.runRFunction(
			request,
			"public/src/modules/GenericDataParser/src/server/GenericDataParserStub.R",
			"parseGenericData",
			(rReturn) ->
				response.end rReturn
		)
	else
		serverUtilityFunctions.runRFunction(
			request,
			"public/src/modules/GenericDataParser/src/server/generic_data_parser.R",
			"parseGenericData",
			(rReturn) ->
				response.end rReturn
		)




