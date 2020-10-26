package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.E_BBSVO;
import com.bc.model.vo.N_BBSVO;

public class E_DeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String e_idx = request.getParameter("e_idx");
		System.out.println(">>>>e_idx : " + e_idx);
		
		E_BBSVO evo = new E_BBSVO();
		DAO.E_delete(e_idx);
		return "controller?type=E_List";
	}
}



































































































