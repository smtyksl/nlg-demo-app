<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/css/jumbotron-narrow.css">
<link rel="stylesheet" type="text/css" href="/css/home.css">
<link rel="stylesheet" type="text/css" href="/css/jquery.growl.css" />
<script src="http://code.jquery.com/jquery.js"></script>
<script src="/js/jquery.growl.js" type="text/javascript"></script>
</head>

<body>

	<div class="container">
		<div class="header clearfix">
			<nav>
				<ul class="nav nav-pills pull-right">
					<li class="active" id="home"><a href="#">Home</a></li>
					<li id="logout"><a href="#">Logout</a></li>
				</ul>
			</nav>
			<h3 class="text-muted">National Life Group</h3>
		</div>
		<div class="jumbotron">
			<h3>Hello ${userId}!</h3>
		</div>
		<div class="row marketing">
			<div class="col-lg-6">
				<h4>Orchestration</h4>
				<p>Donec id elit non mi porta gravida at eget metus. Maecenas
					faucibus mollis interdum.</p>

				<h4>Mainframe</h4>
				<ul class="nav nav-pills">
					<li id="mainframe"><a href="#">Mainframe</a></li>
				</ul>

				<h4>B2B</h4>
				<p>Morbi leo risus, porta ac consectetur ac, vestibulum at eros.
					Cras mattis consectetur purus sit amet fermentum.</p>
			</div>

		</div>

		<footer class="footer">
			<p>&copy; 2016 Company Inc</p>
		</footer>

	</div>

	<script type="text/javascript">
		$("#logout")
				.click(
						function(e) {
							e.preventDefault();
							$("#home").removeClass("active");
							$("#password-login").removeClass("active");
							$("#logout").addClass("active");
							// assumes we are not part of SSO so just logout of local session
							window.location = "${fn:replace(pageContext.request.requestURL, pageContext.request.requestURI, '')}/logout";
						});
	</script>
	<!-- <script type="text/javascript">
		$("#mainframe").click(
				function(e) {
					var data = "hello";
					$.get("http://localhost:8082/wcf/nlgapimpoc/api/ping",
							function(response) {
								data = response;
							}).error(function() {
						alert("Sorry could not proceed");
					});

					return data;
				});
	</script>
	
	
	,
			         success: function (response) {
			             var resp = JSON.parse(response)
			             alert(resp.status);
			         },
			         error: function (xhr, status) {
			             alert("error");
			         }
	
	
	
	-->
	<script type="text/javascript">
	$("#mainframe").click(
			function() {
				 $.ajax({
			         url: "http://localhost:8082/mainframe/ws/rs/process/${userId}",
			         type: "GET",
			         crossDomain: true,
			         dataType: "json",
			         success: function (response) {
			             var resp = JSON.parse(response)
			             alert(resp.status);
			         },
			         error: function (xhr, status) {
			             alert("error");
			         }
			     });
			});
	</script>

</body>
</html>