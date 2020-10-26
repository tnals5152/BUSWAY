package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.Q_BBSVO;

public class Q_DeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q_idx = request.getParameter("q_idx");
		System.out.println(">>>>q_idx : " + q_idx);
		
		Q_BBSVO bvo = new Q_BBSVO();
		DAO.Q_delete(q_idx);
		return "controller?type=Q_BBS";
	}
}



































































































