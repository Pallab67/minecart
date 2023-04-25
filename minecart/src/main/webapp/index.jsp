<%@page import="java.util.*"%>
<%@page import="com.minecart.dao.ProductDao"%>
<%@page import="com.minecart.connection.DBcon"%>
<%@page import="com.minecart.model.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("person", auth);
}
ProductDao pd = new ProductDao(DBcon.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/include/head.jsp"%>
<link rel="stylesheet" href="css/style.css">
<script src="js/script.js"></script>
<title>MineCart</title>
</head>
<body>


	<div class="main-container">

		<%@include file="/include/navbar.jsp"%>

		<!-- Slide Banner Start-->
		<div class="main-slide">
			<div class="silder">
				<div class="slides">
					<input type="radio" name="radio-btn" id="radio1"> <input
						type="radio" name="radio-btn" id="radio2"> <input
						type="radio" name="radio-btn" id="radio3"> <input
						type="radio" name="radio-btn" id="radio4">

					<div class="silde first">
						<img src="img/1.png" alt="">
					</div>
					<div class="silde">
						<img src="img/2.png" alt="">
					</div>
					<div class="silde">
						<img src="img/3.png" alt="">
					</div>
					<div class="silde">
						<img src="img/4.png" alt="">
					</div>

					<div class="navigation-auto">
						<div class="auto-btn1"></div>
						<div class="auto-btn2"></div>
						<div class="auto-btn3"></div>
						<div class="auto-btn4"></div>
					</div>

				</div>
				<div class="navigation-manual">
					<label for="radio1" class="manual-btn"></label> <label for="radio2"
						class="manual-btn"></label> <label for="radio3" class="manual-btn"></label>
					<label for="radio4" class="manual-btn"></label>
				</div>
			</div>


		</div>
		<!-- Slide Banner END-->
		<!-- Top Brand Start-->
		<div class="top-brand">

			<h3>Top Brand</h3>
			<div class="brand-list">
				<div class="">
					<img src="img/samsung.png" alt="">
					<h5>Samsung</h5>
				</div>
				<div class="">
					<img src="img/apple.png" alt="">
					<h5>APPLE</h5>
				</div>
				<div class="">
					<img src="img/asus.png" alt="">
					<h5>Asus</h5>
				</div>
				<div class="">
					<img src="img/xiaomi.png" alt="">
					<h5>Xiaomi</h5>
				</div>
				<div class="">
					<img src="img/realme.png" alt="">
					<h5>Realme</h5>
				</div>
				<div class="">
					<img src="img/sony.png" alt="">
					<h5>Sony</h5>
				</div>
				<div class="">
					<div>
						<img src="img/nikon.png" alt="">
					</div>
					<h5>Nikon</h5>
				</div>

			</div>
		</div>
		<!-- Top Brand END-->


		<!-- Product list -->
		<div class="product-container">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="product-box">
				<div class="image">
					<img src="img/product/<%=p.getImage()%>" alt="img">
				</div>
				<h5>
					<a href="product.jsp?bid=<%= p.getId() %>"><%=p.getName()%></a>
					</h3>
					<h6 class="category">
						Category:
						<%=p.getCategory()%></h6>
					<p>
						<span class="material-symbols-rounded">star_half</span>4.5
					</p>
					<p>
						<s>Price: <%=p.getPrice()%></s><span class="discount">
							24% Off</span>
					</p>
					<p>-Free Delivery</p>
					<a class="btn-p" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a>
					 <a class="btn-p btn-cart" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
			</div>
			<%
			}

			} else {
			out.println("There is no proucts");
			}
			%>
			
		</div>
		<%@include file="/include/footer.jsp"%>
	</div>

	
</body>
</html>