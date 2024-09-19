package com.product;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
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
import com.myPage.CartDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.util.DBConn;
import com.util.FileManager;
import com.util.MyUtil;

public class ProductServlet extends HttpServlet {

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
		CreateProductDAO createDao = new CreateProductDAO(conn);
		CartDAO cartDao = new CartDAO(conn);
		ReviewDAO reviewDao = new ReviewDAO(conn);


		MyUtil myUtil = new MyUtil();

		String uri = req.getRequestURI();
		String url;

		String root = getServletContext().getRealPath("/");
		String path = root+"productImgs"+File.separator+"saveImage";

		File f = new File(path);
		if(!f.exists()) {
			f.mkdirs();
		}

		// session 열기
		HttpSession session = req.getSession();
		UserInfo info = (UserInfo) session.getAttribute("userInfo");

		// 1-1. 상품 등록
		if (uri.indexOf("shop/create.gos") != -1) {
			url = "/product/create.jsp";
			forward(req, resp, url);

			// 1-2. 상품 등록 확인
		} else if (uri.indexOf("shop/create_ok.gos") != -1) {

			String enctype="UTF-8";
			int maxSize = 10*1024*1024;
			MultipartRequest mr = new MultipartRequest(req, path,maxSize,enctype, new DefaultFileRenamePolicy());
			if(mr.getFile("upload")!=null) {
				int productNum = createDao.getProductMaxNum();
				CreateProductDTO dto = new CreateProductDTO();
				
				dto.setCategory(mr.getParameter("category"));
				dto.setProductNum(productNum+1);
				dto.setProductName(mr.getParameter("productName"));
				dto.setPrice(Integer.parseInt(mr.getParameter("price")));
				dto.setAmount(Integer.parseInt(mr.getParameter("amount")));
				dto.setImgSaveFileName(mr.getFilesystemName("upload"));
				dto.setImgOriginalFileName(mr.getOriginalFileName("upload"));
				dto.setProductDetailContent(mr.getParameter("productDetailContent"));
				createDao.insertProduct(dto);
			}
			url=cp+"/cabin/shop/productList.gos";
			resp.sendRedirect(url);
			
			// 2. 전체상품리스트
		} else if (uri.indexOf("shop/productList.gos") != -1) {
			String pageNum = req.getParameter("pageNum");
			//페이징 처리
		int currentPage = 1;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		String searchValue = req.getParameter("searchValue"); //상품명 혹은 카테고리 검색
		if(searchValue!=null) {
			if(req.getMethod().equalsIgnoreCase("GET")) {
				searchValue = URLDecoder.decode(searchValue,"UTF-8");
			}
		} else {
			searchValue = "";
		}
		int dataCount = createDao.getAllDataCount(searchValue);
		int numPerPage = 4;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		if(currentPage>totalPage) {
			currentPage=totalPage;
		}
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<CreateProductDTO> allProductList = createDao.allProductList(start, end, searchValue);

			//페이징 처리
		String param = "";
		if(searchValue!=null && !searchValue.equals("")) {
			param = "searchValue="+URLEncoder.encode(searchValue,"UTF-8");
		}
		String urlList = cp+"/cabin/shop/productList.gos";
		if(!param.equals("")) {
			urlList += "?" + param;
		}

		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, urlList);
		
		req.setAttribute("allProductList", allProductList);
		req.setAttribute("allProductIndexList", pageIndexList);
		req.setAttribute("allProductDataCount", dataCount);
		req.setAttribute("pageNum",currentPage);
		
			//상품 상세페이지
		String articleUrl = cp + "/cabin/shop/productDetail.gos?pageNum="+currentPage;
		if(!param.equals("")) {
			articleUrl += "&" + param;
		}
		req.setAttribute("articleUrl", articleUrl);

		String imagePath = cp + "/productImgs/saveImage";
		String deletePath = cp + "/cabin/shop/all_delete.gos";
		req.setAttribute("imagePath", imagePath);
		req.setAttribute("deletePath", deletePath);

