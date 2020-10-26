package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.E_BBSVO;
import com.bc.model.vo.N_BBSVO;
import com.bc.model.vo.Q_BBSVO;
import com.bc.model.vo.StoreVO;
import com.bc.model.vo.UsersVO;

public class E_WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		E_BBSVO evo = new E_BBSVO();
//		evo.setE_idx(request.getParameter("e_idx"));
		evo.setE_idx(request.getParameter("e_idx"));
		System.out.println("e_idx: " + request.getParameter("e_idx"));
		evo.setTitle(request.getParameter("title"));
		evo.setStart_date(request.getParameter("start_date"));
		evo.setEnd_date(request.getParameter("end_date"));
		evo.setCode(request.getParameter("code"));
		evo.setContent(request.getParameter("content"));
		evo.setImgpath(request.getParameter("imgpath"));
		
		evo.setCode(((StoreVO)request.getSession().getAttribute("storevo")).getCode());
		System.out.println("글쓰기 객체 : " + evo);
		
		request.setAttribute("evo", evo);
		
		int result = DAO.E_write(evo);
		
		return "controller?type=E_List";
	}

}










