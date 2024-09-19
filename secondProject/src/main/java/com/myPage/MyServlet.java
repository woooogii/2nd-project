package com.myPage;

import java.io.File;
import java.io.IOException;
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

public class MyServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		process(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String url) throws ServletException, IOException {

		RequestDispatcher rd = req.getRequestDispatcher(url);
		rd.forward(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		String cp = req.getContextPath();

		Connection conn = DBConn.getConnection();
		CartDAO cartDao = new CartDAO(conn);
		OrderDAO orderDao = new OrderDAO(conn);
		//PageDAO pdao = new PageDAO(conn);

		MyUtil myUtil = new MyUtil();

		String uri = req.getRequestURI();
		String url;

		String root = getServletContext().getRealPath("/");
		String path = root+"productImgs"+File.separator+"saveImage";

		File f = new File(path);
		if(!f.exists()) {

			f.mkdirs();
		}

		//session
		HttpSession session = req.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");
		String userId = info.getUserId();
		
		
		if(uri.indexOf("order/myCart_ok.gos")!=-1) {

			int productNum = Integer.parseInt(req.getParameter("cartnum"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			
			
			try {
				
				CartDTO dto = new CartDTO();
				int cartId = cartDao.getCartId();

				dto.setCartId(cartId+1);
				dto.setUserId(userId);
				dto.setProductNum(productNum);
				
				cartDao.insertCart(dto);
				url = cp + "/cabin/shop/productDetail.gos?pageNum="+ pageNum +"&num="+productNum;
				resp.sendRedirect(url);
				
			} catch (Exception e) {
				System.out.println(e.toString());
				
				url = cp + "/cabin/membership/login.gos";
				resp.sendRedirect(url);
			}
			
			
			
			
			

			//2. ��ٱ��� ����Ʈ
		}else if(uri.indexOf("order/myCart.gos")!=-1) {

			//��ٱ��� ����¡ó��
			int cartCurrentPage = 1;
			int cartDataCount = cartDao.getCartDataCount(userId);
			int cartNumPerPage = 5;
			int totalPage = myUtil.getPageCount(cartNumPerPage, cartDataCount);
			if(cartCurrentPage>totalPage) {
				cartCurrentPage = totalPage;
			}
			int start = (cartCurrentPage-1)*cartNumPerPage+1;
			int end = cartCurrentPage*cartNumPerPage;

			
			
			try {
		
				List<CartDTO> cartList = cartDao.getCartList(userId, start, end);

				String articleUrl = cp + "/cabin/shop/productDetail.gos";

				req.setAttribute("cartList", cartList);
				req.setAttribute("cartDataCount", cartDataCount);
				req.setAttribute("articleUrl", articleUrl);

				//�̹���,���� ���
				String imagePath = cp + "/productImgs/saveImage";		
				String deletePath = cp + "/cabin/order/myCartDelete.gos";
				req.setAttribute("imagePath", imagePath);
				req.setAttribute("deletePath", deletePath);

				url = "/myPage/myCart.jsp";
				forward(req, resp, url);	

				
				
			} catch (Exception e) {
				System.out.println(e.toString());
				
				url = cp + "/cabin/membership/login.gos";
				resp.sendRedirect(url);
				
			}
			
			
			
			
			

			//3. ��ٱ��� �� ��ǰ ����
		}else if(uri.indexOf("order/myCartDelete.gos")!=-1) {
			int productNum = Integer.parseInt(req.getParameter("num"));

			cartDao.deleteCart(productNum);

			url = cp + "/cabin/order/myCart.gos";
			resp.sendRedirect(url);

			//4. �ֹ���ȸ	
		}else if(uri.indexOf("order/myOrder.gos")!=-1) {

			/*
		if(info==null) {

			url = "/myPage/login.jsp";
			forward(req, resp, url);
			return;
		}
			 */

			String productName = req.getParameter("productName");
			int currentPage = 1;
			if(productName!=null) {
				currentPage = Integer.parseInt(productName);
			}
			int dataCount = orderDao.getOrderDataCount();
			int numPerPage = 10;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			if(currentPage>totalPage) {
				currentPage = totalPage;
			}
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;

			List<OrderDTO> lists = orderDao.getOrderLists(start,end);

			String imagePath = cp + "/productImgs/saveImage";			
			String deletePath = cp + "/cabin/order/myOrderDelete_ok.gos";			
			String articleUrl = cp + "/cabin/shop/productDetail.gos";

			req.setAttribute("lists", lists);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("deletePath", deletePath);

			url = "/myPage/myOrder.jsp";
			forward(req, resp, url);	

			//5. �ֹ���ȸ ����
		}else if(uri.indexOf("myOrderDelete_ok.do")!=-1) { /////////////////
			int productNum = Integer.parseInt(req.getParameter("num"));
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			int orderNum = Integer.parseInt(req.getParameter("orderNum"));
			orderDao.deleteDataOrderList(orderNum);
			String param = "pageNum=" + pageNum;

			//url = cp + "/cabin/myOrder.gos?" + param;
			url = cp + "/cabin/myOrder.gos";
			resp.sendRedirect(url);

			//6. ����������
		}else if(uri.indexOf("order/myPage.gos")!=-1) {

			/*
		if(info==null) {

			url = "/myPage/login.jsp";
			forward(req, resp, url);
			return;
		}*/

			url = "/myPage/myPage.jsp";
			forward(req, resp, url);	

		}
	}
}