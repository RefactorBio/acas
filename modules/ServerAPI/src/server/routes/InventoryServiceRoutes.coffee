serverUtilityFunctions = require './ServerUtilityFunctions.js'
csUtilities = require '../src/javascripts/ServerAPI/CustomerSpecificServerFunctions.js'
_ = require 'underscore'
preferredEntityCodeService = require '../routes/PreferredEntityCodeService.js'

exports.setupAPIRoutes = (app) ->
	app.post '/api/getContainersInLocation', exports.getContainersInLocation
	app.post '/api/getContainerCodesByLabels', exports.getContainerCodesByLabels
	app.post '/api/getContainersByLabels', exports.getContainersByLabels
	app.post '/api/getContainersByCodeNames', exports.getContainersByCodeNames
	app.post '/api/getWellCodesByPlateBarcodes', exports.getWellCodesByPlateBarcodes
	app.post '/api/getWellContent', exports.getWellContent
	app.put '/api/containersByContainerCodes', exports.updateContainersByContainerCodes
	app.put '/api/containerByContainerCode', exports.updateContainerByContainerCode
	app.get '/api/getContainerAndDefinitionContainerByContainerLabel/:label', exports.getContainerAndDefinitionContainerByContainerLabel
	app.post '/api/getContainerAndDefinitionContainerByContainerCodeNames', exports.getContainerAndDefinitionContainerByContainerCodeNames
	app.post '/api/getDefinitionContainersByContainerCodeNames', exports.getDefinitionContainersByContainerCodeNames
	app.put '/api/containers/jsonArray', exports.updateContainers
	app.post '/api/getBreadCrumbByContainerCode', exports.getBreadCrumbByContainerCode
	app.post '/api/getWellCodesByContainerCodes', exports.getWellCodesByContainerCodes
	app.get '/api/containers', exports.getAllContainers
	app.get '/api/containers/:lsType/:lsKind', exports.containersByTypeKind
	app.get '/api/containers/:code', exports.containerByCodeName
	app.post '/api/containers', exports.postContainer
	app.put '/api/containers/:code', exports.putContainer
	app.post '/api/validateContainerName', exports.validateContainerName
	app.post '/api/getContainerCodesFromLabels', exports.getContainerCodesFromLabels
	app.post '/api/getContainerFromLabel', exports.getContainerFromLabel
	app.post '/api/updateWellContent', exports.updateWellContent
	app.post '/api/moveToLocation', exports.moveToLocation
	app.get '/api/getWellContentByContainerLabel/:label', exports.getWellContentByContainerLabel
	app.post '/api/getWellContentByContainerLabels', exports.getWellContentByContainerLabels
	app.post '/api/cloneContainers', exports.cloneContainers
	app.post '/api/cloneContainer', exports.cloneContainer
	app.post '/api/splitContainer', exports.splitContainer
	app.get '/api/getDefinitionContainerByNumberOfWells/:lsType/:lsKind/:numberOfWells', exports.getDefinitionContainerByNumberOfWells
	app.post '/api/searchContainers', exports.searchContainers


exports.setupRoutes = (app, loginRoutes) ->
	app.post '/api/getContainersInLocation', loginRoutes.ensureAuthenticated, exports.getContainersInLocation
	app.post '/api/getContainerCodesByLabels', loginRoutes.ensureAuthenticated, exports.getContainerCodesByLabels
	app.post '/api/getContainersByLabels', loginRoutes.ensureAuthenticated, exports.getContainersByLabels
	app.post '/api/getContainersByCodeNames', loginRoutes.ensureAuthenticated, exports.getContainersByCodeNames
	app.post '/api/getWellCodesByPlateBarcodes', loginRoutes.ensureAuthenticated, exports.getWellCodesByPlateBarcodes
	app.post '/api/getWellContent', loginRoutes.ensureAuthenticated, exports.getWellContent
	app.put '/api/containersByContainerCodes', loginRoutes.ensureAuthenticated, exports.updateContainersByContainerCodes
	app.put '/api/containerByContainerCode', loginRoutes.ensureAuthenticated, exports.updateContainerByContainerCode
	app.get '/api/getContainerAndDefinitionContainerByContainerLabel/:label', loginRoutes.ensureAuthenticated, exports.getContainerAndDefinitionContainerByContainerLabel
	app.post '/api/getContainerAndDefinitionContainerByContainerCodeNames', loginRoutes.ensureAuthenticated, exports.getContainerAndDefinitionContainerByContainerCodeNames
	app.post '/api/getDefinitionContainersByContainerCodeNames', loginRoutes.ensureAuthenticated, exports.getDefinitionContainersByContainerCodeNames
	app.put '/api/containers/jsonArray', loginRoutes.ensureAuthenticated, exports.updateContainers
	app.post '/api/getBreadCrumbByContainerCode', loginRoutes.ensureAuthenticated, exports.getBreadCrumbByContainerCode
	app.post '/api/getWellCodesByContainerCodes', loginRoutes.ensureAuthenticated, exports.getWellCodesByContainerCodes
	app.get '/api/containers', loginRoutes.ensureAuthenticated, exports.getAllContainers
	app.get '/api/containers/:lsType/:lsKind', loginRoutes.ensureAuthenticated, exports.containersByTypeKind
	app.get '/api/containers/:code', loginRoutes.ensureAuthenticated, exports.containerByCodeName
	app.post '/api/containers', loginRoutes.ensureAuthenticated, exports.postContainer
	app.put '/api/containers/:code', loginRoutes.ensureAuthenticated, exports.putContainer
	app.post '/api/validateContainerName', loginRoutes.ensureAuthenticated, exports.validateContainerName
	app.post '/api/getContainerCodesFromLabels', loginRoutes.ensureAuthenticated, exports.getContainerCodesFromLabels
	app.post '/api/getContainerFromLabel', loginRoutes.ensureAuthenticated, exports.getContainerFromLabel
	app.post '/api/updateWellContent', loginRoutes.ensureAuthenticated, exports.updateWellContent
	app.post '/api/moveToLocation', loginRoutes.ensureAuthenticated, exports.moveToLocation
	app.get '/api/getWellContentByContainerLabel/:label', loginRoutes.ensureAuthenticated, exports.getWellContentByContainerLabel
	app.post '/api/getWellContentByContainerLabels', loginRoutes.ensureAuthenticated, exports.getWellContentByContainerLabels
	app.post '/api/cloneContainers', loginRoutes.ensureAuthenticated, exports.cloneContainers
	app.post '/api/cloneContainer', loginRoutes.ensureAuthenticated, exports.cloneContainer
	app.post '/api/splitContainer', loginRoutes.ensureAuthenticated, exports.splitContainer
	app.get '/api/getDefinitionContainerByNumberOfWells/:lsType/:lsKind/:numberOfWells', loginRoutes.ensureAuthenticated, exports.getDefinitionContainerByNumberOfWells
	app.post '/api/searchContainers', loginRoutes.ensureAuthenticated, exports.searchContainers

