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
		sql.append("SELECT NO, WRITER, TITLE, CONTENT, TO_CHAR(REG_DATE, 'yy-mm-dd') REG_DATE ");
		sql.append(" , HIT, REF, LEV, STEP FROM L_BOARD ORDER BY NO DESC ");

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

	public PostVO getPostDetail(int postNo) {
		PostVO post = new PostVO();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * FROM L_BOARD WHERE NO = ? ");
		
		try(
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			
			pstmt.setInt(1, postNo);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("NO");
				String writer = rs.getString("WRITER");
				String title = rs.getString("TITLE");
				String content = rs.getString("CONTENT");
				String regDate = rs.getString("REG_DATE");
				int hit = rs.getInt("HIT");
				int ref = rs.getInt("REF");
				int lev = rs.getInt("LEV");
				int step = rs.getInt("STEP");

				post = new PostVO(no, writer, title, content, regDate, hit, ref, lev, step);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return post;
	}

	public void deletePost(int no) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM L_BOARD WHERE NO = ? ");

		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {

			pstmt.setInt(1, no);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시글 수정용
	public void modifyPost(PostVO post) {
		int idx = 1;
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE L_BOARD SET TITLE = ?, CONTENT = ? WHERE NO = ? ");

		try (
			 Connection conn = new ConnectionFactory().getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(idx++, post.getTitle());
			pstmt.setString(idx++, post.getContent());
			pstmt.setInt(idx++, post.getNo());

			if (pstmt.executeUpdate() == 0) {
				System.out.println("postDAO, 게시글 수정 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
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


}// end of class
