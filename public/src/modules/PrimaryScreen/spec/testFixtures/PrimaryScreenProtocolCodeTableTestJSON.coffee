((exports) ->
	exports.dataDictValues =
		[
			"assay stage":
				[
					code: "assay development"
					name: "Assay Development"
					ignored: false
				]
		,
			"assay activity":
				[
					code: "luminescence"
					name: "Luminescence"
					ignored: false
				,
					code: "fluorescence"
					name: "Fluorescence"
					ignored: false
				]
		,
			"molecular target":
				[
					code: "target x"
					name: "Target X"
					ignored: false
				,
					code: "target y"
					name: "Target Y"
					ignored: false
				]
		,
			"target origin":
				[
					code: "human"
					name: "Human"
					ignored: false
				,
					code: "chimpanzee"
					name: "Chimpanzee"
					ignored: false
				]
		,
			"assay type":
				[
					code: "cellular assay"
					name: "Cellular Assay"
					ignored: false
				]
		,
			"assay technology":
				[
					code: "wizard triple luminescence"
					name: "Wizard Triple Luminescence"
					ignored: false
				]
		,
			"cell line":
				[
					code: "cell line x"
					name: "Cell Line X"
					ignored: false
				,
					code: "cell line y"
					name: "Cell Line Y"
					ignored: false
				]
		]
) (if (typeof process is "undefined" or not process.versions) then window.primaryScreenProtocolCodeTableTestJSON = window.primaryScreenProtocolCodeTableTestJSON or {} else exports)
