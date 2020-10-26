package com.bc.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.CartDAO;
import com.bc.model.vo.ShopVO;
import com.bc.model.vo.UsersVO;

@WebServlet("/sortController")
public class sortController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8"); response.setContentType("text/html; charset=UTF-8");
		String menusort = request.getParameter("menusort");
		String store_code = request.getParameter("store_code");
		if(store_code != null) {
			request.getSession().setAttribute("store_code", store_code);
		}
		UsersVO user = (UsersVO) request.getSession().getAttribute("user");
		if(user == null) {
			response.sendRedirect("empty2.jsp");
		}else {
			List<ShopVO> list= CartDAO.selectMenuVO(menusort);
			request.setAttribute("list", list);
			request.getRequestDispatcher("orderTable.jsp").forward(request, response);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request,response);
	}
	
}
