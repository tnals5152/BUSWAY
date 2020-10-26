package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.CommVO;
import com.bc.model.vo.E_BBSVO;
import com.bc.model.vo.N_BBSVO;
import com.bc.model.vo.Q_BBSVO;

public class E_ViewCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String e_idx = request.getParameter("e_idx");
		String cPage = request.getParameter("cPage");
		
		
		System.out.println("> e_idx : -" + e_idx + "-");
		System.out.println("> cPage : -" + cPage + "-");
		
		
		E_BBSVO evo = DAO.E_selectOne(e_idx);
		System.out.println("> evo : " + evo);
		
		HttpSession ss = request.getSession(true);
		
		E_BBSVO evo1 = (E_BBSVO)ss.getAttribute("evo");
		ss.setAttribute("evo",evo);
		ss.getAttribute("p");
		
		ss.getAttribute("list");
		ss.getAttribute("evo");
		
		ss.setAttribute("cPage", cPage);
		
		DAO.E_views(Integer.parseInt(e_idx));
		
		
		
		return "e_view.jsp";
	}
}
