<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<%



	// 헤더 추가하기
	response.addHeader("apiKey", "a2dkrk") ;

	// 헤더값 변경하기
	response.setHeader("apiKey", "112233") ;
	
	// 헤더값을 정수값으로 변경하기
	response.setIntHeader("apiKey", 25) ;





	// 헤더 전체정보 보기
	Enumeration<String> em = request.getHeaderNames();

	while(em.hasMoreElements()){
		String name = em.nextElement() ;
		String val = request.getHeader(name) ;
		
		out.println(name + " : " + val) ;
	}

	
	
	// 이전 접속 페이지 가져오기
	String h_referer = request.getHeader("referer") ;
	
	// 사용자의 브라우저 확인
	String h_agent = request.getHeader("User-Agent") ;
	

%>
