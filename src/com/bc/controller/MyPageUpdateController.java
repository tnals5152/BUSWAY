package com.bc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.UsersVO;

/**
 * Servlet implementation class MyPageUpdateController
 */
@WebServlet("/userupdate")
public class MyPageUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		String addr = request.getParameter("addr");
		String phone = request.getParameter("phone");
		String card = request.getParameter("card");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		UsersVO user = (UsersVO) request.getSession().getAttribute("user");
		String id = user.getUserid();
		String name = user.getName();
		
		UsersVO uvo = new UsersVO(id, pwd, nickname, name, addr, phone, card, email);
		int result = DAO.userUpdate(uvo);
		request.getSession().setAttribute("user", uvo);
		response.sendRedirect("login/check_pwd.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
