package member;

import java.util.Date;

public class MemberVO {
	
	//회원번호(자동생성), 멤버코드(회원1, 관리자9) ID, PW, 이름, 폰번호
	//CREATE SEQUENCE SEQ_MEMBER_NO START WITH 000001 NOCACHE;
	private int memberNo;
	private int memberCode;
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private Date regDate;

	
	public MemberVO() {
		super();
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int MemberCode) {
		this.memberCode = MemberCode;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}



	//회원조회용
	public MemberVO(int no, int code, String id, String pw, String name, String phone, String email, Date regDate) {
		super();
		this.memberNo = no;
		this.memberCode = code;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.regDate = regDate;
	}
	
	//멤버코드 추가된 DB생성용
	public MemberVO(int no, int code, String id, String pw, String name, String phone, String email) {
		super();
		this.memberNo = no;
		this.memberCode = code;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}
	
	//회원가입용
	public MemberVO(String id, String pw, String name, String phone, String email) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNo=" + memberNo + ", memberCode=" + memberCode + ", id=" + id + ", pw=" + pw + ", name="
				+ name + ", phone=" + phone + ", email=" + email + ", regDate=" + regDate + "]";
	}

}
