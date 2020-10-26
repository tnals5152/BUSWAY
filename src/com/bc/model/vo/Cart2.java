package com.bc.model.vo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.bc.model.CartDAO;

//담은 토핑 장바구니 역할 클래스 
public class Cart2 {
	private List<StuffVO> list;
	private int total;
	
	public Cart2() {
		list = new ArrayList<StuffVO>();
		
	}
	
	public void addProduct(String sort, CartDAO dao) {
		StuffVO vo = findProduct(sort);
	}
	
	public StuffVO findProduct(String sort) {
		StuffVO vo = null;
		Iterator<StuffVO> ite = list.iterator();
		while(ite.hasNext()) {
			StuffVO listVO = ite.next();
			if(listVO.getSort().equals(sort)) {
				vo = listVO;
				break;
			}
		}
		return vo;
	}
	
	public List<StuffVO> getList(){
		return list;
	}
	
}
