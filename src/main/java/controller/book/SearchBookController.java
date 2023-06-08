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
			break;
		case "title" :
			bookList = dao.searchBooks(2, keyword);
			break;
		case "author" :
			bookList = dao.searchBooks(3, keyword);
			break;
		case "publisher" :
			bookList = dao.searchBooks(4, keyword);
			break;
		}
		
		request.setAttribute("bookList", bookList);
		
		return "./jsp/searchBook.jsp";
	}

}
