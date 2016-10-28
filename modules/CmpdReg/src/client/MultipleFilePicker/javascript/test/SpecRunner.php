<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>Jasmine Spec Runner</title>

  <link rel="shortcut icon" type="image/png" href="../lib/jasmine-1.1.0/jasmine_favicon.png">

  <link rel="stylesheet" type="text/css" href="../lib/jasmine-1.1.0/jasmine.css">
  <link rel="stylesheet" type="text/css" href="../../css/style.css">
  <script type="text/javascript" src="../lib/jasmine-1.1.0/jasmine.js"></script>
  <script type="text/javascript" src="../lib/jasmine-1.1.0/jasmine-html.js"></script>
  
  <script type="text/javascript" src="../lib/json2.js"></script>
  <script type="text/javascript" src="../lib/jquery-1.6.2.js"></script>
  <script type="text/javascript" src="../lib/jquery.form.js"></script>
  <script type="text/javascript" src="../lib/underscore-1.1.6.js"></script>
  <script type="text/javascript" src="../lib/backbone.js"></script>
  <script type="text/javascript" src="../lib/backbone-localstorage.js"></script>
  <script type="text/javascript" src="../../../src/PickList.js"></script>

  <!-- include source files here... -->
  <script type="text/javascript" src="spec.js"></script>

  <!-- include spec files here... -->
  <script type="text/javascript" src="../src/file.js"></script>
  <script type="text/javascript" src="../src/file_renderer.js"></script>

  <script type="text/javascript">
    (function() {
           window.configuration =     {serverConnection: {
                connectToServer: false
            }};
      var jasmineEnv = jasmine.getEnv();
      jasmineEnv.updateInterval = 1000;

      var trivialReporter = new jasmine.TrivialReporter();

      jasmineEnv.addReporter(trivialReporter);

      jasmineEnv.specFilter = function(spec) {
        return trivialReporter.specFilter(spec);
      };

      var currentWindowOnload = window.onload;

      window.onload = function() {
        if (currentWindowOnload) {
          currentWindowOnload();
        }
        execJasmine();
      };

      function execJasmine() {
        jasmineEnv.execute();
      }

    })();
  </script>

</head>

<body>
	<div id="fixture">
        <?php
    	include '../../templates/DropView.inc';
        include '../../templates/file_template.inc';
        include '../../templates/file_template_desc.inc';
        include '../../templates/file_template_renderer.inc';
        ?>
	</div>
</body>
</html>
