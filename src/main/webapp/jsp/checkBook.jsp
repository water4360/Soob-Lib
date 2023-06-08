<%@page import="java.util.List"%>
<%@ page import="book.BookDAO"%>
<%@ page import="book.BookVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
String keyword = request.getParameter("searchKeyword");
List<BookVO> result = null;

//사용자가 값을 제대로 입력했을때
if (keyword != null) {
	BookDAO dao = new BookDAO();
	result = dao.searchBooks(2, keyword);
}
%>
<%=result%>