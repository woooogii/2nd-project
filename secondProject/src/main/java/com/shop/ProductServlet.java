package com.shop;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyUtil;


public class ProductServlet extends HttpServlet{

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
		CreateProductDAO dao = new CreateProductDAO(conn);

		
		MyUtil myUtil = new MyUtil();
		
		String uri = req.getRequestURI();
		String url;
		
		String root = getServletContext().getRealPath("/");
		String path = root+"productImgs"+File.separator+"saveImage";
		
		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}
		
		if(uri.indexOf("shop/create.gos")!=-1) {
			
			url = "/mthree/create.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("shop/create_ok.gos")!=-1) {
			
			String enctype="UTF-8";
			int maxSize = 10*1024*1024;
			
			MultipartRequest mr = new MultipartRequest(req, path,maxSize,enctype, new DefaultFileRenamePolicy());
			
			if(mr.getFile("upload")!=null) {
				
				int productNum = dao.getAllProductMaxNum();
				
				CreateProductDTO dto = new CreateProductDTO();
				
				dto.setCategory(mr.getParameter("category"));
				dto.setProductNum(productNum+1);
				dto.setProductName(mr.getParameter("productName"));
				dto.setPrice(Integer.parseInt(mr.getParameter("price")));
				dto.setAmount(Integer.parseInt(mr.getParameter("amount")));
				dto.setImgSaveFileName(mr.getFilesystemName("upload"));
				dto.setImgOriginalFileName(mr.getOriginalFileName("upload"));
				dto.setProductDetailContent(mr.getParameter("productDetailContent"));
				
				dao.insertProduct(dto);
				
			}
			
			url=cp+"/cabin/shop/productList.gos";
			resp.sendRedirect(url);

		}else if(uri.indexOf("shop/productList.gos")!=-1){//  ü     Ʈ    
			
			String pageNum = req.getParameter("pageNum");
			
			int currentPage = 1;
			
			if(pageNum!=null) {
				currentPage = Integer.parseInt(pageNum);
			}
			
			int dataCount = dao.getProductDataCount();
			
			int numPerPage = 9;
			
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			
			if(currentPage>totalPage) {
				currentPage=totalPage;
			}
			
			int start = (currentPage-1)*numPerPage+1;
			int end = currentPage*numPerPage;
			
			String urlList = cp+"/cabin/shop/productlist.gos";
			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, urlList);
			
			List<CreateProductDTO> allProductLists = dao.allProductList(start, end);
			
			String imagePath = cp + "/productImgs/saveImage";
			
			String deletePath = cp + "/cabin/shop/delete.gos";
			
			String articleUrl = cp + "/cabin/shop/productDetail.gos?pageNum="+currentPage;
			
			req.setAttribute("allProductLists", allProductLists);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum",currentPage);
			req.setAttribute("totalPage", totalPage);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("articleUrl", articleUrl);
			req.setAttribute("deletePath", deletePath);
			
			url = "/mthree/productList.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("shop/productDetail.gos")!=-1) {//article
			
			int productNum = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			
			CreateProductDTO productList = dao.getReadProduct(productNum);
			
			String imagePath = cp + "/productImgs/saveImage";
			
			if(productList==null) {
				url = cp+"/cabin/shop/productList.gos";
				resp.sendRedirect(url);
			}
			
			String param = "pageNum="+pageNum;
			
			req.setAttribute("productList", productList);
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("params", param);
			req.setAttribute("pageNum", pageNum);
			
			url = "/mthree/productDetail.jsp";
			forward(req, resp, url);
			
		}else if(uri.indexOf("shop/delete.gos")!=-1) {
			int productNum = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			
			CreateProductDTO dto = dao.getReadProduct(productNum);
			
			FileManager.doFileDelete(dto.getImgSaveFileName(), path);
			
			dao.deleteData(productNum);
			
			url = cp+"/cabin/shop/productList.gos?pageNum="+pageNum;
			resp.sendRedirect(url);
			
		}

	}
}