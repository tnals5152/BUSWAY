package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminStoreLogoutController
 */
@WebServlet({ "/adminlogout", "/storelogout" })
public class AdminStoreLogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String path = null;
		if(type.equals("adminlogout")) {
			request.getSession().removeAttribute("storevo");
			System.out.println("@22");
			System.out.println(request.getSession().getAttribute("storevo"));
			path = "adminIndex.jsp";
			
		}
		
		response.sendRedirect(path);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
