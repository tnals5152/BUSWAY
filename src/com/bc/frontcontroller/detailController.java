package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.CartDAO;
import com.bc.model.vo.ShopVO;
import com.bc.model.vo.StuffVO;


@WebServlet("/detailController")
public class detailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String idx = request.getParameter("idx");
			ShopVO svo = CartDAO.selectDetailVO(idx);
			request.setAttribute("svo", svo);
			String menusort = request.getParameter("menusort");
			System.out.println("menusort : " + menusort);
			List<StuffVO> stuffVoList = CartDAO.selectAllStuff();
			request.getSession().setAttribute("stuffVoList", stuffVoList);
			request.getRequestDispatcher("detail.jsp").forward(request, response);
			
				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
