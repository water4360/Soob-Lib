package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.PostDAO;
import board.PostVO;

public class MainController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		PostDAO dao = new PostDAO();

		List<PostVO> postList = dao.getAllPosts();
		request.setAttribute("board", postList);

		return "index.jsp";
	}
}
