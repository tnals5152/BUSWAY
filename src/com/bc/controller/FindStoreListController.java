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
import com.bc.model.vo.StoreVO;

/**
 * Servlet implementation class FindStoreListController
 */
@WebServlet("/FindStoreListController")
public class FindStoreListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String findstore = request.getParameter("findstore");
		String intext = request.getParameter("intext");
		List<StoreVO> storeList = new ArrayList<StoreVO>();
		if(findstore.equals("name")) {
			storeList = DAO.findStoreByName(intext);
		}else if(findstore.equals("shop_number")) {
			storeList = DAO.findStoreByShop_number(intext);
		}else if(findstore.equals("addr")) {
			storeList = DAO.findStoreByAddr(intext);
		}else{
			System.out.println("??????????????넌 뭔데 왜 나오는데 ");
		}
		request.setAttribute("storeList", storeList);
		request.getRequestDispatcher("foundStore.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
