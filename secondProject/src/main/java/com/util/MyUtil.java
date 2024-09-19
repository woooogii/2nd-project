package com.util;

// page ó�� Ŭ����
public class MyUtil {

	// ��ü �������� ����
	public int getPageCount(int numPerPage,int dataCount) { // ��ȯ �ʼ�
		
		int pageCount = 0;
		
		pageCount = dataCount / numPerPage;
		
		if(dataCount % numPerPage !=0) { // ������ ���� ��
			
			pageCount++;
		}
		
		return pageCount;
	}
	
	// ����¡ ó�� �޼ҵ�
	public String pageIndexList(int currentPage,int totalPage,String listUrl) { // (���� ����� ������,��ü ������ ��,����?)
		
		int numPerBlock = 5;
		int currentPageSetup; // ����, ����������
		int page; // for���� i�� ����
		
		StringBuffer sb = new StringBuffer();
		
		if(currentPage==0 || totalPage==0) {
			
			return ""; // ��ȯ�� ��Ʈ���̶� �ΰ� ǥ��
		}
		
		// listUrl�� list.jsp�� �־��(?�� �ִ��� Ȯ��)

		// list.jsp
		// list.jsp?searchKey=name&searchValue=suzi
		if(listUrl.indexOf("?")!=-1) { // ������(����������)
			
			//listUrl = listUrl + "&";
			listUrl += "&";
		}else {
			
			listUrl += "?";
		}
		
		currentPageSetup = (currentPage/numPerBlock)*numPerBlock; // ���� �� ���ϱ�
		
		if(currentPage % numPerBlock==0) {
			
			currentPageSetup = currentPageSetup - numPerBlock;
		}
		
		// ������
		if(totalPage > numPerBlock && currentPageSetup > 0) {
			
			sb.append("<a href=\""+listUrl+"pageNum="+currentPageSetup+"\">������</a>&nbsp;");
			//<a href="list.jsp?pafeNum=5">������</a>&nbsp;
		}
		
		// �ٷΰ��� ������
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
		
		// ������
		if(totalPage - currentPageSetup > numPerBlock) { // ũ�� ����
			
			sb.append("<a href=\""+listUrl+"pageNum="+page+"\">������</a>&nbsp;");
			//<a href="list.jsp?pageNum=11">������</a>&nbsp;
		}
		
		return sb.toString();
	}
}
