package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bc.model.dao.DAO;
import com.bc.model.vo.CommVO;
import com.bc.model.vo.Q_BBSVO;

public class Q_ViewCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String q_idx = request.getParameter("q_idx");
		String cPage = request.getParameter("cPage");
		
		
		System.out.println("> q_idx : -" + q_idx + "-");
		System.out.println("> cPage : -" + cPage + "-");
		
		
		Q_BBSVO bvo = DAO.Q_selectOne(q_idx);
		System.out.println("> bvo : " + bvo);
		
		List<CommVO> list = DAO.Comm_list(q_idx);
		System.out.println("> list : " + list);
		
		HttpSession ss = request.getSession(true);
		
		Q_BBSVO bvo1 = (Q_BBSVO)ss.getAttribute("bvo");
		ss.setAttribute("bvo",bvo);
		ss.setAttribute("c_list", list);
		ss.getAttribute("p");
		ss.getAttribute("list");
		ss.getAttribute("bvo");
		ss.setAttribute("cPage", cPage);
		System.out.println("bvo: " + bvo);
		DAO.Q_views(Integer.parseInt(q_idx));
		
		
		
		return "view.jsp";
	}
}
