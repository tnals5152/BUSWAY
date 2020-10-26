package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.Q_BBSVO;

public class Q_ModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cPage = request.getParameter("cPage");
		HttpSession ss = request.getSession(true);
		ss.getAttribute("bvo");
		//String c_idx = request.getParameter("c_idx");	
		String q_idx = request.getParameter("q_idx");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Q_BBSVO bvo1 = (Q_BBSVO)ss.getAttribute("bvo");
		
		Q_BBSVO bvo = new Q_BBSVO();
		bvo.setTitle(title);
		System.out.println(title);
		bvo.setUserid(bvo1.getUserid());
		bvo.setRegdate(bvo1.getRegdate());
		bvo.setContent(content);
		bvo.setQ_idx(bvo1.getQ_idx());
		System.out.println(">>>>>" + bvo);
		int result = DAO.Q_modify(bvo);
		ss.setAttribute("bvo", bvo);
		ss.getAttribute("bvo");
		ss.setAttribute("cPage", cPage);
		ss.getAttribute(cPage);
		
		return "controller?type=Q_BBS";
	}

}










