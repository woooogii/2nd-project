package com.member;

public class MailUtil {

	public static void sendMail(String userEmail, String subject, String msg) throws Exception {
		
		//Mail Server ����
		String charset = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "zlxltn7";
		String hostSMTPpwd = "zlxltntksdhfl68!";
		
		//������ ���
		String fromEmail = "joden@cabin.com";
		String fromName = "Joden";
		/*
		//email ����
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charset);
			mail.setSSLOnConnect(true);
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(465);
			
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.addTo(userEmail);
			mail.setFrom(fromEmail, fromName, charset);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
