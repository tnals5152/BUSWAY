package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.CommVO;
import com.bc.model.vo.N_BBSVO;
import com.bc.model.vo.Q_BBSVO;

public class N_ViewCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String n_idx = request.getParameter("n_idx");
		String cPage = request.getParameter("cPage");
		
		
		System.out.println("> n_idx : -" + n_idx + "-");
		System.out.println("> cPage : -" + cPage + "-");
		
		
		N_BBSVO nvo = DAO.N_selectOne(n_idx);
		System.out.println("> nvo : " + nvo);
		
		HttpSession ss = request.getSession(true);
		
		N_BBSVO nvo1 = (N_BBSVO)ss.getAttribute("nvo");
		ss.setAttribute("nvo",nvo);
		ss.getAttribute("p");
		
		ss.getAttribute("list");
		ss.getAttribute("nvo");
		
		ss.setAttribute("cPage", cPage);
		
		DAO.N_views(Integer.parseInt(n_idx));
		
		
		
		return "n_view.jsp";
	}
}
