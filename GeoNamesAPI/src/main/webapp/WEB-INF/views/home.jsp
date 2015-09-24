<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>GeoNames API</title>
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	

    <!-- Custom styles for this template -->
    <!-- <link href="../css/jumbotron.css" rel="stylesheet"> -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="<c:url value="/resources/js/ie-emulation-modes-warning.js" />"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body onload='document.loginForm.username.focus();'>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/geonames">GeoNames API</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
     <!--     <form class="navbar-form navbar-right" action="file">   -->

     <form class="navbar-form navbar-right" name='loginForm'
			action="<c:url value='/login' />" method='POST'>
            <div class="form-group">
              <input type="text" id="username" name="username" placeholder="Username" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" id="password" name="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
         <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <div class="jumbotron">
      <div class="container">
        <h2>Introduction</h2>
        <p>
        	With GeoNames API you can get access to countries details for various continents and countries code.
        </p>
        <p>
        	To access the data you just send a HTTP-request to address: 
        	<code>
        		https://localhost:8080/geonames/getCountries/{continent}/{countryCode}/{geonameId}
        	</code>
        </p>
        <p>
        	Sample request : 
        	<code>
        		https://localhost:8080/geonames/getCountries/EU/AD/3041565
        	</code>
        </p>
        <p>
        	This call returns a JSON object with one of the following results:
        	<ul>
	        	<li>
	        		If there are no countries than response will be:<br>
	        		{"result": "No countries found"}
	        	</li>
	        	<li>
	        		Else:<br>
	        		{"result": [{"continent": continent, "countryCode": countryCode, "geonameId": geonameId, "capital": capital, "currencyCode": currencyCode, "languages": languages, "population": population, "areaInSqKm": areaInSqKm }]}
	        	</li>
        	</ul>
        </p>
      </div>
    </div>
    <div class="container">
		<h2>About Me</h2>
		<p>
			I am a post graduate in Computer Science from IIIT Delhi.
		</p>
		<p>
			<p><a class="btn btn-default" href="https://www.iiitd.ac.in" role="button">Learn More &raquo;</a></p>
	</div>
      <hr>

      <footer>
        <p>&copy; Rahul Batra, India</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<c:url value="/resources/js/ie10-viewport-bug-workaround.js" />"></script>
  </body>
</html>

