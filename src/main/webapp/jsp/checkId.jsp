<%@ page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String id = request.getParameter("id");
boolean result = false;

//사용자가 값을 제대로 입력했을때
if (id != null) {
	MemberDAO memberDAO = new MemberDAO();
	result = memberDAO.isDuplicatedId(id);
}
%>
<%=result%>