package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;


public class E_DeleteViewCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String e_idx = request.getParameter("e_idx");
		DAO.E_delete(e_idx);
		
		
		System.out.println("e_idx: " + e_idx);
		request.setAttribute("e_idx", e_idx);
		return "controller?type=E_List";
	}

}










