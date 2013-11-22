(function() {
  beforeEach(function() {
    this.fixture = $.clone($("#fixture").get(0));
    return this.testMenuItems = [
      {
        isHeader: true,
        menuName: "Test Header"
      }, {
        isHeader: false,
        menuName: "Test Launcher 1",
        mainControllerClassName: "controllerClassName1"
      }, {
        isHeader: false,
        menuName: "Test Launcher 2",
        mainControllerClassName: "controllerClassName2"
      }, {
        isHeader: false,
        menuName: "Test Launcher 3",
        mainControllerClassName: "controllerClassName3"
      }
    ];
  });

  afterEach(function() {
    $("#fixture").remove();
    return $("body").append($(this.fixture));
  });

  describe("Module Menus Controller testing", function() {
    beforeEach(function() {
      this.mmc = new ModuleMenusController({
        el: $('#fixture'),
        menuListJSON: this.testMenuItems
      });
      return this.mmc.render();
    });
    describe("Basic loading", function() {
      it("Class should exist", function() {
        return expect(this.mmc).toBeDefined();
      });
      it("Should load the template", function() {
        expect($('.bv_modLaunchMenuWrapper')).not.toBeNull();
        return expect($('.bv_mainModuleWrapper')).not.toBeNull();
      });
      it("should show the user first name", function() {
        if (window.conf.require.login) {
          return expect(this.mmc.$('.bv_loginUserFirstName').html()).toContain('John');
        }
      });
      it("should show the user last name", function() {
        if (window.conf.require.login) {
          return expect(this.mmc.$('.bv_loginUserLastName').html()).toContain('McNeil');
        }
      });
      return it("should show a logout link", function() {
        if (window.conf.require.login) {
          return expect(this.mmc.$('.bv_logout').attr('href')).toContain('logout');
        }
      });
    });
    describe("Sub Controllers load after rendering", function() {
      it("Should have 4 menu items", function() {
        return expect(this.mmc.$('.bv_modLaunchMenuWrapper li').length).toEqual(4);
      });
      return it("Should create and make divs for all the non header ModuleLauncherControllers", function() {
        return expect(this.mmc.$('.bv_mainModuleWrapper div.bv_moduleContent').length).toEqual(3);
      });
    });
    return describe("Deploy mode display", function() {
      beforeEach(function() {
        return this.mmc = new ModuleMenusController({
          el: $('#fixture'),
          menuListJSON: this.testMenuItems
        });
      });
      it("should show the deploy mode if set", function() {
        window.AppLaunchParams.deployMode = "Stage";
        this.mmc.render();
        return expect(this.mmc.$('.bv_deployMode h1').html()).toEqual("STAGE");
      });
      return it("should not show the deploy mode if set to Prod", function() {
        window.AppLaunchParams.deployMode = "Prod";
        this.mmc.render();
        return expect(this.mmc.$('.bv_deployMode h1').html()).toEqual("");
      });
    });
  });

}).call(this);