		url = "/product/productList.jsp";
		forward(req, resp, url);

		//3. 카테고리별 페이지
		} else if (uri.indexOf("shop/cateList.gos") != -1) {

			String category = req.getParameter("category");
			String catePageNum = req.getParameter("pageNum");
				//페이징처리
			int cateCurrentPage = 1;
			if(catePageNum!=null) {
				cateCurrentPage = Integer.parseInt(catePageNum);
			}
			int cateDataCount = createDao.getCategoryDataCount(category);
			int cateNumPerPage = 4;
			int cateTotalPage = myUtil.getPageCount(cateNumPerPage, cateDataCount);
			if(cateCurrentPage>cateTotalPage) {
				cateCurrentPage=cateTotalPage;
			}
			int start = (cateCurrentPage-1)*cateNumPerPage+1;
			int end = cateCurrentPage*cateNumPerPage;
			
			List<CreateProductDTO> categoryLists = createDao.cateProductList(category, start, end);

			String cateUrlList = cp+"/cabin/shop/cateList.gos?category="+category;
			String cateIndexList = myUtil.pageIndexList(cateCurrentPage, cateTotalPage, cateUrlList);

			req.setAttribute("categoryLists", categoryLists);
			req.setAttribute("cateIndexList", cateIndexList);
			req.setAttribute("cateDataCount", cateDataCount);
			req.setAttribute("pageNum",cateCurrentPage);
			
			String articleUrl = cp + "/cabin/shop/productDetail.gos?pageNum="+cateCurrentPage;

			req.setAttribute("articleUrl", articleUrl);

			String imagePath = cp + "/productImgs/saveImage";
			String cateDeletePath = cp + "/cabin/shop/cate_delete.gos";
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("deletePath", cateDeletePath);

			url = "/product/categoryList.jsp";
			forward(req, resp, url);
			
			//상품 상세페이지
		} else if (uri.indexOf("shop/productDetail.gos") != -1) {
			int productNum = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");

			CreateProductDTO productList = createDao.getReadProduct(productNum);
			
			
			if (info != null) {//장바구니 확인
				String userId = info.getUserId();
				boolean isCart = cartDao.isCart(userId);
				req.setAttribute("isCart", isCart);
			}
			if(productList==null) {
				url = cp+"/cabin/shop/productList.gos";
				resp.sendRedirect(url);
			}
			String param = "pageNum="+pageNum;
			
			req.setAttribute("productList", productList);
			req.setAttribute("params", param);
			req.setAttribute("pageNum", pageNum);
			
				//리뷰 시작
//			int reviewCount = reviewDao.getReviewCount(productNum);
//			List<ReviewDTO> reviewList = reviewDao.getReviewList(productNum);
//			
//			req.setAttribute("reviewList", reviewList);
//			req.setAttribute("reviewCount", reviewCount);
			String imagePath = cp + "/productImgs/saveImage";
			req.setAttribute("imagePath", imagePath);

			url = "/product/productDetail.jsp";
			forward(req, resp, url);

			//전체상품 내 상품 삭제
		} else if (uri.indexOf("shop/all_delete.gos") != -1) {
			int productNum = Integer.parseInt(req.getParameter("num"));
			String pageNum = req.getParameter("pageNum");
			CreateProductDTO dto = createDao.getReadProduct(productNum);
			FileManager.doFileDelete(dto.getImgSaveFileName(), path);
			createDao.deleteData(productNum);
			url = cp+"/cabin/shop/productList.gos?pageNum="+pageNum;
			resp.sendRedirect(url);

			// 카테고리 리스트 내 상품 삭제
		} else if (uri.indexOf("shop/cate_delete.gos") != -1) {
			int cateProductNum = Integer.parseInt(req.getParameter("num"));
			String catePageNum = req.getParameter("pageNum");
			String category = req.getParameter("category");
			CreateProductDTO dto = createDao.getReadProduct(cateProductNum);
			FileManager.doFileDelete(dto.getImgSaveFileName(), path);
			createDao.deleteData(cateProductNum);
			String encodedCategory = URLEncoder.encode(category, "UTF-8");
			url = cp + "/cabin/shop/cateList.gos?category=" + encodedCategory + "&pageNum=" + catePageNum;
			resp.sendRedirect(url);


		}

		
		
		
		
		// 240130 높은가격순 페이지 추가
		else if (uri.indexOf("shop/productPriceList.gos") != -1) {

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			String searchValue = req.getParameter("searchValue"); // ��ǰ�� Ȥ�� ī�װ� �˻�
			if (searchValue != null) {
				if (req.getMethod().equalsIgnoreCase("GET")) {
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			} else {
				searchValue = "";
			}
			int dataCount = createDao.getAllDataCount(searchValue);
			int numPerPage = 4;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<CreateProductDTO> allProductList = createDao.priceProductList(start, end, searchValue);

			String param = "";
			if (searchValue != null && !searchValue.equals("")) {
				param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}
			String urlList = cp + "/cabin/shop/productList.gos";
			if (!param.equals("")) {
				urlList += "?" + param;
			}

			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, urlList);

			req.setAttribute("allProductList", allProductList);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);

			String articleUrl = cp + "/cabin/shop/productDetail.gos?pageNum=" + currentPage;
			if (!param.equals("")) {
				articleUrl += "&" + param;
			}
			req.setAttribute("articleUrl", articleUrl);

			String imagePath = cp + "/productImgs/saveImage";
			String deletePath = cp + "/cabin/shop/all_delete.gos";
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("deletePath", deletePath);

			url = "/product/productList.jsp";
			forward(req, resp, url);

		}
		// 240130 낮은가격순 페이지 추가
		else if (uri.indexOf("shop/productLowPriceList.gos") != -1) {

			String pageNum = req.getParameter("pageNum");

			int currentPage = 1;
			if (pageNum != null) {
				currentPage = Integer.parseInt(pageNum);
			}
			String searchValue = req.getParameter("searchValue"); // ��ǰ�� Ȥ�� ī�װ� �˻�
			if (searchValue != null) {
				if (req.getMethod().equalsIgnoreCase("GET")) {
					searchValue = URLDecoder.decode(searchValue, "UTF-8");
				}
			} else {
				searchValue = "";
			}
			int dataCount = createDao.getAllDataCount(searchValue);
			int numPerPage = 4;
			int totalPage = myUtil.getPageCount(numPerPage, dataCount);
			if (currentPage > totalPage) {
				currentPage = totalPage;
			}
			int start = (currentPage - 1) * numPerPage + 1;
			int end = currentPage * numPerPage;

			List<CreateProductDTO> allProductList = createDao.priceLowProductList(start, end, searchValue);

			String param = "";
			if (searchValue != null && !searchValue.equals("")) {
				param = "searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
			}
			String urlList = cp + "/cabin/shop/productList.gos";
			if (!param.equals("")) {
				urlList += "?" + param;
			}

			String pageIndexList = myUtil.pageIndexList(currentPage, totalPage, urlList);

			req.setAttribute("allProductList", allProductList);
			req.setAttribute("pageIndexList", pageIndexList);
			req.setAttribute("dataCount", dataCount);
			req.setAttribute("pageNum", currentPage);

			String articleUrl = cp + "/cabin/shop/productDetail.gos?pageNum=" + currentPage;
			if (!param.equals("")) {
				articleUrl += "&" + param;
			}
			req.setAttribute("articleUrl", articleUrl);

			String imagePath = cp + "/productImgs/saveImage";
			String deletePath = cp + "/cabin/shop/all_delete.gos";
			req.setAttribute("imagePath", imagePath);
			req.setAttribute("deletePath", deletePath);

			url = "/product/productList.jsp";
			forward(req, resp, url);

		}

	}
}