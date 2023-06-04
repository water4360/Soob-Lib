package common;

import member.MemberDAO;

public class MemberService {

	/*
	 * 기존 memDao 정보를 유지하기 위해서 서비스 생성.
	 * 각각의 컨트롤러?의 기본 생성자에서
	 * mem서비스 = mem서비스팩토리.newInstance로 부르면
	 * mem서비스.메소드명으로 사용가능!
	 */
	private MemberDAO memDao;

	public MemberService() {
		memDao = new MemberDAO();
	}

	// 0. ID 중복 체크 메소드
	public boolean isDuplicated(String id) {
		return memDao.isDuplicatedId(id);
	}

	// ID, PW 둘 다 일치하는지 확인하는 메소드
	public boolean isCorrectInfo(String id, String pw) {
		return memDao.isCorrectInfo(id, pw);
	}

}
