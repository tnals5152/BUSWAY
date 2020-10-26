package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.UsersVO;

/**
 * Servlet implementation class OrderFromCartController
 */
@WebServlet("/orderFromCart")
public class OrderFromCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] checked = request.getParameterValues("checkRow");
		String all_total = request.getParameter("all_total");
		UsersVO user = (UsersVO)(request.getSession().getAttribute("user"));
		String id = user.getUserid();
		String addr = user.getAddr();
		UsersVO userupdate = DAO.order(checked, id, addr, all_total);
		request.getSession().setAttribute("user", userupdate);
		
		response.sendRedirect("orderlsit");
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
