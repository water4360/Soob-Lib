package controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.BookDAO;
import book.BookVO;
import controller.BaseController;

public class AllBooksController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
//		System.out.println("전체 도서 조회");
		BookDAO dao = new BookDAO();
		
		List<BookVO> bookList = dao.showAllBooks();
		
		request.setAttribute("bookList", bookList);
		
		return "./jsp/book/allBooks.jsp";
	}

}
