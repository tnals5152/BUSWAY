package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;


public class Q_DeleteViewCommand implements Command {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String q_idx = request.getParameter("q_idx");
		DAO.Q_delete(q_idx);
		
		
		System.out.println("q_idx"+ q_idx);
		request.setAttribute("q_idx", q_idx);
		return "controller?type=Q_BBS";
	}

}










