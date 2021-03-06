((exports) ->
	exports.templates =
		[
			{
				templateName: 'Template 1',
				jsonTemplate:
					'[
						{"dbProperty":"db1","sdfProperty":"prop1","required":true,"defaultVal":"1"}
					,
						{"dbProperty":"db2","sdfProperty":"prop2","required":true,"defaultVal":"2"}
					,
						{"dbProperty":"db3","required":true,"sdfProperty":"prop3","defaultVal":"3"}
					,
						{"dbProperty":"db4","required":true,"sdfProperty":"prop4","defaultVal":"4"}
					,
						{"dbProperty":"none","required":false,"sdfProperty":"prop5","defaultVal":""}
					,
						{"dbProperty":"db5","required":false,"sdfProperty":null,"defaultVal":""}
					,
						{"dbProperty":"db6","required":false,"sdfProperty":"prop6","defaultVal":""}
					,
						{"dbProperty":"db7","required":false,"sdfProperty":"prop7","defaultVal":""}
					,
						{"dbProperty":"db8","required":false,"sdfProperty":"prop8","defaultVal":""}
					,
						{"dbProperty":"db9","required":true,"sdfProperty":"prop9","defaultVal":""}
					,
						{"dbProperty":"db10","required":true,"sdfProperty":"prop10","defaultVal":""}
					]'
				ignored: false
			}
			,
			{
				templateName: 'Template 2',
				jsonTemplate:
					'[
						{"dbProperty": "db1", "sdfProperty": "prop1", "required": true, "defaultVal": "1"}
					,
						{"dbProperty": "db2", "sdfProperty": "prop2", "required": true, "defaultVal": "2"}
					,
						{"dbProperty": "db3", "required": true, "sdfProperty": "prop3", "defaultVal": "3"}
					,
						{"dbProperty": "db4", "required": true, "sdfProperty": "prop4", "defaultVal": "4"}
					,
						{"dbProperty": "none", "required": false, "sdfProperty": "prop5", "defaultVal": ""}
					,
						{"dbProperty": "db5", "required": true, "sdfProperty": null, "defaultVal": ""}
					]'
				ignored: false
			}

		]

	exports.savedTemplateReturn =
	{
		"id": 50126,
		"ignored": false,
		"jsonTemplate": "[{\"dbProperty\":\"Project\",\"defaultVal\":\"project1\",\"required\":true,\"sdfProperty\":\"\"},{\"dbProperty\":\"Lot Comments\",\"defaultVal\":\"Default Comments\",\"required\":false,\"sdfProperty\":\"Lot Comments\"},{\"dbProperty\":\"none\",\"defaultVal\":\"\",\"required\":false,\"sdfProperty\":\"Formula\"},{\"dbProperty\":\"none\",\"defaultVal\":\"\",\"required\":false,\"sdfProperty\":\"Mol Weight\"},{\"dbProperty\":\"none\",\"defaultVal\":\"\",\"required\":false,\"sdfProperty\":\"CdId\"},{\"dbProperty\":\"Lot Synthesis Date\",\"defaultVal\":\"2015-06-23\",\"required\":true,\"sdfProperty\":\"\"},{\"dbProperty\":\"Lot Notebook Page\",\"defaultVal\":\"EG 1\",\"required\":true,\"sdfProperty\":\"\"},{\"dbProperty\":\"Lot Chemist\",\"defaultVal\":\"bob\",\"required\":true,\"sdfProperty\":\"\"},{\"dbProperty\":\"Lot Purity Measured By\",\"defaultVal\":\"NMR\",\"required\":true,\"sdfProperty\":\"\"},{\"dbProperty\":\"Parent Stereo Category\",\"defaultVal\":\"unknown\",\"required\":true,\"sdfProperty\":\"\"},{\"dbProperty\":\"Lot Number\",\"defaultVal\":\"22\",\"required\":false,\"sdfProperty\":\"\"}]",
		"recordedBy": "bob",
		"templateName": "Bob Template 2",
		"version": 0
	}

	exports.propertiesList =
	{
		"sdfProperties":[
			{"name":"prop1", "dataType":"double"},
			{"name":"prop2", "dataType":"text"},
			{"name":"prop3", "dataType":"date"},
			{"name":"prop4", "dataType":"integer"},
			{"name":"prop5", "dataType":"double"}
		]
		,
		"dbProperties":
			[
				{"name":"db1", "dataType":"double", "required": true, "displayOrder":1},
				{"name":"db2", "dataType":"text", "required": true, "displayOrder":2},
				{"name":"db3", "dataType":"date", "required": true, "displayOrder":3},
				{"name":"db4", "dataType":"integer", "required": true, "displayOrder":4},
				{"name":"db5", "dataType":"double", "required": false, "displayOrder":5}
			]
		,
		"bulkLoadProperties":[
			{"dbProperty": "db1", "sdfProperty":"prop1" , required: true, defaultVal: 1 },
			{"dbProperty": "db2", "sdfProperty":"prop2" , required: true, defaultVal: 2}
		]
	}

	exports.propertiesList2 =
	{
		"sdfProperties":[
			{"name":"prop1", "dataType":"double"},
			{"name":"prop2", "dataType":"text"},
			{"name":"prop3", "dataType":"date"},
			{"name":"prop4", "dataType":"integer"},
			{"name":"prop5", "dataType":"double"}
			{"name":"prop6", "dataType":"double"},
			{"name":"prop7", "dataType":"text"},
			{"name":"prop8", "dataType":"date"},
			{"name":"prop9", "dataType":"integer"},
			{"name":"prop10", "dataType":"double"}
		]
		,
		"dbProperties":
			[
				{"name":"db1", "dataType":"double", "required": true, "displayOrder":1},
				{"name":"db2", "dataType":"text", "required": true, "displayOrder":2},
				{"name":"db3", "dataType":"date", "required": true, "displayOrder":3},
				{"name":"db4", "dataType":"integer", "required": true, "displayOrder":4},
				{"name":"db5", "dataType":"double", "required": false, "displayOrder":5}
				{"name":"db6", "dataType":"double", "required": false, "displayOrder":6},
				{"name":"db7", "dataType":"text", "required": false, "displayOrder":7},
				{"name":"db8", "dataType":"date", "required": false, "displayOrder":8},
				{"name":"db9", "dataType":"integer", "required": true, "displayOrder":9},
				{"name":"db10", "dataType":"double", "required": true, "displayOrder":10}
			]
		,
		"bulkLoadProperties":[
			{"dbProperty": "db1", "sdfProperty":"prop1" , required: true, defaultVal: 1 },
			{"dbProperty": "db2", "sdfProperty":"prop2" , required: true, defaultVal: 2 }
			{"dbProperty": "db9", "sdfProperty":"prop9" , required: true, defaultVal: 9 },
			{"dbProperty": "db10", "sdfProperty":"prop10" , required: true, defaultVal: 10 }
		]
	}

	exports.propertiesList3 =
	{
		"sdfProperties":[
			{"name":"prop1", "dataType":"double"},
			{"name":"prop2", "dataType":"text"},
			{"name":"prop3", "dataType":"date"},
			{"name":"prop4", "dataType":"integer"},
			{"name":"prop5", "dataType":"double"}
			{"name":"prop6", "dataType":"double"},
			{"name":"prop7", "dataType":"text"},
			{"name":"prop8", "dataType":"date"},
			{"name":"prop9", "dataType":"integer"},
			{"name":"prop10", "dataType":"double"}
			{"name":"prop10", "dataType":"double"}
		]
		,
		"dbProperties":
			[
				{"name":"db1", "dataType":"double", "required": true, "displayOrder":1},
				{"name":"db2", "dataType":"text", "required": true, "displayOrder":2},
				{"name":"db3", "dataType":"date", "required": true, "displayOrder":3},
				{"name":"db4", "dataType":"integer", "required": true, "displayOrder":4},
				{"name":"db5", "dataType":"double", "required": true, "displayOrder":5}
				{"name":"db6", "dataType":"double", "required": true, "displayOrder":6},
				{"name":"db7", "dataType":"text", "required": false, "displayOrder":7},
				{"name":"db8", "dataType":"date", "required": false, "displayOrder":8},
				{"name":"db9", "dataType":"integer", "required": false, "displayOrder":9},
				{"name":"db10", "dataType":"double", "required": false, "displayOrder":10}
				{"name":"salt type", "dataType":"double", "required": false, "displayOrder":11}
				{"name":"salt equivalents", "dataType":"double", "required": false, "displayOrder":12}
			]
		,
		"bulkLoadProperties":[
			{"dbProperty": "db1", "sdfProperty":"prop1" , required: true },
			{"dbProperty": "db2", "sdfProperty":"prop2" , required: true },
			{"dbProperty": "db9", "sdfProperty":"prop9" , required: false },
			{"dbProperty": "db10", "sdfProperty":"prop10" , required: false }
		]
	}

	exports.file1 =
		id: 1
		fileName: "TestFile.csv"
		loadDate: 1342080000000
		loadUser: "bob"

	exports.file2 =
		id: 2
		fileName: "TestFile2.csv"
		loadDate: 1342020000000
		loadUser: "joe"

	exports.file3 =
		id: 3
		fileName: "TestFile3.csv"
		loadDate: 1343920000000
		loadUser: "jane"

	exports.filesToPurge =
		[
			exports.file1,
			exports.file2,
			exports.file3
		]

) (if (typeof process is "undefined" or not process.versions) then window.cmpdRegBulkLoaderServiceTestJSON = window.cmpdRegBulkLoaderServiceTestJSON or {} else exports)
