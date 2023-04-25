
<header class="main-header">
            <div class="logo">
                <a href="index.jsp">Mine<span>Cart</span></a>
            </div>
            <div class="catagory-container">
                <section class="catagory">
                    <a href="#"><i class="material-symbols-rounded">view_list</i>Catagory</a>
                </section>

                <!-- Popup Catagory Start-->
                <div class="list-container">
                    <ul class="ctg-list">
                        <h5>All Catagory</h3>
                            <li><a href="#">Mobile</a></li>
                            <li><a href="#">Tablet</a></li>
                            <li class="sub1"><a href="#">PC</a>
                                <div class="sub-mcontainer">
                                    <div class="sub-menu">
                                        <a href="#">Desktop</a>
                                        <a href="#">Laptop</a>
                                        <a href="#">Server</a>
                                        <a href="#">Mini-pc</a>
                                    </div>
                                </div>
                            </li>
                            <li class="sub2">
                            <a href="#">Camera</a>
                                <div class="sub-mcontainer">
                                    <div class="sub-menu">
                                        <a href="#">DSLR</a>
                                        <a href="#">Compact Camera</a>
                                        <a href="#">Mirrorless Camera</a>
                                    </div>
                                </div>
                            </li>
                            <li><a href="#">Accessories</a>
                            </li>
                    </ul>
                </div>
                <!-- Popup Catagory END-->
            </div>

            <form action="#" class="search-form">
                <div class="form-item">
                    <input type="text" class="search-input" placeholder="Search for product, Brand">
                    <button class="search-clear-btn"><a href="#"><i
                                class="material-symbols-rounded">close</i></a></button>
                    <button class="search-btn"><a href="#"><i
                                class="material-symbols-rounded">search</i>Search</a></button>
                </div>
            </form>
            <div class="acc-btn-container">
                <button class="account-btn">
                    <a href="#">
                        <i class="material-symbols-rounded">Account_circle</i>Account
                    </a>
                </button>
                <div class="arrow-icon"></div>
                <div class="login-container">
                    <form action="login.jsp" class="login-form">
                    <% if(auth != null){%>
                    	<a class="h-btn" href="orders.jsp">Orders</a>
                    	<a class="h-btn" href="log-out">Logout</a>
                    	<% }else{ %>
                    	<button class="login-btn">Login</button>
                        <a href="sign-up.jsp">Create an Account?</a>
                    	<% }%>
                    
                    	
                        
                    </form>
                </div>
            </div>


            <button class="cart-btn"><a href="cart.jsp"><span>${cart_list.size()}</span>> <i class="material-symbols-rounded">shopping_cart</i>Cart</a></button>
        </header>