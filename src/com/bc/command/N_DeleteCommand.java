package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.N_BBSVO;

public class N_DeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String n_idx = request.getParameter("n_idx");
		System.out.println(">>>>n_idx : " + n_idx);
		
		N_BBSVO nvo = new N_BBSVO();
		DAO.N_delete(n_idx);
		return "controller?type=N_List";
	}
}



































































































