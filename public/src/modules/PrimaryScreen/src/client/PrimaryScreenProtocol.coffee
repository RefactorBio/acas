class window.PrimaryScreenProtocol extends Protocol

	defaults: ->
		_(super()).extend(
			dnsList: false
		)

	initialize: ->
		super()
		@.setdnsList()

	validate: (attrs) ->
		errors = []
		maxY = @getCurveDisplayMax().get('numericValue')
		if isNaN(maxY)
			errors.push
				attribute: 'maxY'
				message: "maxY must be a number"
		minY = @getCurveDisplayMin().get('numericValue')
		if isNaN(minY)
			errors.push
				attribute: 'minY'
				message: "minY must be a number"

		if errors.length > 0
			return errors
		else
			return null

	getPrimaryScreenProtocolParameterCodeValue: (parameterName) ->
		parameter = @.get('lsStates').getOrCreateValueByTypeAndKind "metadata", "screening assay", "codeValue", parameterName
		if parameter.get('codeValue') is undefined or parameter.get('codeValue') is ""
			parameter.set codeValue: "unassigned"
		if parameter.get('codeOrigin') is undefined or parameter.get('codeOrigin') is ""
			parameter.set codeOrigin: "acas ddict"

		parameter

	setdnsList: ->
		molecularTarget = @.get('lsStates').getOrCreateValueByTypeAndKind "metadata", "screening assay", "codeValue", "molecular target"
		if molecularTarget.get('codeOrigin') is "dns target list"
			@.set dnsList: true
		else
			@.set dnsList: false



	getCurveDisplayMin: ->
		minY = @.get('lsStates').getOrCreateValueByTypeAndKind "metadata", "screening assay", "numericValue", "curve display min"
		if minY.get('numericValue') is undefined or minY.get('numericValue') is ""
			minY.set numericValue: 0.0

		minY

	getCurveDisplayMax: ->
		maxY = @.get('lsStates').getOrCreateValueByTypeAndKind "metadata", "screening assay", "numericValue", "curve display max"
		if maxY.get('numericValue') is undefined or maxY.get('numericValue') is ""
			maxY.set numericValue: 100.0

		maxY


class window.AbstractPrimaryScreenProtocolParameterController extends Backbone.View
	events:
		"change .bv_parameter": "handleParameterChanged"
		"click .bv_addParameterBtn": "clearModal"
		"click .bv_addNewParameterOption": "addNewParameterOption"

#	Your initialization function needs at least these three lines below:
# initialize: ->
#		@.parameter = "parameterName"
#		@setupParameterSelect()
#

	handleParameterChanged: ->
		splitName = (@.parameter).replace /([A-Z])/g,' $1'
		splitName = splitName.toLowerCase()
		@model.getPrimaryScreenProtocolParameterCodeValue(splitName).set
			codeValue: @$('.bv_'+@.parameter).val()

	clearModal: ->
		pascalCaseParameterName = (@.parameter).charAt(0).toUpperCase() + (@.parameter).slice(1)
		@$('.bv_optionAddedMessage').hide()
		@$('.bv_errorMessage').hide()
		@$('.bv_new'+pascalCaseParameterName+'Label').val("")
		@$('.bv_new'+pascalCaseParameterName+'Description').val("")
		@$('.bv_new'+pascalCaseParameterName+'Comments').val("")
		@$('.bv_optionAddedMessage').hide()
		@$('.bv_errorMessage').hide()


	addNewParameterOption: ->
		pascalCaseParameterName = (@.parameter).charAt(0).toUpperCase() + (@.parameter).slice(1)
		# new short name is generated by making everything lower case in label text
		newOptionName = (@$('.bv_new'+pascalCaseParameterName+'Label').val()).toLowerCase()
		if @.validNewOption(newOptionName)
			#add new option to code table. for now just append to html
			# TODO: add to DataDictionary and refresh the select list. Need route from Guy
			@$('.bv_'+@.parameter).append('<option value='+ newOptionName+'>'+newOptionName+'</option>')
			@$('.bv_optionAddedMessage').show()
			@$('.bv_errorMessage').hide()

		else
			@$('.bv_optionAddedMessage').hide()
			@$('.bv_errorMessage').show()

	validNewOption: (newOptionName) ->
		#checks to see if assay activity option already exists
		if @$('.bv_'+@.parameter+' option[value="'+newOptionName+'"]').length > 0
			return false
		else
			return true


