package com.bc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.bc.model.dao.DAO;

@WebServlet({"/checkId", "/findId", "/findPwd"})
public class CheckIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		System.out.println("type : " + type);
		response.setContentType("application/x-json; charset=UTF-8");
		String text = null;
		if(type.equals("signup")) {
			String id = request.getParameter("idd");
			
			int result = DAO.selectIdCheck(id);
			
			text = "{\"check\":\"" + result + "\"}";
		}else if(type.equals("findid")) {
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			List<String> userIdList = DAO.findUserId(name, phone);
			System.out.println("userIdList : " + userIdList);
			text = "{\"list\" : [";
			for(int i = 0; i < userIdList.size(); i++) {
				text += "{\"id\":\"" + userIdList.get(i) + "\"}";
				if(i != (userIdList.size() - 1)) {
					text += ", ";
				}
			}
			text += "]}";
			
			
		}else if(type.equals("findpwd")) {
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String userPwd = DAO.findUserPwd(id, name, phone);
			text = "{\"pwd\":\"" + userPwd + "\"}";
		}
		response.getWriter().print(text);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
