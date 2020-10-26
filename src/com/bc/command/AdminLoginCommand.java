package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.StoreVO;

public class AdminLoginCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		String pwd = request.getParameter("pwd");
		
		StoreVO storevo = DAO.adminLogin(code, pwd);
		request.getSession().removeAttribute("user");
		System.out.println(storevo);
		request.getSession().setAttribute("storevo", storevo);
		
		if(storevo == null) {
			return null;
		}else if(storevo.getCode().equals("admin")) {
			return "adminIndex.jsp";//서버관리자page
		}else {
			return "storeIndex.jsp";//지점장page
		}
	}

}