class window.AssayActivityController extends AbstractPrimaryScreenProtocolParameterController
	template: _.template($("#AssayActivityView").html())

	events:
		"change .bv_assayActivity": "handleParameterChanged"
		"click .bv_addAssayActivityBtn": "clearModal"
		"click .bv_addNewAssayActivityOption": "addNewParameterOption"

	initialize: ->
		@.parameter = "assayActivity"
		@setupParameterSelect()


	render: ->
		$(@el).empty()
		$(@el).html @template()
		@setupParameterSelect()

	setupParameterSelect: ->
		@assayActivityList = new PickListList()
		@assayActivityList.url = "/api/dataDict/protocolMetadata/assay activity"
		@assayActivityListController = new PickListSelectController
			el: @$('.bv_assayActivity')
			collection: @assayActivityList
			insertFirstOption: new PickList
				code: "unassigned"
				name: "Select Assay Activity"
			selectedCode: @model.getPrimaryScreenProtocolParameterCodeValue('assay activity').get('codeValue')


class window.MolecularTargetController extends AbstractPrimaryScreenProtocolParameterController
	template: _.template($("#MolecularTargetView").html())

	events:
		"change .bv_molecularTarget": "handleParameterChanged"
		"click .bv_addMolecularTargetBtn": "clearModal"
		"click .bv_addNewMolecularTargetOption": "addNewParameterOption"

	initialize: ->
		@.parameter = "molecularTarget"
		@setupParameterSelect()


	render: ->
		$(@el).empty()
		$(@el).html @template()
		@setupParameterSelect()

	setupParameterSelect: ->
		@molecularTargetList = new PickListList()
		@molecularTargetList.url = "/api/dataDict/protocolMetadata/molecular target"
		@molecularTargetListController = new PickListSelectController
			el: @$('.bv_molecularTarget')
			collection: @molecularTargetList
			insertFirstOption: new PickList
				code: "unassigned"
				name: "Select Molecular Target"
			selectedCode: @model.getPrimaryScreenProtocolParameterCodeValue('molecular target').get('codeValue')

class window.TargetOriginController extends AbstractPrimaryScreenProtocolParameterController
	template: _.template($("#TargetOriginView").html())

	events:
		"change .bv_targetOrigin": "handleParameterChanged"
		"click .bv_addTargetOriginBtn": "clearModal"
		"click .bv_addNewTargetOriginOption": "addNewParameterOption"

	initialize: ->
		@.parameter = "targetOrigin"
		@setupParameterSelect()

	render: ->
		$(@el).empty()
		$(@el).html @template()
		@setupParameterSelect()

	setupParameterSelect: ->
		@targetOriginList = new PickListList()
		@targetOriginList.url = "/api/dataDict/protocolMetadata/target origin"
		@targetOriginListController = new PickListSelectController
			el: @$('.bv_targetOrigin')
			collection: @targetOriginList
			insertFirstOption: new PickList
				code: "unassigned"
				name: "Select Target Origin"
			selectedCode: @model.getPrimaryScreenProtocolParameterCodeValue('target origin').get('codeValue')


class window.AssayTypeController extends AbstractPrimaryScreenProtocolParameterController
	template: _.template($("#AssayTypeView").html())

	events:
		"change .bv_assayType": "handleParameterChanged"
		"click .bv_addAssayTypeBtn": "clearModal"
		"click .bv_addNewAssayTypeOption": "addNewParameterOption"

	initialize: ->
		@.parameter = "assayType"
		@setupParameterSelect()

	render: ->
		$(@el).empty()
		$(@el).html @template()
		@setupParameterSelect()

	setupParameterSelect: ->
		@assayTypeList = new PickListList()
		@assayTypeList.url = "/api/dataDict/protocolMetadata/assay type"
		@assayTypeListController = new PickListSelectController
			el: @$('.bv_assayType')
			collection: @assayTypeList
			insertFirstOption: new PickList
				code: "unassigned"
				name: "Select Assay Type"
			selectedCode: @model.getPrimaryScreenProtocolParameterCodeValue('assay type').get('codeValue')


