class window.FullPK extends Backbone.Model
	defaults:
		format: "In Vivo Full PK"
		protocolName: ""
		experimentName: ""
		scientist: ""
		notebook: ""
		inLifeNotebook: ""
		assayDate: null
		project: ""
		bioavailability: ""
		aucType: ""

	validate: (attrs) ->
		errors = []
		if  attrs.protocolName == "Select Protocol"
			errors.push
				attribute: 'protocolName'
				message: "Protocol Name must be provided"
		if attrs.experimentName == ""
			errors.push
				attribute: 'experimentName'
				message: "Experiment Name must be provided"
		if attrs.scientist == ""
			errors.push
				attribute: 'scientist'
				message: "Scientist must be provided"
		if attrs.notebook == ""
			errors.push
				attribute: 'notebook'
				message: "Notebook must be provided"
		if attrs.inLifeNotebook == ""
			errors.push
				attribute: 'inLifeNotebook'
				message: "inLifeNotebook must be provided"
		if attrs.project == "unassigned"
			errors.push
				attribute: 'project'
				message: "Project must be provided"
		if attrs.bioavailability == ""
			errors.push
				attribute: 'bioavailability'
				message: "Bioavailability must be provided"
		if attrs.aucType == ""
			errors.push
				attribute: 'aucType'
				message: "AUC Type must be provided"
		if _.isNaN(attrs.assayDate)
			errors.push
				attribute: 'assayDate'
				message: "Assay date must be set"

		if errors.length > 0
			return errors
		else
			return null

class window.FullPKController extends AbstractParserFormController
	template: _.template($("#FullPKView").html())

	events:
		'change .bv_protocolName': "attributeChanged"
		'change .bv_experimentName': "attributeChanged"
		'change .bv_scientist': "attributeChanged"
		'change .bv_notebook': "attributeChanged"
		'change .bv_inLifeNotebook': "attributeChanged"
		'change .bv_project': "attributeChanged"
		'change .bv_bioavailability': "attributeChanged"
		'change .bv_aucType': "attributeChanged"
		'change .bv_assayDate': "attributeChanged"

	initialize: ->
		@errorOwnerName = 'FullPKController'
		super()
		@setupProjectSelect()
		@setupProtocolSelect("pk")

	render: =>
		super()
		@$('.bv_assayDate').datepicker( );
		@$('.bv_assayDate').datepicker( "option", "dateFormat", "yy-mm-dd" );
		if @model.get('assayDate') != null
			date = new Date(@model.get('assayDate'))
			@$('.bv_assayDate').val(date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate())
		@

	updateModel: ->
		@model.set
			protocolName: @$('.bv_protocolName').find(":selected").text()
			experimentName: @getTrimmedInput('.bv_experimentName')
			scientist: @getTrimmedInput('.bv_scientist')
			notebook: @getTrimmedInput('.bv_notebook')
			inLifeNotebook: @getTrimmedInput('.bv_inLifeNotebook')
			project: @getTrimmedInput('.bv_project')
			bioavailability: @getTrimmedInput('.bv_bioavailability')
			aucType: @getTrimmedInput('.bv_aucType')
			assayDate: @convertYMDDateToMs(@getTrimmedInput('.bv_assayDate'))
		@trigger 'amDirty'

class window.FullPKParserController extends BasicFileValidateAndSaveController

	initialize: ->
		@fileProcessorURL = "/api/fullPKParser"
		@errorOwnerName = 'FullPKParser'
		@loadReportFile = true
		super()
		@$('.bv_moduleTitle').html('Full PK Experiment Loader')
		@fpkc = new FullPKController
			model: new FullPK()
			el: @$('.bv_additionalValuesForm')
		@fpkc.on 'valid', @handleFPKFormValid
		@fpkc.on 'invalid', @handleFPKFormInvalid
		@fpkc.on 'notifyError', @notificationController.addNotification
		@fpkc.on 'clearErrors', @notificationController.clearAllNotificiations
		@fpkc.on 'amDirty', =>
			@trigger 'amDirty'
		@fpkc.render()

	handleFPKFormValid: =>
		if @parseFileUploaded
			@handleFormValid()

	handleFPKFormInvalid: =>
		@handleFormInvalid()

	handleFormValid: ->
		if @fpkc.isValid()
			super()

	handleValidationReturnSuccess: (json) =>
		super(json)
		@fpkc.disableAllInputs()

	showFileSelectPhase: ->
		super()
		if @fpkc?
			@fpkc.enableAllInputs()

	validateParseFile: =>
		@fpkc.updateModel()
		unless !@fpkc.isValid()
			@additionalData =
				inputParameters: @fpkc.model.toJSON()
			super()

	validateParseFile: =>
		@fpkc.updateModel()
		unless !@fpkc.isValid()
			@additionalData =
				inputParameters: @fpkc.model.toJSON()
			super()