package com.bc.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Q_WriteViewCommand implements Command{
	public String exec(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		return "write.jsp";
	}
}
