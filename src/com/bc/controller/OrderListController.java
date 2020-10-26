package com.bc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.dao.DAO;
import com.bc.model.vo.OrderedToppingVO;
import com.bc.model.vo.SuborderVO;
import com.bc.model.vo.UsersVO;

/**
 * Servlet implementation class OrderListController
 */
@WebServlet("/orderlsit")
public class OrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = ((UsersVO)request.getSession().getAttribute("user")).getUserid();
		
		List<SuborderVO> suborderlist =  DAO.selectSuborderList(id);
		List<OrderedToppingVO> orderToppingList = new ArrayList<OrderedToppingVO>();
		
		for(int i = 0; i < suborderlist.size(); i++) {
			String suborderIdx = suborderlist.get(i).getIdx();
			List<OrderedToppingVO> toppingListBySuborderIdx = DAO.selectOrderedToppingList(suborderIdx);
			for(int k = 0; k < toppingListBySuborderIdx.size(); k++) {
				orderToppingList.add(toppingListBySuborderIdx.get(k));
			}
		}
		
		request.setAttribute("suborderlist", suborderlist);
		request.setAttribute("orderToppingList", orderToppingList);
		
		request.getRequestDispatcher("orderList.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
