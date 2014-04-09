
/* To install this module add
  to app.coffee
 * login routes
passport.serializeUser (user, done) ->
	done null, user.username
passport.deserializeUser (username, done) ->
	loginRoutes.findByUsername username, (err, user) ->
		done err, user
passport.use new LocalStrategy loginRoutes.loginStrategy

app.get '/login', loginRoutes.loginPage
app.post '/login',
	passport.authenticate('local', { failureRedirect: '/login', failureFlash: true }),
	loginRoutes.loginPost
app.get '/logout', loginRoutes.logout
app.post '/api/userAuthentication', loginRoutes.authenticationService
app.get '/api/users/:username', loginRoutes.getUsers
 */

(function() {
  var csUtilities;

  exports.setupRoutes = function(app, passport) {
    app.get('/login', exports.loginPage);
    app.post('/login', passport.authenticate('local', {
      failureRedirect: '/login',
      successRedirect: '/',
      failureFlash: true
    }));
    app.get('/logout', exports.logout);
    app.post('/api/userAuthentication', exports.authenticationService);
    app.get('/api/users/:username', exports.getUsers);
    app.get('/reset', exports.resetpage);
    app.post('/reset', exports.resetAuthenticationService, exports.resetPost);
    app.post('/api/userResetAuthentication', exports.resetAuthenticationService);
    app.get('/change', exports.changePage);
    app.post('/change', exports.changeAuthenticationService, exports.changePost);
    return app.post('/api/userChangeAuthentication', exports.changeAuthenticationService);
  };

  csUtilities = require('../public/src/conf/CustomerSpecificServerFunctions.js');

  exports.loginPage = function(req, res) {
    var error, errorMsg, user;
    req.session.returnTo = '/';
    user = null;
    if (req.user != null) {
      user = req.user;
    }
    errorMsg = "";
    error = req.flash('error');
    if (error.length > 0) {
      errorMsg = error[0];
    }
    return res.render('login', {
      title: "ACAS Login",
      scripts: [],
      user: user,
      message: errorMsg
    });
  };

  exports.resetPost = function(req, res) {
    console.log(req.session);
    return res.redirect('/reset');
  };

  exports.changePost = function(req, res) {
    console.log(req.session);
    return res.redirect('/change');
  };

  exports.logout = function(req, res) {
    req.logout();
    return res.redirect('/');
  };

  exports.ensureAuthenticated = function(req, res, next) {
    if (req.isAuthenticated()) {
      return next();
    }
    req.session.returnTo = req.url;
    return res.redirect('/login');
  };

  exports.getUsers = function(req, resp) {
    var callback;
    callback = function(err, user) {
      if (user === null) {
        return resp.send(204);
      } else {
        delete user.password;
        return resp.json(user);
      }
    };
    return csUtilities.getUser(req.params.username, callback);
  };

  exports.authenticationService = function(req, resp) {
    var callback;
    callback = function(results) {
      console.log(results);
      if (results.indexOf("Success") >= 0) {
        console.log("in authentication service success");
        return resp.json({
          status: "Success"
        });
      } else {
        console.log("in authentication service fail");
        return resp.json({
          status: "Fail"
        });
      }
    };
    if (global.specRunnerTestmode) {
      return callback("Success");
    } else {
      return csUtilities.authCheck(req.body.user, req.body.password, callback);
    }
  };

  exports.resetAuthenticationService = function(req, resp) {
    var callback;
    callback = function(results) {
      console.log(results);
      if (results.indexOf("Your new password is sent to your email address") >= 0) {
        req.flash('error', 'Your new password is sent to your email address');
        return resp.redirect('/reset');
      } else {
        req.flash('error', 'Invalid Email or Username');
        return resp.redirect('/reset');
      }
    };
    if (global.specRunnerTestmode) {
      return callback("Success");
    } else {
      return csUtilities.resetAuth(req.body.email, callback);
    }
  };

  exports.changeAuthenticationService = function(req, resp) {
    var callback;
    callback = function(results) {
      console.log(results);
      if (results.indexOf("Success") >= 0) {
        return resp.json({
          status: "Success"
        });
      } else {
        return resp.redirect('/change');
      }
    };
    if (global.specRunnerTestmode) {
      return callback("Success");
    } else {
      return csUtilities.changeAuth(req.body.user, req.body.oldPassword, req.body.oldPassword, req.body.oldPassword, callback);
    }
  };

  exports.resetpage = function(req, res) {
    var error, errorMsg, user;
    user = null;
    if (req.user != null) {
      user = req.user;
    }
    console.log(req.flash);
    errorMsg = "";
    error = req.flash('error');
    if (error.length > 0) {
      errorMsg = error[0];
    }
    return res.render('reset', {
      title: "ACAS reset",
      scripts: [],
      user: user,
      message: errorMsg
    });
  };

  exports.changePage = function(req, res) {
    var error, errorMsg, user;
    user = null;
    if (req.user != null) {
      user = req.user;
    }
    errorMsg = "";
    error = req.flash('error');
    if (error.length > 0) {
      errorMsg = error[0];
    }
    return res.render('change', {
      title: "ACAS reset",
      scripts: [],
      user: user,
      message: errorMsg
    });
  };

}).call(this);
