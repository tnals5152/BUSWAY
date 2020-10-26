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



@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8"); response.setContentType("text/html; charset=UTF-8");
		String id = request.getParameter("id");
		String inputpwd = request.getParameter("pwd");
		String pathall = request.getParameter("nowPage");
		String searchquery = request.getParameter("searchquery");
		String[] path = pathall.split("/");
		UsersVO user = DAO.loginUsers(id, inputpwd);
		String pa = null;
		System.out.println("path login : " + pathall);
		PrintWriter out = response.getWriter();
		if(user == null) {
			System.out.println("로그인 일치 정보 없음");
			out.println("<script>alert(\"로그인일치정보없음\");"
					+ "var result = confirm(\"회원가입하시겠습니까?\");"
					+ "if(result){"
					+ "document.location.href = \"signstep?type=1\";"
					+ "}else{"
					+ "document.location.href=\"shop.jsp\";"
					+ "}</script>");
			//response.sendRedirect(pa);
		}else if(user.getUsing().equals("1")) {
			request.setAttribute("user", user);
			request.getSession().setAttribute("user", user);
			request.getSession().removeAttribute("storevo");
			
			if(searchquery != null) {
				
				response.sendRedirect(path[path.length - 1] + searchquery);
			}else {
				response.sendRedirect(path[path.length - 1]);
			}
			
			pa = path[path.length - 1];
		}else if(user.getUsing().equals("0")) {
			out.println("<script>alert(\"탈퇴된 아이디입니다. 다시 회원가입을 시작하세요.\");"
					+ "document.location.href = \"signstep?type=1\";</script>");
		}else {
			System.out.println("에러");
		}
		System.out.println(pa);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
