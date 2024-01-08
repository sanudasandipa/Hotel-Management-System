<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<style>

/*button edits */
.buttonup {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
}

.button2:hover {
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

/* table edits */

tbody td {
  /* 1. Animate the background-color
     from transparent to white on hover */
  background-color: rgba(255,255,255,0);
  transition: all 0.2s linear; 
  transition-delay: 0.3s, 0s;
  /* 2. Animate the opacity on hover */
  opacity: 0.6;
}
tbody tr:hover td {
  background-color: rgba(255,255,255,1);
  transition-delay: 0s, 0s;
  opacity: 1;
  font-size: 2em;
}

td {
  /* 3. Scale the text using transform on hover */
  transform-origin: center left;
  transition-property: transform;
  transition-duration: 0.4s;
  transition-timing-function: ease-in-out;
}
tr:hover td {
  transform: scale(1.1);
}





/* Codepen styling */
* { box-sizing: border-box }

table {
  width: 90%;
  margin: 0 5%;
  text-align: left;
}
th, td {
  padding: 0.5em;
}

body {
 
  height: 100vh;
 background: hsl(232, 22%, 90%);
  color: rgba(95, 17, 232, 1);
}

body > *  {
  margin: auto;
}



</style>


<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet" href="style.css">

<title>Hotel LUXEHAVN</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />

</head>
</head>
<body id="page-top">

      <!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">User profile</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="homepage.jsp">Home</a></li>
					<!--  <li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#about">About</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="login.jsp">Logout</a></li>
					  <li class="nav-item mx-0 mx-lg-1 bg-danger"><a 
						class="nav-link py-3 px-0 px-lg-3 rounded" href="useraccount.jsp">UserProfile</a></li> 	
					-->
				</ul>
			</div>
		</div>
	</nav>







<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
       <table>
       <c:forEach var ="cus" items= "${cusDetails}">
       
       <c:set var="id" value="${cus.id}" />
        <c:set var="name" value="${cus.name}" />
         <c:set var="password" value="${cus.upwd}" />
          <c:set var="email" value="${cus.uemail}" />
           <c:set var="phone" value="${cus.umobile}" />
       
   
  <tbody>
     
       <tr>
          <td>Customer ID</td>
          <td> ${cus.id}</td>
       </tr> 
       
       <tr>
          <td>Customer Name</td>
          <td> ${cus.name}</td>
       </tr> 
       
       <tr>
          <td>Customer Password</td>
          <td> ${cus.upwd}</td>
       </tr> 
       
       <tr>
          <td>Customer Email</td>
          <td>  ${cus.uemail}</td>
       </tr> 
       
       <tr>
          <td>Customer Phone</td>
          <td> ${cus.umobile}</td>
       </tr> 
       
  </tbody>
       
       </c:forEach>
     </table>
     
     <c:url  value="updatecustomer.jsp" var="cusupdate" >
     
     <c:param name="id" value= "${id}" />
     <c:param name="name" value= "${name}" />
     <c:param name="pass" value= "${password}" />
     <c:param name="email" value= "${email}" />
     <c:param name="phone" value= "${phone}" />
     
     
     </c:url>
     
     
     <br>
     <a href= "${cusupdate}">
     <button class="buttonup button2" name= "update">Update Account</button>
     <!--  <input type= "button" name= "update" value="Update my Data"> <br> -->
     </a>
     <br>
       <br>
     

     
     
     <c:url  value="deletecustomer.jsp" var="cusdelete" >
     
       <c:param name="id" value= "${id}" />
     <c:param name="name" value= "${name}" />
     <c:param name="pass" value= "${password}" />
     <c:param name="email" value= "${email}" />
     <c:param name="phone" value= "${phone}" />
     
     </c:url>
     
     <a href="${cusdelete}">
      <button class="buttonup button2" name= "delete">Delete Account</button>
     </a>
     
<br>
<br>
<br>
<br>

     <!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Location</h4>
					<p class="lead mb-0">
						2215 John Daniel Drive <br /> Clark, MO 65243
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">About Freelancer</h4>
					<p class="lead mb-0">
						Freelance is a free to use, MIT licensed Bootstrap theme created
						by <a href="membersinfo.jsp">Start Bootstrap</a> .
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright &copy; Sanuda Sandipa 2023</small>
		</div>
	</div>






<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>
	
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<!-- * *                               SB Forms JS                               * *-->
	<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
	<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>



</body>
</html>