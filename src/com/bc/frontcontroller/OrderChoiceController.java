package com.bc.frontcontroller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.CartDAO;
import com.bc.model.vo.StuffVO;
import com.bc.model.vo.UsersVO;

@WebServlet("/OrderChoiceController")
public class OrderChoiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sort = request.getParameter("sort");
		String type = request.getParameter("type");// 종류별 선택한 토핑배열(,로 넘어옴)
		String goSort = request.getParameter("goSort");
		String idx = request.getParameter("idx");
		List<String> toppingList = new ArrayList<>();
		if (!type.equals("")) {
			String[] arr = type.split(",");
			for (int i = 0; i < arr.length; i++) {
				toppingList.add(arr[i]);
				System.out.println(toppingList);
				System.out.println("arr[i] : " + arr[i]);
			}
		}
		// if(!type.equals("bread")) {
		// array = type.split(",");
		// }

		
		String path = null;
		
			if (sort.equals("bread")) {
				request.getSession().setAttribute("bread", type);
				goSort = "cheese";
			}
//		if(!toppingList.isEmpty()) {
			if (sort.equals("cheese")) {
				request.getSession().setAttribute("cheese", toppingList);// 이거 사실 배열 아니고 리스트 타입이란다.
				
			} else if (sort.equals("veg")) {
				request.getSession().setAttribute("veg", toppingList);
			} else if (sort.equals("source")) {
				request.getSession().setAttribute("source", toppingList);
			} else if (sort.equals("more")) {
				request.getSession().setAttribute("more", toppingList);
			}
//		}
		path = "orderStart.jsp?sort=" + goSort;
		
		if (goSort.equals("mu")) {
			String id = ((UsersVO)request.getSession().getAttribute("user")).getUserid();
			String bread = (String) request.getSession().getAttribute("bread");
			String roasting = request.getParameter("roasting");
			String bread_size = request.getParameter("size");
			String store_code = (String)request.getSession().getAttribute("store_code");//***********처음에 지점고르고 난 뒤에 store_code를 세션에 저장하기
			List<String> cheese = new ArrayList<String>();
			List<String> veg = new ArrayList<String>();
			List<String> source = new ArrayList<String>();
			List<String> more = new ArrayList<String>();
			cheese = (List<String>) request.getSession().getAttribute("cheese");
			System.out.println("2");
			veg = (List<String>) request.getSession().getAttribute("veg");
			System.out.println("3");
			source = (List<String>) request.getSession().getAttribute("source");
			System.out.println("3");
			more = (List<String>) request.getSession().getAttribute("more");
			System.out.println("3");
			List<List<String>> listtest = new ArrayList<>();
			List<String> list = new ArrayList<>();
			if(cheese.isEmpty()) {
				System.out.println("너 죽는");
			}else {
				listtest.add(cheese);
			}
			if(veg != null) {
				listtest.add(veg);
				System.out.println("맘에 안 든다");
			}
			if(source != null) {
				listtest.add(source);
				System.out.println("서브우ㅞ이 가만안 ㄷ러 ");
			}
			if(more != null) {
				listtest.add(more);
			}
			
			String menusort = (String)request.getSession().getAttribute("menusort");
			if(menusort.equals("샌드위치")) {
				
				list.add(bread);// 선택한게 샌드위치면 실행하고 아닌 샐러드면 실행 안 해줘라알겠냐?실행하면 죽는다~~~
			}
			// System.out.println("1 : " + toppingArr[3].length);
			
			
			for(int i = 0; i < listtest.size(); i++) {
				System.out.println("i + " + i);
				if(!listtest.get(i).isEmpty()) {
					System.out.println("i : " + i);
					for(int k = 0; k < listtest.get(i).size(); k++) {
						list.add(listtest.get(i).get(k));
					}
				}
			}
			
			
			
//			for (int i = 0; i < toppingArr.length; i++) {
//				if (toppingArr[i] != null) {
//					for (int k = 0; k < toppingArr[i].length; i++) {
//						System.out.println("=======list : " + list);
//						list.add(toppingArr[i][k]);
//					}
//				}
//			}

			System.out.println(list);
			int toppingPrice = 0;
			if(bread_size.equals("15")) {
				toppingPrice += Integer.parseInt(request.getParameter("price15"));
			}else if(bread_size.equals("30")) {
				toppingPrice += Integer.parseInt(request.getParameter("price30"));
			}
			List<StuffVO> svoList = (List<StuffVO>)request.getSession().getAttribute("stuffVoList");
			for(int i = 0; i < list.size(); i++) {//내가선택한 토핑리스트
				for(int k = 0; k < svoList.size(); k++) {//디비에 저장된 전체토핑리스트
					if((list.get(i)).equals(svoList.get(k).getName())) {//내가 선택한 토핑과 디비에 저장된 토핑의 이름이 같을 경우 해당 토핑의 가격을 조회, 더함 
						toppingPrice += Integer.parseInt(svoList.get(k).getPrice());
						break;
					}
				}
			}
			//store_code = "seoul1";//******테스트용sore_code -->session에 저장으로 바꿔야 됨
			CartDAO.insertMyCart(id, idx, roasting, bread_size, store_code, list, toppingPrice);
			request.getRequestDispatcher("empty.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher(path).forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
