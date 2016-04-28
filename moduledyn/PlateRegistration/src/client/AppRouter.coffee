Backbone = require('backbone')

#DataServiceController = require('./DataServiceController.coffee').DataServiceController

AppController = require('./AppController.coffee').AppController
appController = new AppController()

$("#app-container").html appController.render().el
appController.completeInitialization()

class AppRouter extends Backbone.Router
  routes:
    "": "createPlateRoute"
    "createPlate": "createPlateRoute"
    "plateDesign/:plateCodeName": "plateDesignRoute"
    "plateSearch": "plateSearchRoute"
    "mergeOrSplitPlates": "mergeOrSplitPlates"

  plateDesignRoute: (plateBarcode) ->
    appController.displayPlateDesignForm(plateBarcode)

  createPlateRoute: ->
    appController.displayCreatePlateForm()

  plateSearchRoute: ->
    appController.displayPlateSearch()

  mergeOrSplitPlates: ->
    appController.displayMergeOrSplitPlatesForm()

module.exports =
  AppRouter: AppRouter
