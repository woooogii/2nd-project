package com.member;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.DBConn;

public class MemServlet extends HttpServlet {

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
		MemDAO dao = new MemDAO(conn);

		String uri = req.getRequestURI();
		String url;

		if (uri.indexOf("membership/login.gos") != -1) {
			url = "/login/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("created.gos") != -1) {
			url = "/login/created.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("created_ok.gos") != -1) {

			MemDTO dto = new MemDTO();

			dto.setUserId(req.getParameter("userId"));
			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserEmail(req.getParameter("userEmail"));
			dto.setUserTel(req.getParameter("userTel"));
			dto.setUserGender(req.getParameter("userGender"));
			dto.setUserAddr(req.getParameter("userAddr"));
			dto.setUserBirth(req.getParameter("userBirth"));
			

			dao.insertData(dto);

			url = cp + "/cabin/membership/login.gos";
			resp.sendRedirect(url);

		} else if (uri.indexOf("membership/login_ok.gos") != -1) {

			String userId = req.getParameter("userId");
			String userPwd = req.getParameter("userPwd");

			MemDTO dto = dao.getReadData(userId);

			if (dto == null || (!dto.getUserPwd().equals(userPwd))) {
				req.setAttribute("message1", "아이디 또는 패스워드를 정확히 입력하세요");

				url = "/login/login.jsp";
				forward(req, resp, url);

				return;
			}

			HttpSession session = req.getSession();

			UserInfo info = new UserInfo();

			info.setUserId(dto.getUserId());
			info.setUserName(dto.getUserName());

			session.setAttribute("userInfo", info);

			url = cp + "/cabin/shop/productList.gos";
			resp.sendRedirect(url);

		} else if (uri.indexOf("membership/logout.gos") != -1) {

			HttpSession session = req.getSession();

			session.removeAttribute("userInfo");
			session.invalidate();

			url = cp + "/cabin/shop/productList.gos";
			resp.sendRedirect(url);

		} else if (uri.indexOf("membership/searchPw.gos") != -1) {

			url = "/login/searchPw.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("membership/searchId.gos") != -1) {

			url = "/login/searchId.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("membership/searchPw_ok.gos") != -1) {
			String userId = req.getParameter("userId");
			String userEmail = req.getParameter("userEmail");

			MemDTO dto = dao.getReadData1(userId, userEmail);

			if (dto == null) {
				req.setAttribute("message", "회원정보가 존재하지 않습니다");

				url = "/login/login.jsp";
				forward(req, resp, url);
				return;
			}

			// 여기에 메일 보내는 코딩적어주기

			url = "/login/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("membership/searchId_ok.gos") != -1) {
			String userTel = req.getParameter("userTel");
			String userEmail = req.getParameter("userEmail");

			MemDTO dto = dao.getReadData2(userTel, userEmail);

			if (dto == null) {
				req.setAttribute("message", "회원정보가 존재하지 않습니다");

				url = "/login/login.jsp";
				forward(req, resp, url);
				return;
			}

			url = "/login/login.jsp";
			forward(req, resp, url);

		} else if (uri.indexOf("membership/updated.gos") != -1) {

			HttpSession session = req.getSession();
			UserInfo info = (UserInfo) session.getAttribute("userInfo");

			if (info != null) {
				String userId = info.getUserId();
				MemDTO dto = dao.getReadData(userId);

				req.setAttribute("dto", dto);
			}

			url = "/login/updated.jsp";
			forward(req, resp, url);
			return;

		} 

		 else if (uri.indexOf("membership/updated_ok.gos") != -1) {

			MemDTO dto = new MemDTO();

			dto.setUserPwd(req.getParameter("userPwd"));
			dto.setUserName(req.getParameter("userName"));
			dto.setUserEmail(req.getParameter("userEmail"));
			dto.setUserTel(req.getParameter("userTel"));
			dto.setUserGender(req.getParameter("userGender"));
			dto.setUserAddr(req.getParameter("userAddr"));
			dto.setUserBirth(req.getParameter("userBirth"));

			dao.updateData(dto);

			url = cp + "/cabin/order/myPage.gos";
			resp.sendRedirect(url);

		}
		
		
		else if (uri.indexOf("/hello.gos") != -1) {
			url = "/main.jsp";
			forward(req, resp, url);
		}
		
		
		
	}

}
