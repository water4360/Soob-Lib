<%@ page import="book.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String isbn = request.getParameter("isbn");
boolean result = false;

//사용자가 값을 제대로 입력했을때
if (isbn != null) {
	BookDAO dao = new BookDAO();
	if(dao.searchOneBook(isbn)!=null) {
		result = true;
	}
}
%>
<%=result %>