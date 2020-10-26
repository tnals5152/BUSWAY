package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.CommVO;
import com.bc.model.vo.E_BBSVO;


public class C_DeleteViewCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String c_idx = request.getParameter("c_idx");
		String q_idx = request.getParameter("q_idx");
		String cPage = request.getParameter("cPage");
		System.out.println(">>>>c_idx : " + c_idx);
		
		CommVO cvo = new CommVO();
		DAO.Comm_delete(c_idx);
		
		
		
		return "controller?type=Q_View&cPage="+cPage+"&q_idx="+q_idx;
	}

}










