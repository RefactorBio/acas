(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  window.Logging = (function(_super) {
    __extends(Logging, _super);

    function Logging() {
      return Logging.__super__.constructor.apply(this, arguments);
    }

    return Logging;

  })(Backbone.Model);

  window.LoggingController1 = (function(_super) {
    __extends(LoggingController1, _super);

    function LoggingController1() {
      this.render = __bind(this.render, this);
      return LoggingController1.__super__.constructor.apply(this, arguments);
    }

    LoggingController1.prototype.template = _.template($("#LoggingView").html());

    LoggingController1.prototype.initialize = function() {
      this.errorOwnerName = 'LoggingController';
      if (this.model == null) {
        return this.model = new Logging();
      }
    };

    LoggingController1.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template(this.model.attributes));
      return this;
    };

    return LoggingController1;

  })(Backbone.View);

  window.LoggingController = (function(_super) {
    __extends(LoggingController, _super);

    function LoggingController() {
      this.render = __bind(this.render, this);
      return LoggingController.__super__.constructor.apply(this, arguments);
    }

    LoggingController.prototype.initialize = function() {
      if (AppLaunchParams.loggingToMongo) {
        return this.loggingApp = new MongoLoggingController();
      } else {
        return this.loggingApp = new FileLoggingController();
      }
    };

    LoggingController.prototype.render = function() {
      $(this.el).empty();
      return $(this.el).html(this.loggingApp.render().el);
    };

    return LoggingController;

  })(Backbone.View);

  window.FileLoggingController = (function(_super) {
    __extends(FileLoggingController, _super);

    function FileLoggingController() {
      this.updateLogFiltering = __bind(this.updateLogFiltering, this);
      this.render = __bind(this.render, this);
      return FileLoggingController.__super__.constructor.apply(this, arguments);
    }

    FileLoggingController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html("<textarea class='bv_logs' style='width: 100%;'rows='30'></textarea><br /><a href='/api/logFile'>Download Logs</a>");
      $.get("/api/logFile", (function(_this) {
        return function(data) {
          return _this.$(".bv_logs").val(data);
        };
      })(this));
      return this;
    };

    FileLoggingController.prototype.updateLogFiltering = function() {
      var filter;
      filter = this.filterMenuController.getFilters();
      this.logs.url = "/api/logger/" + filter;
      return this.logs.fetch();
    };

    return FileLoggingController;

  })(Backbone.View);

  window.MongoLoggingController = (function(_super) {
    __extends(MongoLoggingController, _super);

    function MongoLoggingController() {
      this.updateLogFiltering = __bind(this.updateLogFiltering, this);
      this.render = __bind(this.render, this);
      return MongoLoggingController.__super__.constructor.apply(this, arguments);
    }

    MongoLoggingController.prototype.template = $("#app-view").html();

    MongoLoggingController.prototype.initialize = function() {
      return this.logs = new LogList();
    };

    MongoLoggingController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template);
      this.logsController = new LogListController({
        el: ".bv_logTable",
        collection: this.logs
      });
      this.filterMenuController = new LogFilterMenu({
        el: ".bv_filtersMenu"
      });
      this.filterMenuController.render();
      this.filterMenuController.bind("filterChanged", this.updateLogFiltering);
      this.logs.fetch();
      return this;
    };

    MongoLoggingController.prototype.updateLogFiltering = function() {
      var filter;
      filter = this.filterMenuController.getFilters();
      this.logs.url = "/api/logger/" + filter;
      return this.logs.fetch();
    };

    return MongoLoggingController;

  })(Backbone.View);

  window.LogEntry = (function(_super) {
    __extends(LogEntry, _super);

    function LogEntry() {
      return LogEntry.__super__.constructor.apply(this, arguments);
    }

    LogEntry.prototype.url = "/api/logger/";

    LogEntry.prototype.defaults = {
      level: "na",
      sourceApp: "na",
      action: "na",
      user: "na",
      data: "na",
      timestamp: "na"
    };

    LogEntry.prototype.initialize = function() {
      this.set("sourceApp", this.attributes.meta.sourceApp);
      this.set("action", this.attributes.meta.action);
      this.set("user", this.attributes.meta.user);
      return this.set("data", this.attributes.meta.data);
    };

    return LogEntry;

  })(Backbone.Model);

  window.LogList = (function(_super) {
    __extends(LogList, _super);

    function LogList() {
      this.getLogTypeStats = __bind(this.getLogTypeStats, this);
      return LogList.__super__.constructor.apply(this, arguments);
    }

    LogList.prototype.url = "/api/logger/";

    LogList.prototype.model = LogEntry;

    LogList.prototype.getLogTypeStats = function() {
      var key, stats, statsArray, value;
      stats = {
        info: 0,
        warn: 0,
        error: 0
      };
      this.models.forEach(function(model) {
        if (model.get("level")) {
          return stats[model.get("level")]++;
        }
      });
      statsArray = [];
      for (key in stats) {
        value = stats[key];
        statsArray.push([key, value]);
      }
      return statsArray;
    };

    return LogList;

  })(Backbone.Collection);

  window.LogListController = (function(_super) {
    __extends(LogListController, _super);

    function LogListController() {
      this.addItem = __bind(this.addItem, this);
      this.addAllItems = __bind(this.addAllItems, this);
      this.render = __bind(this.render, this);
      return LogListController.__super__.constructor.apply(this, arguments);
    }

    LogListController.prototype.template = $("#log-list-view").html();

    LogListController.prototype.initialize = function() {
      this.collection.bind("fetch", this.render);
      this.collection.bind("change", this.render);
      return this.collection.bind("add", this.render);
    };

    LogListController.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template);
      return this.addAllItems();
    };

    LogListController.prototype.addAllItems = function() {
      return this.collection.each((function(_this) {
        return function(item) {
          return _this.addItem(item);
        };
      })(this));
    };

    LogListController.prototype.addItem = function(item) {
      var log;
      log = new LogEntryController({
        model: item
      });
      return this.$('.bv_logListBody').append(log.render().el);
    };

    return LogListController;

  })(Backbone.View);

  window.LogEntryController = (function(_super) {
    __extends(LogEntryController, _super);

    function LogEntryController() {
      this.render = __bind(this.render, this);
      return LogEntryController.__super__.constructor.apply(this, arguments);
    }

    LogEntryController.prototype.tagName = 'tr';

    LogEntryController.prototype.template = $("#log-entry-item").html();

    LogEntryController.prototype.render = function() {
      var styleName, template;
      this.$el.empty();
      template = _.template(this.template, this.model.toJSON());
      this.$el.html(template);
      styleName = "";
      if (this.model.get("level") === "warn") {
        styleName = "warning";
      } else if (this.model.get("level") === "error") {
        styleName = "danger";
      } else if (this.model.get("level") === "info") {
        styleName = "active";
      }
      $(this.el).addClass(styleName);
      return this;
    };

    return LogEntryController;

  })(Backbone.View);

  window.LogFilterMenu = (function(_super) {
    __extends(LogFilterMenu, _super);

    function LogFilterMenu() {
      this.render = __bind(this.render, this);
      this.getFilters = __bind(this.getFilters, this);
      this.filterChanged = __bind(this.filterChanged, this);
      return LogFilterMenu.__super__.constructor.apply(this, arguments);
    }

    LogFilterMenu.prototype.template = $("#log-filters-menu").html();

    LogFilterMenu.prototype.initialize = function() {
      this.usersList = new UsersList();
      return this.appSourcesList = new ApplicationSourcesList();
    };

    LogFilterMenu.prototype.events = {
      "change .bv_logLevel": "filterChanged",
      "change .bv_application": "filterChanged",
      "change .bv_user": "filterChanged"
    };

    LogFilterMenu.prototype.filterChanged = function() {
      return this.trigger("filterChanged");
    };

    LogFilterMenu.prototype.getFilters = function() {
      return "" + (this.$(".bv_logLevel").val()) + "/" + (this.$(".bv_application select").val()) + "/" + (this.$(".bv_user select").val());
    };

    LogFilterMenu.prototype.render = function() {
      $(this.el).empty();
      $(this.el).html(this.template);
      this.usersPickList = new PickList({
        el: ".bv_user",
        collection: this.usersList
      });
      this.usersList.fetch();
      this.appSourcesPickList = new PickList({
        el: ".bv_application",
        collection: this.appSourcesList
      });
      this.appSourcesList.fetch();
      return this;
    };

    return LogFilterMenu;

  })(Backbone.View);

  window.ApplicationSourcesList = (function(_super) {
    __extends(ApplicationSourcesList, _super);

    function ApplicationSourcesList() {
      return ApplicationSourcesList.__super__.constructor.apply(this, arguments);
    }

    ApplicationSourcesList.prototype.url = '/api/logger/applicationSources';

    return ApplicationSourcesList;

  })(Backbone.Collection);

  window.UsersList = (function(_super) {
    __extends(UsersList, _super);

    function UsersList() {
      return UsersList.__super__.constructor.apply(this, arguments);
    }

    UsersList.prototype.url = '/api/logger/users';

    return UsersList;

  })(Backbone.Collection);

  window.GraphLogStats = (function(_super) {
    __extends(GraphLogStats, _super);

    function GraphLogStats() {
      this.render = __bind(this.render, this);
      return GraphLogStats.__super__.constructor.apply(this, arguments);
    }

    GraphLogStats.prototype.template = $("#log-stats-view").html();

    GraphLogStats.prototype.initialize = function() {
      this.collection.bind("fetch", this.render);
      this.collection.bind("change", this.render);
      return this.collection.bind("add", this.render);
    };

    GraphLogStats.prototype.render = function() {
      var data, plot1;
      $(this.el).empty();
      $(this.el).html(this.template);
      data = this.collection.getLogTypeStats();
      return plot1 = jQuery.jqplot("chart1", [data], {
        seriesDefaults: {
          renderer: jQuery.jqplot.PieRenderer,
          rendererOptions: {
            showDataLabels: true
          }
        },
        legend: {
          show: true,
          location: "e"
        }
      });
    };

    return GraphLogStats;

  })(Backbone.View);

}).call(this);
