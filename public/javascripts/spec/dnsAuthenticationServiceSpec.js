(function() {
  describe('User authentication Service testing', function() {
    beforeEach(function() {
      this.waitForServiceReturn = function() {
        return typeof this.serviceReturn !== 'undefined';
      };
      return this.serviceType = window.configurationNode.serverConfigurationParams.configuration.userAuthenticationType;
    });
    describe('when auth service called', function() {
      beforeEach(function() {
        return runs(function() {
          var _this = this;

          return $.ajax({
            type: 'POST',
            url: "api/userAuthentication",
            data: {
              user: "ldap-query",
              password: "Est@P7uRi5SyR+"
            },
            success: function(json) {
              return _this.serviceReturn = json;
            },
            error: function(err) {
              console.log('got ajax error');
              return _this.serviceReturn = null;
            },
            dataType: 'json'
          });
        });
      });
      return it('should return succesfull credentials', function() {
        waitsFor(this.waitForServiceReturn, 'service did not return', 2000);
        return runs(function() {
          return expect(this.serviceReturn.status).toContain("Success");
        });
      });
    });
    describe('when user lookup called with valid username', function() {
      beforeEach(function() {
        return runs(function() {
          var _this = this;

          return $.ajax({
            type: 'GET',
            url: "api/users/jmcneil",
            success: function(json) {
              return _this.serviceReturn = json;
            },
            error: function(err) {
              console.log('got ajax error');
              return _this.serviceReturn = null;
            },
            dataType: 'json'
          });
        });
      });
      it('should return user', function() {
        waitsFor(this.waitForServiceReturn, 'service did not return', 2000);
        return runs(function() {
          return expect(this.serviceReturn.username).toEqual("jmcneil");
        });
      });
      it('should return firstName', function() {
        waitsFor(this.waitForServiceReturn, 'service did not return', 2000);
        return runs(function() {
          return expect(this.serviceReturn.firstName).toEqual("John");
        });
      });
      it('should return lastName', function() {
        waitsFor(this.waitForServiceReturn, 'service did not return', 2000);
        return runs(function() {
          return expect(this.serviceReturn.lastName).toEqual("McNeil");
        });
      });
      it('should return email', function() {
        waitsFor(this.waitForServiceReturn, 'service did not return', 2000);
        return runs(function() {
          return expect(this.serviceReturn.email).toContain("jmcneil");
        });
      });
      return it('should not return password', function() {
        waitsFor(this.waitForServiceReturn, 'service did not return', 2000);
        return runs(function() {
          return expect(this.serviceReturn.password).toBeUndefined();
        });
      });
    });
    return describe('when user lookup called with invalid username', function() {
      beforeEach(function() {
        return runs(function() {
          var _this = this;

          return $.ajax({
            type: 'GET',
            url: "api/users/starksofwesteros",
            success: function(json) {
              return _this.serviceReturn = "got 200";
            },
            error: function(err) {
              console.log('got ajax error');
              return _this.serviceReturn = null;
            },
            statusCode: {
              204: function() {
                return _this.serviceReturn = "got 204";
              }
            },
            dataType: 'json'
          });
        });
      });
      return it('should return 204', function() {
        waitsFor(this.waitForServiceReturn, 'service did not return', 2000);
        return runs(function() {
          return expect(this.serviceReturn).toEqual("got 204");
        });
      });
    });
  });

}).call(this);
