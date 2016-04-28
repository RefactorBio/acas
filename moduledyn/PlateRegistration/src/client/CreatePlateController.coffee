Backbone = require('backbone')
BackboneValidation = require('backbone-validation')

_ = require('lodash')
$ = require('jquery')

PickListSelectController = require('./SelectList.coffee').PickListSelectController
PickList = require('./SelectList.coffee').PickList


CREATE_PLATE_CONTROLLER_EVENTS =
  CREATE_PLATE: "CreatePlate"

_.extend(Backbone.Validation.callbacks, {
  valid: (view, attr, selector) ->
    $el = view.$('[name=' + attr + ']')
    $group = $el.closest('.form-group')

    $group.removeClass('has-error');
    $group.find('.help-block').html('').addClass('hidden')

  invalid: (view, attr, error, selector) ->
    $el = view.$('[name=' + attr + ']')
    $group = $el.closest('.form-group')

    $group.addClass('has-error')
    $group.find('.help-block').html(error).removeClass('hidden')

})

class CreatePlateController extends Backbone.View
  template: _.template(require('html!./CreatePlateView.tmpl'))

  initialize: (options) ->
    @model = options.model
    @plateDefinitions = options.plateDefinitions
    @selectLists = [
      containerSelector: "select[name='definition']"
      collection: @plateDefinitions
    ]

  events:
    "change input": "handleFormFieldUpdate"
    "change select": "handleFormFieldUpdate"
    "click button[name='submit']": "handleClickStart"

  completeInitialization: =>
    plateDefinition = document.getElementsByName("definition") #$("select[name='definition']")
    # make sure the default selected plate type is reflected in the form model
    @handleFormFieldUpdate({currentTarget: plateDefinition})

  render: =>
    $(@el).html @template() #@model.toJSON())
    @initializeSelectLists()

    @

  initializeSelectLists: =>
    _.each(@selectLists, (selectList) =>
      @plateDefinitionsSelectList = new PickListSelectController
        el: $(@el).find(selectList.containerSelector)
        collection: selectList.collection
        insertFirstOption: new PickList
          code: "unassigned"
          name: "Select Plate Definition"
        selectedCode: "unassigned"
        className: "form-control"
    )

  handleFormFieldUpdate: (evt) ->
    target = $(evt.currentTarget)
    data = {}
    data[target.attr('name')] = $.trim(target.val())
    @updateModel data

  updateModel: (data) =>
    @model.set data
    if @model.isValid(true)
      @$("button[name='submit']").prop("disabled", false)
    else
      @$("button[name='submit']").prop("disabled", true)

  handleClickStart: =>
    @trigger CREATE_PLATE_CONTROLLER_EVENTS.CREATE_PLATE, @model

  handleSuccessfulSave: (updatedModel) =>
    @model.reset()
    @render()


module.exports =
  CreatePlateController: CreatePlateController
  CREATE_PLATE_CONTROLLER_EVENTS: CREATE_PLATE_CONTROLLER_EVENTS