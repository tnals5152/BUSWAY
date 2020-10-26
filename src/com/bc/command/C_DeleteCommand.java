package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.CommVO;
import com.bc.model.vo.E_BBSVO;

public class C_DeleteCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		CommVO cvo = new CommVO();
		String q_idx = request.getParameter("q_idx");
		String c_idx = request.getParameter("c_idx");
		String store_code = request.getParameter("store_code");
		System.out.println(">>>>q : " + q_idx);
		System.out.println(">>>>c : " + c_idx);
		DAO.Comm_delete(c_idx);
		
		String cPage = request.getParameter("cPage");
		
		request.setAttribute("c_idx", c_idx);
		request.setAttribute("store_code", store_code);
		request.setAttribute("q_idx", q_idx);
		request.getParameter(c_idx);
		request.getParameter(store_code);
		request.getParameter(q_idx);
		System.out.println(">>>>" + q_idx);
		
		
		System.out.println(">>>>c_idx : " + c_idx);
		
		DAO.Comm_delete(c_idx);
		return "controller?type=Q_View&${bvo.q_idx }&cPage=${pvo.nowPage}";
		
		
	}
}










