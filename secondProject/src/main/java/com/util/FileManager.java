package com.util;

import java.io.*;

import javax.servlet.http.HttpServletResponse;

public class FileManager {
	
	public static boolean doFileDownload(HttpServletResponse response,String saveFileName,String originalFileName,String path){
		
		try {
			String filePath = path + File.separator + saveFileName;
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1");
			
			File f= new File(filePath);
			if(!f.exists()){
				return false;
			}
			
			response.setContentType("application/octet-stream");
			response.setHeader("Content-disposition", "attachment;fileName="+originalFileName);
			
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(f));
			
			OutputStream out = response.getOutputStream();
			int data;
			byte buffer[] = new byte[4096];
			
			while((data=bis.read(buffer,0,4096))!=-1) {
				out.write(buffer,0,data);
			}
			out.flush();
			out.close();
			bis.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return false;
	}
	
	public static void doFileDelete(String fileName,String path) {
		
		try {
			String filePath = path + File.separator+fileName;
			File f = new File(filePath);
			
			if(f.exists()) {
				f.delete();
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		
	}
}
