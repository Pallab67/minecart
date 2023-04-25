<%@page import="com.minecart.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<% 
		User auth = (User) request.getSession().getAttribute("auth");
		if(auth != null){
			response.sendRedirect("index.jsp");
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/login.css">
<script src="js/script.js"></script>
<title>Login Page</title>
</head>
<body>
	<div class="login-container">
		<form action="user-login" class="form-tag" method="post">
			<div class="login-head">
				<h3>Login</h3>
			</div>
			<% String test = request.getParameter("msg");
            	if("valid".equals(test)){  %>
            		<div class="n-div"><p>Success!</p></div>
            	<% }
            	if("invalid".equals(test)){  %>
            		<div class="n-div-w"><p>Invalid!</p></div>
            	<% }
            	if("succ".equals(test)){  %>
        		<div class="n-div"><p>Register Success!</p></div>
        	<% }
            %>
			<input type="text" placeholder="Enter Email" name="login-email"
				required><br> <input type="password"
				placeholder="Type Password" name="login-password" required><br>
			<button class="btn-login" type="submit">Login</button>
			<div class="bottom-link">
				<p>
					<a href="#">Forgot Password?</a>
				</p>
				<p>
					<a href="sign-up.jsp">Sign Up</a>
				</p>
			</div>

		</form>
	</div>
</body>
</html>