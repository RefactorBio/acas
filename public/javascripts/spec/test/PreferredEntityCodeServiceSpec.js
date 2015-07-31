(function() {
  var assert, config, parseResponse, request;

  assert = require('assert');

  request = require('request');

  parseResponse = function(jsonStr) {
    var error;
    try {
      return JSON.parse(jsonStr);
    } catch (_error) {
      error = _error;
      console.log("response unparsable: " + error);
      console.log("response: " + jsonStr);
      return null;
    }
  };

  config = require('../../../../conf/compiled/conf.js');

  describe("Preferred Entity code service tests", function() {
    describe("available entity type list", function() {
      describe("when requested as fully detailed list", function() {
        before(function(done) {
          return request("http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/configuredEntityTypes", (function(_this) {
            return function(error, response, body) {
              _this.responseJSON = parseResponse(body);
              return done();
            };
          })(this));
        });
        it("should return an array of entity types", function() {
          return assert.equal(this.responseJSON.length > 0, true);
        });
        return it("should return entity type descriptions with required attributes", function() {
          assert.equal(this.responseJSON[0].type != null, true);
          assert.equal(this.responseJSON[0].kind != null, true);
          assert.equal(this.responseJSON[0].displayName != null, true);
          assert.equal(this.responseJSON[0].codeOrigin != null, true);
          return assert.equal(this.responseJSON[0].sourceExternal != null, true);
        });
      });
      describe("when requested as list of codes", function() {
        before(function(done) {
          return request("http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/configuredEntityTypes/asCodes", (function(_this) {
            return function(error, response, body) {
              _this.responseJSON = parseResponse(body);
              return done();
            };
          })(this));
        });
        it("should return an array of entity types", function() {
          return assert.equal(this.responseJSON.length > 0, true);
        });
        return it("should return entity type descriptions with required attributes", function() {
          assert.equal(this.responseJSON[0].code != null, true);
          assert.equal(this.responseJSON[0].name != null, true);
          return assert.equal(this.responseJSON[0].ignored != null, true);
        });
      });
      return describe("when a specific entity type is requested by displayName", function() {
        var entityType;
        entityType = encodeURIComponent("Corporate Parent ID");
        before(function(done) {
          return request("http://" + config.all.client.host + ":" + config.all.server.nodeapi.port + "/api/entitymeta/configuredEntityTypes/displayName/" + entityType, (function(_this) {
            return function(error, response, body) {
              _this.responseJSON = parseResponse(body);
              return done();
            };
          })(this));
        });
        return it("should return an object with all the required attributes", function() {
          assert(this.responseJSON.type != null);
          assert(this.responseJSON.kind != null);
          assert(this.responseJSON.displayName != null);
          assert(this.responseJSON.codeOrigin != null);
          return assert(this.responseJSON.sourceExternal != null);
        });
      });
    });
    describe("get preferred entity codeName for supplied name or codeName", function() {
      describe("when valid compounds sent with valid type info ONLY PASSES IN STUBS MODE", function() {
        var body;
        body = {
          type: "parent",
          kind: "protein",
          entityIdStringLines: "PROT1\nPROT2\nPROT3\n"
        };
        before(function(done) {
          this.timeout(20000);
          return request.post({
            url: "http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/referenceCodes",
            json: true,
            body: body
          }, (function(_this) {
            return function(error, response, body) {
              _this.serverError = error;
              _this.responseJSON = body;
              console.log(_this.responseJSON);
              _this.serverResponse = response;
              return done();
            };
          })(this));
        });
        it("should return a success status code if in stubsMode, otherwise, this will fail", function() {
          return assert.equal(this.serverResponse.statusCode, 200);
        });
        it("should return 5 rows including a trailing \n", function() {
          return assert.equal(this.responseJSON.resultCSV.split('\n').length, 5);
        });
        it("should have 2 columns", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[0].split(',').length, 2);
        });
        it("should have a header row", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[0], "Requested Name,Preferred Code");
        });
        return it("should have the query first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[0], "PROT1");
        });
      });
      describe("when valid compounds sent with invalid type info", function() {
        var body;
        body = {
          type: "ERROR",
          kind: "protein",
          entityIdStringLines: "PROT1\nPROT2\nPROT3\n"
        };
        before(function(done) {
          this.timeout(20000);
          return request.post({
            url: "http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/referenceCodes",
            json: true,
            body: body
          }, (function(_this) {
            return function(error, response, body) {
              _this.serverError = error;
              _this.responseJSON = body;
              console.log(_this.responseJSON);
              _this.serverResponse = response;
              return done();
            };
          })(this));
        });
        return it("should return a failure status code", function() {
          return assert.equal(this.serverResponse.statusCode, 500);
        });
      });
      describe("when valid small molecule batch names are passed in ONLY PASSES IN STUBS MODE", function() {
        var body;
        body = {
          type: "compound",
          kind: "batch name",
          entityIdStringLines: "CMPD-0000001-01\nnone_2222:1\nCMPD-0000002-01\n"
        };
        before(function(done) {
          this.timeout(20000);
          return request.post({
            url: "http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/referenceCodes",
            json: true,
            body: body
          }, (function(_this) {
            return function(error, response, body) {
              _this.serverError = error;
              _this.responseJSON = body;
              console.log(_this.responseJSON);
              _this.serverResponse = response;
              return done();
            };
          })(this));
        });
        it("should return the requested Type", function() {
          return assert.equal(this.responseJSON.type, "compound");
        });
        it("should return the requested Kind", function() {
          return assert.equal(this.responseJSON.kind, "batch name");
        });
        it("should have the first line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[0], "CMPD-0000001-01");
        });
        it("should have the first line result second result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[1], "CMPD-0000001-01");
        });
        it("should have the second line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[0], "none_2222:1");
        });
        return it("should have the second line result second result column with no result", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[1], "");
        });
      });
      describe("when valid small molecule Parent names are passed in ONLY PASSES IN STUBS MODE", function() {
        var body;
        body = {
          type: "compound",
          kind: "parent name",
          entityIdStringLines: "CMPD-0000001\nCMPD-999999999\ncompoundName\n"
        };
        before(function(done) {
          this.timeout(20000);
          return request.post({
            url: "http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/referenceCodes",
            json: true,
            body: body
          }, (function(_this) {
            return function(error, response, body) {
              _this.serverError = error;
              _this.responseJSON = body;
              console.log(_this.responseJSON);
              _this.serverResponse = response;
              return done();
            };
          })(this));
        });
        it("should return the requested Type", function() {
          return assert.equal(this.responseJSON.type, "compound");
        });
        it("should return the requested Kind", function() {
          return assert.equal(this.responseJSON.kind, "parent name");
        });
        it("should have the first line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[0], "CMPD-0000001");
        });
        it("should have the first line result second result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[1], "CMPD-0000001");
        });
        it("should have the second line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[0], "CMPD-999999999");
        });
        it("should have the second line result second result column with no result", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[1], "");
        });
        return it("should have the third line result second result column with alias result", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[3].split(',')[1].indexOf('CMPD') > -1, true);
        });
      });
      describe("when valid lsthing parent names are passed in ONLY PASSES IN STUBS MODE", function() {
        var body;
        body = {
          type: "parent",
          kind: "protein",
          entityIdStringLines: "GENE1234\nsome Gene name\nambiguousName\n"
        };
        before(function(done) {
          this.timeout(20000);
          return request.post({
            url: "http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/referenceCodes",
            json: true,
            body: body
          }, (function(_this) {
            return function(error, response, body) {
              _this.serverError = error;
              _this.responseJSON = body;
              console.log(_this.responseJSON);
              _this.serverResponse = response;
              return done();
            };
          })(this));
        });
        it("should return the requested Type", function() {
          return assert.equal(this.responseJSON.type, "parent");
        });
        it("should return the requested Kind", function() {
          return assert.equal(this.responseJSON.kind, "protein");
        });
        it("should have the first line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[0], "GENE1234");
        });
        it("should have the first line result second result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[1], "GENE1234");
        });
        it("should have the second line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[0], "some Gene name");
        });
        it("should have the second line result second result column with the code", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[1], "GENE1111");
        });
        it("should have the third line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[3].split(',')[0], "ambiguousName");
        });
        return it("should have the third line result second result column with no result", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[3].split(',')[1], "");
        });
      });
      return describe("when valid lsthing entrez gene names or codes are passed in ONLY PASSES IN LIVE MODE with genes loaded", function() {
        var body;
        body = {
          type: "gene",
          kind: "entrez gene",
          entityIdStringLines: "GENE-000002\nCPAMD5\nambiguousName\n"
        };
        before(function(done) {
          this.timeout(20000);
          return request.post({
            url: "http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/referenceCodes",
            json: true,
            body: body
          }, (function(_this) {
            return function(error, response, body) {
              _this.serverError = error;
              _this.responseJSON = body;
              console.log(_this.responseJSON);
              _this.serverResponse = response;
              console.log(_this.serverResponse.statusCode);
              return done();
            };
          })(this));
        });
        it("should return a success status code if in stubsMode, otherwise, this will fail", function() {
          return assert.equal(this.serverResponse.statusCode, 200);
        });
        it("should return the requested Type", function() {
          return assert.equal(this.responseJSON.type, "gene");
        });
        it("should return the requested Kind", function() {
          return assert.equal(this.responseJSON.kind, "entrez gene");
        });
        it("should have the first line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[0], "GENE-000002");
        });
        it("should have the first line result second result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[1], "GENE-000002");
        });
        it("should have the second line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[0], "CPAMD5");
        });
        it("should have the second line result second result column with the code", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[1], "GENE-000003");
        });
        it("should have the third line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[3].split(',')[0], "ambiguousName");
        });
        return it("should have the third line result second result column with no result", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[3].split(',')[1], "");
        });
      });
    });
    return describe("direct function API tests", function() {
      var codeService;
      codeService = require('../../../../routes/PreferredEntityCodeService.js');
      describe("when valid lsthing entrez gene names or codes are passed in ONLY PASSES IN LIVE MODE with genes loaded", function() {
        var requestData;
        requestData = {
          type: "gene",
          kind: "entrez gene",
          entityIdStringLines: "GENE-000002\nCPAMD5\nambiguousName\n"
        };
        before(function(done) {
          this.timeout(20000);
          return codeService.referenceCodes(requestData, (function(_this) {
            return function(response) {
              _this.responseJSON = response;
              console.log(response);
              return done();
            };
          })(this));
        });
        it("should return the requested Type", function() {
          return assert.equal(this.responseJSON.type, "gene");
        });
        it("should return the requested Kind", function() {
          return assert.equal(this.responseJSON.kind, "entrez gene");
        });
        it("should have the first line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[0], "GENE-000002");
        });
        it("should have the first line result second result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[1].split(',')[1], "GENE-000002");
        });
        it("should have the second line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[0], "CPAMD5");
        });
        it("should have the second line result second result column with the code", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[2].split(',')[1], "GENE-000003");
        });
        it("should have the third line query in first result column", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[3].split(',')[0], "ambiguousName");
        });
        return it("should have the third line result second result column with no result", function() {
          var res;
          res = this.responseJSON.resultCSV.split('\n');
          return assert.equal(res[3].split(',')[1], "");
        });
      });
      describe("available entity type list", function() {
        describe("when requested as fully detailed list", function() {
          before(function(done) {
            return codeService.getConfiguredEntityTypes(false, (function(_this) {
              return function(response) {
                _this.responseJSON = response;
                return done();
              };
            })(this));
          });
          it("should return an array of entity types", function() {
            return assert.equal(this.responseJSON.length > 0, true);
          });
          return it("should return entity type descriptions with required attributes", function() {
            assert.equal(this.responseJSON[0].type != null, true);
            assert.equal(this.responseJSON[0].kind != null, true);
            assert.equal(this.responseJSON[0].displayName != null, true);
            assert.equal(this.responseJSON[0].codeOrigin != null, true);
            return assert.equal(this.responseJSON[0].sourceExternal != null, true);
          });
        });
        return describe("when requested as list of codes", function() {
          before(function(done) {
            return codeService.getConfiguredEntityTypes(true, (function(_this) {
              return function(response) {
                _this.responseJSON = response;
                return done();
              };
            })(this));
          });
          it("should return an array of entity types", function() {
            return assert.equal(this.responseJSON.length > 0, true);
          });
          return it("should return entity type descriptions with required attributes", function() {
            assert.equal(this.responseJSON[0].code != null, true);
            assert.equal(this.responseJSON[0].name != null, true);
            return assert.equal(this.responseJSON[0].ignored != null, true);
          });
        });
      });
      return describe("specific entity type details", function() {
        before(function(done) {
          return codeService.getSpecificEntityType("Corporate Parent ID", (function(_this) {
            return function(response) {
              _this.responseJSON = response;
              return done();
            };
          })(this));
        });
        return it("should return entity type descriptions with required attributes", function() {
          assert.equal(this.responseJSON.type != null, true);
          assert.equal(this.responseJSON.kind != null, true);
          assert.equal(this.responseJSON.displayName != null, true);
          assert.equal(this.responseJSON.codeOrigin != null, true);
          return assert.equal(this.responseJSON.sourceExternal != null, true);
        });
      });
    });
  });

  describe.only("pickBestLabels service test", function() {
    return describe("for lsThings", function() {
      var body;
      body = {
        referenceCodes: "GENE-000002\nGENE-000003",
        displayName: "Gene ID"
      };
      before(function(done) {
        this.timeout(20000);
        return request.post({
          url: "http://localhost:" + config.all.server.nodeapi.port + "/api/entitymeta/pickBestLabels",
          json: true,
          body: body
        }, (function(_this) {
          return function(error, response, body) {
            _this.serverError = error;
            _this.responseJSON = body;
            console.log(_this.responseJSON);
            _this.serverResponse = response;
            return done();
          };
        })(this));
      });
      it("should return an object with the correct fields", function() {
        assert(this.responseJSON.displayName != null);
        return assert(this.responseJSON.resultCSV != null);
      });
      it("should have the first line query in second row, first column", function() {
        var res;
        res = this.responseJSON.resultCSV.split('\n');
        return assert.equal(res[1].split(',')[0], "GENE-000002");
      });
      it("should have the first line result in second row, second column", function() {
        var res;
        res = this.responseJSON.resultCSV.split('\n');
        return assert.equal(res[1].split(',')[1], "1");
      });
      it("should have the second line query in third row, first column", function() {
        var res;
        res = this.responseJSON.resultCSV.split('\n');
        return assert.equal(res[2].split(',')[0], "GENE-000003");
      });
      return it("should have the second line result in third row, second column", function() {
        var res;
        res = this.responseJSON.resultCSV.split('\n');
        return assert.equal(res[2].split(',')[1], "2");
      });
    });
  });

}).call(this);
