<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/login.css">
    <script src="js/script.js"></script>
    <title>Sign Up Page</title>
</head>

<body>
    <div class="login-container">
        <form action="RegisterServlet" class="form-tag" method="post">
            <div class="login-head">
                <h3>Sign Up</h3>
            </div>
            <% String test = request.getParameter("msg");
            	if("valid".equals(test)){  %>
            		<div class="n-div"><p>Success!</p></div>
            	<% }
            	if("invalid".equals(test)){  %>
            		<div class="n-div-w"><p>Invalid!</p></div>
            	<% }
            %>
            
            <input type="text" placeholder="Enter Username" name="username" required><br>
            <input type="Email" placeholder="Type Email" name="email" required><br>
            <input type="password" placeholder="Type Password" name="password" required><br>
            <input type="password" placeholder="Re-Type Password"><br>
            <button class="btn-login" type="submit">Sign Up</button>
            <div class="bottom-link">
                <p> <a href="#">Forgot Password?</a></p>
                <p><a href="login.jsp">Login</a></p>
            </div>

        </form>
    </div>
</body>

</html>