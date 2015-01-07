(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  describe('Thing testing', function() {
    beforeEach(function() {
      return window.siRNA = (function(_super) {
        __extends(siRNA, _super);

        function siRNA() {
          return siRNA.__super__.constructor.apply(this, arguments);
        }

        siRNA.prototype.lsProperties = {
          defaultLabels: [
            {
              key: 'name',
              type: 'name',
              kind: 'name',
              preferred: false
            }, {
              key: 'corpName',
              type: 'name',
              kind: 'corpName',
              preferred: true
            }, {
              key: 'barcode',
              type: 'barcode',
              kind: 'barcode',
              preferred: false
            }
          ],
          defaultValues: [
            {
              key: 'sequence',
              stateType: 'descriptors',
              stateKind: 'unique attributes',
              type: 'stringValue',
              kind: 'sequence'
            }, {
              key: 'mass',
              stateType: 'descriptors',
              stateKind: 'other attributes',
              type: 'numericValue',
              kind: 'mass',
              unitKind: 'mg',
              unitType: 'mass'
            }, {
              key: 'analysis parameters',
              stateType: 'meta',
              stateKind: 'experiment meta',
              type: 'clobValue',
              kind: 'analysis parameters'
            }
          ],
          defaultValueArrays: [
            {
              key: 'temperatureValueArray',
              stateType: 'measurements',
              stateKind: 'stateVsTime',
              type: 'numberValue',
              kind: 'temperature',
              unitKind: 'C'
            }, {
              key: 'timeValueArray',
              stateType: 'measurements',
              stateKind: 'stateVsTime',
              type: 'dateValue',
              kind: 'time'
            }
          ]
        };

        return siRNA;

      })(Thing);
    });
    describe('When created from new', function() {
      beforeEach(function() {
        return this.siRNA = new siRNA();
      });
      describe("Existence and Defaults", function() {
        it("should be defined", function() {
          return expect(this.siRNA).toBeDefined();
        });
        it("should have a type", function() {
          return expect(this.siRNA.get('lsType')).toEqual("thing");
        });
        it("should have a kind", function() {
          return expect(this.siRNA.get('lsKind')).toEqual("thing");
        });
        it("should have an empty scientist", function() {
          return expect(this.siRNA.get('recordedBy')).toEqual("");
        });
        it("should have a recordedDate set to now", function() {
          return expect(new Date(this.siRNA.get('recordedDate')).getHours()).toEqual(new Date().getHours());
        });
        return it('Should have an empty short description with a space as an oracle work-around', function() {
          return expect(this.siRNA.get('shortDescription')).toEqual(" ");
        });
      });
      describe('Instantiation - defaultLabels', function() {
        it('should create a list of lsLabels based on the defaultLabels defined in Child Object', function() {
          var lsLabels;
          lsLabels = this.siRNA.get("lsLabels");
          expect(lsLabels).toBeDefined();
          return expect(lsLabels.length).toEqual(3);
        });
        it('should create model attributes for each element in defaultLabels', function() {
          return expect(this.siRNA.get("corpName")).toBeDefined();
        });
        it('should reference the lsLabel model objects stored in lsLabels as top level model attributes', function() {
          var corpNameLabel;
          this.siRNA.get("corpName").set("labelText", "newCorpName");
          corpNameLabel = this.siRNA.get("lsLabels").getLabelByTypeAndKind("name", "corpName")[0];
          expect(corpNameLabel.get("labelText")).toEqual(this.siRNA.get("corpName").get("labelText"));
          return expect(corpNameLabel.get("labelText")).toEqual("newCorpName");
        });
        it('should remove the top level label references when reformatBeforeSaving() is called', function() {
          expect(this.siRNA.get("corpName")).toBeDefined();
          this.siRNA.reformatBeforeSaving();
          return expect(this.siRNA.get("corpName")).toBeUndefined();
        });
        return it('should create top level label references when parse() is called / when the object is re-hyrdrated', function() {
          var newLabelText;
          newLabelText = "this is a new label";
          this.siRNA.get("corpName").set("labelText", newLabelText);
          expect(this.siRNA.get("corpName")).toBeDefined();
          this.siRNA.reformatBeforeSaving();
          expect(this.siRNA.get("corpName")).toBeUndefined();
          this.siRNA.parse();
          expect(this.siRNA.get("corpName")).toBeDefined();
          return expect(this.siRNA.get("corpName").get("labelText")).toEqual(newLabelText);
        });
      });
      return describe('Instantiation - defaultStates', function() {
        it('should create a list of lsStates based on the defaultValues defined in Child Object', function() {
          var lsStates;
          lsStates = this.siRNA.get("lsStates");
          expect(lsStates).toBeDefined();
          return expect(lsStates.length).toEqual(3);
        });
        it('should create a list of lsValues in the appropriate state based on the defaultValues', function() {
          var lsStates, lsValues;
          lsStates = this.siRNA.get('lsStates').getStatesByTypeAndKind("descriptors", "unique attributes");
          lsValues = lsStates[0].get('lsValues');
          expect(lsValues).toBeDefined();
          return expect(lsValues.length).toEqual(1);
        });
        it('should store unit type and unit kind in the associated state', function() {
          var lsStates, lsValues;
          lsStates = this.siRNA.get('lsStates').getStatesByTypeAndKind("descriptors", "other attributes");
          lsValues = lsStates[0].get('lsValues');
          console.log("lsValues");
          console.log(lsValues);
          console.log(lsValues.at(0));
          expect(lsValues.at(0).get('unitType')).toEqual('mass');
          return expect(lsValues.at(0).get('unitKind')).toEqual('mg');
        });
        it('should create model attributes for each element in defaultValues', function() {
          return expect(this.siRNA.get("sequence")).toBeDefined();
        });
        it('should reference the lsStates model objects stored in lsStates as top level model attributes', function() {
          var sequenceStateValue;
          this.siRNA.get("sequence").set("value", "newsequence");
          sequenceStateValue = this.siRNA.get('lsStates').getStateValueByTypeAndKind("descriptors", "unique attributes", "stringValue", "sequence");
          expect(sequenceStateValue.get("stringValue")).toEqual(this.siRNA.get("sequence").get("value"));
          expect(sequenceStateValue.get("stringValue")).toEqual("newsequence");
          expect(this.siRNA.get("sequence").get("value")).toEqual("newsequence");
          console.log("this");
          return console.log(this.siRNA);
        });
        it('should remove the top level lsStates model object references when reformatBeforeSaving() is called', function() {
          expect(this.siRNA.get("sequence")).toBeDefined();
          this.siRNA.reformatBeforeSaving();
          return expect(this.siRNA.get("sequence")).toBeUndefined();
        });
        return it('should create top level lsStates model object references when parse() is called / when the object is re-hyrdrated', function() {
          var newsequence;
          newsequence = "this is a new sequence value";
          this.siRNA.get("sequence").set("value", newsequence);
          expect(this.siRNA.get("sequence")).toBeDefined();
          this.siRNA.reformatBeforeSaving();
          expect(this.siRNA.get("sequence")).toBeUndefined();
          this.siRNA.parse();
          expect(this.siRNA.get("sequence")).toBeDefined();
          return expect(this.siRNA.get("sequence").get("value")).toEqual(newsequence);
        });
      });
    });
    describe("When created from existing", function() {
      beforeEach(function() {
        return this.testsiRNA = new siRNA(JSON.parse(JSON.stringify(window.thingTestJSON.siRNA)));
      });
      return describe("after initial load", function() {
        it("should be defined", function() {
          return expect(this.testsiRNA).toBeDefined();
        });
        it("should have a type", function() {
          return expect(this.testsiRNA.get('lsType')).toEqual("thing");
        });
        it("should have a kind", function() {
          return expect(this.testsiRNA.get('lsKind')).toEqual("siRNA");
        });
        it("should have a scientist set", function() {
          return expect(this.testsiRNA.get('recordedBy')).toEqual("egao");
        });
        it("should have a recordedDate", function() {
          return expect(this.testsiRNA.get('recordedDate')).toEqual(1375889487000);
        });
        it("Should have a short description", function() {
          return expect(this.testsiRNA.get('shortDescription')).toEqual("thing created by egao");
        });
        it("should have a sequence value", function() {
          return expect(this.testsiRNA.get('sequence').get("value")).toEqual("test sequence");
        });
        return it("should have a mass value", function() {
          return expect(this.testsiRNA.get('mass').get("value")).toEqual(12.3);
        });
      });
    });
    return describe("model change propagation", function() {
      it("should trigger change when label changed", function() {
        runs(function() {
          this.testsiRNA = new siRNA();
          this.siRNAChanged = false;
          this.testsiRNA.get('lsLabels').setBestName(new Label({
            labelKind: "siRNA name",
            labelText: "test label",
            recordedBy: this.testsiRNA.get('recordedBy'),
            recordedDate: this.testsiRNA.get('recordedDate')
          }));
          this.testsiRNA.on('change', (function(_this) {
            return function() {
              return _this.siRNAChanged = true;
            };
          })(this));
          this.siRNAChanged = false;
          return this.testsiRNA.get('lsLabels').setBestName(new Label({
            labelKind: "experiment name",
            labelText: "new label",
            recordedBy: this.testsiRNA.get('recordedBy'),
            recordedDate: this.testsiRNA.get('recordedDate')
          }));
        });
        waitsFor(function() {
          return this.siRNAChanged;
        }, 500);
        return runs(function() {
          return expect(this.siRNAChanged).toBeTruthy();
        });
      });
      return it("should trigger change when value changed in state", function() {
        runs(function() {
          this.testsiRNA = new siRNA(window.thingTestJSON.siRNA);
          this.testsiRNAChanged = false;
          this.testsiRNA.on('change', (function(_this) {
            return function() {
              return _this.siRNAChanged = true;
            };
          })(this));
          return this.testsiRNA.get('lsStates').at(0).get('lsValues').at(0).set({
            stringValue: 'new test sequence'
          });
        });
        waitsFor(function() {
          return this.siRNAChanged;
        }, 500);
        return runs(function() {
          return expect(this.siRNAChanged).toBeTruthy();
        });
      });
    });
  });

}).call(this);