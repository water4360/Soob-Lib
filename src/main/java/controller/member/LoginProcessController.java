package controller.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;
import member.MemberDAO;
import member.MemberVO;

public class LoginProcessController extends BaseController {
	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// 사용자가 로그인할때 입력한 값을 VO에 담아주기
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);

		MemberDAO dao = new MemberDAO();
		MemberVO mem = null;
		session = request.getSession();

		
		// VO에 담아준 걸로 DAO에서 비교해서 일치하는 사용자 정보 가져온게 mem
		if (dao.isCorrectInfo(id, pw)) {
			mem = dao.getMemberById(id);

			// 그리고 이 mem을 session에 MemberVO형태 고대로 넘겨줌.
			session.setAttribute("loginMember", mem);
			
			System.out.println("회원정보 존재. by LoginController");
			return "main.do";
		} else if (dao.isDuplicatedId(id)) {
			// 아이디는 존재, 비밀번호가 틀린 경우.
			if (!dao.isCorrectInfo(id, pw)) {
				request.setAttribute("loginFeedback", "비밀번호가 일치하지 않아요");
				return "login.do";
			}
		} else {
			// 아이디없고, 비번도 안맞겠지...
			request.setAttribute("loginFeedback", "일치하는 회원이 없어요");
			return "login.do";
		}
		return "main.do";
	}
}
