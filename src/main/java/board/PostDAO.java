package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.ConnectionFactory;

public class PostDAO {

	/**
	 * 게시판 등록/수정/삭제/답글관련
	 * 
	 * @param PostVO
	 */

	// 1. DB에 도서 등록
	public void addPost(PostVO post) {
		int idx = 1;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO L_BOARD(NO, WRITER, TITLE, CONTENT) ");
		sql.append(" 		VALUES(SEQ_L_BOARD_NO.NEXTVAL, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(idx++, post.getWriter());
			pstmt.setString(idx++, post.getTitle());
			pstmt.setString(idx++, post.getContent());

			if (pstmt.executeUpdate() == 0) {
				System.out.println("postDAO, 게시글 등록 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 2. 모든 리스트
	public List<PostVO> getAllPosts() {
		List<PostVO> postList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM L_BOARD ORDER BY NO DESC");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				int no = rs.getInt("NO");
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String regDate = rs.getString("REG_DATE");
				int hit = rs.getInt("HIT");
//				int replyCnt = rs.getInt("REPLYCNT");
				int ref = rs.getInt("REF");
				int lev = rs.getInt("LEV");
				int step = rs.getInt("STEP");

//				PostVO post = new PostVO(no, writer, title, content, regDate, hit, replyCnt, ref, lev, step);
				PostVO post = new PostVO(no, writer, title, content, regDate, hit, 0, ref, lev, step);
				postList.add(post);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return postList;
	}

//	// 3. 관리번호로 검색
//	public BookVO searchOneBook(String manageNo) {
//
//		BookVO book = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT * FROM BOOKLIST ");
//		sql.append(" WHERE NO = ? ");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//
//			pstmt.setString(1, manageNo);
//			ResultSet rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				String no = rs.getString("NO");
//				String title = rs.getString("TITLE");
//				String author = rs.getString("AUTHOR");
//				String publisher = rs.getString("PUBLISHER");
//				int status = rs.getInt("STATUS");
//				int pop = rs.getInt("POP");
//
//				book = new BookVO(no, title, author, publisher, status, pop);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		return book;
//	}
//
//	// 관리번호로 찾아서 삭제
//	public BookVO deleteBook(String manageNo) {
//
//		BookVO book = null;
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("DELETE FROM BOOKLIST ");
//		sql.append("	WHERE NO = ? ");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			// 물음표 자리에 매개변수로 들어오는 int를 날려~
//			pstmt.setString(1, manageNo);
//			pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return book;
//	}
//	
//	
//	
//	//혹시 대출중인지 확인
//	public boolean isRented(String no) {
//		int result = 0;
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT 1 FROM RENTAL WHERE NO=? ");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			// 물음표 자리에 매개변수로 들어오는 int를 날려~
//			pstmt.setString(1, no);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				result = rs.getInt("1");
//			}
//			
//			//대출중이라는 뜻
//			if(result==1) {
//				return true;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return false;
//		
//				
//	}
//
//	
//	
//	
//	
//	
//	
//	
//	// 4. 다중 수정!!!! 타이틀/저자/출판사
//	public BookVO modifyBook(int menu, String manageNo, String str) {
//		BookVO book = null;
//		StringBuilder sql = new StringBuilder();
//
//		switch (menu) {
//		case 1: // 타이틀 수정
//			sql.append("UPDATE BOOKLIST SET TITLE = ? ");
//			sql.append(" WHERE NO = ? ");
//			break;
//		case 2: // 저자
//			sql.append("UPDATE BOOKLIST SET AUTHOR = ? ");
//			sql.append(" WHERE NO = ? ");
//			break;
//		case 3: // 출판사
//			sql.append("UPDATE BOOKLIST SET PUBLISHER = ? ");
//			sql.append(" WHERE NO = ? ");
//			break;
//		}
//
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, str);
//			pstmt.setString(2, manageNo);
//
//			pstmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return book;
//	}
//
//	// 3-2 다중 검색!!!! 1=통합 2=제목 3=저자 4=출판사
//	public List<BookVO> searchBooks(int menu, String str) {
//		List<BookVO> bookList = new ArrayList<>();
//
//		switch (menu) {
//		case 1:
//			bookList = this.searchBook(str);
//			break;
//		case 2:
//			bookList = this.searchBookByTitle(str);
//			break;
//		case 3:
//			bookList = this.searchBookByAuthor(str);
//			break;
//		case 4:
//			bookList = this.searchBookByPublisher(str);
//			break;
//		}
//		return bookList;
//	}
//
//	// 통합검색
//	public List<BookVO> searchBook(String str) {
//		List<BookVO> bookList = new ArrayList<>();
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT INSTR((NO || TITLE || AUTHOR || PUBLISHER), ?) AS SEARCH_BOOK, ");
//		sql.append("NO, TITLE, AUTHOR, PUBLISHER, STATUS, POP FROM BOOKLIST ");
//		sql.append("WHERE INSTR((NO || TITLE || AUTHOR || PUBLISHER), ?) != 0 ");
//		sql.append("ORDER BY NO ");
//		
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, str);
//			pstmt.setString(2, str);
////			System.out.println("sql 잘 들어왔니? " + sql);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				String no = rs.getString("NO");
//				String title = rs.getString("TITLE");
//				String author = rs.getString("AUTHOR");
//				String publisher = rs.getString("PUBLISHER");
//				int status = rs.getInt("STATUS");
//				int pop = rs.getInt("POP");
//				
//				BookVO book = new BookVO(no, title, author, publisher, status, pop);
//				bookList.add(book);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return bookList;
//	}
//	
//	
//
//	// 제목검색
//	public List<BookVO> searchBookByTitle(String str) {
//		List<BookVO> bookList = new ArrayList<>();
//
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT * FROM BOOKLIST WHERE INSTR(TITLE, ?) != 0 ");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, str);
//			ResultSet rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				String no = rs.getString("NO");
//				String title = rs.getString("TITLE");
//				String author = rs.getString("AUTHOR");
//				String publisher = rs.getString("PUBLISHER");
//				int status = rs.getInt("STATUS");
//				int pop = rs.getInt("POP");
//
//				BookVO book = new BookVO(no, title, author, publisher, status, pop);
//				bookList.add(book);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return bookList;
//	}
//	
//	// 저자검색
//	public List<BookVO> searchBookByAuthor(String str) {
//		List<BookVO> bookList = new ArrayList<>();
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT * FROM BOOKLIST WHERE INSTR(AUTHOR, ?) != 0 ");
//		
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, str);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				String no = rs.getString("NO");
//				String title = rs.getString("TITLE");
//				String author = rs.getString("AUTHOR");
//				String publisher = rs.getString("PUBLISHER");
//				int status = rs.getInt("STATUS");
//				int pop = rs.getInt("POP");
//				
//				BookVO book = new BookVO(no, title, author, publisher, status, pop);
//				bookList.add(book);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return bookList;
//	}
//	// 출판사 검색
//	public List<BookVO> searchBookByPublisher(String str) {
//		List<BookVO> bookList = new ArrayList<>();
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT * FROM BOOKLIST WHERE INSTR(PUBLISHER, ?) != 0 ");
//		
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, str);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				String no = rs.getString("NO");
//				String title = rs.getString("TITLE");
//				String author = rs.getString("AUTHOR");
//				String publisher = rs.getString("PUBLISHER");
//				int status = rs.getInt("STATUS");
//				int pop = rs.getInt("POP");
//				
//				BookVO book = new BookVO(no, title, author, publisher, status, pop);
//				bookList.add(book);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return bookList;
//	}
//	
//	
//	
//	
//	
//	
//	
//	
//	
//
//	// 도서번호로 도서명 가져오기
//	public String getTitle(String bookNo) {
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT TITLE FROM BOOKLIST WHERE NO = ?");
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, bookNo);
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next())
//				return rs.getString(1);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "";
//	}
//
//	// 도서번호로 저자명 가져오기
//	public String getAuthor(String bookNo) {
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT AUTHOR FROM BOOKLIST WHERE NO = ?");
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, bookNo);
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next())
//				return rs.getString(1);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "";
//	}
//
//	// 도서번호로 출판사 가져오기
//	public String getPublisher(String bookNo) {
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT PUBLISHER FROM BOOKLIST WHERE NO = ?");
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setString(1, bookNo);
//			ResultSet rs = pstmt.executeQuery();
//			if (rs.next())
//				return rs.getString(1);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "";
//	}
//
//	// 대출 또는 반납시 상태코드 변경
//	public void changeStatus(int status, String bookNo) {
//		StringBuilder sql = new StringBuilder();
//		sql.append("UPDATE BOOKLIST SET STATUS = ? ");
//		sql.append(" WHERE NO = ? ");
//
//		try (Connection conn = new ConnectionFactory().getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
//			pstmt.setInt(1, status);
//			pstmt.setString(2, bookNo);
//
//			if (pstmt.executeUpdate() == 0) {
//				System.out.println("여기는 BookDAO, changeStatus 반영안됨");
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}

}// end of class
