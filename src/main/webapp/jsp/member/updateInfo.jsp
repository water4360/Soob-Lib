<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String phone = request.getParameter("phone");
String email = request.getParameter("email");
boolean result = false;

//사용자가 값을 제대로 입력했을때
// if (phone != null && email != null) {
// 	MemberDAO dao = new MemberDAO();
// 	result = dao.updateInfo(phone, email);
// }
%>
<%=result%>