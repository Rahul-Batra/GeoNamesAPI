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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript">
	function toggle(source) {
	  checkboxes = document.getElementsByName('countryId');
	  for(var i=0, n=checkboxes.length;i<n;i++) {
	    checkboxes[i].checked = source.checked;
	  }
	}
	</script>
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
			<!--/.navbar-collapse -->
		</div>
	</nav>
    <div class="jumbotron rahul">
      <div class="row">
        <div class="container">
          <form method="POST">
            <div class="col-md-4">
              Continent Code :  <select class="form-control" name="continent">
							<c:forEach var="continent" items="${continents}">
								<option>${continent}</option>
							</c:forEach>
						</select>
            </div>
            <div class="col-md-4">
             Country Code: <select class="form-control" name="countryCode">
							<c:forEach var="countryCode" items="${countrieslist}">
								<option>${countryCode}</option>
							</c:forEach>
						</select>
            </div>
            <div class="col-md-4">
              GeoName Id: <select class="form-control" name="geonameId">
							<c:forEach var="geonameId" items="${geonameIds}">
								<option>${geonameId}</option>
							</c:forEach>
						</select>
            </div>
            <div class="container">
              <div class="col-md-4">
                
              </div>
              <div class="col-md-4">
                <button type="submit" class="btn btn-success rahul_button">Submit</button>
                 <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <c:if test="${not empty countries}">
    <div class="container">
    		<form method="POST" action="/geonames/dashboard/deleteCountries">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
						<td>Continent Code</td>
						<td>Country Code</td>
						<td>GeoName Id</td>
						<td>Capital</td>
						<td>Currency Code</td>
						<td>Languages</td>
						<td>Population</td>
						<td>Area In SqKm.</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="country" items="${countries}">
					<tr>
						<td><input type="checkbox" name="countryId" value="${country.countryId}"></td>
						<td>${country.continent}</td>
						<td>${country.countryCode}</td>
						<td>${country.geonameId}</td>
						<td>${country.capital}</td>
						<td>${country.currencyCode}</td>
						<td>${country.languages}</td>
						<td>${country.population}</td>
						<td>${country.areaInSqKm}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="navbar-form navbar-right">
				<tr>
					<td>
						<div class="row">
  							<div class="container">
								<div class="col-md-4"><input type="checkbox" onclick="toggle(this)"> Select All</div>
    							<div class="col-md-4"></div>
								<div class="col-md-4"><button type="submit" class="btn btn-success rahul_button2">Delete Selected Items</button></div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</form>
		</div>
	</c:if>
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
