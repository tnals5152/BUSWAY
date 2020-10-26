package com.bc.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;

import com.bc.model.dao.DAO;
import com.bc.model.vo.Paging;
import com.bc.model.vo.Q_BBSVO;

public class Q_ListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Paging p = new Paging();
		String q_idx = request.getParameter("q_idx");

		p.setTotalRecord(DAO.Q_Count());
		p.setTotalPage();
		System.out.println("> 총기록 : " + p.getTotalRecord());
		System.out.println("> 총페이지: " + p.getTotalPage());
		
		String cPage = request.getParameter("cPage");
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		
		p.setEnd(p.getNowPage() * p.getNumPerPage()); //현재페이지번호 * 페이지당글수
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		System.out.println("-----------");
		System.out.println(">>현재페이지 : " + p.getNowPage());
		System.out.println(">>시작페이지(begin) : " + p.getBegin());
		System.out.println(">>끝페이지(end) : " + p.getEnd());
		
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", p.getBegin());
		map.put("end", p.getEnd());
		List<Q_BBSVO> list = DAO.Q_List(map);
		System.out.println("list : " + list);
		
		HttpSession ss = request.getSession(true);	
		
		ss.setAttribute("list", list);
		ss.setAttribute("pvo",p);
		ss.setAttribute("cPage", cPage);
		ss.setAttribute("q_idx", q_idx);
		return "list.jsp";
	}	
}










