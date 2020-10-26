package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;

/**
 * Servlet implementation class CartPlusMinusController
 */
@WebServlet("/plusCnt")
public class CartPlusMinusController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String type = request.getParameter("type");
		response.setContentType("application/x-json; charset=UTF-8");
		
		if(type.equals("plus")) {
			DAO.updateplusCart(idx);
		}else if(type.equals("minus")) {
			DAO.updateMinusCart(idx);
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
