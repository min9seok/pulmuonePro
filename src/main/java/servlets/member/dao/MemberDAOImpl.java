package servlets.member.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import servlets.member.dto.MemberDTO;


@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor

public class MemberDAOImpl implements MemberDAO {

	private Connection conn = null;
	
//	int memberNo;
//	String memberId;
//	String pwd;
//	String name;
//	String tel;
//	String email;
//	Date birthdate;
//	String invCode;
//	int interestCode1;
//	int interestCode2;
//	int interestCode3;
//	String naverToken;
//	String kakaoToken;
//	int adApproval;
//	int marketingApproval;
	
	// 1-1. 로그인 용도
	@Override
	public MemberDTO selectOne(String memberId, String pwd) throws SQLException {
		
		String sql = "SELECT * " 
				+ " FROM member "
				+ " WHERE member_id = ? AND pwd = ? ";
		
//		System.out.println(sql);
//		System.out.println(memberId);
//		System.out.println(pwd);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;


		MemberDTO dto = null;

		int memberNo;
		String name;
		String tel;
		String email;
		Date birthdate;
		String invCode;
		int interestCode1;
		int interestCode2;
		int interestCode3;
		String naverToken;
		String kakaoToken;
		int adApproval;
		int marketingApproval;
		Date regDate;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);	
			pstmt.setString(2, pwd);
		
			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					memberNo = rs.getInt("member_no");
					name = rs.getString("name");
					tel = rs.getString("tel");
					email = rs.getString("email");
					birthdate = rs.getDate("birthdate");
					invCode = rs.getString("inv_code");
					interestCode1 = rs.getInt("interest_code1");
					interestCode2 = rs.getInt("interest_code2");
					interestCode3 = rs.getInt("interest_code3");
					naverToken = rs.getString("naver_token");
					kakaoToken = rs.getString("kakao_token");
					adApproval = rs.getInt("ad_approval");
					marketingApproval = rs.getInt("marketing_approval");
					regDate = rs.getDate("reg_date");
					
					dto = MemberDTO.builder().memberNo(memberNo)
											.name(name)
											.tel(tel)
											.email(email)
											.birthDate(birthdate)
											.invCode(invCode)
											.interestCode1(interestCode1)
											.interestCode2(interestCode2)
											.interestCode3(interestCode3)
											.naverToken(naverToken)
											.kakaoToken(kakaoToken)
											.adApproval(adApproval)
											.marketingApproval(marketingApproval)
											.regDate(regDate)
											.build();
				} while (rs.next());
				
			} else {
				System.err.println("[Warn] MemberDAOImpl_selectOne : Invaild memberId / pwd");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		return dto;
	}

	// 1-2. NICE 인증 대체용
	@Override
	public MemberDTO selectOne(String name, String tel, Date birthDate) throws SQLException {
		
		String sql = "SELECT * " 
				+ " FROM member "
				+ " WHERE name = ? AND tel = ?  AND birthdate = ? ";
		
		System.out.println(sql);
		System.out.println(name);
		System.out.println(tel);
		System.out.println(birthDate);
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		
		MemberDTO dto = null;

		String memberId;
		Date regDate;


		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);	
			pstmt.setString(2, tel);
			pstmt.setDate(3, birthDate);
		
			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					memberId = rs.getString("member_id");
					regDate = rs.getDate("reg_date");
					
					
					dto = MemberDTO.builder().memberId(memberId).regDate(regDate)
							.build();
				} while (rs.next());
				
			} else {
				System.err.println("[Warn] MemberDAOImpl_selectOne : Invaild name / tel / birthDate");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		return dto;
	}

	// 1-3. 아이디 존재 여부 체크용
	@Override
	public MemberDTO selectOne(String memberId) throws SQLException {
	
		String sql = "SELECT * " 
				+ " FROM member "
				+ " WHERE member_id = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberDTO dto = null;
		int memberNo;
		String tel;
		String email;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);	
		
			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					memberNo = rs.getInt("member_no");
					tel = rs.getString("tel");
					email = rs.getString("email");
										
					dto = MemberDTO.builder().memberNo(memberNo).tel(tel).email(email)
							.build();

				} while (rs.next());
				
			} else {
				System.err.println("[Warn] MemberDAOImpl_selectOne : Invaild memberId");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		return dto;
	}
	
	@Override
	public MemberDTO selectOneWithInvCode(String invCode) throws SQLException {
	
		String sql = "SELECT * " 
				+ " FROM member "
				+ " WHERE inv_code = ? ";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		MemberDTO dto = null;
		
		int memberNo;
		String memberId;
		String name;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, invCode);	
		
			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					memberNo = rs.getInt("member_no");
					memberId = rs.getString("member_id");
					name = rs.getString("name");

										
					dto = MemberDTO.builder().memberNo(memberNo).memberId(memberId).name(name)
							.build();

				} while (rs.next());
				
			} else {
				System.err.println("[Warn] MemberDAOImpl_selectOneWithInvCode : Invaild invCode");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		return dto;
	}
	
	@Override
	public int insert(MemberDTO dto) throws SQLException {
		int rowCount = 0;

		String sql = "INSERT INTO member(member_no, member_id, pwd, name, tel, email, birthdate, inv_code, ad_approval, marketing_approval) "
				+ " VALUES ( seq_member.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
		PreparedStatement pstmt = null;

		try {
			pstmt = this.conn.prepareStatement(sql);

			pstmt.setString(1, dto.getMemberId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setDate(6, dto.getBirthDate());
			pstmt.setString(7, dto.getInvCode());
			pstmt.setInt(8, dto.getAdApproval());
			pstmt.setInt(9, dto.getMarketingApproval());
//			pstmt.setInt(8, dto.getInterestCode1());
//			pstmt.setInt(9, dto.getInterestCode2());
//			pstmt.setInt(10, dto.getInterestCode3());
//			pstmt.setString(11, dto.getNaverToken());
//			pstmt.setString(12, dto.getKakaoToken());
//			pstmt.setDate(15, dto.getRegDate());

			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("MemberDAOImpl_insert : Exception");
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return rowCount;


	}
	
	@Override
	public int updatePwd(int memberNo, String newPwd) throws SQLException {
		int rowCount = 0;

		String sql = "UPDATE member "
					+ "SET pwd = ? "
					+ "WHERE member_no = ? ";
		PreparedStatement pstmt = null;

		try {
			pstmt = this.conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setInt(2, memberNo);

			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("MemberDAOImpl_updatePwd : Exception");
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return rowCount;
	}
	
	@Override
	public int delete(int memberNo) throws SQLException {
		int rowCount = 0;

		String sql = "DELETE FROM member "
					+ "WHERE member_no = ? ";
		PreparedStatement pstmt = null;

		try {
			pstmt = this.conn.prepareStatement(sql);

			pstmt.setInt(1, memberNo);

			rowCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("MemberDAOImpl_delete : Exception");
			e.printStackTrace();
		} finally {
			pstmt.close();
		}

		return rowCount;
	}









}
