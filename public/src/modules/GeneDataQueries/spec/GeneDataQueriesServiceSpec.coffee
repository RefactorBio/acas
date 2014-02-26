###
This service takes a list of geneids and returns related experimental data,


###
#Service call data with good data:
goodDataRequest =
	geneIDs: [
		{gid: 1234},
		{gid: 1111},
		{gid: 3456}
	]
	maxRowsToReturn: 10000
	user: 'jmcneil'


#Service call data with bad data:
badDataRequest =
	geneIDs: [
		{gid: 1234},
		{gid: 1111},
		{gid: 3456}
	]
	maxRowsToReturn: -1
	user: 'jmcneil'


#The expected return format for save or update success is:
returnExampleSuccess =
	results: window.geneDataQueriesTestJSON.geneIDQueryResults
	hasError: false
	hasWarning: true
	errorMessages: []

#The expected return format for error is:
returnExampleError =
	results:
		htmlSummary: "Error: There is a problem in this request..."
		data: null
	hasError: true
	hasWarning: true
	errorMessages: [
		{errorLevel: "warning", message: "some genes not found"},
		{errorLevel: "error", message: "start offset outside allowed range, please speak to an administrator"},
	]

# Here is example usage
describe 'Gene Data Queries Service testing', ->
	beforeEach ->
		@waitForServiceReturn = ->
			typeof @serviceReturn != 'undefined'

	describe 'when run with valid input data', ->
		beforeEach ->
			runs ->
				$.ajax
					type: 'POST'
					url: "api/geneDataQuery"
					data: goodDataRequest
					success: (json) =>
						@serviceReturn = json
					error: (err) =>
						console.log 'got ajax error'
						@serviceReturn = null
					dataType: 'json'
		# combine all expects in one test to reduce test run time since the service is slow
		it 'should return no errors, dry run mode, hasWarning, and an html summary', ->
			waitsFor( @waitForServiceReturn, 'service did not return', 10000)
			runs ->
				expect(@serviceReturn.hasError).toBeFalsy()
				expect(@serviceReturn.results.data.aaData.length).toEqual 4
				expect(@serviceReturn.hasWarning).toBeDefined()
				expect(@serviceReturn.results.htmlSummary).toBeDefined()

	describe 'when run with invalid input file', ->
		beforeEach ->
			runs ->
				$.ajax
					type: 'POST'
					url: "api/geneDataQuery"
					data: badDataRequest
					success: (json) =>
						@serviceReturn = json
					error: (err) =>
						console.log 'got ajax error'
						@serviceReturn = null
					dataType: 'json'
		it 'should return error=true, and at least one message', ->
			waitsFor( @waitForServiceReturn, 'service did not return', 20000)
			runs ->
				expect(@serviceReturn.results.htmlSummary).toBeDefined()
				expect(@serviceReturn.hasError).toBeTruthy()
				expect(@serviceReturn.errorMessages.length).toBeGreaterThan(0)
				expect(@serviceReturn.errorMessages[1].errorLevel).toEqual 'error'

#TODO api/geneDataQueryReturnCSV just returns a CSV stream May not be able to test here