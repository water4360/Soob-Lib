package controller.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;
import controller.Controller;
import member.MemberDAO;

public class FindInfoProcessController extends BaseController {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		
		String searchId = request.getParameter("findId");
		String searchPw = request.getParameter("findPw");
		String msg = "";
		
		MemberDAO dao = new MemberDAO();
		
		//확인용
		System.out.println("name : "+name);
		System.out.println("id : "+id);
		System.out.println("phone : "+phone);
		System.out.println("searchId : "+searchId);
		System.out.println("searchPw : "+searchPw);
		
		//아이디찾기 일때(이름/폰번호)
		if(searchId!=null && name!=null && phone!=null) {
			msg = dao.findIdByPhone(name, phone);
			System.out.println("id검색결과 : " + msg);
			request.setAttribute("findInfo", "아이디");
			//찾은 게 없으면
			if(msg=="") {
				msg = "일치하는 회원 정보가 없어요.";
				System.out.println("msg : " + msg);
				request.setAttribute("findIdResult", msg);
				return "findId.do";
			} else {
				//있으면
				request.setAttribute("findIdResult", msg);
				System.out.println("msg : " + msg);
				return "./jsp/member/findInfoResult.jsp";
			}
			//비번찾기(아이디/폰번호)
		} else if(searchPw!=null && id!=null && phone!=null) {
			msg = dao.findPwByPhone(id, phone);
			System.out.println("pw검색결과 : " + msg);
			request.setAttribute("findInfo", "비밀번호");
			//찾은 게 없으면
			if(msg=="") {
				msg = "일치하는 회원 정보가 없어요.";
				System.out.println("msg : " + msg);
				request.setAttribute("findPwResult", msg);
				return "findPw.do";
			} else {
				//있으면
				request.setAttribute("findPwResult", msg);
				System.out.println("msg : " + msg);
				return "./jsp/member/findInfoResult.jsp";
			}
		}
		System.out.println("딴길로 샘");
		return null;
	}

}
