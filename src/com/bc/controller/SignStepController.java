package com.bc.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.UsersVO;



@WebServlet("/signstep")
public class SignStepController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String type = request.getParameter("type");
		if(type.equals("1")) {
			request.setAttribute("type", type);
			request.getRequestDispatcher("signup.jsp").forward(request, response);
			
		}else {
			System.out.println("signstepController");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			String nickname = request.getParameter("nickname");
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			String phone = request.getParameter("phone");
			String card = request.getParameter("card");
			String email = request.getParameter("email");
			
			UsersVO user = new UsersVO(id, pwd, nickname, name, addr, phone, card, email);
			
			DAO.insertUser(user);
			
//			PrintWriter out = response.getWriter();
//			
//
//			out.println("<script type='text/javascript'>alert('회원가입이 완료되었습니다.\n로그인하여주세요.');</script>");
//			out.flush();
//			out.close();
			request.getRequestDispatcher("login/signupcheck.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
