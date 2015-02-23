(function() {
  beforeEach(function() {
    return this.fixture = $.clone($("#fixture").get(0));
  });

  afterEach(function() {
    $("#fixture").remove();
    return $("body").append($(this.fixture));
  });

  describe("Primary Screen Protocol module testing", function() {
    describe("Primary Screen Protocol Parameters model testing", function() {
      describe("When loaded from new", function() {
        beforeEach(function() {
          return this.pspp = new PrimaryScreenProtocolParameters();
        });
        describe("Defaults", function() {
          it('Should have an default maxY curve display of 100', function() {
            expect(this.pspp.getCurveDisplayMax() instanceof Value).toBeTruthy();
            return expect(this.pspp.getCurveDisplayMax().get('numericValue')).toEqual(100.0);
          });
          return it('Should have an default minY curve display of 0', function() {
            expect(this.pspp.getCurveDisplayMin() instanceof Value).toBeTruthy();
            return expect(this.pspp.getCurveDisplayMin().get('numericValue')).toEqual(0);
          });
        });
        return describe("required states and values", function() {
          it("should have an assay activity value", function() {
            expect(this.pspp.getAssayActivity() instanceof Value).toBeTruthy();
            expect(this.pspp.getAssayActivity().get('codeValue')).toEqual("unassigned");
            expect(this.pspp.getAssayActivity().get('codeOrigin')).toEqual("ACAS DDICT");
            expect(this.pspp.getAssayActivity().get('codeType')).toEqual("assay");
            return expect(this.pspp.getAssayActivity().get('codeKind')).toEqual("activity");
          });
          it("should have a molecular target value with code origin set to acas ddict", function() {
            expect(this.pspp.getMolecularTarget() instanceof Value).toBeTruthy();
            expect(this.pspp.getMolecularTarget().get('codeValue')).toEqual("unassigned");
            expect(this.pspp.getMolecularTarget().get('codeOrigin')).toEqual("ACAS DDICT");
            expect(this.pspp.getMolecularTarget().get('codeType')).toEqual("assay");
            return expect(this.pspp.getMolecularTarget().get('codeKind')).toEqual("molecular target");
          });
          it("should have a target origin value", function() {
            expect(this.pspp.getTargetOrigin() instanceof Value).toBeTruthy();
            expect(this.pspp.getTargetOrigin().get('codeValue')).toEqual("unassigned");
            expect(this.pspp.getTargetOrigin().get('codeOrigin')).toEqual("ACAS DDICT");
            expect(this.pspp.getTargetOrigin().get('codeType')).toEqual("target");
            return expect(this.pspp.getTargetOrigin().get('codeKind')).toEqual("origin");
          });
          it("should have an assay type value", function() {
            expect(this.pspp.getAssayType() instanceof Value).toBeTruthy();
            expect(this.pspp.getAssayType().get('codeValue')).toEqual("unassigned");
            expect(this.pspp.getAssayType().get('codeOrigin')).toEqual("ACAS DDICT");
            expect(this.pspp.getAssayType().get('codeType')).toEqual("assay");
            return expect(this.pspp.getAssayType().get('codeKind')).toEqual("type");
          });
          it("should have an assay technology value", function() {
            expect(this.pspp.getAssayTechnology() instanceof Value).toBeTruthy();
            expect(this.pspp.getAssayTechnology().get('codeValue')).toEqual("unassigned");
            expect(this.pspp.getAssayTechnology().get('codeOrigin')).toEqual("ACAS DDICT");
            expect(this.pspp.getAssayTechnology().get('codeType')).toEqual("assay");
            return expect(this.pspp.getAssayTechnology().get('codeKind')).toEqual("technology");
          });
          return it("should have a cell line value", function() {
            expect(this.pspp.getCellLine() instanceof Value).toBeTruthy();
            expect(this.pspp.getCellLine().get('codeValue')).toEqual("unassigned");
            expect(this.pspp.getCellLine().get('codeOrigin')).toEqual("ACAS DDICT");
            expect(this.pspp.getCellLine().get('codeType')).toEqual("reagent");
            return expect(this.pspp.getCellLine().get('codeKind')).toEqual("cell line");
          });
        });
      });
      describe("When loaded from existing", function() {
        beforeEach(function() {
          return this.pspp = new PrimaryScreenProtocolParameters(window.primaryScreenProtocolTestJSON.primaryScreenProtocolParameters);
        });
        describe("Existence and Defaults", function() {
          return it("should be defined", function() {
            return expect(this.pspp).toBeDefined();
          });
        });
        return describe("after initial load", function() {
          it("should have a maxY curve display ", function() {
            return expect(this.pspp.getCurveDisplayMax().get('numericValue')).toEqual(200.0);
          });
          it("should have a minY curve display ", function() {
            return expect(this.pspp.getCurveDisplayMin().get('numericValue')).toEqual(10.0);
          });
          it('Should have an assay Activity value', function() {
            return expect(this.pspp.getAssayActivity().get('codeValue')).toEqual("luminescence");
          });
          it('Should have a molecularTarget value with the codeOrigin set to customer ddict', function() {
            expect(this.pspp.getMolecularTarget().get('codeValue')).toEqual("test1");
            return expect(this.pspp.getMolecularTarget().get('codeOrigin')).toEqual("customer ddict");
          });
          it('Should have an targetOrigin value', function() {
            return expect(this.pspp.getTargetOrigin().get('codeValue')).toEqual("human");
          });
          it('Should have an assay type value', function() {
            return expect(this.pspp.getAssayType().get('codeValue')).toEqual("cellular assay");
          });
          it('Should have a assay technology value', function() {
            return expect(this.pspp.getAssayTechnology().get('codeValue')).toEqual("wizard triple luminescence");
          });
          return it('Should have an cell line value', function() {
            return expect(this.pspp.getCellLine().get('codeValue')).toEqual("cell line y");
          });
        });
      });
      return describe("model validation", function() {
        beforeEach(function() {
          return this.pspp = new PrimaryScreenProtocolParameters(window.primaryScreenProtocolTestJSON.primaryScreenProtocolParameters);
        });
        it("should be valid when loaded from saved", function() {
          return expect(this.pspp.isValid()).toBeTruthy();
        });
        it("should be invalid when maxY is NaN", function() {
          var filtErrors;
          this.pspp.getCurveDisplayMax().set({
            numericValue: NaN
          });
          expect(this.pspp.isValid()).toBeFalsy();
          filtErrors = _.filter(this.pspp.validationError, function(err) {
            return err.attribute === 'maxY';
          });
          return expect(filtErrors.length).toBeGreaterThan(0);
        });
        return it("should be invalid when minY is NaN", function() {
          var filtErrors;
          this.pspp.getCurveDisplayMin().set({
            numericValue: NaN
          });
          expect(this.pspp.isValid()).toBeFalsy();
          filtErrors = _.filter(this.pspp.validationError, function(err) {
            return err.attribute === 'minY';
          });
          return expect(filtErrors.length).toBeGreaterThan(0);
        });
      });
    });
    describe("Primary Screen Protocol model testing", function() {
      describe("When loaded from new", function() {
        beforeEach(function() {
          return this.psp = new PrimaryScreenProtocol();
        });
        return describe("Existence and Defaults", function() {
          return it("should be defined", function() {
            return expect(this.psp).toBeDefined();
          });
        });
      });
      return describe("When loaded from existing", function() {
        beforeEach(function() {
          return this.psp = new PrimaryScreenProtocol(window.primaryScreenProtocolTestJSON.fullSavedPrimaryScreenProtocol);
        });
        describe("Existence and Defaults", function() {
          it("should be defined", function() {
            return expect(this.psp).toBeDefined();
          });
          return it("should have lsKind set to Bio Activity", function() {
            return expect(this.psp.get('lsKind')).toEqual("Bio Activity");
          });
        });
        return describe("special getters", function() {
          describe("primary screen protocol parameters", function() {
            it('Should be able to get primary screen protocol parameters', function() {
              return expect(this.psp.getPrimaryScreenProtocolParameters() instanceof PrimaryScreenProtocolParameters).toBeTruthy();
            });
            return it('Should parse primary screen protocol parameters', function() {
              expect(this.psp.getPrimaryScreenProtocolParameters().getCurveDisplayMax().get('numericValue')).toEqual(200.0);
              return expect(this.psp.getPrimaryScreenProtocolParameters().getCurveDisplayMin().get('numericValue')).toEqual(10.0);
            });
          });
          return describe("analysis parameters", function() {
            it('Should be able to get analysis parameters', function() {
              return expect(this.psp.getAnalysisParameters() instanceof PrimaryScreenAnalysisParameters).toBeTruthy();
            });
            it('Should parse analysis parameters', function() {
              expect(this.psp.getAnalysisParameters().get('hitSDThreshold')).toEqual(5);
              return expect(this.psp.getAnalysisParameters().get('dilutionFactor')).toEqual(21);
            });
            it('Should parse pos control into backbone models', function() {
              return expect(this.psp.getAnalysisParameters().get('positiveControl').get('batchCode')).toEqual("CMPD-12345678-01");
            });
            it('Should parse neg control into backbone models', function() {
              return expect(this.psp.getAnalysisParameters().get('negativeControl').get('batchCode')).toEqual("CMPD-87654321-01");
            });
            it('Should parse veh control into backbone models', function() {
              return expect(this.psp.getAnalysisParameters().get('vehicleControl').get('batchCode')).toEqual("CMPD-00000001-01");
            });
            return it('Should parse agonist control into backbone models', function() {
              return expect(this.psp.getAnalysisParameters().get('agonistControl').get('batchCode')).toEqual("CMPD-87654399-01");
            });
          });
        });
      });
    });
    describe("PrimaryScreenProtocolParametersController", function() {
      describe("when instantiated with no data", function() {
        beforeEach(function() {
          this.psppc = new PrimaryScreenProtocolParametersController({
            model: new PrimaryScreenProtocolParameters(),
            el: $('#fixture')
          });
          return this.psppc.render();
        });
        describe("Basic existence tests", function() {
          it("should exist", function() {
            return expect(this.psppc).toBeDefined();
          });
          return it('should load autofill template', function() {
            return expect(this.psppc.$('.bv_assayActivity').length).toEqual(1);
          });
        });
        return describe("render existing parameters", function() {
          it("should show the assayActivity as unassigned", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayActivity option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getAssayActivity().get('codeValue')).toEqual("unassigned");
              return expect(this.psppc.assayActivityListController.getSelectedCode()).toEqual("unassigned");
            });
          });
          it("should show the molecularTarget as unassigned", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_molecularTarget option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getMolecularTarget().get('codeValue')).toEqual("unassigned");
              return expect(this.psppc.molecularTargetListController.getSelectedCode()).toEqual("unassigned");
            });
          });
          it("should show the targetOrigin as unassigned", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_targetOrigin option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getTargetOrigin().get('codeValue')).toEqual("unassigned");
              return expect(this.psppc.targetOriginListController.getSelectedCode()).toEqual("unassigned");
            });
          });
          it("should show the assay type as unassigned", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayType option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getAssayType().get('codeValue')).toEqual("unassigned");
              return expect(this.psppc.assayTypeListController.getSelectedCode()).toEqual("unassigned");
            });
          });
          it("should show the assay technology as unassigned", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayTechnology option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getAssayTechnology().get('codeValue')).toEqual("unassigned");
              return expect(this.psppc.assayTechnologyListController.getSelectedCode()).toEqual("unassigned");
            });
          });
          it("should show the cell line as unassigned", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_cellLine option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getCellLine().get('codeValue')).toEqual("unassigned");
              return expect(this.psppc.cellLineListController.getSelectedCode()).toEqual("unassigned");
            });
          });
          it("should have the customer molecular target ddict checkbox ", function() {
            return expect(this.psppc.$('.bv_customerMolecularTargetDDictChkbx').attr("checked")).toBeUndefined();
          });
          it("should show the curve display max", function() {
            expect(this.psppc.model.getCurveDisplayMax().get('numericValue')).toEqual(100.0);
            return expect(this.psppc.$('.bv_maxY').val()).toEqual("100");
          });
          return it("should show the curve display min", function() {
            expect(this.psppc.model.getCurveDisplayMin().get('numericValue')).toEqual(0.0);
            return expect(this.psppc.$('.bv_minY').val()).toEqual("0");
          });
        });
      });
      return describe("when instantiated with data", function() {
        beforeEach(function() {
          this.psppc = new PrimaryScreenProtocolParametersController({
            model: new PrimaryScreenProtocolParameters(window.primaryScreenProtocolTestJSON.primaryScreenProtocolParameters),
            el: $('#fixture')
          });
          return this.psppc.render();
        });
        describe("Basic existence tests", function() {
          it("should exist", function() {
            return expect(this.psppc).toBeDefined();
          });
          return it('should load autofill template', function() {
            return expect(this.psppc.$('.bv_assayActivity').length).toEqual(1);
          });
        });
        describe("render existing parameters", function() {
          it("should have the assayActivity set", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayActivity option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getAssayActivity().get('codeValue')).toEqual("luminescence");
              return expect(this.psppc.assayActivityListController.getSelectedCode()).toEqual("luminescence");
            });
          });
          it("should have the molecularTarget set", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_molecularTarget option').length > 0;
            }, 1000);
            return runs(function() {
              waits(1000);
              expect(this.psppc.model.getMolecularTarget().get('codeValue')).toEqual("test1");
              return expect(this.psppc.molecularTargetListController.getSelectedCode()).toEqual("test1");
            });
          });
          it("should have the targetOrigin set", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_targetOrigin option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getTargetOrigin().get('codeValue')).toEqual("human");
              return expect(this.psppc.targetOriginListController.getSelectedCode()).toEqual("human");
            });
          });
          it("should have the assay type set", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayType option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getAssayType().get('codeValue')).toEqual("cellular assay");
              return expect(this.psppc.assayTypeListController.getSelectedCode()).toEqual("cellular assay");
            });
          });
          it("should have the assay technology set", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayTechnology option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getAssayTechnology().get('codeValue')).toEqual("wizard triple luminescence");
              return expect(this.psppc.assayTechnologyListController.getSelectedCode()).toEqual("wizard triple luminescence");
            });
          });
          it("should have the cell line set", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_cellLine option').length > 0;
            }, 1000);
            return runs(function() {
              expect(this.psppc.model.getCellLine().get('codeValue')).toEqual("cell line y");
              return expect(this.psppc.cellLineListController.getSelectedCode()).toEqual("cell line y");
            });
          });
          it("should have the customer molecular target ddict checkbox checked ", function() {
            return expect(this.psppc.$('.bv_customerMolecularTargetDDictChkbx').attr("checked")).toEqual("checked");
          });
          it('should show the maxY', function() {
            return expect(this.psppc.model.getCurveDisplayMax().get('numericValue')).toEqual(200.0);
          });
          return it('should show the minY', function() {
            return expect(this.psppc.model.getCurveDisplayMin().get('numericValue')).toEqual(10.0);
          });
        });
        describe("model updates", function() {
          it("should update the assay activity", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayActivity option').length > 0;
            }, 1000);
            return runs(function() {
              this.psppc.$('.bv_assayActivity .bv_parameterSelectList').val('fluorescence');
              this.psppc.$('.bv_assayActivity').change();
              return expect(this.psppc.model.getAssayActivity().get('codeValue')).toEqual("fluorescence");
            });
          });
          it("should update the molecular target", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_molecularTarget option').length > 0;
            }, 1000);
            return runs(function() {
              this.psppc.$('.bv_molecularTarget .bv_parameterSelectList').val('test2');
              this.psppc.$('.bv_molecularTarget').change();
              return expect(this.psppc.model.getMolecularTarget().get('codeValue')).toEqual("test2");
            });
          });
          it("should update the target origin", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_targetOrigin option').length > 0;
            }, 1000);
            return runs(function() {
              this.psppc.$('.bv_targetOrigin .bv_parameterSelectList').val('chimpanzee');
              this.psppc.$('.bv_targetOrigin').change();
              return expect(this.psppc.model.getTargetOrigin().get('codeValue')).toEqual("chimpanzee");
            });
          });
          it("should update the assay type", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayType option').length > 0;
            }, 1000);
            return runs(function() {
              this.psppc.$('.bv_assayType .bv_parameterSelectList').val('unassigned');
              this.psppc.$('.bv_assayType').change();
              return expect(this.psppc.model.getAssayType().get('codeValue')).toEqual("unassigned");
            });
          });
          it("should update the assay technology", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_assayTechnology option').length > 0;
            }, 1000);
            return runs(function() {
              this.psppc.$('.bv_assayTechnology .bv_parameterSelectList').val('unassigned');
              this.psppc.$('.bv_assayTechnology').change();
              return expect(this.psppc.model.getAssayTechnology().get('codeValue')).toEqual("unassigned");
            });
          });
          it("should update the cell line", function() {
            waitsFor(function() {
              return this.psppc.$('.bv_cellLine option').length > 0;
            }, 1000);
            return runs(function() {
              this.psppc.$('.bv_cellLine .bv_parameterSelectList').val('unassigned');
              this.psppc.$('.bv_cellLine').change();
              return expect(this.psppc.model.getCellLine().get('codeValue')).toEqual("unassigned");
            });
          });
          it("should update the curve display max", function() {
            this.psppc.$('.bv_maxY').val("130 ");
            this.psppc.$('.bv_maxY').change();
            return expect(this.psppc.model.getCurveDisplayMax().get('numericValue')).toEqual(130);
          });
          return it("should update the curve display min", function() {
            this.psppc.$('.bv_minY').val(" 13 ");
            this.psppc.$('.bv_minY').change();
            return expect(this.psppc.model.getCurveDisplayMin().get('numericValue')).toEqual(13);
          });
        });
        describe("behavior", function() {
          return it("should hide the Molecular Target's add button when the customer molecular target ddict checkbox is checked", function() {
            this.psppc.$('.bv_customerMolecularTargetDDictChkbx').click();
            return expect(this.psppc.$('.bv_molecularTarget .bv_addOptionBtn')).toBeHidden();
          });
        });
        return describe("controller validation rules", function() {
          it("should show error when maxY is NaN", function() {
            this.psppc.$('.bv_maxY').val("b");
            this.psppc.$('.bv_maxY').change();
            return expect(this.psppc.$('.bv_group_maxY').hasClass('error')).toBeTruthy();
          });
          return it("should show error when minY is NaN", function() {
            this.psppc.$('.bv_minY').val("b");
            this.psppc.$('.bv_minY').change();
            return expect(this.psppc.$('.bv_group_minY').hasClass('error')).toBeTruthy();
          });
        });
      });
    });
    describe("PrimaryScreenProtocolController", function() {
      beforeEach(function() {
        this.pspc = new PrimaryScreenProtocolController({
          model: new PrimaryScreenProtocol(window.primaryScreenProtocolTestJSON.fullSavedPrimaryScreenProtocol),
          el: $('#fixture')
        });
        return this.pspc.render();
      });
      return describe("when instantiated", function() {
        return describe("basic existence tests", function() {
          it("should exist", function() {
            return expect(this.pspc).toBeDefined();
          });
          it("should have protocol base controller", function() {
            return expect(this.pspc.protocolBaseController).toBeDefined();
          });
          return it("should have a primary screen protocol parameters controller", function() {
            return expect(this.pspc.primaryScreenProtocolParametersController).toBeDefined();
          });
        });
      });
    });
    describe("Abstract Primary Screen Protocol Module Controller testing", function() {
      return describe("Basic loading", function() {
        return it("Class should exist", function() {
          return expect(window.AbstractPrimaryScreenProtocolModuleController).toBeDefined();
        });
      });
    });
    return describe("Primary Screen Protocol Module Controller testing", function() {
      describe("when instantiated with no data", function() {
        beforeEach(function() {
          this.pspmc = new PrimaryScreenProtocolModuleController({
            model: new PrimaryScreenProtocol(),
            el: $('#fixture')
          });
          return this.pspmc.render();
        });
        describe("basic existence tests", function() {
          it("should exist", function() {
            return expect(this.pspmc).toBeDefined();
          });
          it("should have a primary screen protocol controller", function() {
            return expect(this.pspmc.primaryScreenProtocolController).toBeDefined();
          });
          return it("should have a primary screen analysis parameters controller", function() {
            return expect(this.pspmc.primaryScreenAnalysisParametersController).toBeDefined();
          });
        });
        describe("displaying save, cancel, and new protocol buttons", function() {
          it("should have the buttons from protocol base hidden", function() {
            expect(this.pspmc.$('.bv_save')).toBeHidden();
            expect(this.pspmc.$('.bv_cancel')).toBeHidden();
            return expect(this.pspmc.$('.bv_newEntity')).toBeHidden();
          });
          return it("should have the new protocol button for the module be hidden", function() {
            return expect(this.pspmc.$('.bv_newModule')).toBeHidden();
          });
        });
        return describe("save module button testing", function() {
          describe("when instantiated with new primary screen protocol", function() {
            it("should show the save button text as Save", function() {
              return expect(this.pspmc.$('.bv_saveModule').html()).toEqual("Save");
            });
            return it("should show the save button disabled", function() {
              return expect(this.pspmc.$('.bv_saveModule').attr('disabled')).toEqual('disabled');
            });
          });
          describe("expect save to work", function() {
            beforeEach(function() {
              runs(function() {
                this.pspmc.$('.bv_protocolName').val(" example protocol name   ");
                this.pspmc.$('.bv_protocolName').change();
                this.pspmc.$('.bv_recordedBy').val("nxm7557");
                this.pspmc.$('.bv_recordedBy').change();
                this.pspmc.$('.bv_creationDate').val(" 2013-3-16   ");
                this.pspmc.$('.bv_creationDate').val(" 2013-3-16   ");
                this.pspmc.$('.bv_creationDate').change();
                this.pspmc.$('.bv_notebook').val("my notebook");
                this.pspmc.$('.bv_notebook').change();
                this.pspmc.$('.bv_positiveControlBatch').val("test");
                this.pspmc.$('.bv_positiveControlBatch').change();
                this.pspmc.$('.bv_positiveControlConc').val(" 123 ");
                this.pspmc.$('.bv_positiveControlConc').change();
                this.pspmc.$('.bv_negativeControlBatch').val("test2");
                this.pspmc.$('.bv_negativeControlBatch').change();
                this.pspmc.$('.bv_negativeControlConc').val(" 1231 ");
                this.pspmc.$('.bv_negativeControlConc').change();
                this.pspmc.$('.bv_readName').val("luminescence");
                this.pspmc.$('.bv_readName').change();
                this.pspmc.$('.bv_signalDirectionRule').val("increasing");
                this.pspmc.$('.bv_signalDirectionRule').change();
                this.pspmc.$('.bv_aggregateBy').val("compound batch concentration");
                this.pspmc.$('.bv_aggregateBy').change();
                this.pspmc.$('.bv_aggregationMethod').val("mean");
                this.pspmc.$('.bv_aggregationMethod').change();
                this.pspmc.$('.bv_normalizationRule').val("plate order only");
                this.pspmc.$('.bv_normalizationRule').change();
                this.pspmc.$('.bv_transformationRule').val("sd");
                return this.pspmc.$('.bv_transformationRule').change();
              });
              return waitsFor(function() {
                return this.pspmc.$('.bv_transformationRule option').length > 0;
              }, 1000);
            });
            it("should have a save button", function() {
              return runs(function() {
                return expect(this.pspmc.$('.bv_saveModule').length).toEqual(1);
              });
            });
            xit("model should be valid and ready to save", function() {
              return runs(function() {
                return expect(this.pspmc.model.isValid()).toBeTruthy();
              });
            });
            return xit("should update protocol code", function() {
              runs(function() {
                return this.pspmc.$('.bv_saveModule').click();
              });
              waits(1000);
              return runs(function() {
                console.log("save should have been clicked");
                console.log(this.pspmc);
                return expect(this.pspmc.$('.bv_protocolCode').html()).toEqual("PROT-00000001");
              });
            });
          });
          describe("cancel button behavior testing", function() {
            return it("should call a fetch on the model when cancel is clicked", function() {
              runs(function() {
                return this.pspmc.$('.bv_cancel').click();
              });
              waits(1000);
              return runs(function() {
                return expect(this.pspmc.$('.bv_protocolName').val()).toEqual("");
              });
            });
          });
          return describe("new protocol button behavior testing", function() {
            return it("should create a new protocol when New Protocol is clicked", function() {
              runs(function() {
                return this.pspmc.$('.bv_newModule').click();
              });
              waits(1000);
              return runs(function() {
                expect(this.pspmc.$('.bv_protocolName').val()).toEqual("");
                return expect(this.pspmc.$('.bv_positiveControlBatch').val()).toEqual("");
              });
            });
          });
        });
      });
      return describe("when instantiated with data", function() {
        beforeEach(function() {
          this.pspmc = new PrimaryScreenProtocolModuleController({
            model: new PrimaryScreenProtocol(window.primaryScreenProtocolTestJSON.fullSavedPrimaryScreenProtocol),
            el: $('#fixture')
          });
          return this.pspmc.render();
        });
        describe("basic existence tests", function() {
          it("should exist", function() {
            return expect(this.pspmc).toBeDefined();
          });
          it("should have a primary screen protocol controller", function() {
            return expect(this.pspmc.primaryScreenProtocolController).toBeDefined();
          });
          return it("should have a primary screen analysis parameters controller", function() {
            return expect(this.pspmc.primaryScreenAnalysisParametersController).toBeDefined();
          });
        });
        describe("displaying save, cancel, and new protocol buttons", function() {
          it("should have the buttons from protocol base hidden", function() {
            expect(this.pspmc.$('.bv_save')).toBeHidden();
            expect(this.pspmc.$('.bv_cancel')).toBeHidden();
            return expect(this.pspmc.$('.bv_newEntity')).toBeHidden();
          });
          return it("should have the new protocol button for the module be visible", function() {
            return expect(this.pspmc.$('.bv_newModule')).toBeVisible();
          });
        });
        describe("save module button testing", function() {
          describe("when instantiated with new primary screen protocol", function() {
            it("should show the save button text as Update", function() {
              return expect(this.pspmc.$('.bv_saveModule').html()).toEqual("Update");
            });
            return it("should show the save button disabled", function() {
              return expect(this.pspmc.$('.bv_saveModule').attr('disabled')).toEqual('disabled');
            });
          });
          describe("when a tab is invalid", function() {
            return it("should have the save button disabled if the general information tab is not filled in properly", function() {
              return expect(this.pspmc.$('.bv_saveModule').attr('disabled')).toEqual('disabled');
            });
          });
          return describe("expect save to work", function() {
            beforeEach(function() {
              runs(function() {
                this.pspmc.$('.bv_protocolName').val(" example protocol name   ");
                this.pspmc.$('.bv_protocolName').change();
                this.pspmc.$('.bv_recordedBy').val("nxm7557");
                this.pspmc.$('.bv_recordedBy').change();
                this.pspmc.$('.bv_creationDate').val(" 2013-3-16   ");
                this.pspmc.$('.bv_creationDate').change();
                this.pspmc.$('.bv_notebook').val("my notebook");
                this.pspmc.$('.bv_notebook').change();
                this.pspmc.$('.bv_positiveControlBatch').val("test");
                this.pspmc.$('.bv_positiveControlBatch').change();
                this.pspmc.$('.bv_positiveControlConc').val(" 123 ");
                this.pspmc.$('.bv_positiveControlConc').change();
                this.pspmc.$('.bv_negativeControlBatch').val("test2");
                this.pspmc.$('.bv_negativeControlBatch').change();
                this.pspmc.$('.bv_negativeControlConc').val(" 1231 ");
                this.pspmc.$('.bv_negativeControlConc').change();
                this.pspmc.$('.bv_readName').val("luminescence");
                this.pspmc.$('.bv_readName').change();
                this.pspmc.$('.bv_signalDirectionRule').val("increasing");
                this.pspmc.$('.bv_signalDirectionRule').change();
                this.pspmc.$('.bv_aggregateBy').val("compound batch concentration");
                this.pspmc.$('.bv_aggregateBy').change();
                this.pspmc.$('.bv_aggregationMethod').val("mean");
                this.pspmc.$('.bv_aggregationMethod').change();
                this.pspmc.$('.bv_normalizationRule').val("plate order only");
                this.pspmc.$('.bv_normalizationRule').change();
                this.pspmc.$('.bv_transformationRule').val("sd");
                return this.pspmc.$('.bv_transformationRule').change();
              });
              return waitsFor(function() {
                return this.pspmc.$('.bv_transformationRule option').length > 0;
              }, 1000);
            });
            return it("should show the save button text as Update", function() {
              runs(function() {
                return this.pspmc.$('.bv_saveModule').click();
              });
              waits(1000);
              return runs(function() {
                return expect(this.pspmc.$('.bv_saveModule').html()).toEqual("Update");
              });
            });
          });
        });
        describe("cancel button behavior testing", function() {
          return it("should call a fetch on the model when cancel is clicked", function() {
            runs(function() {
              this.pspmc.$('.bv_protocolName').val(" Updated protocol name   ");
              this.pspmc.$('.bv_protocolName').change();
              expect(this.pspmc.model.get('lsLabels').pickBestLabel().get('labelText')).toEqual("Updated protocol name");
              this.pspmc.$('.bv_positiveControlBatch').val('blah');
              this.pspmc.$('.bv_positiveControlBatch').change();
              expect(this.pspmc.$('.bv_positiveControlBatch').val()).toEqual("blah");
              return this.pspmc.$('.bv_cancel').click();
            });
            waits(1000);
            return runs(function() {
              expect(this.pspmc.model.get('lsLabels').pickBestLabel().get('labelText')).toEqual("FLIPR target A biochemical");
              return expect(this.pspmc.$('.bv_positiveControlBatch').val()).toEqual("CMPD-12345678-01");
            });
          });
        });
        return describe("new protocol button behavior testing", function() {
          return it("should create a new protocol when New Protocol is clicked", function() {
            runs(function() {
              return this.pspmc.$('.bv_newModule').click();
            });
            waits(1000);
            return runs(function() {
              expect(this.pspmc.$('.bv_protocolCode').html()).toEqual("autofill when saved");
              return expect(this.pspmc.$('.bv_positiveControlBatch').val()).toEqual("");
            });
          });
        });
      });
    });
  });

}).call(this);
