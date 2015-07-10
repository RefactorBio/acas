window.conf={"service":{"preferred":{"batchid":{"path":"/api/preferredBatchId"}},"project":{"path":"/api/projects"},"users":{"path":"/api/users"},"external":{"structure":{"url":"http://host4.labsynch.com:8080/cmpdreg/structureimage/lot/"},"preferred":{"batchid":{"type":"LabSynchCmpdReg"}}},"persistence":{"path":"acas/api/v1","host":"172.17.0.6","port":8080,"fullpath":"http://172.17.0.6:8080/acas/api/v1/"},"rapache":{"port":1080,"use":{"ssl":false},"host":"192.168.99.100","path":"r-services-api","fullpath":"http://192.168.99.100:1080/r-services-api/"},"result":{"viewer":{"protocolPrefix":"http://172.17.0.6:9080/seurat/runseurat?cmd=newjob&AssayName=","experimentPrefix":"&AssayProtocol=","experimentNameColumn":"EXPERIMENT_NAME","experimentName":{"invalidCharacters":"\"',"}}},"control":{"tolerance":{"percentage":0.01}},"rshiny":{"host":"172.17.0.6","path":"fred","port":3838,"fullpath":"http://172.17.0.6:3838/fred"},"spotfire":{"host":"dsantsptdxp","path":"/Lead Discovery/HTSWells"}},"host":"192.168.99.100","port":3000,"deployMode":"dev","include":{"project":"FALSE"},"path":null,"use":{"ssl":false},"roologin":{"showpasswordchange":true},"require":{"login":true},"datafiles":{"downloadurl":{"prefix":"/dataFiles/"}},"moduleMenus":{"headerName":"ACAS","homePageMessage":"Welcome to ACAS","copyrightMessage":"&copy; John McNeil & Company 2012-2015","summaryStats":true},"leaveACASMessage":"There are no unsaved changes.","scientistCodeOrigin":"ACAS authors","molecularTargetCodeOrigin":"ACAS DDICT","roles":{"htsAdmin":"admin"},"browser":{"enableSearchAll":true},"curvefit":{"modelfitparameter":{"classes":"[{\"code\":\"4 parameter D-R\", \"parametersController\":\"DoseResponseAnalysisParametersController\", \"parametersClass\": \"DoseResponseAnalysisParameters\", \"plotCurveClass\": \"DoseResponsePlotCurveLL4\", \"RSource\":\"public/src/modules/CurveAnalysis/src/server/ll4.R\"}, {\"code\":\"Ki Fit\", \"parametersController\":\"DoseResponseKiAnalysisParametersController\", \"parametersClass\": \"DoseResponseKiAnalysisParameters\", \"plotCurveClass\": \"DoseResponsePlotCurveKi\", \"RSource\":\"public/src/modules/CurveAnalysis/src/server/ki.R\"}]"}}};