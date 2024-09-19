package com.pay;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.MemDTO;
import com.myPage.OrderDTO;
import com.util.DBConn;
import com.util.MyUtil;

public class PayServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		Connection conn = DBConn.getConnection();
	
		PayDAO dao = new PayDAO(conn);
		
		MyUtil myUtil = new MyUtil();
		
		String uri = req.getRequestURI();
		String url;
		
		String userId = "rud101";
		
		if(uri.indexOf("pay/pay.gos")!=-1) {
			MemDTO dto = dao.getReadData(userId);
			req.setAttribute("dto", dto);
			
			url = "/pay/payTry.jsp";
			forward(req, resp, url);
		}
		
		
		
		else if(uri.indexOf("pay/pay_ok.gos")!=-1) {
			//여기에 데이터 주문 데이터
			PayDTO pdto = new PayDTO();
			
			pdto.setUserName(req.getParameter("buyerName"));
			pdto.setUserAddr(req.getParameter("buyerAddr"));
			pdto.setUserTel(req.getParameter("buyerTel"));
			
			req.setAttribute("pdto", pdto);
			
			url = "/pay/payFinished.jsp";
			forward(req, resp, url);
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
