package com.bc.frontcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.Session;

import com.bc.model.CartDAO;
import com.bc.model.vo.BasicSuborderVO;
import com.bc.model.vo.CartToppingVO;
import com.bc.model.vo.CartVO;
import com.bc.model.vo.UsersVO;
import com.bc.mybatis.DBService;


@WebServlet("/cartController")
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = ((UsersVO)request.getSession().getAttribute("user")).getUserid();
			
		List<CartVO> list = CartDAO.selectMycart(userid); //DB연결하고 데이터가져오기
		
		
		
		List<CartToppingVO> l = new ArrayList<CartToppingVO>();
		
		for(int i = 0; i < list.size(); i++) {//장바구니 안에 저장된 데이터수(주문갯수)만큼 포문을 돌림 
			int cart_idx = list.get(i).getIdx();//CartVO인 list의 예를들어 첫번째주문에 대해 getIdx메소드 돌림(idx가져오기)
			List<CartToppingVO> carttoppinglist = CartDAO.selectCartToppingVO(cart_idx);
			//cart_idx(몇번째 주문인지알려주는것) 을 통해 DB에 저장된 토핑들을 불러와 리스트에 저장 
			for(int k = 0; k < carttoppinglist.size(); k++) {
				l.add(carttoppinglist.get(k));//카트토핑리스트속 토핑수만큼 for문을 돌려 들어간 토핑들을 보여주기 
			}
//			request.getRequestDispatcher("cartList.jsp").forward(request, response);
		}
		
		
		
		request.setAttribute("cartToppingList", l);
		
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setOne_total(list.get(i).salePricesetting());
		}
		request.setAttribute("list", list);
		request.getRequestDispatcher("cartList.jsp").forward(request, response);
		//response.sendRedirect("cartList.jsp");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	
	}

}
