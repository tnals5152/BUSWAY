package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.N_BBSVO;
import com.bc.model.vo.Q_BBSVO;
import com.bc.model.vo.StoreVO;
import com.bc.model.vo.UsersVO;

public class N_WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		N_BBSVO nvo = new N_BBSVO();
		nvo.setN_idx(request.getParameter("n_idx"));
		nvo.setTitle(request.getParameter("title"));
		nvo.setContent(request.getParameter("content"));
		nvo.setImgpath(request.getParameter("imgpath"));
		//nvo.setCode(request.getParameter("code"));
		
		nvo.setCode(((StoreVO)request.getSession().getAttribute("storevo")).getCode());
		System.out.println("글쓰기 객체 : " + nvo);
		
		request.setAttribute("nvo", nvo);
		
		int result = DAO.N_write(nvo);
		
		return "controller?type=N_List";
	}

}










