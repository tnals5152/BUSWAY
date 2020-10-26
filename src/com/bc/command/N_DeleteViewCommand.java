package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;


public class N_DeleteViewCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String n_idx = request.getParameter("n_idx");
		DAO.N_delete(n_idx);
		
		
		System.out.println("n_idx"+ n_idx);
		request.setAttribute("n_idx", n_idx);
		return "controller?type=N_List";
	}

}










