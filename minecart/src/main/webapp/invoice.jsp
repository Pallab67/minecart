<%@page import="java.text.DecimalFormat"%>
<%@page import="com.minecart.dao.OrderDao"%>
<%@page import="com.minecart.connection.DBcon"%>
<%@page import="com.minecart.dao.ProductDao"%>
<%@page import="com.minecart.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	User auth = (User) request.getSession().getAttribute("auth");
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DBcon.getConnection());
		orders = orderDao.userInvoice(auth.getId(), pid);
	}else{
		response.sendRedirect("login.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	

	
	%>

<html>
  <head>
    <meta charset="utf-8">
    <title>Invoice</title>
    <link rel="stylesheet" href="css/invoice-css.css">
    <link rel="license" href="https://www.opensource.org/licenses/mit-license/">
    <script src="script.js"></script>
  </head>
  <body>
    <header>
      <h1>Invoice</h1>
      <address contenteditable>
        <p>SILIGURI INSTITUTE OF TECHNOLOGY</p>
        <p>S.I.T Campus, Salbari,
Hill Cart Road,
Post Office - Sukna, Siliguri,<br>
District - Darjeeling,
Pin Code - 734009,
West Bengal (WB),
India (IN).</p>
        <p>0353-2778002 / 2778004, 0353-2778003</p>
      </address>
      <span><img alt="" src="http://www.jonathantneal.com/examples/invoice/logo.png"><input type="file" accept="image/*"></span>
    </header>
    <article>
      <h1>Recipient</h1>
      <address contenteditable>
        <p>MINECART<br></p>
      </address>
      
     <%
			if(orders != null){
				for(Order o:orders){%>
				
      <table class="meta">
        <tr>
          <th><span contenteditable>Invoice #</span></th>
          <td><span contenteditable> <%=o.getOrderId() %> </span></td>
        </tr>
        <tr>
          <th><span contenteditable>Date</span></th>
          <td><span contenteditable><%=o.getDate() %></span></td>
        </tr>
        <tr>
          <th><span contenteditable>Amount Due</span></th>
          <td><span id="prefix" contenteditable>$</span><span><%=dcf.format(o.getPrice()) %></span></td>
        </tr>
      </table>
      <table class="inventory">
        <thead>
          <tr>
            <th><span contenteditable>Item</span></th>
            <th><span contenteditable>Description</span></th>
            <th><span contenteditable>Rate</span></th>
            <th><span contenteditable>Quantity</span></th>
            <th><span contenteditable>Price</span></th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td><a class="cut">-</a><span contenteditable><%=o.getName() %></span></td>
            <td><span contenteditable>Catagory: <%=o.getCategory() %></span></td>
            <td><span data-prefix>$</span><span contenteditable><%=dcf.format(o.getPrice()*1.2) %></span></td>
            <td><span contenteditable><%=o.getQunatity() %></span></td>
            <td><span data-prefix>$</span><span><%=dcf.format(o.getPrice()) %></span></td>
          </tr>
        </tbody>
      </table>
      <!-- <a class="add">+</a> -->
      <table class="balance">
        <tr>
          <th><span contenteditable>Total</span></th>
          <td><span data-prefix>$</span><span><%=dcf.format(o.getPrice()) %></span></td>
        </tr>
        <tr>
          <th><span contenteditable>Amount Paid</span></th>
          <td><span data-prefix>$</span><span contenteditable>0.00</span></td>
        </tr>
        <tr>
          <th><span contenteditable>Balance Due</span></th>
          <td><span data-prefix>$</span><span><%=dcf.format(o.getPrice()) %></span></td>
        </tr>
      </table>
    </article>
    <aside>
      <h1><span contenteditable>Additional Notes</span></h1>
      <div contenteditable>
        <p>A finance charge of 1.5% will be made on unpaid balances after 30 days.</p>
      </div>
    </aside>
    
    <div class="print">
    	<button  onclick="window.print()">Print</button>
    </div>
    
    <%}
			}
			%>
    
  </body>
</html>