exports.getContainersInLocation = (req, resp) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getContainersInLocationResponse
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/getContainersInLocation"
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: req.body
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				resp.json json
			else
				console.error 'got ajax error trying to get getContainersInLocation'
				console.error error
				console.error json
				console.error response
				resp.end JSON.stringify "getContainersInLocation failed"
  		)

exports.getContainersByLabels = (req, resp) ->
	exports.getContainersByLabelsInternal req.body, req.query.containerType, req.query.containerKind, req.query.labelType, req.query.labelKind, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.getContainersByLabelsInternal = (containerLabels, containerType, containerKind, labelType, labelKind, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getContainersByLabelsInternalResponse
	else
		console.debug 'incoming getContainersByLabelsInternal request: ', JSON.stringify(containerLabels), containerType, containerKind, labelType, labelKind
		exports.getContainerCodesByLabelsInternal containerLabels, containerType, containerKind, labelType, labelKind, (containerCodes, statusCode) =>
			if statusCode == 500
				callback JSON.stringify("getContainersByLabels failed"), 500
			else
				codeNames = _.map containerCodes, (code) ->
					if code.foundCodeNames[0]?
						code.foundCodeNames[0]
					else
						""
				codeNamesJSON = JSON.stringify codeNames
				exports.getContainersByCodeNamesInternal codeNamesJSON, (containers, statusCode) =>
					if statusCode == 400
						console.debug "got errors requesting code names: #{JSON.stringify containers}"
					if statusCode == 500
						callback JSON.stringify "getContainersByLabels failed", 500
					else
						response = []
						for label, index in containerLabels
							resp =
								label: label
								codeName: null
								container: null
							codeName =  containerCodes[index]
							if codeName?.foundCodeNames[0]?
								resp.codeName = codeName.foundCodeNames[0]
							container = _.findWhere(containers, {'containerCodeName': resp.codeName})
							if container?.container?
								resp.container = container.container
							if container?.level?
								resp.level = container.level
							if container?.message?
								resp.message = container.message
							response.push resp
						callback response, statusCode

exports.getContainerCodesByLabels = (req, resp) ->
	exports.getContainerCodesByLabelsInternal req.body, req.query.containerType, req.query.containerKind, req.query.labelType, req.query.labelKind, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.getContainerCodesByLabelsInternal = (containerCodesJSON, containerType, containerKind, labelType, labelKind, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getContainerCodesByLabelsResponse
	else
		console.debug 'incoming getContainerCodesByLabelsInternal request: ', JSON.stringify(containerCodesJSON), containerType, containerKind, labelType, labelKind
		config = require '../conf/compiled/conf.js'
		queryParams = []
		if containerType?
			queryParams.push "containerType="+containerType
		if containerKind?
			queryParams.push "containerKind="+containerKind
		if labelType?
			queryParams.push "labelType="+labelType
		if labelKind?
			queryParams.push "labelKind="+labelKind
		queryString = queryParams.join "&"
		baseurl = config.all.client.service.persistence.fullpath+"containers/getContainerCodesByLabels?"+queryString
		console.debug 'base url: ', baseurl
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: JSON.stringify containerCodesJSON
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			if !error && json[0] != "<"
				callback json, response.statusCode
			else
				console.error 'got ajax error trying to get getContainerCodesByLabels'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify("getContainerCodesByLabels failed"), 500
		)

exports.getWellCodesByPlateBarcodes = (req, resp) ->
	exports.getWellCodesByPlateBarcodesInternal req.body, (json) ->
		if json.indexOf('failed') > -1
			resp.statusCode = 500
		else
			resp.json json

exports.getWellCodesByPlateBarcodes = (req, resp) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getWellCodesByPlateBarcodesResponse
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/getWellCodesByPlateBarcodes"
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: req.body
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				resp.json json
			else
				console.error 'got ajax error trying to get getWellCodesByPlateBarcodes'
				console.error error
				console.error json
				console.error response
				resp.end JSON.stringify "getWellCodesByPlateBarcodes failed"
  		)

exports.getWellContent = (req, resp) ->
	exports.getWellContentInternal req.body, (json) ->
		if json.indexOf('failed') > -1
			resp.statusCode = 500
		else
			resp.json json

