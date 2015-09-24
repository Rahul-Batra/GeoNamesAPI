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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
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

  <body background="#00c3c1">
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
			<!--/.navbar-collapse -->
		</div>
    </nav>
    <div class="jumbotron">
      <div class="container input-group rahul_upload col-md-4">
      <c:if test="${not empty message}">
				<p>${message}</p>
			</c:if>
      	<form method="POST" action="/geonames/dashboard/upload/save?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
	        <input type="text" class="form-control" readonly>
	        <span class="input-group-btn">
	          <span class="btn btn-primary btn-file">
	            Browse
	            <input type="file" name="name" multiple>
	          </span>
	          <input  class="btn btn-primary" type="submit" name="upload">
	        </span>
	       
        </form>
      </div>
    </div>

    <!-- <div class="container">
      <div class="row rahul_upload">
        <input type="text" class="form-control" readonly>
        <form method="POST" commandName="file" enctype="multipart/form-data">
          <span class="btn btn-primary btn-file">
            Browse&hellip; <input type="file" multiple>
          </span>
          <input class="btn btn-primary" type="submit" name="upload">
        </form>
      </div>
    </div> -->
   <!--  <div class="input-group rahul_upload">
      <span class="input-group-btn">
        <span class="btn btn-primary btn-file">
          Browse&hellip;
          <input type="file" multiple>
        </span>
      </span>
      <input type="text" class="form-control" readonly>
    </div> -->
 <!--    <form method="post" action="file-upload-1.htm" name="submit" enctype="multipart/form-data">
  <input type="file" name="fileField"><br /><br />
  <input type="submit" name="submit" value="Submit">
</form> -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->   <script src="<c:url value="/resources/js/upload.js" />"></script>
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="<c:url value="/resources/js/ie10-viewport-bug-workaround.js" />"></script>
    
   
  </body>
 
</html>
