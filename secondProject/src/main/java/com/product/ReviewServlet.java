package com.product;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.UserInfo;
import com.util.DBConn;
import com.util.MyUtil;

public class ReviewServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}
	
	protected void forward(HttpServletRequest req, HttpServletResponse resp,String url) throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}
	
	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String cp = req.getContextPath();
		
		Connection conn = DBConn.getConnection();
		ReviewDAO reviewDao = new ReviewDAO(conn);
		
		MyUtil myUtil = new MyUtil();
		
		String uri = req.getRequestURI();
		String url;
		
		HttpSession session = req.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		
		if(uri.indexOf("review/writeReview.gos")!=-1) {

			url = "/review/write.jsp";
			forward(req, resp, url);
		
		}else if(uri.indexOf("review/writeReview_ok.gos")!=-1) {
			String userId = info.getUserId();
			int productNum = Integer.parseInt(req.getParameter("num"));
			int reviewNum = reviewDao.getMaxNum(productNum);
			
			ReviewDTO reviewDto = new ReviewDTO();
			reviewDto.setReviewNum(reviewNum+1);
			reviewDto.setProductNum(productNum);
			reviewDto.setUserId(userId);
			reviewDto.setUserName(info.getUserName());
			reviewDto.setUserPwd(req.getParameter("reviewPwd"));
			reviewDto.setContent(req.getParameter("content"));
			
			reviewDao.insertData(reviewDto);
			
			url = cp+"/cabin/review/writeReview.gos";
			resp.sendRedirect(url);
		}else if(uri.indexOf("review/review.gos")!=-1) {
			int productNum = Integer.parseInt(req.getParameter("num"));
			
			String pageNum = req.getParameter("pageNum");
			int reviewCurrentPage = 1;
			
			if(pageNum!=null) {
				reviewCurrentPage = Integer.parseInt(pageNum);
			}
			int reviewDataCount =reviewDao.getReviewCount(productNum);
			
			int numPerPage = 5;
			int reviewTotalPage = myUtil.getPageCount(numPerPage, reviewDataCount);
			
			int start = (reviewCurrentPage-1)*numPerPage+1;
			int end = reviewCurrentPage*numPerPage;
			
			List<ReviewDTO> allReviewList = reviewDao.getAllReviewList(productNum,start,end);
			
			String urlList = cp+"/cabin/review/review.gos";
			String reviewIndexList = myUtil.pageIndexList(reviewCurrentPage, reviewTotalPage, urlList);
			
			req.setAttribute("allReviewList", allReviewList);
			req.setAttribute("reviewIndexList", reviewIndexList);
			req.setAttribute("reviewDataCount", reviewDataCount);
			
			String imagePath = cp + "/productImgs/saveImage";
			req.setAttribute("imagePath", imagePath);
			
			url = "/review/review.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("review/deleteReview_ok.gos")!=-1) {

			
			
			url = cp+"/cabin/review/review.gos";
			resp.sendRedirect(url);
			
		}
		
		
	}
	
	
	
	

}
