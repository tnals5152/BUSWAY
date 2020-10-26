package com.bc.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.CommVO;

public class C_WriteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommVO cvo = new CommVO();
		
		String q_idx = request.getParameter("q_idx");
		String content = request.getParameter("content");
		String store_code = request.getParameter("store_code");
		
		cvo.setC_idx(request.getParameter("c_idx"));
		cvo.setQ_idx(q_idx);
		cvo.setStore_code(request.getParameter("store_code"));
		cvo.setContent(request.getParameter("content"));
		request.setAttribute("cvo", cvo);
		System.out.println(">>>>>>>>" + cvo);
		
		int result = DAO.Comm_write(cvo);
		
		return "controller?type=Q_View&${bvo.q_idx }&cPage=${pvo.nowPage}";
	}

}










