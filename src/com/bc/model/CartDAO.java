package com.bc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.CartToppingVO;
import com.bc.model.vo.CartVO;
import com.bc.model.vo.ShopVO;
import com.bc.model.vo.StuffVO;
import com.bc.mybatis.DBService;

public class CartDAO {
	private List<CartVO> list;
	
	public CartDAO() {
		System.out.println(">>CartDAO 객체생성");
	}
	
	
	
	public static List<CartVO> selectMycart (String userid){
		SqlSession ss = DBService.getFactory().openSession(); //DB연결 
		
		System.out.println("id : " + userid );
		List<CartVO> list = ss.selectList("cartlist", userid);//id를 가지고 mapper의 cart(mapper ID) cartlist메소드를 찾아 sql문 쿼리 실행 
		System.out.println("selectMycart method 1 : " + list);
		//List<BasicSuborderVO> list = ss.selectList("cart.cartlist", id);
		//System.out.println(list);
		ss.close();
		return list;
	}
	
	public static List<CartToppingVO> selectCartToppingVO(int cart_idx){
		SqlSession ss = DBService.getFactory().openSession();
		List<CartToppingVO> list = ss.selectList("topping", cart_idx);
		ss.close();
		return list;
		
	}
	
	public static List<ShopVO> selectMenuVO(String menusort){
		SqlSession ss = DBService.getFactory().openSession();
		List<ShopVO> list = ss.selectList("menulist", menusort);
		ss.close();
		return list;
		
	}
	
	public static ShopVO selectDetailVO(String idx){
		
		SqlSession ss = DBService.getFactory().openSession();
		ShopVO svo = ss.selectOne("detail", idx);
		ss.close();
		return svo;
		
	}
	
	public static List<StuffVO> selectStuffVO(String sort) {
		SqlSession ss = DBService.getFactory().openSession();
		List<StuffVO> svo = ss.selectList("stuff",sort);
		ss.close();
		return svo;
	}



	public static List<StuffVO> selectAllStuff() {
		SqlSession ss = DBService.getFactory().openSession();
		List<StuffVO> stuffVoList = ss.selectList("allStuffList");
		ss.close();
		return stuffVoList;
	}



	public static int insertMyCart(String id, List<String> list2, String store_code) {
		SqlSession ss = DBService.getFactory().openSession(true);
		
		Map<String, String> map = new HashMap<>();
		int toppingPrice = 0;
		for(int i = 0; i < list2.size(); i++) {
			map.put("id", id);
			map.put("topping", list2.get(i));
			ss.insert("insertToCart", map);
		}
		ss.close();
		return 0;
	}



	public static void insertMyCart(String id, String idx, String roasting, String bread_size, String store_code,
			List<String> list2, int toppingPrice) {
		
		SqlSession ss = DBService.getFactory().openSession(true);
		List<String> storeInCart = ss.selectList("selectInCartStore", id);
		List<String> MyCartIdx = ss.selectList("selectInCartIdx", id);
		if(storeInCart.size() > 0 && !storeInCart.get(0).equals(store_code)) {
			for(int i = 0; i < MyCartIdx.size(); i++) {
				String cidx = MyCartIdx.get(i);
				ss.delete("deleteInMyCrtTopping", cidx);
			}
			ss.delete("deleteInMyCart", id);
		}
		ss.commit();
		Map<String, String> map = new HashMap<>();
		map.put("userid", id);
		map.put("basic_idx", idx);
		map.put("roasting", roasting);
		map.put("bread_size", bread_size);
		map.put("store_code", store_code);
		map.put("one_total", "" + toppingPrice);
		int result = ss.insert("insertToCart", map);
		if(result == 0) {
			System.out.println("넌 뭔데 안 들어가는데???");
		}
		map.clear();
		String cart_idx = ss.selectOne("selectCart_idx");
		System.out.println("******************cart_idx" + cart_idx);
		map.put("cart_idx", cart_idx);
		
		for(int i = 0; i < list2.size(); i++) {
			String toppingName = list2.get(i);
			System.out.println(toppingName + " : toppingName");
			map.put("toppingName", toppingName);
			ss.insert("insertToCartTopping", map);
			map.remove("toppingName");
		}ss.commit();
		ss.close();
	}
}
