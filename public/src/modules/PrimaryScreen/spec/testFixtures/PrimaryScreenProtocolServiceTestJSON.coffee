((exports) ->
	exports.customerMolecularTargetCodeTable = [
		active: true
		code: "test1"
		description: "test1 description"
		isDefault: false
		name: "Test1"
		version: 1
	,
		active: true
		code: "test2"
		description: "test2 description"
		isDefault: false
		name: "Test2"
		version: 1
	,
		active: true
		code: "test3"
		description: "test3 description"
		isDefault: false
		name: "Test3"
		version: 1
	]
) (if (typeof process is "undefined" or not process.versions) then window.primaryScreenProtocolServiceTestJSON = window.primaryScreenProtocolServiceTestJSON or {} else exports)
