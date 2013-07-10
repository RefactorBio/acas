(function() {
  var LocalStrategy, app, bulkLoadContainersFromSDFRoutes, bulkLoadSampleTransfersRoutes, curveCuratorRoutes, docForBatchesRoutes, experimentRoutes, express, flash, fullPKParserRoutes, genericDataParserRoutes, http, loginRoutes, passport, path, preferredBatchIdRoutes, projectServiceRoutes, protocolRoutes, routes, runPrimaryAnalysisRoutes, serverUtilityFunctions, user, util;

  express = require('express');

  user = require('./routes/user');

  http = require('http');

  path = require('path');

  flash = require('connect-flash');

  passport = require('passport');

  util = require('util');

  LocalStrategy = require('passport-local').Strategy;

  app = express();

  app.configure(function() {
    app.set('port', process.env.PORT || 48203);
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.favicon());
    app.use(express.logger('dev'));
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(express["static"](path.join(__dirname, 'public')));
    app.use(express.cookieParser());
    app.use(express.session({
      secret: 'acas needs login'
    }));
    app.use(flash());
    app.use(passport.initialize());
    app.use(passport.session());
    return app.use(app.router);
  });

  loginRoutes = require('./routes/loginRoutes');

  app.configure('development', function() {
    return app.use(express.errorHandler());
  });

  routes = require('./routes');

  app.get('/', loginRoutes.ensureAuthenticated, routes.index);

  app.get('/SpecRunner', routes.specRunner);

  app.get('/LiveServiceSpecRunner', routes.liveServiceSpecRunner);

  passport.serializeUser(function(user, done) {
    return done(null, user.username);
  });

  passport.deserializeUser(function(username, done) {
    return loginRoutes.findByUsername(username, function(err, user) {
      return done(err, user);
    });
  });

  passport.use(new LocalStrategy(loginRoutes.loginStrategy));

  app.get('/login', loginRoutes.loginPage);

  app.post('/login', passport.authenticate('local', {
    failureRedirect: '/login',
    failureFlash: true
  }), loginRoutes.loginPost);

  app.get('/logout', loginRoutes.logout);

  app.post('/api/userAuthentication', loginRoutes.authenticationService);

  app.get('/api/users/:username', loginRoutes.getUsers);

  preferredBatchIdRoutes = require('./routes/PreferredBatchIdService.js');

  app.post('/api/preferredBatchId', preferredBatchIdRoutes.preferredBatchId);

  app.post('/api/testRoute', preferredBatchIdRoutes.testRoute);

  protocolRoutes = require('./routes/ProtocolServiceRoutes.js');

  app.get('/api/protocols/codename/:code', protocolRoutes.protocolByCodename);

  app.get('/api/protocols/:id', protocolRoutes.protocolById);

  app.post('/api/protocols', protocolRoutes.postProtocol);

  app.put('/api/protocols', protocolRoutes.putProtocol);

  app.get('/api/protocollabels', protocolRoutes.protocolLabels);

  app.get('/api/protocolCodes', protocolRoutes.protocolCodeList);

  app.get('/api/protocolCodes/filter/:str', protocolRoutes.protocolCodeList);

  experimentRoutes = require('./routes/ExperimentServiceRoutes.js');

  app.get('/api/experiments/codename/:code', experimentRoutes.experimentByCodename);

  app.get('/api/experiments/:id', experimentRoutes.experimentById);

  app.post('/api/experiments', experimentRoutes.postExperiment);

  app.put('/api/experiments', experimentRoutes.putExperiment);

  projectServiceRoutes = require('./routes/ProjectServiceRoutes.js');

  app.get('/api/projects', projectServiceRoutes.getProjects);

  docForBatchesRoutes = require('./routes/DocForBatchesRoutes.js');

  app.get('/docForBatches/*', docForBatchesRoutes.docForBatchesIndex);

  app.get('/docForBatches', docForBatchesRoutes.docForBatchesIndex);

  app.get('/api/docForBatches/:id', docForBatchesRoutes.getDocForBatches);

  app.post('/api/docForBatches', docForBatchesRoutes.saveDocForBatches);

  genericDataParserRoutes = require('./routes/GenericDataParserRoutes.js');

  app.post('/api/genericDataParser', genericDataParserRoutes.parseGenericData);

  fullPKParserRoutes = require('./routes/FullPKParserRoutes.js');

  app.post('/api/fullPKParser', fullPKParserRoutes.parseFullPKData);

  bulkLoadContainersFromSDFRoutes = require('./routes/BulkLoadContainersFromSDFRoutes.js');

  app.post('/api/bulkLoadContainersFromSDF', bulkLoadContainersFromSDFRoutes.bulkLoadContainersFromSDF);

  bulkLoadSampleTransfersRoutes = require('./routes/BulkLoadSampleTransfersRoutes.js');

  app.post('/api/bulkLoadSampleTransfers', bulkLoadSampleTransfersRoutes.bulkLoadSampleTransfers);

  runPrimaryAnalysisRoutes = require('./routes/RunPrimaryAnalysisRoutes.js');

  app.get('/primaryScreenExperiment/*', runPrimaryAnalysisRoutes.primaryScreenExperimentIndex);

  app.get('/primaryScreenExperiment', runPrimaryAnalysisRoutes.primaryScreenExperimentIndex);

  app.post('/api/primaryAnalysis/runPrimaryAnalysis', runPrimaryAnalysisRoutes.runPrimaryAnalysis);

  curveCuratorRoutes = require('./routes/CurveCuratorRoutes.js');

  app.get('/curveCurator/*', curveCuratorRoutes.curveCuratorIndex);

  app.get('/api/curves/stub/:exptCode', curveCuratorRoutes.getCurveStubs);

  serverUtilityFunctions = require('./routes/ServerUtilityFunctions.js');

  app.post('/api/runRFunctionTest', serverUtilityFunctions.runRFunctionTest);

  http.createServer(app).listen(app.get('port'), function() {
    return console.log("Express server listening on port " + app.get('port'));
  });

}).call(this);
