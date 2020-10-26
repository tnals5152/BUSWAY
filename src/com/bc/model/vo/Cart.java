package com.bc.model.vo;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.bc.model.CartDAO;

public class Cart {
	private List<BasicSuborderVO> list; //카트에 담길 제품 목록
	private int total; //카트 안 전체금액 
	
	public Cart() {
		list = new ArrayList<BasicSuborderVO>();
	}
	
	public void addProduct(int p_num, CartDAO dao) {
		BasicSuborderVO vo = findProduct(p_num);
	}
	
	
	public BasicSuborderVO findProduct(int id) {
		BasicSuborderVO vo = null;
		Iterator<BasicSuborderVO> ite = list.iterator();
		
		while(ite.hasNext()) {
			BasicSuborderVO listVO = ite.next();
			if(listVO.getUserid().equals(id)) {
				vo = listVO;
				break;
			} else {
				
			}
		}
		
		return vo;
	
		}
	
	public void setQuant(int cnt, int su) {
		BasicSuborderVO vo = findProduct(cnt);
		if(vo == null) return;
		total = total - vo.getTotalprice();
		vo.setQuant(su);
		total = total + vo.getTotalprice();
		
		
	}
	
	public void delProduct(int cnt) {
		BasicSuborderVO vo = findProduct(cnt);
		if(vo != null) {
			list.remove(vo);
			total = total - vo.getTotalprice();
		}
	}
	
	public List<BasicSuborderVO> getList(){
		return list;
	}
	
	public int getTotal() {
		return total;
	}
}
