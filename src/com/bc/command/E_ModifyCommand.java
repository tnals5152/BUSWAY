package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.E_BBSVO;
import com.bc.model.vo.N_BBSVO;
import com.bc.model.vo.Q_BBSVO;

public class E_ModifyCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cPage = request.getParameter("cPage");
		HttpSession ss = request.getSession(true);
		ss.getAttribute("evo");
		String e_idx = request.getParameter("e_idx");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		E_BBSVO evo1 = (E_BBSVO)ss.getAttribute("evo");
		
		E_BBSVO evo = new E_BBSVO();
		evo.setE_idx(e_idx);
		evo.setTitle(title);
		System.out.println(title);
		evo.setCode(evo1.getCode());
		evo.setContent(content);
		evo.setStart_date(evo1.getStart_date());
		evo.setEnd_date(evo1.getEnd_date());
		System.out.println(">>>>>" + evo);
		int result = DAO.E_modify(evo);
		ss.setAttribute("evo", evo);
		ss.getAttribute("evo");
		ss.setAttribute("cPage", cPage);
		ss.getAttribute(cPage);
		
		return "controller?type=E_List";
	}

}










