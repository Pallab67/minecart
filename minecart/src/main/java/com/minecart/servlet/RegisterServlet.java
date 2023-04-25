package com.minecart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import jakarta.servlet.http.HttpSession;

import com.minecart.connection.DBcon;
import com.minecart.dao.UserDatabase;
import com.minecart.model.User;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			//make user object
			User userModel = new User(username, email, password);

			//create a database model
			UserDatabase regUser = new UserDatabase(DBcon.getConnection());
			if (regUser.saveUser(userModel)) {
			   response.sendRedirect("login.jsp?msg=succ");
			} else {
			    String errorMessage = "User Available";
			    HttpSession regSession = request.getSession();
			    regSession.setAttribute("RegError", errorMessage);
			    response.sendRedirect("sign-up.jsp?msg=invalid");
			    }
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
