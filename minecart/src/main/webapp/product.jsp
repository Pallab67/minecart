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
int bid = Integer.parseInt(request.getParameter("bid"));
Product p = pd.getSingleProduct(bid);
%>

<!DOCTYPE html>
<html lang="en">
<head>

<%@include file="/include/head.jsp"%>
<link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/p_css.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Product Page</title>
</head>
<body>
	<div class="main-container">
	<%@include file="/include/navbar.jsp"%>
	
    <div class = "card-wrapper">
        <div class = "card">
          <!-- card left -->
          <div class = "product-imgs">
            <div class = "img-display">
              <div class = "img-showcase">
                <img src = "img/product/<%=p.getImage() %>" alt = "Mobile image">
    
              </div>
            </div>
            <div class = "img-select">
              <div class = "img-item">
                <a href = "#" data-id = "1">
                  <img src = "img/product/<%=p.getImage() %>" alt = "Mobile image">
                </a>
              </div>
              <div class = "img-item">
                <a href = "#" data-id = "3">
                  <img src = "img/product/<%=p.getImage() %>" alt = "Mobile image">
                </a>
              </div>
              <div class = "img-item">
                <a href = "#" data-id = "4">
                  <img src = "img/product/<%=p.getImage() %>" alt = "Mobile image">
                </a>
              </div>
            </div>
          </div>
          <!-- card right -->
          <div class = "product-content">
            <h2 class = "product-title"><%=p.getName()%></h2>
            <a href = "#" class = "product-link">visit online store</a>
            <div class = "product-rating">
              <i class='bx bxs-star' ></i>
              <i class='bx bxs-star' ></i>
              <i class='bx bxs-star' ></i>
              <i class='bx bxs-star' ></i>
              <i class='bx bxs-star-half' ></i>
              <span>4.7(21)</span>
            </div>
  
            <div class = "product-price">
              <p class = "last-price">Old Price: <span><%=p.getPrice() %></span></p>
              <p class = "new-price">New Price: <span><%=p.getPrice() %> (5%)</span></p>
            </div>
  
            <div class = "product-detail">
              <h2>about this item: </h2>
              <p>The iPhone 14 Pro is the best phone for under $1,000. It's powerful, has amazing cameras, sports a beautiful display, and the notch is dead. It's hard to think of anything truly wrong with this device and it's perfect for people tired of giant handsets.</p>
              <ul>
                <li>Color: <span>Black</span></li>
                <li>Available: <span>In Stock</span></li>
                <li>Category: <span>Phone</span></li>
                <li>Shipping Area: <span>All over the world</span></li>
                <li>Shipping Fee: <span>Free</span></li>
              </ul>
            </div>
  
            <div class = "purchase-info">
              <input type = "number" min = "0" value = "1">
              <a class="btn-p btn-cart p-btn" href="add-to-cart?id=<%=p.getId()%>">Add to Cart <i class = "fas fa-shopping-cart"></i></a>
              <a class="btn-p p-btn" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now <i class = "fas fa-shopping-cart"></i></a>
             
            </div>
  
           <div class = "social-links">
                <p>Share At: </p>
                <a href = "#">
                  <i class='bx bxl-facebook'></i>
                </a>
                <a href = "#">
                  <i class='bx bxl-twitter' ></i>
                </a>
                <a href = "#">
                  <i class='bx bxl-instagram' ></i>
                </a>
                <a href = "#">
                  <i class='bx bxl-whatsapp' ></i>
                </a>
                <a href = "#">
                  <i class='bx bxl-pinterest' ></i>
                </a>
              </div>
          </div>
        </div>
      </div>
  
      
      </div>
</body>
</html>