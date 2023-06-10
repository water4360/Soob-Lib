package controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;
import controller.BaseController;

public class SearchBookController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		
		String option = request.getParameter("searchBy");
		
		//사용자 검색어
		String keyword = request.getParameter("searchKeyword");
		BookDAO dao = new BookDAO();
		List<BookVO> bookList = null;
		
		//title, author?
		System.out.println("뭘로 검색? " + option);
		
		switch(option) {
		case "all" :
			bookList = dao.searchBooks(1, keyword);
			option = "통합";
			break;
		case "title" :
			bookList = dao.searchBooks(2, keyword);
			option = "도서명";
			break;
		case "author" :
			bookList = dao.searchBooks(3, keyword);
			option = "저자";
			break;
		case "publisher" :
			bookList = dao.searchBooks(4, keyword);
			option = "출판사";
			break;
		}
		request.setAttribute("bookList", bookList);
		request.setAttribute("searchOption", option);
		
		return "./jsp/book/searchBook.jsp";
	}

}
