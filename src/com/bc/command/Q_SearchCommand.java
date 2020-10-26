package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.Q_BBSVO;

public class Q_SearchCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		String path = null;
		if (keyword == null || keyword.equals("")) {
			path = "list.jsp";
		} else {
			List<Q_BBSVO> list = DAO.Q_Search(idx, keyword);
			System.out.println(">> list : " + list);
			
			String title = "";
			switch (idx) {
				case "0" : title = "제목"; break;
				case "1" : title = "아이디"; break;
			}
			
			
			
			request.setAttribute("list", list);
			request.setAttribute("title", title);
			
			path = "searchList.jsp";
		}
		return path;
	}
}
