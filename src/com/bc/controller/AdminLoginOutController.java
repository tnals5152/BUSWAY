package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.AdminLoginCommand;
import com.bc.command.Command;

/**
 * Servlet implementation class AdminLoginOutController
 */
@WebServlet("/adminloginout")
public class AdminLoginOutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		
		Command command = null; 
		if(type.equals("login")) {
			command = new AdminLoginCommand();
		}else {
			
		}
		
		
		String path = command.exec(request, response);
		
		
		
		if(path == null) {
			response.setContentType("text/html;charset=UTF-8");
		}
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
