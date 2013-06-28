window.ModuleMenusConfiguration =
	[
		{isHeader: true, menuName: "Load Data" }
		{isHeader: false, menuName: "Load Experiment", mainControllerClassName: "GenericDataParserController"}
		{isHeader: false, menuName: "Load Full PK Experiment", mainControllerClassName: "FullPKParserController"}
#		{isHeader: false, menuName: "Annotate Batches with File", mainControllerClassName: "DocForBatchesController",
#		routes: [{routePath: "annotateBatches", routeCallBackName: "loadNewDoc"},{routePath: "annotateBatches:docId", routeCallBackName: "loadExistingDoc"}]}
#		{isHeader: false, menuName: "Analyze FLIPR Data", mainControllerClassName: "PrimaryScreenExperimentController"}
#		{isHeader: true, menuName: "Inventory" }
#		{isHeader: false, menuName: "Load Containers From SDF", mainControllerClassName: "BulkLoadContainersFromSDFController"}
#		{isHeader: false, menuName: "Load Sample Transfer Log", mainControllerClassName: "BulkLoadSampleTransfersController"}
	]
