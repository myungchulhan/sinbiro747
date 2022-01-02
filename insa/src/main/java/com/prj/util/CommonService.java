package com.prj.util;

import java.net.URL;

import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

@Service
public class CommonService {
	public void sendEmail(String email, String subject, String filePath, HttpSession session) {
		//1. 기본 이메일 전송 처리
		//sendSimple(email, subject);
		
		//2. 첨부 파일 있는 이메일 전송 처리
		//session이 있어야 파일 첨부가 가능
		sendAttach(email, subject, filePath, session);
		
		//3. HTML 태그 이메일 전송 처리
		//sendHtml(email, subject, session);
	};
	
	private void sendSimple(String email, String subject) {
		SimpleEmail mail = new SimpleEmail();
		
		mail.setHostName("smtp.naver.com");	//메일 전송 서버 지정, 네이버 메일 - 환경설정 - pop3 설정
		mail.setCharset("utf-8"); //인코딩 설정
		mail.setDebug(true); //메일 전송 과정 추적해서 콘솔에 띄워줌
		
		mail.setAuthentication("sinbiro747", "kycipass7.."); //로그인하기 위해 정보 입력
		mail.setSSLOnConnect(true); //입력한 정보로 로그인 요청
		
		try {
			mail.setFrom("sinbiro747@naver.com", "관리자");	//보내는 사람 메일 / 이름 설정
			mail.addTo(email, "관리자"); //받는 사람 메일 / 이름, 회원가입 페이지에에서 가져온다.
		//	mail.addTo("받을 메일", "수신자"); //복수의 사람 지정 가능
			mail.setSubject(subject); //메일 제목
			mail.setMsg("술좀 먹지말아라"); //메일 내용
			System.out.println("메일주소잘가나요" );
			mail.send(); //메일 발송 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	private void sendAttach(String email, String subject, String filePath,  HttpSession session) {
		MultiPartEmail mail = new MultiPartEmail();
		
		mail.setHostName("smtp.naver.com");	//메일 전송 서버 지정, 네이버 메일 - 환경설정 - pop3 설정
		mail.setCharset("utf-8"); //인코딩 설정
		mail.setDebug(true); //메일 전송 과정 추적해서 콘솔에 띄워줌
		
		mail.setAuthentication("sinbiro747", "kycipass7.."); //로그인하기 위해 정보 입력
		mail.setSSLOnConnect(true); //입력한 정보로 로그인 요청
		
		try {
			mail.setFrom("sinbiro747@naver.com", "관리자");	//보내는 사람 메일 / 이름 설정
			mail.addTo(email, "관리자"); //받는 사람 메일 / 이름, 회원가입 페이지에에서 가져온다.
		//	mail.addTo("받을 메일", "수신자"); //복수의 사람 지정 가능
			
			mail.setSubject(subject); //메일 제목
			mail.setMsg("술좀 먹지말아라"); //메일 내용
			System.out.println("메일주소잘가나요" );
			
			//파일 첨부하기
			EmailAttachment file = new EmailAttachment();
			
			//① 물리적 디스크내 파일 첨부
			file.setPath(filePath);
			mail.attach(file);
			
			//② 프로젝트 내의 파일 첨부
		//	file = new EmailAttachment();
		//	file.setPath(session.getServletContext().getRealPath("resources/images/logo.png"));
		//	mail.attach(file);
			
			//③ URL을 통해 파일 첨부
		//	file = new EmailAttachment();
		//	file.setURL(new URL("https://mvnrepository.com/assets/images/392dffac024b9632664e6f2c0cac6fe5-logo.png"));
		//	mail.attach(file);
			
			mail.send(); //메일 발송 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	private void sendHtml(String email, String name, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		
		mail.setHostName("smtp.naver.com");	//메일 전송 서버 지정, 네이버 메일 - 환경설정 - pop3 설정
		mail.setCharset("utf-8"); //인코딩 설정
		mail.setDebug(true); //메일 전송 과정 추적해서 콘솔에 띄워줌
		
		mail.setAuthentication("아이디", "비밀번호"); //로그인하기 위해 정보 입력
		mail.setSSLOnConnect(true); //입력한 정보로 로그인 요청
		
		try {
			mail.setFrom("보내는 메일", "관리자");	//보내는 사람 메일 / 이름 설정
			mail.addTo(email, name); //받는 사람 메일 / 이름, 회원가입 페이지에에서 가져온다.
			mail.addTo("받을 메일", "수신자"); //복수의 사람 지정 가능
			
			mail.setSubject("HTML 메일 테스트");
			
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<a href='https://mvnrepository.com'><img src='https://mvnrepository.com/assets/images/392dffac024b9632664e6f2c0cac6fe5-logo.png' /></a>");
			msg.append("<hr>");
			msg.append("<h3>HTML 메일 테스트</h3>");
			msg.append("<p>가입을 축하드립니다.</p>");
			msg.append("<p>HTML 메일 테스트</p>");
			msg.append("</body>");
			msg.append("</html>");
			mail.setHtmlMsg(msg.toString());
			
			EmailAttachment file = new EmailAttachment();
			file.setPath(session.getServletContext().getRealPath("resources/css/common.css"));
			mail.attach(file);
			
			file = new EmailAttachment();
			file.setURL(new URL("https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png"));
			mail.attach(file);
			
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}