exports.getWellContentInternal = (wellCodeNames, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		callback inventoryServiceTestJSON.getWellContentResponse
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/getWellContent"
		request = require 'request'
		console.debug 'calling service', baseurl
		request(
			method: 'POST'
			url: baseurl
			body: JSON.stringify wellCodeNames
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			if !error && response.statusCode == 200
				console.debug 'returned success from service', baseurl
				callback json
			else
				console.error 'got ajax error trying to get getWellContent'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify "getWellContent failed"
  		)

exports.getContainerAndDefinitionContainerByContainerLabel = (req, resp) ->
	exports.getContainerAndDefinitionContainerByContainerLabelInternal [req.params.label], (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json[0]

exports.getContainerAndDefinitionContainerByContainerLabelInternal = (labels, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getContainerAndDefinitionContainerByContainerLabelInternalResponse
	else
		console.debug "incoming getContainerAndDefinitionContainerByContainerLabelInternal request: '#{JSON.stringify(labels)}'"
		exports.getContainerCodesByLabelsInternal labels, null, null, null, null, (containerCodes, statusCode) =>
			if statusCode == 500
				callback JSON.stringify "getContainerAndDefinitionContainerByContainerLabelInternal failed", statusCode
			else
				codeNames = _.map containerCodes, (code) ->
					if code.foundCodeNames[0]?
						code.foundCodeNames[0]
					else
						""
				exports.getContainerAndDefinitionContainerByContainerCodeNamesInternal codeNames, (json, statusCode) =>
					if statusCode == 500
						callback JSON.stringify "getContainerAndDefinitionContainerByContainerLabelInternal failed", statusCode
					else
						callback json, statusCode

exports.getContainerAndDefinitionContainerByContainerCodeNames = (req, resp) ->
	exports.getContainerAndDefinitionContainerByContainerCodeNamesInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.getContainerAndDefinitionContainerByContainerCodeNamesInternal = (containerCodes, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getContainerAndDefinitionContainerByContainerCodeNamesInternalResponse
	else
		console.debug "incoming getContainerAndDefinitionContainerByContainerCodeNames request: '#{JSON.stringify(containerCodes)}'"
		exports.getContainersByCodeNamesInternal containerCodes, (containers, statusCode) =>
			if statusCode == 400
				console.error "got errors requesting code names: #{JSON.stringify containers}"
				callback containers, 400
				return
			if statusCode == 500
				callback JSON.stringify "getContainerAndDefinitionContainerByContainerCodeNames failed", statusCode
			else
				exports.getDefinitionContainersByContainerCodeNamesInternal containerCodes, (definitions, statusCode) =>
					if statusCode == 500
						callback JSON.stringify "getContainerAndDefinitionContainerByContainerCodeNames failed", statusCode
					else
						outArray = []
						for containerCode, index in containerCodes
							container = _.findWhere(containers, {'containerCodeName': containerCode})
							if container.container?
								container = container.container
								console.debug "found container type: #{container.lsType}"
								console.debug "found container kind: #{container.lsKind}"
								containerPreferredEntity = preferredEntityCodeService.getSpecificEntityTypeByTypeKindAndCodeOrigin container.lsType, container.lsKind, "ACAS Container"
								if containerPreferredEntity?
									console.debug "found preferred entity: #{JSON.stringify(containerPreferredEntity)}"
								else
									console.error "could not find preferred entity for ls type and kind, here are the configured entity types"
									preferredEntityCodeService.getConfiguredEntityTypes false, (types)->
										console.error types
								console.debug "here is the container as returned by tomcat: #{JSON.stringify(container, null, '  ')}"
								container = new containerPreferredEntity.model(container)
								definitionPreferredEntity = preferredEntityCodeService.getSpecificEntityTypeByTypeKindAndCodeOrigin definitions[index].definition.lsType, definitions[index].definition.lsKind, "ACAS Container"
								definition = new definitionPreferredEntity.model(definitions[index].definition)
								containerValues =  container.getValues()
								console.debug "here are the values of the container: #{JSON.stringify(containerValues,null, '  ')}"
								definitionValues =  definition.getValues()
								console.debug "here are the values of the definition container: #{JSON.stringify(definitionValues,null, '  ')}"
								out = _.extend containerValues, definitionValues
								out.barcode = container.get('barcode').get("labelText")
								out.codeName = containerCode
								out.definitionCodeName = definition.get('codeName')
								out.recordedBy = container.get('recordedBy')
								outArray.push out
							else
								console.error "could not find container #{containerCode}"
						console.debug "output of getContainerAndDefinitionContainerByContainerCodeNames: #{JSON.stringify(outArray,null, '  ')}"
						callback outArray, 200

exports.updateContainerByContainerCode = (req, resp) ->
	exports.updateContainersByContainerCodesInternal [req.body], req.query.callCustom, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json[0]

exports.updateContainersByContainerCodes = (req, resp) ->
	exports.updateContainersByContainerCodesInternal req.body, req.query.callCustom, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.updateContainersByContainerCodesInternal = (updateInformation, callCustom, callback) ->
	# If call custom doesn't equal 0 then call custom
	callCustom  = callCustom != "0"
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.updateContainerMetadataByContainerCodeResponse
	else
		console.debug "incoming updateContainersByContainerCodesInternal request: #{JSON.stringify(updateInformation)}"
		codeNames = _.pluck updateInformation, "codeName"
		console.debug "calling getContainersByCodeNamesInternal"
		exports.getContainersByCodeNamesInternal codeNames, (containers, statusCode) =>
			console.debug "containers from service"
			if statusCode == 400
				console.error "got errors requesting code names: #{JSON.stringify containers}"
				callback containers, 400
			if statusCode == 500
				console.errror "updateContainerMetadataByContainerCodeInternal failed: #{JSON.stringify containers}"
				callback JSON.stringify "updateContainerMetadataByContainerCodeInternal failed", 500
				return
			else
				barcodes = _.pluck updateInformation, "barcode"
				console.debug "calling getContainerCodesByLabelsInternal"
				exports.getContainerCodesByLabelsInternal barcodes, null, null, "barcode", "barcode", (containerCodes, statusCode) =>
					if statusCode == 500
						console.errror "updateContainerMetadataByContainerCodeInternal failed: #{JSON.stringify containerCodes}"
						callback "updateContainersByContainerCodesInternal failed", 500
						return
					console.debug "return from getContainerCodesByLabelsInternal with #{JSON.stringify(containerCodes)}"
					containerArray = []
					for updateInfo, index in updateInformation
						container = _.findWhere(containers, {'containerCodeName': updateInfo.codeName})
						if container.container?
							container = container.container
							console.debug "found container type: #{container.lsType}"
							console.debug "found container kind: #{container.lsKind}"
							preferredEntity = preferredEntityCodeService.getSpecificEntityTypeByTypeKindAndCodeOrigin container.lsType, container.lsKind, "ACAS Container"
							if preferredEntity?
								console.debug "found preferred entity: #{JSON.stringify(preferredEntity)}"
							else
								console.debug "could not find preferred entity for ls type and kind, here are the configured entity types"
								preferredEntityCodeService.getConfiguredEntityTypes false, (types)->
									console.debug types
							container = new preferredEntity.model(container)
							if updateInfo.barcode?
								if containerCodes[index].foundCodeNames.length > 1
									message = "conflict: found more than 1 container plate barcode for label #{containerCodes[index].requestLabel}: #{containerCodes[index].foundCodeNames.join(",")}"
									console.error message
									callback message, 409
									return
								else
									if containerCodes[index].foundCodeNames.length == 0 || containerCodes[index].foundCodeNames[0] == updateInfo.codeName
										container.get('barcode').set("labelText", updateInfo.barcode)
									else
										message = "conflict: barcode '#{updateInfo.barcode}' is already associated with container code '#{containerCodes[index].foundCodeNames[0]}'"
										console.error message
										callback message, 409
										return
							container.updateValuesByKeyValue updateInfo
							container.prepareToSave updateInformation[0].recordedBy
							container.reformatBeforeSaving()
							containerArray.push container.attributes
						else
							console.error "could not find container #{updateInfo.codeName}"
					containerJSONArray = JSON.stringify(containerArray)
					exports.updateContainersInternal containerJSONArray, (savedContainers, statusCode) =>
						if statusCode == 500
							callback JSON.stringify("updateContainersByContainerCodesInternal failed"), 500
							return
						else
							for updateInfo, index in updateInformation
								preferredEntity = preferredEntityCodeService.getSpecificEntityTypeByTypeKindAndCodeOrigin savedContainers[index].lsType, savedContainers[index].lsKind, "ACAS Container"
								savedContainer = new preferredEntity.model(savedContainers[index])
								updateInformation[index].barcode = savedContainer.get('barcode').get("labelText")
								values =  savedContainer.getValuesByKey(Object.keys(updateInfo))
								for key of values
									updateInformation[index][key] = values[key]
							callback updateInformation, 200
							if callCustom
								if csUtilities.updateContainersByContainerCodes?
									console.log "running customer specific server function updateContainersByContainerCodes"
									csUtilities.updateContainersByContainerCodes updateInfo, (response) ->
										console.log response
								else
									console.warn "could not find customer specific server function updateContainersByContainerCodes so not running it"
#
exports.getContainersByCodeNames = (req, resp) ->
	exports.getContainersByCodeNamesInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.getContainersByCodeNamesInternal = (codeNamesJSON, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getContainersByCodeNames
	else
		console.debug 'incoming getContainersByCodeNamesInternal request: ', JSON.stringify(codeNamesJSON)
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/getContainersByCodeNames"
		console.debug 'base url: ', baseurl
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: codeNamesJSON
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			console.debug "response statusCode: #{response.statusCode}"
			if !error && json[0] != "<"
				callback json, response.statusCode
			else
				console.error 'got ajax error trying to get getContainersByCodeNames'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify("getContainersByCodeNames failed"), 500
		)

exports.getDefinitionContainersByContainerCodeNames = (req, resp) ->
	exports.getDefinitionContainersByContainerCodeNamesInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.getDefinitionContainersByContainerCodeNamesInternal = (codeNamesJSON, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getDefinitionContainersByContainerCodeNames
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/getDefinitionContainersByContainerCodeNames"
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: codeNamesJSON
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			if !error
				callback json, response.statusCode
			else
				console.error 'got ajax error trying to get getDefinitionContainersByContainerCodeNames'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify "getDefinitionContainersByContainerCodeNames failed", response.statusCode
		)

exports.getBreadCrumbByContainerCode = (req, resp) ->
	exports.getBreadCrumbByContainerCodeInternal req.body, req.query.delimeter, (json) ->
		if json.indexOf('failed') > -1
			resp.statusCode = 500
		else
			resp.json json

exports.getBreadCrumbByContainerCodeInternal = (codeNamesJSON, delimeter, callback) ->
	if !delimeter?
		delimeter = ">"
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getBreadCrumbByContainerCodeResponse
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.rapache.fullpath+"/getBreadCrumbByContainerCode?delimeter="+encodeURIComponent(delimeter)
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: codeNamesJSON
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			if !error && response.statusCode == 200
				callback json
			else
				console.error 'got ajax error trying to get getBreadCrumbByContainerCode'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify "getBreadCrumbByContainerCode failed"
		)

exports.getWellCodesByContainerCodes = (req, resp) ->
	exports.getWellCodesByContainerCodesInternal req.body, (json) ->
		if json.indexOf('failed') > -1
			resp.statusCode = 500
		else
			resp.json json

exports.getWellCodesByContainerCodesInternal = (codeNamesJSON, callback) ->
	console.debug 'incoming getWellCodesByContainerCodes request: ', JSON.stringify(codeNamesJSON)
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getWellCodesByContainerCodesResponse
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/getWellCodesByContainerCodes"
		console.debug 'base url: ', baseurl
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: codeNamesJSON
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			if !error && response.statusCode == 200
				console.debug "returned successfully from #{baseurl}"
				callback json
			else
				console.error 'got ajax error trying to get getWellCodesByContainerCodes'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify "getWellCodesByContainerCodes failed"
		)

exports.getWellContentByContainerCodesInternal = (containerCodeNames, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getWellContentByContainerCodesResponse
	else
		console.debug 'requesting well codes from container codes'
		exports.getWellCodesByContainerCodesInternal containerCodeNames, (wellCodesResponse) ->
			wellCodes = _.map wellCodesResponse, (wellCode) ->
				_.map wellCode.wellCodeNames, (codeName) ->
					{containerCode: wellCode.requestCodeName, wellCode: codeName}
			wellCodes = _.flatten wellCodes
			wellContentRequest = _.pluck wellCodes, 'wellCode'
			console.debug 'requesting well content from well container codes'
			exports.getWellContentInternal wellContentRequest, (wellContentResponse) ->
				response = []
				for containerCodeName in containerCodeNames
					containerWellCodes = _.pluck(_.where(wellCodes, {containerCode: containerCodeName}), "wellCode")
					containerWellContent = _.filter wellContentResponse, (wellContent) ->
						return wellContent.containerCodeName in containerWellCodes
					containerWellContent = _.sortBy containerWellContent, 'wellName'
					response.push {containerCodeName: containerCodeName, wellContent: containerWellContent}
				callback response

exports.updateContainers = (req, resp) ->
	exports.updateContainersInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.updateContainersInternal = (containers, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.updateContainersResponse
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/jsonArray"
		console.debug "base url: #{baseurl}"
		request = require 'request'
		request(
			method: 'PUT'
			url: baseurl
			body: containers
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			if !error && response.statusCode == 200 && json[0] != "<"
				callback json, 200
			else
				console.error 'got ajax error trying to get updateContainers'
				console.error error
				console.error json
				console.error "request #{containers}"
				console.error response
				callback JSON.stringify("updateContainers failed"), 500
		)

exports.getAllContainers = (req, resp) ->
	if req.query.testMode or global.specRunnerTestmode
		containerTestJSON = require '../public/javascripts/spec/testFixtures/ContainerServiceTestJSON.js'
		resp.json containerTestJSON.container
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers"
		serverUtilityFunctions.getFromACASServer(baseurl, resp)



exports.containersByTypeKind = (req, resp) ->
	exports.containersByTypeKindInternal req.params.lsType, req.params.lsKind, req.query.format, req.query.stub, req.query.testMode, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.containersByTypeKindInternal = (lsType, lsKind, format, stub, testMode, callback) ->
	config = require '../conf/compiled/conf.js'
	if testMode or global.specRunnerTestmode
		thingServiceTestJSON = require '../public/javascripts/spec/testFixtures/ThingServiceTestJSON.js'
		callback JSON.stringify(thingServiceTestJSON.batchList), 200
	else
		baseurl = config.all.client.service.persistence.fullpath+"containers?lsType="+lsType+"&lsKind="+lsKind
		stubFlag = "with=stub"
		if stub
			baseurl += "?#{stubFlag}"
		if format? and format=="codetable"
			baseurl += "&format=codetable"
		request = require 'request'
		request(
			method: 'GET'
			url: baseurl
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 200
				callback json, 200
			else
				console.error 'got ajax error'
				console.error error
				console.error json
				console.error response
				callback "containersByTypeKind failed", 500
		)

exports.containerByCodeName = (req, resp) ->
	if req.query.testMode or global.specRunnerTestmode
		containerTestJSON = require '../public/javascripts/spec/testFixtures/ContainerServiceTestJSON.js'
		resp.json containerTestJSON.container
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/"+req.params.code
		serverUtilityFunctions.getFromACASServer(baseurl, resp)


updateContainer = (container, testMode, callback) ->
	serverUtilityFunctions.createLSTransaction container.recordedDate, "updated experiment", (transaction) ->
		container = serverUtilityFunctions.insertTransactionIntoEntity transaction.id, container
		if testMode or global.specRunnerTestmode
			callback container
		else
			config = require '../conf/compiled/conf.js'
			baseurl = config.all.client.service.persistence.fullpath+"containers/"+container.code
			request = require 'request'
			request(
				method: 'PUT'
				url: baseurl
				body: container
				json: true
			, (error, response, json) =>
				if !error && response.statusCode == 200
					callback json
				else
					console.error 'got ajax error trying to update lsContainer'
					console.error error
					console.error response
			)


postContainer = (req, resp) ->
	console.debug "post container"
	serverUtilityFunctions = require './ServerUtilityFunctions.js'
	containerToSave = req.body
	serverUtilityFunctions.createLSTransaction containerToSave.recordedDate, "new experiment", (transaction) ->
		containerToSave = serverUtilityFunctions.insertTransactionIntoEntity transaction.id, containerToSave
		if req.query.testMode or global.specRunnerTestmode
			unless containerToSave.codeName?
				containerToSave.codeName = "PT00002-1"

		checkFilesAndUpdate = (container) ->
			fileVals = serverUtilityFunctions.getFileValuesFromEntity container, false
			filesToSave = fileVals.length

			completeContainerUpdate = (containerToUpdate)->
				updateContainer containerToUpdate, req.query.testMode, (updatedContainer) ->
					resp.json updatedContainer

			fileSaveCompleted = (passed) ->
				if !passed
					resp.statusCode = 500
					return resp.end "file move failed"
				if --filesToSave == 0 then completeContainerUpdate(container)

			if filesToSave > 0
				prefix = serverUtilityFunctions.getPrefixFromEntityCode container.codeName
				for fv in fileVals
					console.debug "updating file"
					csUtilities.relocateEntityFile fv, prefix, container.codeName, fileSaveCompleted
			else
				resp.json container

		if req.query.testMode or global.specRunnerTestmode
			checkFilesAndUpdate containerToSave
		else
			config = require '../conf/compiled/conf.js'
			baseurl = config.all.client.service.persistence.fullpath+"containers"
			request = require 'request'
			request(
				method: 'POST'
				url: baseurl
				body: containerToSave
				json: true
			, (error, response, json) =>
				if !error && response.statusCode == 201
					checkFilesAndUpdate json
				else
					console.error 'got ajax error trying to save lsContainer'
					console.error error
					console.error json
					console.error response
			)

exports.postContainer = (req, resp) ->
	postContainer req, resp

exports.putContainer = (req, resp) ->
#	if req.query.testMode or global.specRunnerTestmode
#		containerTestJSON = require '../public/javascripts/spec/testFixtures/ContainerServiceTestJSON.js'
#		containerToSave = JSON.parse(JSON.stringify(containerTestJSON.container))
#	else
	containerToSave = req.body
	fileVals = serverUtilityFunctions.getFileValuesFromEntity containerToSave, true
	filesToSave = fileVals.length

	completeContainerUpdate = ->
		updateContainer containerToSave, req.query.testMode, (updatedContainer) ->
			resp.json updatedContainer

	fileSaveCompleted = (passed) ->
		if !passed
			resp.statusCode = 500
			return resp.end "file move failed"
		if --filesToSave == 0 then completeContainerUpdate()

	if filesToSave > 0
		prefix = serverUtilityFunctions.getPrefixFromEntityCode req.body.codeName
		for fv in fileVals
			if !fv.id?
				csUtilities.relocateEntityFile fv, prefix, req.body.codeName, fileSaveCompleted
	else
		completeContainerUpdate()

exports.validateContainerNameInternal = (container, callback) ->
	if req.query.testMode or global.specRunnerTestmode
		containerTestJSON = require '../public/javascripts/spec/testFixtures/ContainerServiceTestJSON.js'
		resp.json true
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/validate"
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: container
			json: true
		, (error, response, json) =>
			if !error && response.statusCode == 202
				resp.json true
			else if response.statusCode == 409
				resp.json json
			else
				console.error 'got ajax error trying to validate container name'
				console.error error
				console.error json
				console.error response
				resp.json "error"
		)

exports.validateContainerName = (req, resp) ->
	if req.query.testMode or global.specRunnerTestmode
		containerTestJSON = require '../public/javascripts/spec/testFixtures/ContainerServiceTestJSON.js'
		resp.json true
	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/validate"
		#		if req.params.componentOrAssembly is "component"
		#			baseurl += "?uniqueName=true"
		#		else #is assembly
		#			baseurl += "?uniqueName=true&uniqueInteractions=true&orderMatters=true&forwardAndReverseAreSame=true"
		request = require 'request'
		console.debug "validate container name body"
		console.debug req.body
		console.debug req.body.container
		request(
			method: 'POST'
			url: baseurl
			body: req.body.container
			json: true
		, (error, response, json) =>
			console.debug "response"
			console.debug json
			console.debug response.statusCode
			if !error && response.statusCode == 202
				resp.json true
			else if response.statusCode == 409
				resp.json json
			else
				console.error 'got ajax error trying to validate container name'
				console.error error
				console.error json
				console.error response
				resp.json "error"
		)

exports.getContainerCodesFromNamesOrCodes = (codeRequest, callback) ->
	console.debug "got to getContainerCodesFormNamesOrCodes"
	if global.specRunnerTestmode
		results = []
		for req in codeRequest.requests
			res = requestName: req.requestName
			if req.requestName.indexOf("ambiguous") > -1
				res.referenceName = ""
				res.preferredName = ""
			else if req.requestName.indexOf("name") > -1
				res.referenceName = "CONT1111"
				res.preferredName = "1111"
			else if req.requestName.indexOf("1111") > -1
				res.referenceName = "CONT1111"
				res.preferredName = "1111"
			else
				res.referenceName = req.requestName
				res.preferredName = req.requestName
			results.push res
		response =
			containerType: codeRequest.containerType
			containerKind: codeRequest.containerKind
			results: results

		callback response
	else
		config = require '../conf/compiled/conf.js'
		#TODO: replace with new url
		baseurl = config.all.client.service.persistence.fullpath+"containers/getCodeNameFromNameRequest?"
		#		baseurl = config.all.client.service.persistence.fullpath+"containers/getContainerCodesByLabels?"
		url = baseurl+"containerType=#{codeRequest.containerType}&containerKind=#{codeRequest.containerKind}"
		postBody = requests: codeRequest.requests
		console.debug postBody
		console.debug url
		request = require 'request'
		request(
			method: 'POST'
			url: url
			body: postBody
			json: true
		, (error, response, json) =>
			console.debug response.statusCode
			console.debug json
			if !error and !json.error
				callback
					containerType: codeRequest.containerType
					containerKind: codeRequest.containerKind
					results: json.results
			else
				console.error 'got ajax error trying to lookup lsContainer name'
				console.error error
				console.error response
				callback json
		)

getContainerCodesFromLabels = (req, callback) ->
	if global.specRunnerTestmode
		response =
			codeName: 'CONT-0000001'
			label: 'test label'
		callback response

	else
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/getContainerCodesByLabels?"
		url = baseurl+"containerType=#{req.body.containerType}&containerKind=#{req.body.containerKind}"
		postBody = req.body.labels
		console.debug postBody
		console.debug url
		request = require 'request'
		request(
			method: 'POST'
			url: url
			body: postBody
			json: true
		, (error, response, json) =>
			console.debug response.statusCode
			console.debug json
			if !error and !json.error
				callback json
			else
				console.error 'got ajax error trying to lookup lsContainer name'
				console.error error
				console.error response
				callback json
		)

exports.getContainerCodesFromLabels = (req, resp) ->
	getContainerCodesFromLabels req, (json) ->
		resp.json json


exports.getContainerFromLabel = (req, resp) -> #only for sending in 1 label and expecting to get 1 container back
	getContainerCodesFromLabels req, (json) ->
		if json[0]?.codeName? #assumes that labels are unique
			req.params.code = json[0].codeName
			exports.containerByCodeName req, resp
		else
			resp.json {}

exports.updateWellContent = (req, resp) ->
	req.setTimeout 86400000
	exports.updateWellContentInternal req.body, req.query.callCustom, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.updateWellContentInternal = (wellContent, callCustom, callback) ->
	# If call custom doesn't equal 0 then call custom
	callCustom  = callCustom != "0"

	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getContainerCodesByLabelsResponse
	else
		console.debug 'incoming updateWellContentInternal request: ', JSON.stringify(wellContent)
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/updateWellContent"
		console.debug 'base url: ', baseurl
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: wellContent
			json: true
			timeout: 86400000
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			if !error & response.statusCode in [200,204]
				callback "success", response.statusCode
				if callCustom
					if csUtilities.updateWellContent?
						console.log "running customer specific server function updateWellContent"
						csUtilities.updateWellContent wellContent, (response) ->
							console.log response
					else
						console.warn "could not find customer specific server function updateWellContent so not running it"
			else
				console.error 'got ajax error trying to get updateWellContent'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify("updateWellContent failed"), 500
		)

exports.moveToLocation = (req, resp) ->
	exports.moveToLocationInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.moveToLocationInternal = (input, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.moveToLocationResponse
	else
		console.debug 'incoming moveToLocationJSON request: ', JSON.stringify(input)
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/moveToLocation"
		console.debug 'base url: ', baseurl
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: input
			json: true
			headers: 'content-type': 'application/json'
		, (error, response, json) =>
			console.debug "response statusCode: #{response.statusCode}"
			if !error
				callback json, response.statusCode
			else
				console.error 'got ajax error trying to get moveToLocation'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify("updateWellContent failed"), 500
		)

exports.getWellContentByContainerLabel = (req, resp) ->
	exports.getWellContentByContainerLabelsInternal [req.params.label], req.query.containerType, req.query.containerKind, req.query.labelType, req.query.labelKind, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json[0]

exports.getWellContentByContainerLabels = (req, resp) ->
	exports.getWellContentByContainerLabelsInternal req.body, req.query.containerType, req.query.containerKind, req.query.labelType, req.query.labelKind, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.getWellContentByContainerLabelsInternal = (containerLabels, containerType, containerKind, labelType, labelKind, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.moveToLocationResponse
	else
		console.debug 'incoming getContainersByLabelsInternal request: ', JSON.stringify(containerLabels, containerType, containerKind, labelType, labelKind)
		exports.getContainerCodesByLabelsInternal containerLabels, containerType, containerKind, labelType, labelKind, (containerCodes, statusCode) =>
			if statusCode == 500
				callback JSON.stringify("getContainersByLabels failed"), 500
			else
				codeNames = _.map containerCodes, (code) ->
					if code.foundCodeNames[0]?
						code.foundCodeNames[0]
					else
						""
				exports.getWellContentByContainerCodesInternal codeNames, (wellContent) =>
					for label, index in containerLabels
						wellContent[index].label = label
					callback wellContent, 200

exports.cloneContainer = (req, resp) ->
	exports.cloneContainersInternal [req.body], (json, statusCode) ->
		resp.statusCode = statusCode
		if resp.statusCode == 200
			resp.json json[0]
		else
			resp.json json

exports.cloneContainers = (req, resp) ->
	exports.cloneContainersInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.cloneContainersInternal = (input, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.cloneContainerResponse
	else
		console.debug "incoming cloneContainerInternal request: #{JSON.stringify(input)}"
		codeNames = _.pluck input, "codeName"
		console.debug "calling getContainersByCodeNamesInternal"
		exports.getContainerAndDefinitionContainerByContainerCodeNamesInternal codeNames, (containers, statusCode) =>
			exports.getWellContentByContainerCodesInternal codeNames, (wellContent) =>
				barcodes = _.pluck input, "barcode"
				exports.getContainerCodesByLabelsInternal barcodes, null, null, "barcode", "barcode", (containerCodes, statusCode) =>
					if statusCode == 500
						callback "getContainersByCodeNamesInternal failed", 500
						return
					outputArray = []
					for updateInfo, index in input
						if containerCodes[index].foundCodeNames.length > 0
							message = "conflict: barcode '#{containerCodes[index].requestLabel}' already being used by #{containerCodes[index].foundCodeNames.join(",")}"
							console.error message
							callback message, 409
							return
						container = _.findWhere(containers, {'codeName': updateInfo.codeName})
						container = _.extend container,updateInfo
						container = _.omit container, "codeName"
						container.definition = container.definitionCodeName
						wellContent = _.findWhere(wellContent, {'containerCodeName': updateInfo.codeName})
						if wellContent?.wellContent?
							wellContent = _.map wellContent.wellContent, (wellCont) ->
								_.omit wellCont, "containerCodeName"
							container.wells = wellContent
						compoundInventoryRoutes = require '../routes/CompoundInventoryRoutes.js'
						compoundInventoryRoutes.createPlateInternal container, "1", (newContainer, statusCode) ->
							container.codeName = newContainer.codeName
							exports.updateContainersByContainerCodesInternal [container], "1", (updatedContainer, statusCode) ->
								outContainer = _.extend updatedContainer[0], newContainer
								outputArray[index-1] = outContainer
								if index == (input.length)
									callback outputArray, 200

exports.splitContainer = (req, resp) ->
	exports.splitContainerInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.splitContainerInternal = (input, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.splitContainerResponse
	else
		console.debug "incoming splitContainer request: #{JSON.stringify(input)}"
		console.debug "calling getContainersByCodeNamesInternal"
		console.error input.codeName
		exports.getContainerAndDefinitionContainerByContainerCodeNamesInternal [input.codeName], (originContainer, statusCode) =>
			exports.getWellContentByContainerCodesInternal [input.codeName], (originWellContent) =>
				isOdd = (num) ->
					return (num % 2) == 1
				alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
				originWellContent[0].wellContent = _.map originWellContent[0].wellContent, (content) ->
					content = _.omit(content, ['containerCodeName', 'wellName', 'recordedDate'])
					oddRow = isOdd(content.rowIndex)
					oddColumn = isOdd(content.columnIndex)
					if oddRow && oddColumn
						content.quadrant = 1
					else if oddRow && !oddColumn
						content.quadrant = 2
					else if !oddRow && oddColumn
						content.quadrant = 3
					else if !oddRow && !oddColumn
						content.quadrant = 4
					if oddRow
						content.rowIndex = (content.rowIndex+1)/2
					else
						content.rowIndex = (content.rowIndex)/2
					if oddColumn
						content.columnIndex = (content.columnIndex+1)/2
					else
						content.columnIndex = (content.columnIndex)/2
					if content.rowIndex < 10
						text = "00"
					else
						text = "0"
					content.wellName = alphabet[content.rowIndex-1]+text+content.columnIndex
					return _.omit(content, ['containerCodeName', 'recordedDate'])
				destinationPlateSize = originContainer[0].plateSize/4
				destinationCols = Math.sqrt(1.5*destinationPlateSize)
				destinationRows = destinationCols / 1.5
				exports.getDefinitionContainerByNumberOfWellsInternal "definition container", "plate", destinationPlateSize, (definitionContainer, statusCode) ->
					destinationContainerCode =  definitionContainer.get('codeName')
					barcodes = _.pluck input.quadrants, "barcode"
					exports.getContainerCodesByLabelsInternal barcodes, null, null, "barcode", "barcode", (containerCodes, statusCode) =>
						if statusCode == 500
							callback "getContainersByCodeNamesInternal failed", 500
							return
						outputArray = []
						for quadrant, index in input.quadrants
							#Get barcode
							if containerCodes[index].foundCodeNames.length > 0
								message = "conflict: barcode '#{containerCodes[index].requestLabel}' already being used by #{containerCodes[index].foundCodeNames.join(",")}"
								console.error message
								callback message, 409
								return
							destinationContainerValues = _.extend originContainer[0], quadrant
							destinationContainer = _.omit destinationContainerValues, "codeName"
							destinationContainer.definition = destinationContainerCode
							destinationWellContent = _.filter originWellContent[0].wellContent, (wellCont) ->
								wellCont.quadrant == quadrant.quadrant
							destinationContainer.wells = destinationWellContent
							input.quadrants[index].destinationContainer = destinationContainer
							compoundInventoryRoutes = require '../routes/CompoundInventoryRoutes.js'
							compoundInventoryRoutes.createPlateInternal destinationContainer, "1", (newContainer, statusCode) ->
								if statusCode == 200
									quadrant = _.findWhere(input.quadrants, {"barcode": newContainer.barcode})
									quadrant.newContainer = newContainer
									quadrant.destinationContainer.codeName = newContainer.codeName
									quadrant.destinationContainer = _.omit quadrant.destinationContainer, ["wells", "definitionCodeName"]
									exports.updateContainersByContainerCodesInternal [quadrant.destinationContainer], "1", (updatedContainer, statusCode) ->
										quandrant = _.findWhere(input.quadrants, {"barcode": updatedContainer[0].barcode})
										quadrant.updatedContainer = updatedContainer[0]
										outContainer = _.extend quadrant.updatedContainer, quandrant.newContainer
										outputArray.push outContainer
										if outputArray.length == input.quadrants.length
											outputArray = _.sortBy outputArray, 'quadrant'
											callback outputArray, 200
								else
									outputArray.push newContainer

exports.getDefinitionContainerByNumberOfWells = (req, resp) ->
	exports.getDefinitionContainerByNumberOfWellsInternal req.params.lsType, req.params.lsKind, req.params.numberOfWells, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.getDefinitionContainerByNumberOfWellsInternal = (lsType, lsKind, numberOfWells, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.getDefinitionContainerByPlateSizeInternal
	else
		console.debug "incoming getDefinitionContainerByNumberOfWellsInternal request: #{JSON.stringify([lsType, lsKind, numberOfWells])}"
		console.debug "calling containersByTypeKindInternal"
		exports.containersByTypeKindInternal lsType, lsKind, null, false, false, (response, statusCode) ->
			definitions = []
			for container in response
				containerPreferredEntity = preferredEntityCodeService.getSpecificEntityTypeByTypeKindAndCodeOrigin container.lsType, container.lsKind, "ACAS Container"
				if containerPreferredEntity?
					console.debug "found preferred entity: #{JSON.stringify(containerPreferredEntity)}"
				else
					console.error "could not find preferred entity for ls type and kind, here are the configured entity types"
					preferredEntityCodeService.getConfiguredEntityTypes false, (types)->
						console.error types
				definition = new containerPreferredEntity.model(container)
				definitions.push definition
			definition = _.find definitions, (definition) ->
				return definition.get('plateSize').get('value').toString() == numberOfWells.toString()
			if definition?
				definition.prepareToSave()
				definition.reformatBeforeSaving()
				callback definition, 200
			else
				callback "could not find definition", 500


exports.searchContainers = (req, resp) ->
	exports.searchContainersInternal req.body, (json, statusCode) ->
		resp.statusCode = statusCode
		resp.json json

exports.searchContainersInternal = (input, callback) ->
	if global.specRunnerTestmode
		inventoryServiceTestJSON = require '../public/javascripts/spec/ServerAPI/testFixtures/InventoryServiceTestJSON.js'
		resp.json inventoryServiceTestJSON.searchContainersInternalResponse
	else
		console.debug "incoming searchContainers request: '#{JSON.stringify(input)}'"
		config = require '../conf/compiled/conf.js'
		baseurl = config.all.client.service.persistence.fullpath+"containers/searchContainers"
		request = require 'request'
		request(
			method: 'POST'
			url: baseurl
			body: input
			json: true
			headers:
				'content-type': 'application/json'
				'accept': 'application/json'
		, (error, response, json) =>
			console.debug "response statusCode: #{response.statusCode}"
			if !error
				_ = require 'underscore'
				codeNames = _.map json, (container) ->
					container.codeName
				exports.getContainerAndDefinitionContainerByContainerCodeNamesInternal codeNames, (json, statusCode) =>
					if statusCode == 500
						callback JSON.stringify "getContainerAndDefinitionContainerByContainerLabelInternal failed", statusCode
					else
						console.debug json
						callback json, statusCode
			else
				console.error 'got ajax error trying to get searchContainers'
				console.error error
				console.error json
				console.error response
				callback JSON.stringify("updateWellContent failed"), 500
		)

