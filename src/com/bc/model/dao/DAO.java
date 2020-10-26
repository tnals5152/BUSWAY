package com.bc.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.CartToppingVO;
import com.bc.model.vo.CartVO_only;
import com.bc.model.vo.CommVO;
import com.bc.model.vo.E_BBSVO;
import com.bc.model.vo.N_BBSVO;
import com.bc.model.vo.OrderedToppingVO;
import com.bc.model.vo.Q_BBSVO;
import com.bc.model.vo.StoreVO;
import com.bc.model.vo.SuborderVO;
import com.bc.model.vo.UsersVO;
import com.bc.mybatis.DBService;

public class DAO {
	
	public static UsersVO loginUsers(String id, String pwd) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		UsersVO user = ss.selectOne("userslogin", map);
		ss.close();
		return user;
	}
	
	public static int userUpdate(UsersVO uvo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("userupdate", uvo);
		ss.close();
		return result;
	}

	public static int selectIdCheck(String id) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.selectOne("checkId", id);
		ss.close();
		return result;
	}
	
	public static int insertUser(UsersVO user) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("insertuser", user);
		ss.close();
		return result;
	}

	public static List<String> findUserId(String name, String phone) {
		SqlSession ss = DBService.getFactory().openSession(true);
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("phone", phone);
		
		List<String> userIdList = ss.selectList("finduserid", map);
		ss.close();
		return userIdList;
	}

	public static String findUserPwd(String id, String name, String phone) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("name", name);
		map.put("phone", phone);
		String userPwd = ss.selectOne("finduserpwd", map);
		ss.close();
		return userPwd;
	}

	public static StoreVO adminLogin(String code, String pwd) {
		SqlSession ss = DBService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("pwd", pwd);
		StoreVO storevo = ss.selectOne("adminLogin", map);
		ss.close();
		return storevo;
		
	}
	
	//게시물 총 개수(페이징 관련)
		public static int Q_Count() {
			SqlSession ss = DBService.getFactory().openSession(true);
			int totalCount = ss.selectOne("q_totalCount");
			ss.close();
			return totalCount;
		}
		
		//문의 게시물 리스트
		public static List<Q_BBSVO> Q_List(Map<String, Integer> map) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<Q_BBSVO> list = ss.selectList("q_list", map);
			ss.close();
			return list;
		}
		
		//카테고리별 게시물 검색
		public static List<Q_BBSVO> Q_Search(String idx, String keyword) {
			SqlSession ss = DBService.getFactory().openSession(true);
			Map<String, String> map = new HashMap<>();
			map.put("idx", idx);
			map.put("keyword", keyword);
			List<Q_BBSVO> list = ss.selectList("q_search", map);
			ss.close();
			return list;
		}
		
		//문의 글 하나 조회
		public static Q_BBSVO Q_selectOne(String q_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			Q_BBSVO vo = ss.selectOne("q_one", q_idx);
			ss.close();
			return vo;
		}
		
		//문의 글쓰기
		public static int Q_write(Q_BBSVO nvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("q_insert", nvo);
			ss.close();
			return result;
		}
		
		//문의 게시글 수정
		public static int Q_modify(Q_BBSVO nvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			System.out.println(nvo);
			int result = ss.update("q_update", nvo);
			ss.close();
			return result;
		}
		
		//문의 게시글 삭제
		public static int Q_delete(String q_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("q_delete", q_idx);
			ss.close();
			return result;
		}
		
		//문의 게시글 조회수
		public static int Q_views(int views) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("q_views",views);
			ss.close();
			return result;
			
		}
		
		//문의 댓글 조회
		public static List<CommVO> Comm_list(String c_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<CommVO> list = ss.selectList("c_list", c_idx);
			ss.close();
			return list;
		}

		//문의 댓글 쓰기
		public static int Comm_write(CommVO cvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("c_insert", cvo);
			ss.close();
			return result;
		}
		
		//문의 댓글 삭제
		public static int Comm_delete(String c_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("c_delete", c_idx);
			ss.close();
			return result;
		}
			
		
		
		///////////////////////////////////////////////////////////////
		
		//게시물 총 개수(페이징 관련)
		public static int N_Count() {
			SqlSession ss = DBService.getFactory().openSession(true);
			int totalCount = ss.selectOne("n_totalCount");
			ss.close();
			return totalCount;
		}
			
		//뉴스,공지 게시물 리스트
		public static List<N_BBSVO> N_List(Map<String, Integer> map) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<N_BBSVO> list = ss.selectList("n_list", map);
			ss.close();
			return list;
		}
		
		//뉴스,공지 카테고리별 게시물 검색
		public static List<N_BBSVO> N_Search(String idx, String keyword) {
			SqlSession ss = DBService.getFactory().openSession(true);
			Map<String, String> map = new HashMap<>();
			map.put("idx", idx);
			map.put("keyword", keyword);
			List<N_BBSVO> list = ss.selectList("n_search", map);
			ss.close();
			return list;
		}
		
		//뉴스,공지 글 하나 조회
		public static N_BBSVO N_selectOne(String n_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			N_BBSVO vo = ss.selectOne("n_one", n_idx);
			ss.close();
			return vo;
		}
		
		//뉴스,공지 글쓰기
		public static int N_write(N_BBSVO nvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("n_insert", nvo);
			ss.close();
			return result;
		}
		
		//뉴스,공지 게시글 수정
		public static int N_modify(N_BBSVO nvo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			System.out.println(nvo);
			int result = ss.update("n_update", nvo);
			ss.close();
			return result;
		}
		
		//뉴스,공지 게시글 삭제
		public static int N_delete(String n_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("n_delete", n_idx);
			ss.close();
			return result;
		}
		
		//뉴스,공지 게시글 조회수
		public static int N_views(int views) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("n_views",views);
			ss.close();
			return result;
		}
		
		///////////////////////////////////////////////////////////////
			
		//게시물 총 개수(페이징 관련)
		public static int E_Count() {
			SqlSession ss = DBService.getFactory().openSession(true);
			int totalCount = ss.selectOne("e_totalCount");
			ss.close();
			return totalCount;
		}
		
		//이벤트 게시물 리스트
		public static List<E_BBSVO> E_List(Map<String, Integer> map) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<E_BBSVO> list = ss.selectList("e_list", map);
			ss.close();
			return list;
		}
		
		//이벤트 카테고리별 게시물 검색
		public static List<E_BBSVO> E_Search(String idx, String keyword) {
			SqlSession ss = DBService.getFactory().openSession(true);
			Map<String, String> map = new HashMap<>();
			map.put("idx", idx);
			map.put("keyword", keyword);
			List<E_BBSVO> list = ss.selectList("e_search", map);
			ss.close();
			return list;
		}
		
		//이벤트 글 하나 조회
		public static E_BBSVO E_selectOne(String e_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			E_BBSVO vo = ss.selectOne("e_one", e_idx);
			ss.close();
			return vo;
		}
		
		//이벤트 글쓰기
		public static int E_write(E_BBSVO evo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.insert("e_insert", evo);
			ss.close();
			return result;
		}
		
		//이벤트 게시글 수정
		public static int E_modify(E_BBSVO evo) {
			SqlSession ss = DBService.getFactory().openSession(true);
			System.out.println(evo);
			int result = ss.update("e_update", evo);
			ss.close();
			return result;
		}
		
		//이벤트 게시글 삭제
		public static int E_delete(String e_idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.delete("e_delete", e_idx);
			ss.close();
			return result;
		}
		
		//이벤트 게시글 조회수
		public static int E_views(int views) {
			SqlSession ss = DBService.getFactory().openSession(true);
			int result = ss.update("e_views",views);
			ss.close();
			return result;
		}

		public static void updateplusCart(String idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.update("updateplusCart", idx);
			ss.close();
		}

		public static void updateMinusCart(String idx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.update("updateminusCart", idx);
			ss.close();
			
		}

		public static void deleteMyCart(String[] checked) {
			SqlSession ss = DBService.getFactory().openSession(true);
			for(int i = 0; i < checked.length; i++) {
				String idx = checked[i];
				ss.delete("deleteMyCartTopping", idx);
				ss.delete("deleteMyCart", idx);
			}
			
			ss.close();
			
		}

		public static UsersVO order(String[] checked, String id, String addr, String all_total) {
			SqlSession ss = DBService.getFactory().openSession(true);
			Map<String, String> map = new HashMap<String, String>();
			map.put("userid", id);
			map.put("addr", addr);
			map.put("all_total", all_total);
			ss.insert("userorderTable", map);
			ss.commit();
			map.clear();
			////////////////////////////////
			//카트에 있던 거 그대로 idx로 골라와서 suborder테이블에 저장
			for(int i = 0; i < checked.length; i++) {
				String cartIdx = checked[i];
				CartVO_only cvo = ss.selectOne("selectCartByCartIdx", cartIdx);
				map.put("bread_size", cvo.getBread_size());
				map.put("roasting", cvo.getRoasting());
				map.put("basic_idx", cvo.getBasic_idx());
				map.put("id", cvo.getUserid());
				map.put("cnt", cvo.getCnt());
				map.put("one_total", cvo.getOne_total());
				map.put("store_code", cvo.getStore_code());
				ss.insert("insertSuborder", map);
				ss.commit();
				map.clear();
				
				
				
				List<CartToppingVO> list = ss.selectList("selectCartToppingByCartIdx", cartIdx);
				System.out.println(list);
				for(int k = 0; k < list.size(); k++) {
					String name = list.get(k).getName();
					int quan = list.get(k).getQuan();
					map.put("id", id);
					map.put("name", name);
					map.put("quan", ""+quan);
					ss.insert("insertOrderedTopping", map);
					map.clear();
				}
				ss.delete("deleteCartToppingByCartIdx", cartIdx);
				ss.delete("deleteCartByCartIdx", cartIdx);
				
				
			}
			ss.update("updateUserCnt", id);
			UsersVO user = ss.selectOne("updateUser", id);
			
			ss.close();
			return user;
		}

		public static List<SuborderVO> selectSuborderList(String id) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<SuborderVO> suborderlist = ss.selectList("selectSuborderById", id);
			ss.close();
			return suborderlist;
		}

		public static List<OrderedToppingVO> selectOrderedToppingList(String suborderIdx) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<OrderedToppingVO> orderToppingList = ss.selectList("selectOrderedToppingListBysuborderIdx", suborderIdx);
			ss.close();
			return orderToppingList;
		}

		public static void leaveuser(String userid) {
			SqlSession ss = DBService.getFactory().openSession(true);
			ss.update("leaveUser", userid);
			ss.close();
			
		}

		public static List<StoreVO> findStoreByName(String name) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<StoreVO> storeList = ss.selectList("storeListByName", name);
			return storeList;
		}

		public static List<StoreVO> findStoreByShop_number(String shop_number) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<StoreVO> storeList = ss.selectList("storeListByShop_number", shop_number);
			return storeList;
		}

		public static List<StoreVO> findStoreByAddr(String addr) {
			SqlSession ss = DBService.getFactory().openSession(true);
			List<StoreVO> storeList = ss.selectList("storeListByAddr", addr);
			return storeList;
		}
	
	
}

