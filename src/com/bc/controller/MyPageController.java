package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.Command;
import com.bc.command.MyBusCommand;
import com.bc.command.MyupdateCommand;

@WebServlet(value="/mypage", largeIcon = "img/1-1.png")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		Command cmd = null;
		
		System.out.println("ddd"+request.getRemoteAddr() + "ddd");
		
		if(type.equals("mybus")) {
			cmd = new MyBusCommand();
		}else if(type.equals("update")) {
			cmd = new MyupdateCommand();
		}
		String path = cmd.exec(request, response);
		request.getRequestDispatcher(path).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
