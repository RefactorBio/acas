(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.PrimaryScreenProtocol = (function(_super) {
    __extends(PrimaryScreenProtocol, _super);

    function PrimaryScreenProtocol() {
      return PrimaryScreenProtocol.__super__.constructor.apply(this, arguments);
    }

    PrimaryScreenProtocol.prototype.defaults = function() {
      return _(PrimaryScreenProtocol.__super__.defaults.call(this)).extend({
        dnsTargetList: false
      });
    };

    PrimaryScreenProtocol.prototype.validate = function(attrs) {
      var errors, maxY, minY;
      errors = [];
      maxY = this.getCurveDisplayMax().get('numericValue');
      if (isNaN(maxY)) {
        errors.push({
          attribute: 'maxY',
          message: "maxY must be a number"
        });
      }
      minY = this.getCurveDisplayMin().get('numericValue');
      if (isNaN(minY)) {
        errors.push({
          attribute: 'minY',
          message: "minY must be a number"
        });
      }
      if (errors.length > 0) {
        return errors;
      } else {
        return null;
      }
    };

    PrimaryScreenProtocol.prototype.getPrimaryScreenProtocolParameterCodeValue = function(parameterName) {
      var parameter;
      parameter = this.get('lsStates').getOrCreateValueByTypeAndKind("metadata", "screening assay", "codeValue", parameterName);
      if (parameter.get('codeValue') === void 0 || parameter.get('codeValue') === "") {
        console.log("heres");
        parameter.set({
          codeValue: "unassigned"
        });
      }
      return parameter;
    };

    PrimaryScreenProtocol.prototype.getCurveDisplayMin = function() {
      var parameter;
      parameter = this.get('lsStates').getOrCreateValueByTypeAndKind("metadata", "screening assay", "numericValue", "curve display min");
      if (parameter.get('numericValue') === void 0 || parameter.get('numericValue') === "") {
        parameter.set({
          numericValue: 0.0
        });
      }
      return parameter;
    };

    PrimaryScreenProtocol.prototype.getCurveDisplayMax = function() {
      var parameter;
      parameter = this.get('lsStates').getOrCreateValueByTypeAndKind("metadata", "screening assay", "numericValue", "curve display max");
      if (parameter.get('numericValue') === void 0 || parameter.get('numericValue') === "") {
        parameter.set({
          numericValue: 100.0
        });
      }
      return parameter;
    };

    return PrimaryScreenProtocol;

  })(Protocol);

  window.AbstractPrimaryScreenProtocolParameterController = (function(_super) {
    __extends(AbstractPrimaryScreenProtocolParameterController, _super);

    function AbstractPrimaryScreenProtocolParameterController() {
      return AbstractPrimaryScreenProtocolParameterController.__super__.constructor.apply(this, arguments);
    }

    AbstractPrimaryScreenProtocolParameterController.prototype.events = {
      "change .bv_parameter": "handleParameterChanged",
      "click .bv_addParameterBtn": "clearModal",
      "click .bv_addNewParameterOption": "addNewParameterOption"
    };

    AbstractPrimaryScreenProtocolParameterController.prototype.handleParameterChanged = function() {
      var splitName;
      console.log("parameter changed");
      splitName = this.parameter.replace(/([A-Z])/g, ' $1');
      splitName = splitName.toLowerCase();
      return this.model.getPrimaryScreenProtocolParameterCodeValue(splitName).set({
        codeValue: this.$('.bv_' + this.parameter).val()
      });
    };

    AbstractPrimaryScreenProtocolParameterController.prototype.clearModal = function() {
      var pascalCaseParameterName;
      console.log("clearing modal");
      pascalCaseParameterName = this.parameter.charAt(0).toUpperCase() + this.parameter.slice(1);
      this.$('.bv_optionAddedMessage').hide();
      this.$('.bv_errorMessage').hide();
      this.$('.bv_new' + pascalCaseParameterName + 'Label').val("");
      this.$('.bv_new' + pascalCaseParameterName + 'Description').val("");
      this.$('.bv_new' + pascalCaseParameterName + 'Comments').val("");
      this.$('.bv_optionAddedMessage').hide();
      return this.$('.bv_errorMessage').hide();
    };

    AbstractPrimaryScreenProtocolParameterController.prototype.addNewParameterOption = function() {
      var newOptionName, pascalCaseParameterName;
      console.log("add new parameter clicked");
      pascalCaseParameterName = this.parameter.charAt(0).toUpperCase() + this.parameter.slice(1);
      newOptionName = (this.$('.bv_new' + pascalCaseParameterName + 'Label').val()).toLowerCase();
      console.log(newOptionName);
      if (this.validNewOption(newOptionName)) {
        console.log("will add new option");
        this.$('.bv_' + this.parameter).append('<option value=' + newOptionName + '>' + newOptionName + '</option>');
        this.$('.bv_optionAddedMessage').show();
        this.$('.bv_errorMessage').hide();
        return console.log("messages shown");
      } else {
        console.log("option already exists");
        this.$('.bv_optionAddedMessage').hide();
        return this.$('.bv_errorMessage').show();
      }
    };

    AbstractPrimaryScreenProtocolParameterController.prototype.validNewOption = function(newOptionName) {
      console.log("validating new option");
      console.log(newOptionName);
      if (this.$('.bv_' + this.parameter + ' option[value="' + newOptionName + '"]').length > 0) {
        return false;
      } else {
        return true;
      }
    };

    return AbstractPrimaryScreenProtocolParameterController;

  })(Backbone.View);

  window.AssayActivityController = (function(_super) {
    __extends(AssayActivityController, _super);

    function AssayActivityController() {
      return AssayActivityController.__super__.constructor.apply(this, arguments);
    }

    AssayActivityController.prototype.template = _.template($("#AssayActivityView").html());

    AssayActivityController.prototype.events = {
      "change .bv_assayActivity": "handleParameterChanged",
      "click .bv_addAssayActivityBtn": "clearModal",
      "click .bv_addNewAssayActivityOption": "addNewParameterOption"
    };

    AssayActivityController.prototype.initialize = function() {
      console.log("initialize, pre-super");
      this.parameter = "assayActivity";
      return this.setupParameterSelect();
    };

    AssayActivityController.prototype.render = function() {
      console.log("rendering aa controller");
      $(this.el).empty();
      $(this.el).html(this.template());
      return this.setupParameterSelect();
    };

    AssayActivityController.prototype.setupParameterSelect = function() {
      console.log(this.model);
      console.log("setting up parameter select");
      console.log(this.parameter);
      this.assayActivityList = new PickListList();
      this.assayActivityList.url = "/api/dataDict/assay activity";
      this.assayActivityListController = new PickListSelectController({
        el: this.$('.bv_assayActivity'),
        collection: this.assayActivityList,
        insertFirstOption: new PickList({
          code: "unassigned",
          name: "Select Assay Activity"
        }),
        selectedCode: this.model.getPrimaryScreenProtocolParameterCodeValue('assay activity').get('codeValue')
      });
      console.log(this.model.getPrimaryScreenProtocolParameterCodeValue('assay activity').get('codeValue'));
      return console.log("end");
    };

    return AssayActivityController;

  })(AbstractPrimaryScreenProtocolParameterController);

  window.MolecularTargetController = (function(_super) {
    __extends(MolecularTargetController, _super);

    function MolecularTargetController() {
      return MolecularTargetController.__super__.constructor.apply(this, arguments);
    }

    MolecularTargetController.prototype.template = _.template($("#MolecularTargetView").html());

    MolecularTargetController.prototype.events = {
      "change .bv_molecularTarget": "handleParameterChanged",
      "click .bv_addMolecularTargetBtn": "clearModal",
      "click .bv_addNewMolecularTargetOption": "addNewParameterOption"
    };

    MolecularTargetController.prototype.initialize = function() {
      this.parameter = "molecularTarget";
      return this.setupParameterSelect();
    };

    MolecularTargetController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template());
      return this.setupParameterSelect();
    };

    MolecularTargetController.prototype.setupParameterSelect = function() {
      this.molecularTargetList = new PickListList();
      this.molecularTargetList.url = "/api/dataDict/molecular target";
      return this.molecularTargetListController = new PickListSelectController({
        el: this.$('.bv_molecularTarget'),
        collection: this.molecularTargetList,
        insertFirstOption: new PickList({
          code: "unassigned",
          name: "Select Molecular Target"
        }),
        selectedCode: this.model.getPrimaryScreenProtocolParameterCodeValue('molecular target').get('codeValue')
      });
    };

    return MolecularTargetController;

  })(AbstractPrimaryScreenProtocolParameterController);

  window.TargetOriginController = (function(_super) {
    __extends(TargetOriginController, _super);

    function TargetOriginController() {
      return TargetOriginController.__super__.constructor.apply(this, arguments);
    }

    TargetOriginController.prototype.template = _.template($("#TargetOriginView").html());

    TargetOriginController.prototype.events = {
      "change .bv_targetOrigin": "handleParameterChanged",
      "click .bv_addTargetOriginBtn": "clearModal",
      "click .bv_addNewTargetOriginOption": "addNewParameterOption"
    };

    TargetOriginController.prototype.initialize = function() {
      this.parameter = "targetOrigin";
      return this.setupParameterSelect();
    };

    TargetOriginController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template());
      return this.setupParameterSelect();
    };

    TargetOriginController.prototype.setupParameterSelect = function() {
      this.targetOriginList = new PickListList();
      this.targetOriginList.url = "/api/dataDict/target origin";
      return this.targetOriginListController = new PickListSelectController({
        el: this.$('.bv_targetOrigin'),
        collection: this.targetOriginList,
        insertFirstOption: new PickList({
          code: "unassigned",
          name: "Select Target Origin"
        }),
        selectedCode: this.model.getPrimaryScreenProtocolParameterCodeValue('target origin').get('codeValue')
      });
    };

    return TargetOriginController;

  })(AbstractPrimaryScreenProtocolParameterController);

  window.AssayTypeController = (function(_super) {
    __extends(AssayTypeController, _super);

    function AssayTypeController() {
      return AssayTypeController.__super__.constructor.apply(this, arguments);
    }

    AssayTypeController.prototype.template = _.template($("#AssayTypeView").html());

    AssayTypeController.prototype.events = {
      "change .bv_assayType": "handleParameterChanged",
      "click .bv_addAssayTypeBtn": "clearModal",
      "click .bv_addNewAssayTypeOption": "addNewParameterOption"
    };

    AssayTypeController.prototype.initialize = function() {
      this.parameter = "assayType";
      return this.setupParameterSelect();
    };

    AssayTypeController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template());
      return this.setupParameterSelect();
    };

    AssayTypeController.prototype.setupParameterSelect = function() {
      this.assayTypeList = new PickListList();
      this.assayTypeList.url = "/api/dataDict/assay type";
      return this.assayTypeListController = new PickListSelectController({
        el: this.$('.bv_assayType'),
        collection: this.assayTypeList,
        insertFirstOption: new PickList({
          code: "unassigned",
          name: "Select Assay Type"
        }),
        selectedCode: this.model.getPrimaryScreenProtocolParameterCodeValue('assay type').get('codeValue')
      });
    };

    return AssayTypeController;

  })(AbstractPrimaryScreenProtocolParameterController);

  window.AssayTechnologyController = (function(_super) {
    __extends(AssayTechnologyController, _super);

    function AssayTechnologyController() {
      return AssayTechnologyController.__super__.constructor.apply(this, arguments);
    }

    AssayTechnologyController.prototype.template = _.template($("#AssayTechnologyView").html());

    AssayTechnologyController.prototype.events = {
      "change .bv_assayTechnology": "handleParameterChanged",
      "click .bv_addAssayTechnologyBtn": "clearModal",
      "click .bv_addNewAssayTechnologyOption": "addNewParameterOption"
    };

    AssayTechnologyController.prototype.initialize = function() {
      this.parameter = "assayTechnology";
      return this.setupParameterSelect();
    };

    AssayTechnologyController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template());
      return this.setupParameterSelect();
    };

    AssayTechnologyController.prototype.setupParameterSelect = function() {
      this.assayTechnologyList = new PickListList();
      this.assayTechnologyList.url = "/api/dataDict/assay technology";
      return this.assayTechnologyListController = new PickListSelectController({
        el: this.$('.bv_assayTechnology'),
        collection: this.assayTechnologyList,
        insertFirstOption: new PickList({
          code: "unassigned",
          name: "Select Assay Technology"
        }),
        selectedCode: this.model.getPrimaryScreenProtocolParameterCodeValue('assay technology').get('codeValue')
      });
    };

    return AssayTechnologyController;

  })(AbstractPrimaryScreenProtocolParameterController);

  window.CellLineController = (function(_super) {
    __extends(CellLineController, _super);

    function CellLineController() {
      return CellLineController.__super__.constructor.apply(this, arguments);
    }

    CellLineController.prototype.template = _.template($("#CellLineView").html());

    CellLineController.prototype.events = {
      "change .bv_cellLine": "handleParameterChanged",
      "click .bv_addCellLineBtn": "clearModal",
      "click .bv_addNewCellLineOption": "addNewParameterOption"
    };

    CellLineController.prototype.initialize = function() {
      this.parameter = "cellLine";
      return this.setupParameterSelect();
    };

    CellLineController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template());
      return this.setupParameterSelect();
    };

    CellLineController.prototype.setupParameterSelect = function() {
      this.cellLineList = new PickListList();
      this.cellLineList.url = "/api/dataDict/cell line";
      return this.cellLineListController = new PickListSelectController({
        el: this.$('.bv_cellLine'),
        collection: this.cellLineList,
        insertFirstOption: new PickList({
          code: "unassigned",
          name: "Select Cell Line"
        }),
        selectedCode: this.model.getPrimaryScreenProtocolParameterCodeValue('cell line').get('codeValue')
      });
    };

    return CellLineController;

  })(AbstractPrimaryScreenProtocolParameterController);

  window.PrimaryScreenProtocolParametersController = (function(_super) {
    __extends(PrimaryScreenProtocolParametersController, _super);

    function PrimaryScreenProtocolParametersController() {
      this.handleMinYChanged = __bind(this.handleMinYChanged, this);
      this.handleMaxYChanged = __bind(this.handleMaxYChanged, this);
      this.handleAssayStageChanged = __bind(this.handleAssayStageChanged, this);
      this.handleTargetListChanged = __bind(this.handleTargetListChanged, this);
      this.updateModel = __bind(this.updateModel, this);
      this.render = __bind(this.render, this);
      return PrimaryScreenProtocolParametersController.__super__.constructor.apply(this, arguments);
    }

    PrimaryScreenProtocolParametersController.prototype.template = _.template($("#PrimaryScreenProtocolParametersView").html());

    PrimaryScreenProtocolParametersController.prototype.events = {
      "click .bv_dnsTargetList": "handleTargetListChanged",
      "change .bv_assayStage": "handleAssayStageChanged",
      "change .bv_maxY": "handleMaxYChanged",
      "change .bv_minY": "handleMinYChanged"
    };

    PrimaryScreenProtocolParametersController.prototype.initialize = function() {
      console.log("initialize");
      this.errorOwnerName = 'PrimaryScreenProtocolParametersController';
      PrimaryScreenProtocolParametersController.__super__.initialize.call(this);
      return this.setUpAssayStageSelect();
    };

    PrimaryScreenProtocolParametersController.prototype.render = function() {
      console.log("rendering");
      console.log(this.model);
      console.log;
      console.log(this.model.get('dnsTargetList'));
      console.log(this.model.getPrimaryScreenProtocolParameterCodeValue('assay activity').get('codeValue'));
      console.log(this.model.getPrimaryScreenProtocolParameterCodeValue('molecular target').get('codeValue'));
      this.$('.bv_primaryProtocolParameters').empty();
      this.$('.bv_primaryProtocolParameters').html(this.template(this.model.attributes));
      this.$('.bv_dnsTargetList').val(this.model.get('dnsTargetList'));
      this.$('.bv_maxY').val(this.model.getCurveDisplayMax().get('numericValue'));
      this.$('.bv_minY').val(this.model.getCurveDisplayMin().get('numericValue'));
      this.setUpAssayStageSelect();
      PrimaryScreenProtocolParametersController.__super__.render.call(this);
      return this;
    };

    PrimaryScreenProtocolParametersController.prototype.setUpAssayStageSelect = function() {
      this.assayStageList = new PickListList();
      this.assayStageList.url = "/api/dataDict/assay stage";
      return this.assayStageListController = new PickListSelectController({
        el: this.$('.bv_assayStage'),
        collection: this.assayStageList,
        insertFirstOption: new PickList({
          code: "unassigned",
          name: "Select assay stage"
        }),
        selectedCode: this.model.getPrimaryScreenProtocolParameterCodeValue('assay stage').get('codeValue')
      });
    };

    PrimaryScreenProtocolParametersController.prototype.updateModel = function() {
      return this.model.set({
        assayStage: this.$('.bv_assayStage').val(),
        maxY: parseFloat(this.getTrimmedInput('.bv_maxY')),
        minY: parseFloat(this.getTrimmedInput('.bv_minY'))
      });
    };

    PrimaryScreenProtocolParametersController.prototype.handleTargetListChanged = function() {
      var dnsTargetList;
      dnsTargetList = this.$('.bv_dnsTargetList').is(":checked");
      this.model.set({
        dnsTargetList: dnsTargetList
      });
      if (dnsTargetList) {
        this.$('.bv_addMolecularTargetBtn').hide();
      } else {
        this.$('.bv_addMolecularTargetBtn').show();
      }
      return this.attributeChanged();
    };

    PrimaryScreenProtocolParametersController.prototype.handleAssayStageChanged = function() {
      return this.model.getPrimaryScreenProtocolParameterCodeValue('assay stage').set({
        codeValue: this.$('.bv_assayStage').val()
      });
    };

    PrimaryScreenProtocolParametersController.prototype.handleMaxYChanged = function() {
      return this.model.getCurveDisplayMax().set({
        numericValue: this.$('.bv_maxY').val()
      });
    };

    PrimaryScreenProtocolParametersController.prototype.handleMinYChanged = function() {
      return this.model.getCurveDisplayMin().set({
        numericValue: this.$('.bv_minY').val()
      });
    };

    return PrimaryScreenProtocolParametersController;

  })(AbstractParserFormController);

  window.PrimaryScreenProtocolController = (function(_super) {
    __extends(PrimaryScreenProtocolController, _super);

    function PrimaryScreenProtocolController() {
      return PrimaryScreenProtocolController.__super__.constructor.apply(this, arguments);
    }

    PrimaryScreenProtocolController.prototype.template = _.template($("#PrimaryScreenProtocolView").html());

    PrimaryScreenProtocolController.prototype.moduleLaunchName = "primary_screen_protocol";

    PrimaryScreenProtocolController.prototype.initialize = function() {
      this.completeInitialization();
      this.setupPrimaryScreenProtocolParametersController();
      this.setupAssayActivityController();
      this.setupMolecularTargetController();
      this.setupTargetOriginController();
      this.setupAssayTypeController();
      this.setupAssayTechnologyController();
      this.setupCellLineController();
      return console.log(this.model);
    };

    PrimaryScreenProtocolController.prototype.completeInitialization = function() {
      if (this.model == null) {
        this.model = new PrimaryScreenProtocol();
      }
      $(this.el).html(this.template());
      this.protocolBaseController = new ProtocolBaseController({
        model: new Protocol,
        el: this.$('.bv_protocolBase')
      });
      this.protocolBaseController.on('amDirty', (function(_this) {
        return function() {
          return _this.trigger('amDirty');
        };
      })(this));
      this.protocolBaseController.on('amClean', (function(_this) {
        return function() {
          return _this.trigger('amClean');
        };
      })(this));
      return this.protocolBaseController.render();
    };

    PrimaryScreenProtocolController.prototype.setupPrimaryScreenProtocolParametersController = function() {
      this.primaryScreenProtocolParametersController = new PrimaryScreenProtocolParametersController({
        model: this.model,
        el: this.$('.bv_primaryProtocolParameters')
      });
      return this.primaryScreenProtocolParametersController.render();
    };

    PrimaryScreenProtocolController.prototype.setupAssayActivityController = function() {
      console.log("beg of setting up assay activity controller");
      this.assayActivityController = new AssayActivityController({
        model: this.model,
        el: this.$('.bv_assayActivityWrapper')
      });
      this.assayActivityController.render();
      return console.log("set up aa controller");
    };

    PrimaryScreenProtocolController.prototype.setupMolecularTargetController = function() {
      console.log("beg of setting up mt controller");
      this.molecularTargetController = new MolecularTargetController({
        model: this.model,
        el: this.$('.bv_molecularTargetWrapper')
      });
      this.molecularTargetController.render();
      return console.log("set up mt controller");
    };

    PrimaryScreenProtocolController.prototype.setupTargetOriginController = function() {
      this.targetOriginController = new TargetOriginController({
        model: this.model,
        el: this.$('.bv_targetOriginWrapper')
      });
      return this.targetOriginController.render();
    };

    PrimaryScreenProtocolController.prototype.setupAssayTypeController = function() {
      this.assayTypeController = new AssayTypeController({
        model: this.model,
        el: this.$('.bv_assayTypeWrapper')
      });
      return this.assayTypeController.render();
    };

    PrimaryScreenProtocolController.prototype.setupAssayTechnologyController = function() {
      this.assayTechnologyController = new AssayTechnologyController({
        model: this.model,
        el: this.$('.bv_assayTechnologyWrapper')
      });
      return this.assayTechnologyController.render();
    };

    PrimaryScreenProtocolController.prototype.setupCellLineController = function() {
      this.cellLineController = new CellLineController({
        model: this.model,
        el: this.$('.bv_cellLineWrapper')
      });
      return this.cellLineController.render();
    };

    return PrimaryScreenProtocolController;

  })(Backbone.View);

}).call(this);
