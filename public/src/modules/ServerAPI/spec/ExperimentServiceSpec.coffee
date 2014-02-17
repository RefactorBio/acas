###
This suite of services provides CRUD operations on Experiment Objects

###

describe 'Experiment Service testing', ->
	beforeEach ->
		@waitForServiceReturn = ->
			typeof @serviceReturn != 'undefined'

	describe 'when fetching Experiment stub by code', ->
		beforeEach ->
			self = @
			$.ajax
				type: 'GET'
				url: "api/experiments/codename/EXPT-00000124"
				data:
					testMode: true
				success: (json) ->
					self.serviceReturn = json
				error: (err) ->
					console.log 'got ajax error'
					self.serviceReturn = null
				dataType: 'json'

		it 'should return a experiment stub', ->
			waitsFor( @waitForServiceReturn, 'service did not return', 2000)
			runs ->
				expect(@serviceReturn.codeName).toEqual "EXPT-00000001"

	describe 'when fetching Experiment stubs by protocol code', ->
		beforeEach ->
			self = @
			$.ajax
				type: 'GET'
				url: "api/experiments/protocolCodename/PROT-00000005"
				data:
					testMode: true
				success: (json) ->
					self.serviceReturn = json
				error: (err) ->
					console.log 'got ajax error'
					self.serviceReturn = null
				dataType: 'json'

		it 'should return an array of experiment stubs', ->
			waitsFor( @waitForServiceReturn, 'service did not return', 2000)
			runs ->
				expect(@serviceReturn.codeName).toEqual "EXPT-00000001"


	describe 'when fetching full Experiment by id', ->
		beforeEach ->
			self = @
			$.ajax
				type: 'GET'
				url: "api/experiments/1"
				success: (json) ->
					self.serviceReturn = json
				error: (err) ->
					console.log 'got ajax error'
					self.serviceReturn = null
				dataType: 'json'

		it 'should return a full experiment', ->
			waitsFor( @waitForServiceReturn, 'service did not return', 2000)
			runs ->
				expect(@serviceReturn.codeName).toEqual "EXPT-00000001"

	describe 'when saving new experiment', ->
		beforeEach ->
			self = @
			$.ajax
				type: 'POST'
				url: "api/experiments"
				data: window.experimentServiceTestJSON.experimentToSave
				success: (json) ->
					self.serviceReturn = json
				error: (err) ->
					console.log 'got ajax error'
					self.serviceReturn = null
				dataType: 'json'

		it 'should return an experiment', ->
			waitsFor( @waitForServiceReturn, 'service did not return', 2000)
			runs ->
				expect(@serviceReturn.id).not.toBeNull()

	describe 'when updating existing experiment', ->
		beforeEach ->
			self = @
			$.ajax
				type: 'PUT'
				url: "api/experiments/1234"
				data: window.experimentServiceTestJSON.fullExperimentFromServer
				success: (json) ->
					self.serviceReturn = json
				error: (err) ->
					console.log 'got ajax error'
					self.serviceReturn = null
				dataType: 'json'

		it 'should return the experiment', ->
			waitsFor( @waitForServiceReturn, 'service did not return', 2000)
			runs ->
				expect(@serviceReturn.id).not.toBeNull()