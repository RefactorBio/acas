exports.all={"client":{"service":{"file":{"port":8888},"preferred":{"batchid":{"path":"/api/preferredBatchId"}},"project":{"path":"/api/projects"},"users":{"path":"/api/users"},"persistance":{"host":"acas-d.dart.corp","path":"acas","port":8080,"fullpath":"http://acas-d.dart.corp:8080/acas"},"r":{"host":"acas-d.dart.corp","path":"r-services-api","port":80},"result":{"viewer":{"experiment":{"parameter":"AssayProtocol"},"host":"dsandsrt03","path":"/seurat/runseurat?cmd=newjob","port":9080,"protocol":{"parameter":"AssayName"}}},"rapache":{"host":"acas-d.dart.corp","port":80,"path":"r-services-api","fullpath":"http://acas-d.dart.corp:80/r-services-api"},"rshiny":{"host":"acas-d.dart.corp","path":null,"port":3838,"fullpath":"http://acas-d.dart.corp:3838/"},"external":{"preferred":{"batchid":{"type":"SingleBatchNameQueryString"}}}},"deploymode":"Dev","authentication":{"user":{"type":"DNS"}},"host":"acas-d.dart.corp","include":{"project":"TRUE"},"path":null,"port":48203,"use":{"ssl":false}},"server":{"file":{"server":{"path":"/serverOnlyModules/blueimp-file-upload-node/public/files"}},"log":{"path":"/Users/jam/Projects/runicLIMS/bitbucket/log","level":"INFO"},"service":{"persistance":{"jdbc":{"validation":{"query":"SELECT 1 FROM DUAL"}}},"external":{"file":{"type":"DNS"},"preferred":{"batchid":{"url":"http://imapp01-d:8080/DNS/core/v1/synonyms/preferred/"}},"project":{"url":"http://imapp01-d:8080/DNS/codes/v1/Codes/Project.json"},"report":{"registration":{"url":"http://imapp01-d:8080/DNS/core/v1/DNSAnnotation/"}},"user":{"authentication":{"url":"http://imapp01-d:8080/DNS/persons/v1/Persons/authenticate"},"information":{"url":"http://imapp01-d:8080/DNS/persons/v1/Persons/"}}}},"allow":{"protocol":{"creation":{"formats":null}}},"database":{"driver":"oracle.jdbc.driver.OracleDriver","hibernate":{"dialect":"org.hibernate.dialect.Oracle11gDialect"},"host":"***REMOVED***","name":"ORADEV","password":"2Ydudu8$pD","port":1521,"r":{"driver":"Oracle()","package":"ROracle"},"username":"ACAS"},"delete":{"files":{"on":{"reload":false}}},"enablespecrunner":true,"projects":{"type":"DNS"},"require":{"login":false}}};