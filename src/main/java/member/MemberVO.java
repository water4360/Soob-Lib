package member;

public class MemberVO {
	
	//회원번호(자동생성), 멤버코드(회원1, 관리자9) ID, PW, 이름, 폰번호
	//CREATE SEQUENCE SEQ_MEMBER_NO START WITH 000001 NOCACHE;
	private int memberNo;
	private int memCode;
	private String id;
	private String pw;
	private String userName;
	private String userPhone;
	
	public MemberVO() {
		super();
	}
	
	//멤버코드
	public int getMemCode() {
		return memCode;
	}
	public void setMemCode(int memCode) {
		this.memCode = memCode;
	}

	
	//멤버코드 추가된 생성자
	public MemberVO(int memberNo, int memCode, String id, String pw, String userName, String userPhone) {
		super();
		this.memberNo = memberNo;
		this.memCode = memCode;
		this.id = id;
		this.pw = pw;
		this.userName = userName;
		this.userPhone = userPhone;
	}

	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	//DB생성용
	public MemberVO(int memberNo, String id, String pw, String userName, String userPhone) {
		super();
		this.memberNo = memberNo;
		this.id = id;
		this.pw = pw;
		this.userName = userName;
		this.userPhone = userPhone;
	}
	
	//가입용
	public MemberVO(String id, String pw, String userName, String userPhone) {
		super();
		this.id = id;
		this.pw = pw;
		this.userName = userName;
		this.userPhone = userPhone;
	}




	@Override
	public String toString() {
		System.out.printf("%-10s\t\t%-10s\t\t%s\t\t%s\n",
							id, pw, userName, userPhone);
		return "";
	}
}
