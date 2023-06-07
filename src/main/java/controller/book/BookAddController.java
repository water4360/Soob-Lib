package controller.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;

public class BookAddController extends BaseController {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		return "add-book.do";
	}

}
