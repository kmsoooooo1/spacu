package com.wework.email;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class sendEmail extends Thread{
	
	private String writer = null;
	private String title = null;
	private String emailText = null;
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEmailText() {
		return emailText;
	}
	public void setEmailText(String emailText) {
		this.emailText = emailText;
	}


	@Override
	public void run() {
		// TODO Auto-generated method stub
		try{
			String Text = this.writer+ "\n" + this.emailText;
			
			String sf = "kmsoooooo1@gmail.com";
			String st = "boy1908@naver.com";
			
			Properties p = new Properties();
			p.put("mail.smtp.user", sf);
			p.put("mail.smtp.host", "smtp.gmail.com");
			
			p.put("mail.smtp.port","465");
			
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth","true");
			p.put("mail.smtp.debug", "true");
			
			p.put("mail.smtp.socketFactory.port","465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			
			try{
				Session mailSession = Session.getInstance(p, new Authenticator(){
					protected PasswordAuthentication getPasswordAuthentication(){
						return new PasswordAuthentication("email_id","email_password");
					}
				});
				
				mailSession.setDebug(true);
				
				Message message = new MimeMessage(mailSession);
				message.setFrom(new InternetAddress(sf));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(st));
				
				message.setSubject(this.title);
				
				message.setContent(Text,"text/html;charset=utf-8");
				
				Transport.send(message);
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("Error: unable to send message..." + e.toString());
			}
		}catch(Exception e){
			System.out.println(e.toString());
		}
	}
	
}
