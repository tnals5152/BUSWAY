package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.Q_BBSVO;
import com.bc.model.vo.UsersVO;

public class Q_WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Q_BBSVO bvo = new Q_BBSVO();
		bvo.setQ_idx(request.getParameter("q_idx"));
		bvo.setTitle(request.getParameter("title"));
		bvo.setUserid(request.getParameter("userid"));
		bvo.setContent(request.getParameter("content"));
		bvo.setImgpath(request.getParameter("imgpath"));
		bvo.setUserid(((UsersVO)request.getSession().getAttribute("user")).getUserid());
		System.out.println("글쓰기 객체 : " + bvo);
		
		request.setAttribute("bvo", bvo);
		
		int result = DAO.Q_write(bvo);
		
		return "controller?type=Q_BBS";
	}

}










