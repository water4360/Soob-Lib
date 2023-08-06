package controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.PostDAO;
import board.PostVO;
import controller.BaseController;

public class ModifyPostController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
//		int hit = Integer.parseInt(request.getParameter("hit"));

		PostVO post = new PostVO(no, title, content);

		new PostDAO().modifyPost(post);
		return "redirect:board.do";
	}

}
