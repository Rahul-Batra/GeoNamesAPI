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
   <script src="<c:url value="/resources/js/upload.js" />"></script>
     
    
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
   
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/geonames/dashboard">GeoNames API</a>
        </div>
<div id="navbar" class="navbar-collapse collapse">
				<form action="<c:url value="/logout" />" method="POST"
					id="logoutForm" class="navbar-right navbar-form">
					<!-- <form class="navbar-form navbar-right" method="POST"> -->
					<button type="submit" class="btn btn-success">Logout</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<!-- </form> -->
				</form>
			</div>
			<div>
				<c:if test="{not empty succfile}">
					${succfile}
				</c:if>
			</div>
			<!--/.navbar-collapse -->
		</div>
    </nav>
    <div class="jumbotron rahul">
      <div class="container">
        <p class="rahul_button">
          You can upload a CSV file by clicking upload button and you can search and update countries by clicking search button
        </p>
      </div>
      <div class="container">
        <div class="row">
          <div class="col-md-6 rahul_button">

            <a href="/geonames/dashboard/upload">
              <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-cloud">
                  Upload
                </span>
              </button>
            </a>
          </div>
          <div class="col-md-6 rahul_button">
            <a href="/geonames/dashboard/search_update">
              <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-search">
                  Search / Update
                </span>
              </button>
            </a>
          </div>
        </div>
      </div>
    </div>
     	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<c:url value="/resources/js/ie10-viewport-bug-workaround.js" />"></script>
  </body>
 
</html>
