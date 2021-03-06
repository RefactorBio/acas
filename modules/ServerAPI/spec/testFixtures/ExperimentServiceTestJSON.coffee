((exports) ->
	exports.experimentLabels = [
		id: 43
		ignored: false
		imageFile: null
		lsKind: "experiment name"
		labelText: "FLIPR target A biochemical"
		lsType: "name"
		lsTypeAndKind: "name_experiment name"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 47
			recordedDate: 1362435677000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: true
		recordedBy: "userName"
		recordedDate: 1362435678000
		version: 0
	,
		id: 42
		ignored: true
		imageFile: null
		lsKind: "experiment name"
		labelText: "FLIPR target A biochemical old"
		lsType: "name"
		lsTypeAndKind: "name_experiment name"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 48
			recordedDate: 1362435677000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: true
		recordedBy: "userName"
		recordedDate: 1361435678000
		version: 0
	,
		id: 45
		ignored: false
		imageFile: null
		lsKind: "experiment full name"
		labelText: "FLIPR target A biochemical with additional name awesomness"
		lsType: "name"
		lsTypeAndKind: "name_experiment full name"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 49
			recordedDate: 1362435677000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1362435678001
		version: 0
	,
		id: 49
		ignored: false
		imageFile: null
		lsKind: ""
		labelText: "AAABBD13343434"
		lsType: "barcode"
		lsTypeAndKind: "barcode_"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 50
			recordedDate: 1362435679000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1362435679001
		version: 0
	]

	exports.experimentLabelsNoPreferred = [
		id: 43
		ignored: false
		imageFile: null
		lsKind: "experiment name"
		labelText: "FLIPR target A biochemical"
		lsType: "name"
		lsTypeAndKind: "name_experiment name"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 47
			recordedDate: 1362435677000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1362435678000
		version: 0
	,
		id: 42
		ignored: true
		imageFile: null
		lsKind: "experiment name"
		labelText: "FLIPR target A biochemical old"
		lsType: "name"
		lsTypeAndKind: "name_experiment name"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 48
			recordedDate: 1362435677000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1361435678000
		version: 0
	,
		id: 45
		ignored: false
		imageFile: null
		lsKind: "experiment full name"
		labelText: "FLIPR target A biochemical with additional name awesomness"
		lsType: "name"
		lsTypeAndKind: "name_experiment full name"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 49
			recordedDate: 1362435677000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1362435678001
		version: 0
	,
		id: 49
		ignored: false
		imageFile: null
		lsKind: ""
		labelText: "AAABBD13343434"
		lsType: "barcode"
		lsTypeAndKind: "barcode_"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 50
			recordedDate: 1362435679000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1362435679001
		version: 0
	]

	exports.experimentLabelsNoPreferredNoNames = [
		id: 45
		ignored: false
		imageFile: null
		lsKind: "experiment full name"
		labelText: "FLIPR target A biochemical with additional name awesomness"
		lsType: "barcode"
		lsTypeAndKind: "name_experiment full name"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 49
			recordedDate: 1362435677000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1362435678001
		version: 0
	,
		id: 49
		ignored: false
		imageFile: null
		lsKind: ""
		labelText: "AAABBD13343434"
		lsType: "barcode"
		lsTypeAndKind: "barcode_"
		lsTransaction:
			comments: "experiment 502 transactions"
			id: 50
			recordedDate: 1362435679000
			version: 0
		modifiedDate: null
		physicallyLabled: false
		preferred: false
		recordedBy: "userName"
		recordedDate: 1362435679001
		version: 0
	]

	exports.stubSavedExperiment = [
			codeName: "EXPT-00000046"
			id: 270
			ignored: false
			lsKind: null #changed from kind to lsKind
			lsTransaction:
				comments: "protocol 201 transactions"
				id: 179
				recordedDate: 1361600825000
				version: 0

			modifiedBy: null
			modifiedDate: null
			recordedBy: "jmcneil"
			recordedDate: 1361600860000
			shortDescription: "experiment short description goes here"
			version: 0
		,
			codeName: "EXPT-00000047"
			id: 271
			ignored: false
			lsKind: null #changed from kind to lsKind
			lsTransaction:
				comments: "protocol 201 transactions"
				id: 180
				recordedDate: 1361600825000
				version: 0

			modifiedBy: null
			modifiedDate: null
			recordedBy: "jmcneil"
			recordedDate: 1375600860000
			shortDescription: "2nd experiment short description goes here"
			version: 0
	]

	exports.experimentToSave =
		analysisGroups: []
		lsKind: "default" #changed from kind to lsKind
		lsLabels: [
			ignored: false
			imageFile: null
			labelText: "testing eg experiment for experiment service spec"
			lsKind: "experiment name"
			lsType: "name"
			physicallyLabled: false
			preferred: true
			recordedBy: "bob"
			recordedDate: 1427743629793
		]
		lsStates: [
			ignored: false
			lsKind: "experiment metadata"
			lsType: "metadata"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "TestFile.mol"
				ignored: false
				lsKind: "experiment file"
				lsType: "fileValue"
				lsTypeAndKind: "fileValue_experiment file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "Test.csv"
				ignored: false
				lsKind: "experiment file"
				lsType: "fileValue"
				lsTypeAndKind: "fileValue_experiment file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				codeKind: "scientist"
				codeOrigin: "ACAS authors"
				codeType: "assay"
				codeValue: "egao"
				ignored: false
				lsKind: "scientist"
				lsType: "codeValue"
				recordedBy: "bob"
				recordedDate: 1427743654063
			,
				ignored: false
				lsKind: "notebook"
				lsType: "stringValue"
				recordedBy: "bob"
				recordedDate: 1427743654063
				stringValue: "911"
			,
				dateValue: 1427698800000
				ignored: false
				lsKind: "completion date"
				lsType: "dateValue"
				recordedBy: "bob"
				recordedDate: 1427743654063
			,
				codeKind: "status"
				codeOrigin: "ACAS DDICT"
				codeType: "experiment"
				codeValue: "created"
				ignored: false
				lsKind: "experiment status"
				lsType: "codeValue"
				recordedBy: "bob"
				recordedDate: 1427743654063
			,
				clobValue: "experiment details go here"
				ignored: false
				lsKind: "experiment details"
				lsType: "clobValue"
				recordedBy: "bob"
				recordedDate: 1427743654063
			,
				clobValue: "comments go here"
				ignored: false
				lsKind: "comments"
				lsType: "clobValue"
				recordedBy: "bob"
				recordedDate: 1427743654063
			,
				codeKind: "biology"
				codeOrigin: "ACAS DDICT"
				codeType: "project"
				codeValue: "project1"
				ignored: false
				lsKind: "project"
				lsType: "codeValue"
				recordedBy: "bob"
				recordedDate: 1427743654063
			]
			recordedBy: "smeyer"
			recordedDate: 1427743654063
		]
		lsTags: []
		lsType: "default"
		protocol:
			codeName: "PROT-00000143"
			deleted: false
			experiments: []
			id: 1494668
			ignored: false
			lsKind: "default"
			lsLabels: [
				deleted: false
				id: 297613
				ignored: false
				imageFile: null
				labelText: "testing eg march24 pb2"
				lsKind: "protocol name"
				lsType: "name"
				lsTypeAndKind: "name_protocol name"
				physicallyLabled: false
				preferred: true
				recordedBy: "bob"
				recordedDate: 1427237626820
				version: 0
			]
			lsStates: [
				deleted: false
				id: 2635088
				ignored: false
				lsKind: "protocol metadata"
				lsType: "metadata"
				lsTypeAndKind: "metadata_protocol metadata"
				lsValues: [
					codeKind: "status"
					codeOrigin: "ACAS DDICT"
					codeType: "protocol"
					codeTypeAndKind: "protocol_status"
					codeValue: "created"
					deleted: false
					id: 5927838
					ignored: false
					lsKind: "protocol status"
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_protocol status"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				,
					clobValue: ""
					codeTypeAndKind: "null_null"
					deleted: false
					id: 5927839
					ignored: false
					lsKind: "comments"
					lsType: "clobValue"
					lsTypeAndKind: "clobValue_comments"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				,
					codeKind: "stage"
					codeOrigin: "ACAS DDICT"
					codeType: "assay"
					codeTypeAndKind: "assay_stage"
					codeValue: "unassigned"
					deleted: false
					id: 5927837
					ignored: false
					lsKind: "assay stage"
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_assay stage"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				,
					clobValue: ""
					codeTypeAndKind: "null_null"
					deleted: false
					id: 5927841
					ignored: false
					lsKind: "protocol details"
					lsType: "clobValue"
					lsTypeAndKind: "clobValue_protocol details"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				,
					codeTypeAndKind: "null_null"
					dateValue: 1427180400000
					deleted: false
					id: 5927840
					ignored: false
					lsKind: "creation date"
					lsType: "dateValue"
					lsTypeAndKind: "dateValue_creation date"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				,
					codeTypeAndKind: "null_null"
					deleted: false
					id: 5927835
					ignored: false
					lsKind: "notebook"
					lsType: "stringValue"
					lsTypeAndKind: "stringValue_notebook"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					stringValue: "testing"
					unitTypeAndKind: "null_null"
					version: 0
				,
					codeTypeAndKind: "null_null"
					deleted: false
					id: 5927836
					ignored: false
					lsKind: "assay tree rule"
					lsType: "stringValue"
					lsTypeAndKind: "stringValue_assay tree rule"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					stringValue: ""
					unitTypeAndKind: "null_null"
					version: 0
				,
					codeTypeAndKind: "null_null"
					deleted: false
					fileValue: "Testing (1).pdf"
					id: 5927844
					ignored: false
					lsKind: "experiment file"
					lsType: "fileValue"
					lsTypeAndKind: "fileValue_experiment file"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				,
					codeKind: "scientist"
					codeOrigin: "ACAS authors"
					codeType: "assay"
					codeTypeAndKind: "assay_scientist"
					codeValue: "egao"
					deleted: false
					id: 5927843
					ignored: false
					lsKind: "scientist"
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_scientist"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				,
					clobValue: ""
					codeTypeAndKind: "null_null"
					deleted: false
					id: 5927842
					ignored: false
					lsKind: "assay principle"
					lsType: "clobValue"
					lsTypeAndKind: "clobValue_assay principle"
					operatorTypeAndKind: "null_null"
					publicData: false
					recordedBy: "bob"
					recordedDate: 1427237638381
					unitTypeAndKind: "null_null"
					version: 0
				]
				recordedBy: "bob"
				recordedDate: 1427237638381
				version: 1
			]
			lsTags: []
			lsType: "default"
			lsTypeAndKind: "default_default"
			modifiedBy: ""
			recordedBy: "bob"
			recordedDate: 1427237638000
			shortDescription: " "
			version: 2
		recordedBy: "jmcneil"
		recordedDate: 1361600860000
		shortDescription: "experiment short description goes here"



	exports.fullExperimentFromServer =
		analysisGroups: [
			codeName: "AG-00000002"
			id: 19
			ignored: false
			lsKind: "Generic"
			lsLabels: []
			lsStates: [
				id: 17
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: "exampleUploadedFile.txt"
					id: 222222
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "fileValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: null
					operatorTypeAndKind: null
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: null
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 22
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 40
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 21
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 20
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 18
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 25
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 24
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 23
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 16
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 18
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 30
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 19
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 70
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 17
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			]
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_Generic"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889490000
			treatmentGroups: []
			version: 0
		,
			codeName: "AG-00000001"
			id: 18
			ignored: false
			lsKind: "Generic"
			lsLabels: []
			lsStates: [
				comments: null
				id: 15
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 16
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 15
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 80
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 14
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 14
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 12
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 11
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 13
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 13
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 8
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 12
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 9
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 30
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 10
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			]
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_Generic"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889490000
			treatmentGroups: []
			version: 0
		]
		codeName: "EXPT-00000001"
		id: 17
		ignored: false
		lsKind: "default"
		lsLabels: [
			id: 34
			ignored: false
			imageFile: null
			labelText: "Test Experiment 1"
			lsKind: "experiment name"
			lsTransaction: 2
			lsType: "name"
			lsTypeAndKind: "name_experiment name"
			modifiedDate: null
			physicallyLabled: false
			preferred: true
			recordedBy: "smeyer"
			recordedDate: 1375889487000
			version: 0
		]
		lsTags: [
			id: 1
			tagText: "stuff"
		,
			id: 2
			tagText: "more stuff"
		]
		lsStates: [
			comments: null
			id: 2
			ignored: false
			lsKind: "experiment controls"
			lsTransaction: 1
			lsType: "metadata"
			lsTypeAndKind: "metadata_experiment controls"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 80471
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: "negative control"
				uncertainty: null
				urlValue: null
				lsKind: "control type"
				valueOperator: null
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_control type"
				valueUnit: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 80470
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: 1.0
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "tested concentration"
				valueOperator: null
				lsType: "numericValue"
				lsTypeAndKind: "numericValue_tested concentration"
				valueUnit: "uM"
				version: 0
			,
				clobValue: null
				codeValue: "CRA-000396:1"
				comments: null
				dateValue: null
				fileValue: null
				id: 80469
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "batch code"
				valueOperator: null
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_batch code"
				valueUnit: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "userName"
			recordedDate: 1375141474000
			version: 0
			comments: null
		,
			comments: null
			id: 11
			ignored: false
			lsKind: "experiment metadata"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_experiment metadata"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 3
				ignored: false
				lsKind: "notebook page"
				lsTransaction: 2
				lsType: "numericValue"
				lsTypeAndKind: "numericValue_notebook page"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "12"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "TestFile.mol"
				id: 391
				ignored: false
				lsKind: "experiment file"
				lsTransaction: 2
				lsType: "fileValue"
				lsTypeAndKind: "fileValue_experiment file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "Test.csv"
				id: 391245
				ignored: false
				lsKind: "experiment file"
				lsTransaction: 2
				lsType: "fileValue"
				lsTypeAndKind: "fileValue_experiment file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Analysis not yet completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 4
				ignored: false
				lsKind: "analysis result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_analysis result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Dry Run not started</p>"
#				clobValue: "<p>Dry Run complete</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 4212
				ignored: false
				lsKind: "dry run result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_dry run result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Model fit not yet completed</p>"
#				clobValue: "<p>Model fit completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 444
				ignored: false
				lsKind: "model fit result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_model fit result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeType: "dry run"
				codeKind: "status"
				codeValue: "not started"
#				codeValue: "running"
				comments: null
				dateValue: null
				fileValue: null
				id: 42213
				ignored: false
				lsKind: "dry run status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_dry run status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeType: "analysis"
				codeKind: "status"
				codeOrigin: "ACAS DDICT"
				codeValue: "not started"
				comments: null
				dateValue: null
				fileValue: null
				id: 422
				ignored: false
				lsKind: "analysis status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_analysis status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
#				stringValue: "running"
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: "not started"
				comments: null
				dateValue: null
				fileValue: null
				id: 4225
				ignored: false
				lsKind: "model fit status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_model fit status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
#				stringValue: "complete"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: '{"positiveControl":{"batchCode":"CMPD-12345678-01","concentration":10,"concentrationUnits":"uM"},"negativeControl":{"batchCode":"CMPD-87654321-01","concentration":1,"concentrationUnits":"uM"},"agonistControl":{"batchCode":"CMPD-87654399-01","concentration":250753.77,"concentrationUnits":"uM"},"vehicleControl":{"batchCode":"CMPD-00000001-01","concentration":null,"concentrationUnits":null},"instrumentReader":"flipr","signalDirectionRule":"increasing","aggregateBy":"compound batch concentration","aggregationMethod":"median","normalizationRule":"plate order only","primaryHitEfficacyThreshold":42,"primaryHitSDThreshold":5,"primaryThresholdType":"sd","transferVolume":12,"confirmationHitEfficacyThreshold":42,"confirmationHitSDThreshold":5,"confirmationThresholdType":"sd","dilutionFactor":21,"volumeType":"dilution","assayVolume":24,"htsFormat":false,"primaryAutoHitSelection":false,"confirmationAutoHitSelection":true,"generateSummaryReport":true,"matchReadName":false,"primaryAnalysisReadList":[{"readNumber":1,"readPosition":11,"readName":"none","activity":false},{"readNumber":2,"readPosition":12,"readName":"fluorescence","activity":true},{"readNumber":3,"readPosition":13,"readName":"luminescence","activity":false}],"transformationRuleList":[{"transformationRule":"% efficacy"},{"transformationRule":"sd"},{"transformationRule":"null"}]}'
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 333
				ignored: false
				lsKind: "data analysis parameters"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_data analysis parameters"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: '{ "max": { "limitType": "pin", "value": 100 }, "min": { "limitType": "none", "value": null }, "slope": { "limitType": "limit", "value": 1.5 }, "inactiveThreshold": 20, "inverseAgonistMode": true}'
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 3331
				ignored: false
				lsKind: "model fit parameters"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_model fit parameters"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeOrigin: "ACAS authors"
				codeValue: "jane"
				comments: null
				dateValue: null
				fileValue: null
				id: 523
				ignored: false
				lsKind: "scientist"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_scientist"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 5
				ignored: false
				lsKind: "notebook"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_notebook"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "911"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 514
				ignored: true
				lsKind: "notebook"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_notebook"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "ignored notebook"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: 1342080000000
				fileValue: null
				id: 1
				ignored: false
				lsKind: "completion date"
				lsTransaction: 2
				lsType: "dateValue"
				lsTypeAndKind: "dateValue_completion date"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeKind: "status"
				codeOrigin: "ACAS DDICT"
				codeType: "experiment"
				codeValue: "started"
				comments: null
				dateValue: null
				fileValue: null
				id: 2
				ignored: false
				lsKind: "experiment status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_experiment status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "experiment details go here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 804699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "experiment details"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_experiment details"
				valueUnit: null
				version: 0
			,
				clobValue: "comments go here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 8046999912
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "comments"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_comments"
				valueUnit: null
				version: 0
			,
				clobValue: null
				codeValue: "project1"
				comments: null
				dateValue: null
				fileValue: null
				id: 904699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "project"
				valueOperator: null
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_project"
				valueUnit: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889487000
			version: 1
		,
			comments: ""
			id: 12
			ignored: false
			lsKind: "raw results locations"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_raw results locations"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "experiments/EXPT-00000001/Mia-Paca.xls"
				id: 7
				ignored: false
				lsKind: "source file"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_source file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889489000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889489000
			version: 0
		,
			'deleted': false
			'id': 20
			'ignored': false
			'lsKind': 'custom experiment metadata gui'
			'lsTransaction': 131
			'lsType': 'metadata'
			'lsTypeAndKind': 'metadata_custom experiment metadata gui'
			'lsValues': [
				'clobValue': '[{"displayOrder":1,"lsType":"codeValue","lsKind":"Original Data Level","label":"Original Data Level"},{"displayOrder":2,"lsType":"codeValue","lsKind":"Conversion Method","label":"Conversion Method"},{"displayOrder":3,"lsType":"codeValue","lsKind":"Scoring Category","label":"Scoring Category"},{"displayOrder":4,"lsType":"stringValue","lsKind":"Scoring Category Rationale","label":"Scoring Category Rationale"},{"displayOrder":5,"lsType":"numericValue","lsKind":"Weight","label":"Weight"},{"displayOrder":6,"lsType":"stringValue","lsKind":"Weight Rationale","label":"Weight Rationale"},{"displayOrder":7,"lsType":"codeValue","lsKind":"Species","label":"Species"},{"displayOrder":8,"lsType":"codeValue","lsKind":"Experiment Type","label":"Experiment Type"},{"displayOrder":9,"lsType":"codeValue","lsKind":"Experiment Source","label":"Experiment Source"},{"displayOrder":10,"lsType":"stringValue","lsKind":"Experiment Vendor","label":"Experiment Vendor"},{"displayOrder":11,"lsType":"urlValue","lsKind":"Experiment URL","label":"Experiment URL"},{"displayOrder":12,"lsType":"stringValue","lsKind":"Hit Definition","label":"Hit Definition"},{"displayOrder":13,"lsType":"stringValue","lsKind":"Contributors","label":"Contributors"},{"displayOrder":14,"lsType":"stringValue","lsKind":"ELN Experiment Numbers","label":"ELN Experiment Numbers"},{"displayOrder":15,"lsType":"stringValue","lsKind":"Additional Files","label":"Additional Files"},{"displayOrder":16,"lsType":"urlValue","lsKind":"Summary Report Link","label":"Summary Report Link"},{"displayOrder":17,"lsType":"clobValue","lsKind":"Background","label":"Background"},{"displayOrder":18,"lsType":"clobValue","lsKind":"Methods","label":"Methods"},{"displayOrder":19,"lsType":"clobValue","lsKind":"Results","label":"Results"},{"displayOrder":20,"lsType":"clobValue","lsKind":"Conclusions","label":"Conclusions"},{"displayOrder":21,"lsType":"clobValue","lsKind":"Analysis","label":"Analysis"}]'
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 245
				'ignored': false
				'lsKind': 'GUI descriptor'
				'lsTransaction': 131
				'lsType': 'clobValue'
				'lsTypeAndKind': 'clobValue_GUI descriptor'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'version': 1
			]
		,
			'deleted': false
			'id': 19
			'ignored': false
			'lsKind': 'custom experiment metadata'
			'lsTransaction': 131
			'lsType': 'metadata'
			'lsTypeAndKind': 'metadata_custom experiment metadata'
			'lsValues': [
				'clobValue': 'methods text'
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 244
				'ignored': false
				'lsKind': 'Methods'
				'lsTransaction': 131
				'lsType': 'clobValue'
				'lsTypeAndKind': 'clobValue_Methods'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'clobValue': 'background text'
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 230
				'ignored': false
				'lsKind': 'Background'
				'lsTransaction': 131
				'lsType': 'clobValue'
				'lsTypeAndKind': 'clobValue_Background'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 235
				'ignored': false
				'lsKind': 'Experiment URL'
				'lsTransaction': 131
				'lsType': 'urlValue'
				'lsTypeAndKind': 'urlValue_Experiment URL'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'urlValue': 'http://www.rcsb.org'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 243
				'ignored': false
				'lsKind': 'Weight Rationale'
				'lsTransaction': 131
				'lsType': 'stringValue'
				'lsTypeAndKind': 'stringValue_Weight Rationale'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'stringValue': 'weight rationale text'
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeKind': 'Scoring Category'
				'codeOrigin': 'ACAS DDICT'
				'codeType': 'custom experiment metadata'
				'codeTypeAndKind': 'custom experiment metadata_Scoring Category'
				'codeValue': 'special category'
				'deleted': false
				'id': 234
				'ignored': false
				'lsKind': 'Scoring Category'
				'lsTransaction': 131
				'lsType': 'codeValue'
				'lsTypeAndKind': 'codeValue_Scoring Category'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 242
				'ignored': false
				'lsKind': 'Summary Report Link'
				'lsTransaction': 131
				'lsType': 'urlValue'
				'lsTypeAndKind': 'urlValue_Summary Report Link'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'urlValue': 'https://www.google.com'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 227
				'ignored': false
				'lsKind': 'ELN Experiment Numbers'
				'lsTransaction': 131
				'lsType': 'stringValue'
				'lsTypeAndKind': 'stringValue_ELN Experiment Numbers'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'stringValue': 'P-C-NNNNNNN'
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeKind': 'Species'
				'codeOrigin': 'ACAS DDICT'
				'codeType': 'custom experiment metadata'
				'codeTypeAndKind': 'custom experiment metadata_Species'
				'codeValue': 'Mouse'
				'deleted': false
				'id': 241
				'ignored': false
				'lsKind': 'Species'
				'lsTransaction': 131
				'lsType': 'codeValue'
				'lsTypeAndKind': 'codeValue_Species'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'clobValue': 'results text'
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 236
				'ignored': false
				'lsKind': 'Results'
				'lsTransaction': 131
				'lsType': 'clobValue'
				'lsTypeAndKind': 'clobValue_Results'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 226
				'ignored': false
				'lsKind': 'Experiment Vendor'
				'lsTransaction': 131
				'lsType': 'stringValue'
				'lsTypeAndKind': 'stringValue_Experiment Vendor'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'stringValue': 'name of vendor'
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 231
				'ignored': false
				'lsKind': 'Weight'
				'lsTransaction': 131
				'lsType': 'numericValue'
				'lsTypeAndKind': 'numericValue_Weight'
				'numericValue': 5
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeKind': 'Experiment Source'
				'codeOrigin': 'ACAS DDICT'
				'codeType': 'custom experiment metadata'
				'codeTypeAndKind': 'custom experiment metadata_Experiment Source'
				'codeValue': 'Expermient Source'
				'deleted': false
				'id': 239
				'ignored': false
				'lsKind': 'Experiment Source'
				'lsTransaction': 131
				'lsType': 'codeValue'
				'lsTypeAndKind': 'codeValue_Experiment Source'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeKind': 'Conversion Method'
				'codeOrigin': 'ACAS DDICT'
				'codeType': 'custom experiment metadata'
				'codeTypeAndKind': 'custom experiment metadata_Conversion Method'
				'codeValue': 'special method 2'
				'deleted': false
				'id': 225
				'ignored': false
				'lsKind': 'Conversion Method'
				'lsTransaction': 131
				'lsType': 'codeValue'
				'lsTypeAndKind': 'codeValue_Conversion Method'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeKind': 'Experiment Type'
				'codeOrigin': 'ACAS DDICT'
				'codeType': 'custom experiment metadata'
				'codeTypeAndKind': 'custom experiment metadata_Experiment Type'
				'codeValue': 'Experiment Test'
				'deleted': false
				'id': 240
				'ignored': false
				'lsKind': 'Experiment Type'
				'lsTransaction': 131
				'lsType': 'codeValue'
				'lsTypeAndKind': 'codeValue_Experiment Type'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'clobValue': 'analysis text'
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 237
				'ignored': false
				'lsKind': 'Analysis'
				'lsTransaction': 131
				'lsType': 'clobValue'
				'lsTypeAndKind': 'clobValue_Analysis'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 229
				'ignored': false
				'lsKind': 'Scoring Category Rationale'
				'lsTransaction': 131
				'lsType': 'stringValue'
				'lsTypeAndKind': 'stringValue_Scoring Category Rationale'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'stringValue': 'rationale text'
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeKind': 'Original Data Level'
				'codeOrigin': 'ACAS DDICT'
				'codeType': 'custom experiment metadata'
				'codeTypeAndKind': 'custom experiment metadata_Original Data Level'
				'codeValue': 'mRNA'
				'deleted': false
				'id': 224
				'ignored': false
				'lsKind': 'Original Data Level'
				'lsTransaction': 131
				'lsType': 'codeValue'
				'lsTypeAndKind': 'codeValue_Original Data Level'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'clobValue': 'conclusion text'
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 238
				'ignored': false
				'lsKind': 'Conclusions'
				'lsTransaction': 131
				'lsType': 'clobValue'
				'lsTypeAndKind': 'clobValue_Conclusions'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 232
				'ignored': false
				'lsKind': 'Hit Definition'
				'lsTransaction': 131
				'lsType': 'stringValue'
				'lsTypeAndKind': 'stringValue_Hit Definition'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'stringValue': 'how was the hit defined'
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 228
				'ignored': false
				'lsKind': 'Contributors'
				'lsTransaction': 131
				'lsType': 'stringValue'
				'lsTypeAndKind': 'stringValue_Contributors'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'stringValue': 'List of contributors'
				'unitTypeAndKind': 'null_null'
				'version': 0
			,
				'codeTypeAndKind': 'null_null'
				'deleted': false
				'id': 233
				'ignored': false
				'lsKind': 'Additional Files'
				'lsTransaction': 131
				'lsType': 'stringValue'
				'lsTypeAndKind': 'stringValue_Additional Files'
				'operatorTypeAndKind': 'null_null'
				'publicData': true
				'recordedBy': 'bob'
				'recordedDate': 1434590858000
				'stringValue': 'name or link to files?'
				'unitTypeAndKind': 'null_null'
				'version': 0
			]
			'recordedBy': 'bob'
			'recordedDate': 1434590858000
			'version': 1
		]
		lsTransaction: 2
		lsType: "default"
		lsTypeAndKind: "default_default"
		modifiedBy: null
		modifiedDate: null
		protocol:
			codeName: "PROT-00000001"
			id: 16
			ignored: false
			lsKind: "default"
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_default"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889486000
			shortDescription: "protocol created by generic data parser"
			version: 1

		recordedBy: "jane"
		recordedDate: 1375889487000
		shortDescription: "experiment created by generic data parser"
		version: 1

	exports.fullDeletedExperiment =
		analysisGroups: [
			codeName: "AG-00000002"
			id: 19
			ignored: false
			lsKind: "Generic"
			lsLabels: []
			lsStates: [
				id: 17
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: "exampleUploadedFile.txt"
					id: 222222
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "fileValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: null
					operatorTypeAndKind: null
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: null
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 22
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 40
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 21
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 20
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 18
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 25
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 24
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 23
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 16
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 18
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 30
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 19
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 70
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 17
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			]
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_Generic"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889490000
			treatmentGroups: []
			version: 0
		,
			codeName: "AG-00000001"
			id: 18
			ignored: false
			lsKind: "Generic"
			lsLabels: []
			lsStates: [
				comments: null
				id: 15
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 16
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 15
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 80
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 14
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 14
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 12
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 11
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 13
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 13
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 8
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 12
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 9
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 30
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 10
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			]
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_Generic"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889490000
			treatmentGroups: []
			version: 0
		]
		codeName: "EXPT-00000002"
		id: 112
		ignored: true
		lsKind: "default"
		lsLabels: [
			id: 34
			ignored: false
			imageFile: null
			labelText: "Test Experiment 1"
			lsKind: "experiment name"
			lsTransaction: 2
			lsType: "name"
			lsTypeAndKind: "name_experiment name"
			modifiedDate: null
			physicallyLabled: false
			preferred: true
			recordedBy: "smeyer"
			recordedDate: 1375889487000
			version: 0
		]
		lsTags: [
			id: 1
			tagText: "stuff"
		,
			id: 2
			tagText: "more stuff"
		]
		lsStates: [
			comments: null
			id: 2
			ignored: false
			lsKind: "experiment controls"
			lsTransaction: 1
			lsType: "metadata"
			lsTypeAndKind: "metadata_experiment controls"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 80471
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: "negative control"
				uncertainty: null
				urlValue: null
				lsKind: "control type"
				valueOperator: null
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_control type"
				valueUnit: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 80470
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: 1.0
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "tested concentration"
				valueOperator: null
				lsType: "numericValue"
				lsTypeAndKind: "numericValue_tested concentration"
				valueUnit: "uM"
				version: 0
			,
				clobValue: null
				codeValue: "CRA-000396:1"
				comments: null
				dateValue: null
				fileValue: null
				id: 80469
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "batch code"
				valueOperator: null
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_batch code"
				valueUnit: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "userName"
			recordedDate: 1375141474000
			version: 0
			comments: null
		,
			comments: null
			id: 11
			ignored: false
			lsKind: "experiment metadata"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_experiment metadata"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 3
				ignored: false
				lsKind: "notebook page"
				lsTransaction: 2
				lsType: "numericValue"
				lsTypeAndKind: "numericValue_notebook page"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "12"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Analysis not yet completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 4
				ignored: false
				lsKind: "analysis result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_analysis result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Model fit not yet completed</p>"
#				clobValue: "<p>Model fit completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 444
				ignored: false
				lsKind: "model fit result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_model fit result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 422
				ignored: false
				lsKind: "analysis status"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_analysis status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
#				stringValue: "complete"
				stringValue: "not started"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 4225
				ignored: false
				lsKind: "model fit status"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_model fit status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "not started"
#				stringValue: "complete"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: '{"positiveControl":{"batchCode":"CMPD-12345678-01","concentration":10,"concentrationUnits":"uM"},"negativeControl":{"batchCode":"CMPD-87654321-01","concentration":1,"concentrationUnits":"uM"},"agonistControl":{"batchCode":"CMPD-87654399-01","concentration":250753.77,"concentrationUnits":"uM"},"vehicleControl":{"batchCode":"CMPD-00000001-01","concentration":null,"concentrationUnits":null},"instrumentReader":"flipr","signalDirectionRule":"increasing","aggregateBy":"compound batch concentration","aggregationMethod":"median","normalizationRule":"plate order only","primaryHitEfficacyThreshold":42,"primaryHitSDThreshold":5,"primaryThresholdType":"sd","confirmationHitEfficacyThreshold":42,"confirmationHitSDThreshold":5,"confirmationThresholdType":"sd","transferVolume":12,"dilutionFactor":21,"volumeType":"dilution","assayVolume":24,"htsFormat":false,"primaryAutoHitSelection":false,"confirmationAutoHitSelection":false,"generateSummaryReport":true,"matchReadName":false,"primaryAnalysisReadList":[{"readPosition":11,"readName":"none","activity":false},{"readPosition":12,"readName":"fluorescence","activity":true},{"readPosition":13,"readName":"luminescence","activity":false}],"transformationRuleList":[{"transformationRule":"% efficacy"},{"transformationRule":"sd"},{"transformationRule":"null"}]}'
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 333
				ignored: false
				lsKind: "data analysis parameters"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_data analysis parameters"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: '{ "max": { "limitType": "pin", "value": 100 }, "min": { "limitType": "none", "value": null }, "slope": { "limitType": "limit", "value": 1.5 }, "inactiveThreshold": 20, "inverseAgonistMode": true}'
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 3331
				ignored: false
				lsKind: "model fit parameters"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_model fit parameters"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 5
				ignored: false
				lsKind: "notebook"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_notebook"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "911"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: 1342080000000
				fileValue: null
				id: 1
				ignored: false
				lsKind: "completion date"
				lsTransaction: 2
				lsType: "dateValue"
				lsTypeAndKind: "dateValue_completion date"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: "deleted"
				comments: null
				dateValue: null
				fileValue: null
				id: 2
				ignored: false
				lsKind: "status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "long description goes here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 804699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "description"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_description"
				valueUnit: null
				version: 0
			,
				clobValue: "comments go here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 8046999912
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "comments"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_comments"
				valueUnit: null
				version: 0
			,
				clobValue: null
				codeValue: "project1"
				comments: null
				dateValue: null
				fileValue: null
				id: 904699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "project"
				valueOperator: null
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_project"
				valueUnit: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889487000
			version: 1
		,
			comments: ""
			id: 12
			ignored: false
			lsKind: "raw results locations"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_raw results locations"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "experiments/EXPT-00000001/Mia-Paca.xls"
				id: 7
				ignored: false
				lsKind: "source file"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_source file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889489000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889489000
			version: 0
		]
		lsTransaction: 2
		lsType: "default"
		lsTypeAndKind: "default_default"
		modifiedBy: null
		modifiedDate: null
		protocol:
			codeName: "PROT-00000001"
			id: 16
			ignored: false
			lsKind: "default"
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_default"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889486000
			shortDescription: "protocol created by generic data parser"
			version: 1

		recordedBy: "nxm7557"
		recordedDate: 1375889487000
		shortDescription: "experiment created by generic data parser"
		version: 1

	exports.fullExperimentFromServerTwo =
		analysisGroups: [
			codeName: "AG-00000002"
			id: 19
			ignored: false
			lsKind: "Generic"
			lsLabels: []
			lsStates: [
				id: 17
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: "exampleUploadedFile.txt"
					id: 222222
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "fileValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: null
					operatorTypeAndKind: null
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: null
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 22
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 40
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 21
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 20
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 18
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 25
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 24
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 23
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 16
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 18
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 30
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 19
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 70
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000052-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 17
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			]
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_Generic"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889490000
			treatmentGroups: []
			version: 0
		,
			codeName: "AG-00000001"
			id: 18
			ignored: false
			lsKind: "Generic"
			lsLabels: []
			lsStates: [
				comments: null
				id: 15
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 16
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 15
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 80
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 14
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 100
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 14
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 12
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 11
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 13
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 10
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			,
				comments: null
				id: 13
				ignored: false
				lsKind: "Generic"
				lsTransaction: 2
				lsType: "data"
				lsTypeAndKind: "data_Generic"
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 8
					ignored: false
					lsKind: "Inhibition"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_Inhibition"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 12
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "%"
					unitType: null
					unitTypeAndKind: "null_%"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 9
					ignored: false
					lsKind: "tested concentration"
					lsTransaction: 2
					lsType: "numericValue"
					lsTypeAndKind: "numericValue_tested concentration"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: 30
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: "uM"
					unitType: null
					unitTypeAndKind: "null_uM"
					urlValue: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000051-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 10
					ignored: false
					lsKind: "batch code"
					lsTransaction: 2
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					modifiedBy: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					operatorKind: null
					operatorType: "comparison"
					operatorTypeAndKind: "comparison_null"
					publicData: true
					recordedBy: "smeyer"
					recordedDate: 1375889490000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					unitKind: null
					unitType: null
					unitTypeAndKind: "null_null"
					urlValue: null
					version: 0
				]
				modifiedBy: null
				modifiedDate: null
				recordedBy: "smeyer"
				recordedDate: 1375889490000
				version: 0
			]
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_Generic"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889490000
			treatmentGroups: []
			version: 0
		]
		codeName: "EXPT-00000002"
		id: 17
		ignored: false
		lsKind: "default"
		lsLabels: [
			id: 34
			ignored: false
			imageFile: null
			labelText: "Test Experiment 2"
			lsKind: "experiment name"
			lsTransaction: 2
			lsType: "name"
			lsTypeAndKind: "name_experiment name"
			modifiedDate: null
			physicallyLabled: false
			preferred: true
			recordedBy: "smeyer"
			recordedDate: 1375889487000
			version: 0
		]
		lsTags: [
			id: 1
			tagText: "stuff"
		,
			id: 2
			tagText: "more stuff"
		]
		lsStates: [
			comments: null
			id: 2
			ignored: false
			lsKind: "experiment controls"
			lsTransaction: 1
			lsType: "metadata"
			lsTypeAndKind: "metadata_experiment controls"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 80471
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: "negative control"
				uncertainty: null
				urlValue: null
				lsKind: "control type"
				valueOperator: null
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_control type"
				valueUnit: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 80470
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: 1.0
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "tested concentration"
				valueOperator: null
				lsType: "numericValue"
				lsTypeAndKind: "numericValue_tested concentration"
				valueUnit: "uM"
				version: 0
			,
				clobValue: null
				codeValue: "CRA-000396:1"
				comments: null
				dateValue: null
				fileValue: null
				id: 80469
				ignored: false
				lsTransaction:
					comments: "primary analysis protocol transactions"
					id: 87
					recordedDate: 1363388477000
					version: 0

				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "batch code"
				valueOperator: null
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_batch code"
				valueUnit: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "userName"
			recordedDate: 1375141474000
			version: 0
			comments: null
		,
			comments: null
			id: 11
			ignored: false
			lsKind: "experiment metadata"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_experiment metadata"
			lsValues: [
				clobValue: '{  "positiveControl": {    "batchCode": "CMPD-12345678-01",    "concentration": 10,    "conentrationUnits": "uM"  },  "negativeControl": {    "batchCode": "CMPD-87654321-01",    "concentration": 1,    "concentrationUnits": "uM"  },  "agonistControl": {    "batchCode": "CMPD-87654399-01",    "concentration": 250753.77,    "concentrationUnits": "uM"  },  "vehicleControl": {    "batchCode": "CMPD-00000001-01",    "concentration": null,    "concentrationUnits": null  },  "": "(maximum-minimum)/minimum",  "normalizationRule": "plate order",  "hitEfficacyThreshold": 42,  "hitSDThreshold": 5.0,  "thresholdType": "sd"}'
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 333
				ignored: false
				lsKind: "data analysis parameters"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_data analysis parameters"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: '{ "max": { "limitType": "pin", "value": 100 }, "min": { "limitType": "none", "value": null }, "slope": { "limitType": "limit", "value": 1.5 }, "inactiveThreshold": 20, "inverseAgonistMode": true}'
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 3331
				ignored: false
				lsKind: "model fit parameters"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_model fit parameters"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 3
				ignored: false
				lsKind: "notebook page"
				lsTransaction: 2
				lsType: "numericValue"
				lsTypeAndKind: "numericValue_notebook page"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "12"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "TestFile.mol"
				id: 39123
				ignored: false
				lsKind: "experiment file"
				lsTransaction: 2
				lsType: "fileValue"
				lsTypeAndKind: "fileValue_experiment file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "Test.csv"
				id: 391
				ignored: false
				lsKind: "experiment file"
				lsTransaction: 2
				lsType: "fileValue"
				lsTypeAndKind: "fileValue_experiment file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Dry Run not started</p>"
#				clobValue: "<p>Dry Run complete</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 412
				ignored: false
				lsKind: "dry run html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_dry run result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Analysis not yet completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 4
				ignored: false
				lsKind: "analysis result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_analysis result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Model fit not yet completed</p>"
#				clobValue: "<p>Model fit completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 444
				ignored: false
				lsKind: "model fit result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_model fit result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeType: "dry run"
				codeKind: "status"
#				codeValue: "not started"
				codeValue: "complete"
				comments: null
				dateValue: null
				fileValue: null
				id: 42213
				ignored: false
				lsKind: "dry run status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_dry run status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeType: "analysis"
				codeKind: "status"
				codeOrigin: "ACAS DDICT"
				codeValue: "not started"
				comments: null
				dateValue: null
				fileValue: null
				id: 422
				ignored: false
				lsKind: "analysis status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_analysis status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
#				stringValue: "complete"
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: "not started"
				comments: null
				dateValue: null
				fileValue: null
				id: 4225
				ignored: false
				lsKind: "model fit status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_model fit status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
#				stringValue: "complete"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeType: "assay"
				codeKind: "scientist"
				codeOrigin: "ACAS authors"
				codeValue: "jane"
				comments: null
				dateValue: null
				fileValue: null
				id: 523
				ignored: false
				lsKind: "scientist"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_scientist"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 5
				ignored: false
				lsKind: "notebook"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_notebook"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "911"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: 1342080000000
				fileValue: null
				id: 1
				ignored: false
				lsKind: "completion date"
				lsTransaction: 2
				lsType: "dateValue"
				lsTypeAndKind: "dateValue_completion date"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeKind: "status"
				codeType: "experiment"
				codeOrigin: "ACAS DDICT"
				codeValue: "started"
				comments: null
				dateValue: null
				fileValue: null
				id: 2
				ignored: false
				lsKind: "experiment status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_experiment status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "experiment details go here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 804699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "experiment details"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_experiment details"
				valueUnit: null
				version: 0
			,
				clobValue: "comments go here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 804699999123
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "comments"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_comments"
				valueUnit: null
				version: 0
			,
				clobValue: null
				codeValue: "project1"
				comments: null
				dateValue: null
				fileValue: null
				id: 904699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "project"
				valueOperator: null
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_project"
				valueUnit: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889487000
			version: 1
		,
			comments: ""
			id: 12
			ignored: false
			lsKind: "raw results locations"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_raw results locations"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "experiments/EXPT-00000001/Mia-Paca.xls"
				id: 7
				ignored: false
				lsKind: "source file"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_source file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889489000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889489000
			version: 0
		]
		lsTransaction: 2
		lsType: "default"
		lsTypeAndKind: "default_default"
		modifiedBy: null
		modifiedDate: null
		protocol:
			codeName: "PROT-00000001"
			id: 16
			ignored: false
			lsKind: "default"
			lsTransaction: 2
			lsType: "default"
			lsTypeAndKind: "default_default"
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889486000
			shortDescription: "protocol created by generic data parser"
			version: 1

		recordedBy: "smeyer"
		recordedDate: 1375889487000
		shortDescription: "another experiment created by generic data parser"
		version: 1

	exports.listOfExperiments = [
		exports.fullExperimentFromServer
		exports.fullExperimentFromServerTwo
	]

	exports.savedExperimentWithAnalysisGroups =
		codeName: "EXPT-00000222"
		lsLabels: [
			id: 31876
			ignored: false
			imageFile: null
			lsKind: "experiment name"
			labelText: "EXPT-00000221"
			lsType: "name"
			lsTypeAndKind: "name_experiment name"
			lsTransaction:
				comments: "docForBatches upload"
				id: 423
				recordedDate: 1367455531000
				version: 0

			modifiedDate: null
			physicallyLabled: false
			preferred: true
			recordedBy: "jmcneil"
			recordedDate: 1367455532000
			version: 0
		]
		lsTags: [
			id: 1
			tagText: "stuff"
		,
			id: 2
			tagText: "more stuff"
		]
		lsStates: [
			comments: null
			id: 11
			ignored: false
			lsKind: "experiment metadata"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_experiment metadata"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 3
				ignored: false
				lsKind: "notebook page"
				lsTransaction: 2
				lsType: "numericValue"
				lsTypeAndKind: "numericValue_notebook page"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "12"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "Testing.csv"
				id: 391
				ignored: false
				lsKind: "experiment file"
				lsTransaction: 2
				lsType: "fileValue"
				lsTypeAndKind: "fileValue_experiment file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Dry Run not started</p>"
#				clobValue: "<p>Dry Run complete</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 412
				ignored: false
				lsKind: "dry run html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_dry run result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Analysis not yet completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 4
				ignored: false
				lsKind: "analysis result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_analysis result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "<p>Model fit not yet completed</p>"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 454
				ignored: false
				lsKind: "model fit result html"
				lsTransaction: 2
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_model fit result html"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 5
				ignored: false
				lsKind: "notebook"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_notebook"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: "911"
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeType: "assay"
				codeKind: "scientist"
				codeOrigin: "ACAS authors"
				codeValue: "jane"
				comments: null
				dateValue: null
				fileValue: null
				id: 5231
				ignored: false
				lsKind: "scientist"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_scientist"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeValue: "project1"
				comments: null
				dateValue: null
				fileValue: null
				id: 904699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "project"
				valueOperator: null
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_project"
				valueUnit: null
				version: 0
			,
				clobValue: null
				codeValue: null
				comments: null
				dateValue: 1342080000000
				fileValue: null
				id: 1
				ignored: false
				lsKind: "completion date"
				lsTransaction: 2
				lsType: "dateValue"
				lsTypeAndKind: "dateValue_completion date"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: null
				codeKind: "status"
				codeOrigin: "ACAS DDICT"
				codeType: "experiment"
				codeValue: "started"
				comments: null
				dateValue: null
				fileValue: null
				id: 2
				ignored: false
				lsKind: "experiment status"
				lsTransaction: 2
				lsType: "codeValue"
				lsTypeAndKind: "codeValue_experiment status"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889487000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			,
				clobValue: "experiment details go here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 804699999
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "experiment details"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_experiment details"
				valueUnit: null
				version: 0
			,
				clobValue: "comments go here"
				codeValue: null
				comments: null
				dateValue: null
				fileValue: null
				id: 804699912399
				ignored: false
				lsTransaction:
					comments: ""
					id: 87
					recordedDate: 1363388477000
					version: 0
				modifiedDate: null
				numericValue: null
				publicData: true
				recordedDate: 1363388477000
				sigFigs: null
				stringValue: null
				uncertainty: null
				urlValue: null
				lsKind: "comments"
				valueOperator: null
				lsType: "clobValue"
				lsTypeAndKind: "clobValue_comments"
				valueUnit: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889487000
			version: 1
		,
			comments: ""
			id: 12
			ignored: false
			lsKind: "raw results locations"
			lsTransaction: 2
			lsType: "metadata"
			lsTypeAndKind: "metadata_raw results locations"
			lsValues: [
				clobValue: null
				codeValue: null
				comments: null
				dateValue: null
				fileValue: "experiments/EXPT-00000001/Mia-Paca.xls"
				id: 7
				ignored: false
				lsKind: "source file"
				lsTransaction: 2
				lsType: "stringValue"
				lsTypeAndKind: "stringValue_source file"
				modifiedBy: null
				modifiedDate: null
				numberOfReplicates: null
				numericValue: null
				operatorKind: null
				operatorType: "comparison"
				operatorTypeAndKind: "comparison_null"
				publicData: true
				recordedBy: "smeyer"
				recordedDate: 1375889489000
				sigFigs: null
				stringValue: null
				uncertainty: null
				uncertaintyType: null
				unitKind: null
				unitType: null
				unitTypeAndKind: "null_null"
				urlValue: null
				version: 0
			]
			modifiedBy: null
			modifiedDate: null
			recordedBy: "smeyer"
			recordedDate: 1375889489000
			version: 0
		]
		id: 64781
		ignored: false
		lsKind: "ACAS doc for batches" #changed from kind to lsKind
		lsTransaction:
			comments: "docForBatches upload"
			id: 423
			recordedDate: 1367455531000
			version: 0

		modifiedBy: null
		modifiedDate: null
		protocol:
			codeName: "ACASdocForBatches"
			id: 2403
			ignored: false
			lsKind: null #changed from kind to lsKind
			lsTransaction:
				comments: "docForBatches upload"
				id: 38
				recordedDate: 1362677322000
				version: 0

			modifiedBy: null
			modifiedDate: null
			recordedBy: "jmcneil"
			recordedDate: 1362677322000
			shortDescription: "ACAS Doc For Batches"
			version: 0

		recordedBy: "jmcneil"
		recordedDate: null
		shortDescription: "test description"
		version: 0
		analysisGroups: [
			lsLabels: []
			lsStates: [
				lsValues: [
					clobValue: null
					codeValue: null
					comments: "ok"
					dateValue: null
					fileValue: "exampleUploadedFile.txt"
					id: 258587
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "annotation"
					valueOperator: null
					lsType: "fileValue"
					lsTypeAndKind: "fileValue_annotation"
					valueUnit: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD_1112"
					comments: null
					dateValue: null
					fileValue: null
					id: 258588
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "batch code"
					valueOperator: null
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					valueUnit: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 258586
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "document kind"
					valueOperator: null
					lsType: "stringValue"
					lsTypeAndKind: "stringValue_document kind"
					valueUnit: null
					version: 0
				]
				comments: null
				id: 85510
				ignored: false
				lsTransaction:
					comments: "docForBatches upload"
					id: 423
					recordedDate: 1367455531000
					version: 0

				modifiedBy: null
				modifiedDate: null
				recordedBy: "jmcneil"
				recordedDate: 1367455532000
				lsKind: "Document for Batch"
				lsType: "results"
				stateTypeAndKind: "results_Document for Batch"
				version: 0
			,
				lsValues: [
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 258591
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "document kind"
					valueOperator: null
					lsType: "stringValue"
					lsTypeAndKind: "stringValue_document kind"
					valueUnit: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: "good"
					dateValue: null
					fileValue: "exampleUploadedFile.txt"
					id: 258589
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "annotation"
					valueOperator: null
					lsType: "fileValue"
					lsTypeAndKind: "fileValue_annotation"
					valueUnit: null
					version: 0
				,
					clobValue: null
					codeValue: "CMPD-0000007-01"
					comments: null
					dateValue: null
					fileValue: null
					id: 258590
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "batch code"
					valueOperator: null
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					valueUnit: null
					version: 0
				]
				comments: null
				id: 85511
				ignored: false
				lsTransaction:
					comments: "docForBatches upload"
					id: 423
					recordedDate: 1367455531000
					version: 0

				modifiedBy: null
				modifiedDate: null
				recordedBy: "jmcneil"
				recordedDate: 1367455532000
				lsKind: "Document for Batch"
				lsType: "results"
				stateTypeAndKind: "results_Document for Batch"
				version: 0
			,
				lsValues: [
					clobValue: null
					codeValue: "CMPD_1113"
					comments: null
					dateValue: null
					fileValue: null
					id: 258585
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "batch code"
					valueOperator: null
					lsType: "codeValue"
					lsTypeAndKind: "codeValue_batch code"
					valueUnit: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: null
					dateValue: null
					fileValue: null
					id: 258584
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "document kind"
					valueOperator: null
					lsType: "stringValue"
					lsTypeAndKind: "stringValue_document kind"
					valueUnit: null
					version: 0
				,
					clobValue: null
					codeValue: null
					comments: "bad"
					dateValue: null
					fileValue: "exampleUploadedFile.txt"
					id: 258583
					ignored: false
					lsTransaction: null
					modifiedDate: null
					numberOfReplicates: null
					numericValue: null
					publicData: true
					recordedDate: 1367455532000
					sigFigs: null
					stringValue: null
					uncertainty: null
					uncertaintyType: null
					urlValue: null
					lsKind: "annotation"
					valueOperator: null
					lsType: "fileValue"
					lsTypeAndKind: "fileValue_annotation"
					valueUnit: null
					version: 0
				]
				comments: null
				id: 85509
				ignored: false
				lsTransaction:
					comments: "docForBatches upload"
					id: 423
					recordedDate: 1367455531000
					version: 0

				modifiedBy: null
				modifiedDate: null
				recordedBy: "jmcneil"
				recordedDate: 1367455532000
				lsKind: "Document for Batch"
				lsType: "results"
				stateTypeAndKind: "results_Document for Batch"
				version: 0
			]
			codeName: "AG-00037424"
			id: 64782
			ignored: false
			recordedBy: "jmcneil"
			recordedDate: 1367455531000
			lsKind: "ACAS doc for batches" #changed from kind to lsKind
			lsTransaction:
				comments: "docForBatches upload"
				id: 423
				recordedDate: 1367455531000
				version: 0
		]
	exports.resultViewerURLByExperimentCodeName =
		resultViewerURL: "host4.labsynch.com:9080/seurat/runseurat?cmd=newjob&AssayName=FLIPR%20target%20A%20biochemical&AssayProtocol=test%3a%3a"


	exports.experimentValueByStateTypeKindAndValueTypeKind =
		metadata:
			"experiment metadata":
				"codeValue":
					"experiment status": [ {
						'clobValue': null
						'codeKind': 'status'
						'codeOrigin': 'ACAS DDICT'
						'codeType': 'experiment'
						'codeTypeAndKind': 'experiment_status'
						'codeValue': 'approved'
						'comments': null
						'concUnit': null
						'concentration': null
						'dateValue': null
						'deleted': false
						'fileValue': null
						'id': 6
						'ignored': false
						'lsKind': 'experiment status'
						'lsState':
							'comments': null
							'deleted': false
							'experiment':
								'codeName': 'EXPT-00000001'
								'deleted': true
								'id': 2
								'ignored': true
								'lsKind': 'default'
								'lsTransaction': 1
								'lsType': 'default'
								'lsTypeAndKind': 'default_default'
								'modifiedBy': 'bob'
								'modifiedDate': 1440549900000
								'protocol':
									'codeName': 'PROT-00000001'
									'deleted': false
									'id': 1
									'ignored': false
									'lsKind': 'default'
									'lsTransaction': 1
									'lsType': 'default'
									'lsTypeAndKind': 'default_default'
									'modifiedBy': null
									'modifiedDate': null
									'recordedBy': 'bob'
									'recordedDate': 1440549899000
									'shortDescription': 'protocol created by generic data parser'
									'version': 1
								'recordedBy': 'bob'
								'recordedDate': 1440549900000
								'shortDescription': 'experiment created by generic data parser'
								'version': 2
							'id': 1
							'ignored': false
							'lsKind': 'experiment metadata'
							'lsTransaction': 1
							'lsType': 'metadata'
							'lsTypeAndKind': 'metadata_experiment metadata'
							'modifiedBy': null
							'modifiedDate': null
							'recordedBy': 'bob'
							'recordedDate': 1440549900000
							'version': 1
						'lsTransaction': 1
						'lsType': 'codeValue'
						'lsTypeAndKind': 'codeValue_experiment status'
						'modifiedBy': null
						'modifiedDate': null
						'numberOfReplicates': null
						'numericValue': null
						'operatorKind': null
						'operatorType': null
						'operatorTypeAndKind': 'null_null'
						'publicData': true
						'recordedBy': 'bob'
						'recordedDate': 1440549900000
						'sigFigs': null
						'stringValue': null
						'uncertainty': null
						'uncertaintyType': null
						'unitKind': null
						'unitType': null
						'unitTypeAndKind': 'null_null'
						'urlValue': null
						'version': 0
					} ]

# ---
# generated by js2coffee 2.1.0


) (if (typeof process is "undefined" or not process.versions) then window.experimentServiceTestJSON = window.experimentServiceTestJSON or {} else exports)