class window.AssayTechnologyController extends AbstractPrimaryScreenProtocolParameterController
	template: _.template($("#AssayTechnologyView").html())

	events:
		"change .bv_assayTechnology": "handleParameterChanged"
		"click .bv_addAssayTechnologyBtn": "clearModal"
		"click .bv_addNewAssayTechnologyOption": "addNewParameterOption"

	initialize: ->
		@.parameter = "assayTechnology"
		@setupParameterSelect()

	render: ->
		$(@el).empty()
		$(@el).html @template()
		@setupParameterSelect()

	setupParameterSelect: ->
		@assayTechnologyList = new PickListList()
		@assayTechnologyList.url = "/api/dataDict/protocolMetadata/assay technology"
		@assayTechnologyListController = new PickListSelectController
			el: @$('.bv_assayTechnology')
			collection: @assayTechnologyList
			insertFirstOption: new PickList
				code: "unassigned"
				name: "Select Assay Technology"
			selectedCode: @model.getPrimaryScreenProtocolParameterCodeValue('assay technology').get('codeValue')

class window.CellLineController extends AbstractPrimaryScreenProtocolParameterController
	template: _.template($("#CellLineView").html())

	events:
		"change .bv_cellLine": "handleParameterChanged"
		"click .bv_addCellLineBtn": "clearModal"
		"click .bv_addNewCellLineOption": "addNewParameterOption"

	initialize: ->
		@.parameter = "cellLine"
		@setupParameterSelect()

	render: ->
		$(@el).empty()
		$(@el).html @template()
		@setupParameterSelect()

	setupParameterSelect: ->
		@cellLineList = new PickListList()
		@cellLineList.url = "/api/dataDict/protocolMetadata/cell line"
		@cellLineListController = new PickListSelectController
			el: @$('.bv_cellLine')
			collection: @cellLineList
			insertFirstOption: new PickList
				code: "unassigned"
				name: "Select Cell Line"
			selectedCode: @model.getPrimaryScreenProtocolParameterCodeValue('cell line').get('codeValue')



class window.PrimaryScreenProtocolParametersController extends AbstractFormController
	template: _.template($("#PrimaryScreenProtocolParametersView").html())
	autofillTemplate: _.template($("#PrimaryScreenProtocolParametersAutofillView").html())

	events:
		"click .bv_dnsTargetListChkbx": "handleTargetListChanged"
		"change .bv_assayStage": "handleAssayStageChanged"
		"change .bv_maxY": "handleMaxYChanged"
		"change .bv_minY": "handleMinYChanged"


	initialize: ->
		@errorOwnerName = 'PrimaryScreenProtocolParametersController'
		@setBindings()
		super()
		@setUpAssayStageSelect()



	render: =>
		@$el.empty()
		@$el.html @autofillTemplate(@model.attributes)
		@$('.bv_dnsTargetListChkbx').val(@model.get('dnsList'))
		@$('.bv_maxY').val(@model.getCurveDisplayMax().get('numericValue'))
		@$('.bv_minY').val(@model.getCurveDisplayMin().get('numericValue'))
		@setUpAssayStageSelect()
		@handleTargetListChanged()
		super()

		@

	setUpAssayStageSelect: ->
		@assayStageList = new PickListList()
		@assayStageList.url = "/api/dataDict/protocolMetadata/assay stage"
		@assayStageListController = new PickListSelectController
			el: @$('.bv_assayStage')
			collection: @assayStageList
			insertFirstOption: new PickList
				code: "unassigned"
				name: "Select assay stage"
			selectedCode: @model.getPrimaryScreenProtocolParameterCodeValue('assay stage').get('codeValue')

	updateModel: =>
		@model.set
			assayStage: @$('.bv_assayStage').val()

	handleTargetListChanged: =>
		dnsTargetList = @$('.bv_dnsTargetListChkbx').is(":checked")
		@model.set dnsList: dnsTargetList
		if dnsTargetList
			@$('.bv_addMolecularTargetBtn').hide()
			@model.getPrimaryScreenProtocolParameterCodeValue('molecular target').set
				codeOrigin: "dns target list"
			# TODO: repopulate Molecular Target Select list with DNS Target List. Get route from Guy
		else
			@$('.bv_addMolecularTargetBtn').show()
			@model.getPrimaryScreenProtocolParameterCodeValue('molecular target').set
				codeOrigin: "acas ddict"

		@attributeChanged()

	handleAssayStageChanged: =>
		@model.getPrimaryScreenProtocolParameterCodeValue('assay stage').set
			codeValue: @$('.bv_assayStage').val()

	handleMaxYChanged: =>
		@model.getCurveDisplayMax().set
			numericValue: @$('.bv_maxY').val()
		@handleModelChange()


	handleMinYChanged: =>
		@model.getCurveDisplayMin().set
			numericValue: @$('.bv_minY').val()
		@handleModelChange()

