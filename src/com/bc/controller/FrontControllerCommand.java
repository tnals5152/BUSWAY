package com.bc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.command.C_DeleteCommand;
import com.bc.command.C_DeleteViewCommand;
import com.bc.command.C_WriteCommand;
import com.bc.command.C_WriteViewCommand;
import com.bc.command.Command;
import com.bc.command.E_DeleteCommand;
import com.bc.command.E_DeleteViewCommand;
import com.bc.command.E_ListCommand;
import com.bc.command.E_ModifyCommand;
import com.bc.command.E_ModifyViewCommand;
import com.bc.command.E_SearchCommand;
import com.bc.command.E_ViewCommand;
import com.bc.command.E_WriteCommand;
import com.bc.command.E_WriteViewCommand;
import com.bc.command.N_DeleteCommand;
import com.bc.command.N_DeleteViewCommand;
import com.bc.command.N_ListCommand;
import com.bc.command.N_ModifyCommand;
import com.bc.command.N_ModifyViewCommand;
import com.bc.command.N_SearchCommand;
import com.bc.command.N_ViewCommand;
import com.bc.command.N_WriteCommand;
import com.bc.command.N_WriteViewCommand;
import com.bc.command.Q_DeleteCommand;
import com.bc.command.Q_DeleteViewCommand;
import com.bc.command.Q_ListCommand;
import com.bc.command.Q_ModifyCommand;
import com.bc.command.Q_ModifyViewCommand;
import com.bc.command.Q_SearchCommand;
import com.bc.command.Q_ViewCommand;
import com.bc.command.Q_WriteCommand;
import com.bc.command.Q_WriteViewCommand;



@WebServlet("/controller")
public class FrontControllerCommand extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">> FrontControllerCommand.doGet() 실행~~");

		String type = request.getParameter("type");
		System.out.println("> type : " + type);
		System.out.println("===" + request.getParameter("title"));
		Command command = null;
		if ("Q_BBS".equals(type)) { //문의 게시판으로 이동 
			command = new Q_ListCommand();
		} else if("Q_View".equals(type)) { //문의 게시글 상세페이지
			command = new Q_ViewCommand();
		} else if("Q_Search".equals(type)) { //문의 게시글 검색
			command = new Q_SearchCommand();
		} else if("Q_Write".equals(type)) { //문의 게시글 작성
			command = new Q_WriteCommand();
		} else if("Q_WriteView".equals(type)) { 
			command = new Q_WriteViewCommand();
		} else if("Q_Modify".equals(type)) { //문의 게시글 수정
			command = new Q_ModifyCommand();
		} else if("Q_ModifyView".equals(type)) {
			command = new Q_ModifyViewCommand();
		} else if ("Q_Delete".equals(type)) { //문의 게시글 삭제
			command = new Q_DeleteCommand();
		} else if ("Q_DeleteView".equals(type)) {
			command = new Q_DeleteViewCommand();
		} else if ("C_Write".equals(type)) { //댓글 작성
			command = new C_WriteCommand();
		} else if ("C_WriteView".equals(type)) { 
			command = new C_WriteViewCommand();
		} else if ("C_Delete".equals(type)) { //댓글 삭제
			command = new C_DeleteCommand();
		} else if ("C_DeleteView".equals(type)) { 
			command = new C_DeleteViewCommand();
		} else if ("N_List".equals(type)) { //뉴스, 공지사항 게시판으로 이동
			command = new N_ListCommand();
		} else if ("N_View".equals(type)) { //뉴스, 공지사항 게시글 상세페이지
			command = new N_ViewCommand();
		} else if ("N_Search".equals(type)) { //뉴스, 공지사항 검색
			command = new N_SearchCommand();
		} else if ("N_Write".equals(type)) { //뉴스, 공지사항 작성
			command = new N_WriteCommand();
		} else if ("N_WriteView".equals(type)) { 
			command = new N_WriteViewCommand();
		} else if ("N_Modify".equals(type)) { //뉴스, 공지사항 수정
			command = new N_ModifyCommand();
		} else if ("N_ModifyView".equals(type)) { 
			command = new N_ModifyViewCommand();
		} else if ("N_Delete".equals(type)) { //뉴스, 공지사항 삭제
			command = new N_DeleteCommand();
		} else if ("N_DeleteView".equals(type)) { /////
			command = new N_DeleteViewCommand();
		} else if ("E_List".equals(type)) { //이벤트 게시판으로 이동
			command = new E_ListCommand();
		} else if ("E_View".equals(type)) { //이벤트 게시글 상세페이지
			command = new E_ViewCommand();
		} else if ("E_Search".equals(type)) { //이벤트 검색
			command = new E_SearchCommand();
		} else if ("E_Write".equals(type)) { //이벤트 작성
			command = new E_WriteCommand();
		} else if ("E_WriteView".equals(type)) { 
			command = new E_WriteViewCommand();
		} else if ("E_Modify".equals(type)) { //이벤트 수정
			command = new E_ModifyCommand();
		} else if ("E_ModifyView".equals(type)) { 
			command = new E_ModifyViewCommand();
		} else if ("E_Delete".equals(type)) { //이벤트 삭제
			command = new E_DeleteCommand();
		} else if ("E_DeleteView".equals(type)) { 
			command = new E_DeleteViewCommand();
		}
		
		String path = command.exec(request, response);
		System.out.println("path : " + path);
		request.getRequestDispatcher(path).forward(request, response);
		System.out.println(">> FrontController.doGet() 실행~~");
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
}


























































































































