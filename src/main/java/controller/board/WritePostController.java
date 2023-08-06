package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.BaseController;

public class WritePostController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		return "./jsp/board/write-post.jsp";
	}
}
