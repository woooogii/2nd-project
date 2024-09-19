package com.util;

// page 처리 클래스
public class MyUtil {

	// 전체 페이지의 개수
	public int getPageCount(int numPerPage,int dataCount) { // 반환 필수
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage !=0) { // 나머지 있을 때
			
			pageCount++;
		}
		
		return pageCount;
	}
	
	// 페이징 처리 메소드
	public String pageIndexList(int currentPage,int totalPage,String listUrl) { // (지금 출력할 페이지,전체 페이지 수,어디다?)
		
		int numPerBlock = 5;
		int currentPageSetup; // 이전, 다음페이지
		int page; // for문의 i와 동일
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			
			return ""; // 반환값 스트링이라 널값 표시
		}
		
		// listUrl에 list.jsp를 넣어둠(?가 있는지 확인)

		// list.jsp
		// list.jsp?searchKey=name&searchValue=suzi
		if(listUrl.indexOf("?")!=-1) { // 있으면(없지않으면)
			
			//listUrl = listUrl + "&";
			listUrl += "&";
		}else {
			
			listUrl += "?";
		}
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; // 이전 값 구하기
		
		if(currentPage % numPerBlock==0) {
			
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		// ◀이전
		if(totalPage > numPerBlock && currentPageSetup > 0) {
			
			sb.append("<a href=\""+listUrl+"pageNum="+currentPageSetup+"\">◀이전</a>&nbsp;");
			//<a href="list.jsp?pafeNum=5">◀이전</a>&nbsp;
		}
		
		// 바로가기 페이지
		page = currentPageSetup +1;
		
		while(page <= totalPage && page <= (currentPageSetup + numPerBlock)) {
			
			if(page == currentPage) {
				
				sb.append("<font color=\"Fuchsia\">"+page+"</font>&nbsp;");
				//<font color="Fuchsia">9</font>&nbsp;
			}else {
				
				sb.append("<a href=\""+listUrl+"pageNum="+page+"\">"+page+"</a>&nbsp;");
				//<a href="list.jsp?psgeNum=2">2</a>&nbsp;
			}
			
			page++;
		}
		
		// 다음▶
		if(totalPage - currentPageSetup > numPerBlock) { // 크면 생성
			
			sb.append("<a href=\""+listUrl+"pageNum="+page+"\">다음▶</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">다음▶</a>&nbsp;
		}
		
		return sb.toString();
	}
}
