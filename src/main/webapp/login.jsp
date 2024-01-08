<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--  <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

     <form action="login" method = "post">
     
         User Name <input type ="text" name="uid"> <br>
         Password <input type = "password" name ="pass"><br>
          
           <input type= "submit" name = "submit" value="login">
           
           
     </form>      
     


</body>
</html> -->

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<input type="hidden" id="status" 
    value="<%= request.getAttribute("status")%>">
	<div class="main">

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="sing up image">
						</figure>
						<a href="customerinsert.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Sign in</h2>
						<form method="post" action="login" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="uid" id="username"
									placeholder="Your Email" required="required" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="password"
									placeholder="Password" required="required"/>
							</div>
							<div class="form-group">
								<a href ="forgotPassword.jsp">Forgot Password ? </a>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="submit" id="signin"
									class="form-submit" value="login" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Or login with</span>
							<ul class="socials">
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-facebook"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-twitter"></i></a></li>
								<li><a href="#"><i
										class="display-flex-center zmdi zmdi-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel= "stylesheet" href="alert/dist/sweetalert.css">
	
<script type= "text/javascript">

var status = document.getElementById("status").value;
if(status == "failed"){
	swal("Sorry","Wrong Username or Password","error");
}
    else if(status == "invalidEmail"){
	   swal("Sorry","Please Enter Email","error");
}
    else if(status == "failed"){
	    swal("Sorry","Please Enter Password","error");
}
    else if(status == "resetSuccess"){
	     swal("congratulations","Password reset successfully","success");
}
    else if(status == "resetFailed"){
	     swal("Sorry","Failed to reset Password","error");
}

</script>	
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>