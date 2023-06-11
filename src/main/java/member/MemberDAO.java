package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import common.ConnectionFactory;

public class MemberDAO {
	// 샘플용
//			INSERT INTO MEMBER(MEM_NO, ID, PW, NAME, PHONE, RENTAL_STATUS, RENTAL_NO)
//	        VALUES(SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?) ;

	// 1. DB에 회원정보 추가하는 메소드
	public void addMember(MemberVO vo) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO MEMBER(MEM_NO, ID, PW, NAME, PHONE, EMAIL) ");
		sql.append("			VALUES(SEQ_MEMBER_NO.NEXTVAL, ?, ?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone());
			pstmt.setString(5, vo.getEmail());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 0.회원가입/로그인1단계-ID 중복 검색하는 메소드.
	public boolean isDuplicatedId(String id) {

//			MemberVO mem = null;

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT INSTR(ID, ?), ID FROM MEMBER ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();

			// 쿼리를 실행하고 결과가 있으면
			while (rs.next()) {
				// 입력받은 문자와 비교하고 같으면 true
				if (rs.getString("ID").equalsIgnoreCase(id))
					return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 다르면 false 반환
		return false;
	}

	// 0. 로그인2단계-ID&PW 둘다일치 확인하는 메소드.
	public boolean isCorrectInfo(String id, String pw) {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM MEMBER WHERE ID = ? AND PW = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			ResultSet rs = pstmt.executeQuery();
			// 쿼리를 실행하고 정보가 둘 다 일치하면
			while (rs.next()) {
				if (rs.getString("ID").equalsIgnoreCase(id) && rs.getString("PW").equals(pw))
					return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 다르면 false 반환
		return false;
	}

	// 0. 아이디, 비밀번호로 회원번호 찾기.
	public int getMemberCode(String id, String pw) {

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT ID, PW, MEM_CODE FROM MEMBER WHERE ID = ? ");
		sql.append(" AND PW = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, id);
			pstmt.setString(2, pw);

			ResultSet rs = pstmt.executeQuery();

			// 쿼리를 실행하고 정보가 둘 다 일치하면
			while (rs.next()) {
				if ((rs.getString("ID").equalsIgnoreCase(id)) && (rs.getString("PW").equals(pw)))
					return rs.getInt("MEM_CODE");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// 다르면 false 반환
		return 0;
	}

	// ID로 회원정보 뽑아오기
	public MemberVO getMemberById(String userId) {
		StringBuilder sql = new StringBuilder();
		MemberVO mem = null;

		sql.append("SELECT * FROM MEMBER WHERE ID = ? ");
		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, userId);

			ResultSet rs = pstmt.executeQuery();

			// ID가 존재하면 쿼리를 실행하고
			if (rs.next()) {
				int memNo = rs.getInt("MEM_NO");
				int memCode = rs.getInt("MEM_CODE");
				String id = rs.getString("ID");
				String pw = rs.getString("PW");
				String name = rs.getString("NAME");
				String phone = rs.getString("PHONE");
				String email = rs.getString("EMAIL");
				Date date = rs.getDate("REG_DATE");

				mem = new MemberVO(memNo, memCode, id, pw, name, phone, email, date);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return mem;
	}

	// 1. 저장된 모든 멤버VO리스트를 보여주는 메소드
	public List<MemberVO> getAllMembers() {
		List<MemberVO> memList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM MEMBER ORDER BY MEM_NO");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {

				int memNo = rs.getInt("MEM_NO");
				int memCode = rs.getInt("MEM_CODE");
				String id = rs.getString("ID");
				String pw = rs.getString("PW");
				String name = rs.getString("NAME");
				String phone = rs.getString("PHONE");
				String email = rs.getString("EMAIL");
				Date date = rs.getDate("REG_DATE");

				MemberVO mem = new MemberVO(memNo, memCode, id, pw, name, phone, email, date);

				memList.add(mem);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return memList;
	}

	// 이름이랑 폰번호로 비밀번호 찾기
	public String findIdByPhone(String name, String phone) {
		StringBuilder sql = new StringBuilder();
		String id = "";
		sql.append("SELECT ID FROM MEMBER WHERE NAME=? AND PHONE=? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, name);
			pstmt.setString(2, phone);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				id = rs.getString("ID");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}

	// id랑 폰번호로 비밀번호 찾기
	public String findPwByPhone(String id, String phone) {
		StringBuilder sql = new StringBuilder();
		String pw = "";
		sql.append("SELECT PW FROM MEMBER WHERE ID =? AND PHONE=? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, id);
			pstmt.setString(2, phone);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				pw = rs.getString("PW");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pw;
	}

	// isCorrectInfo랑 같이 쓸 것.
	// id랑 비밀번호가 일치하면 -> 비밀번호 변경하기
	public MemberVO changePw(String userId, String newPw) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE PW FROM MEMBER WHERE ID =? AND PW=? ");
		int result = 0;

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, userId);
			pstmt.setString(2, newPw);

			result = pstmt.executeUpdate();
		} catch (

		Exception e) {
			e.printStackTrace();
		}

		if (result != 0) {
		MemberVO vo = null;
		sql = new StringBuilder();
		sql.append("SELECT * FROM MEMBER WHERE ID =? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, userId);

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int memNo = rs.getInt("MEM_NO");
				int memCode = rs.getInt("MEM_CODE");
				String id = rs.getString("ID");
				String pw = rs.getString("PW");
				String name = rs.getString("NAME");
				String phone = rs.getString("PHONE");
				String email = rs.getString("EMAIL");
				Date date = rs.getDate("REG_DATE");
				
				//새로운 정보로 업데이트
				vo = new MemberVO(memNo, memCode, id, pw, name, phone, email, date);
			}
		} catch (

		Exception e) {
			e.printStackTrace();
		}
			//업데이트 된 회원정보 반환
			return vo;
		}

		return null;
	}

}// end of class