class window.PrimaryScreenProtocolController extends Backbone.View
	template: _.template($("#PrimaryScreenProtocolView").html())
	moduleLaunchName: "primary_screen_protocol"

	initialize: ->
		@completeInitialization()
		@setupPrimaryScreenProtocolParametersController()
		@setupAssayActivityController()
		@setupMolecularTargetController()
		@setupTargetOriginController()
		@setupAssayTypeController()
		@setupAssayTechnologyController()
		@setupCellLineController()

	completeInitialization: ->
		unless @model?
			@model = new PrimaryScreenProtocol()
		$(@el).html @template()
		@model.on 'sync', @handleProtocolSaved
		@protocolBaseController = new ProtocolBaseController
			model: new Protocol
			el: @$('.bv_protocolBase')
		@protocolBaseController.on 'amDirty', =>
			@trigger 'amDirty'
		@protocolBaseController.on 'amClean', =>
			@trigger 'amClean'
		@protocolBaseController.render()

	setupPrimaryScreenProtocolParametersController: ->
		@primaryScreenProtocolParametersController= new PrimaryScreenProtocolParametersController
			model: @model
			el: @$('.bv_autofillSection')
		@primaryScreenProtocolParametersController.on 'amDirty', =>
			@trigger 'amDirty'
		@primaryScreenProtocolParametersController.on 'amClean', =>
			@trigger 'amClean'
		@primaryScreenProtocolParametersController.render()

	setupAssayActivityController: ->
		@assayActivityController = new AssayActivityController
			model: @model
			el: @$('.bv_assayActivityWrapper')
		@assayActivityController.render()

	setupMolecularTargetController: ->
		@molecularTargetController = new MolecularTargetController
			model: @model
			el: @$('.bv_molecularTargetWrapper')
		@molecularTargetController.render()

	setupTargetOriginController: ->
		@targetOriginController = new TargetOriginController
			model: @model
			el: @$('.bv_targetOriginWrapper')
		@targetOriginController.render()

	setupAssayTypeController: ->
		@assayTypeController = new AssayTypeController
			model: @model
			el: @$('.bv_assayTypeWrapper')
		@assayTypeController.render()

	setupAssayTechnologyController: ->
		@assayTechnologyController = new AssayTechnologyController
			model: @model
			el: @$('.bv_assayTechnologyWrapper')
		@assayTechnologyController.render()

	setupCellLineController: ->
		@cellLineController = new CellLineController
			model: @model
			el: @$('.bv_cellLineWrapper')
		@cellLineController.render()

	handleProtocolSaved: =>
		@primaryScreenProtocolParametersController.render()