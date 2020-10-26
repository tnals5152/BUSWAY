package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.N_BBSVO;
import com.bc.model.vo.Q_BBSVO;

public class N_ModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cPage = request.getParameter("cPage");
		HttpSession ss = request.getSession(true);
		ss.getAttribute("nvo");
		String n_idx = request.getParameter("n_idx");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		N_BBSVO nvo1 = (N_BBSVO)ss.getAttribute("nvo");
		
		N_BBSVO nvo = new N_BBSVO();
		nvo.setN_idx(n_idx);
		nvo.setTitle(title);
		System.out.println(title);
		nvo.setCode(nvo1.getCode());
		nvo.setRegdate(nvo1.getRegdate());
		nvo.setContent(content);
		nvo.setN_idx(nvo1.getN_idx());
		System.out.println(">>>>>" + nvo);
		int result = DAO.N_modify(nvo);
		ss.setAttribute("nvo", nvo);
		ss.getAttribute("nvo");
		ss.setAttribute("cPage", cPage);
		ss.getAttribute(cPage);
		
		return "controller?type=N_List";
	}

}










