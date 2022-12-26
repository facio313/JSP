package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MemoVO;

public class MemberDAOImpl1 implements MemberDAO {

	@Override
	public int insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberVO> selectMemberList() {
		// sql을 담을 StringBuffer 생성, 한 줄이라 그냥 String해도 될 듯
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from member ");

		try(
			// 만들어둔 ConnectionFactory클래스를 사용해서 DB연결
			Connection conn = ConnectionFactory.getConnection();
			// 쿼리객체
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			// 결과를 담을 ResultSet객체
			ResultSet rs = pstmt.executeQuery();
			// ResultSet에서 나온 결과를 담을 List객체
			List<MemberVO> memberList = new ArrayList<>();
			while (rs.next()) {// ResultSet에는 쿼리결과가 담겨져 있다. 그걸 한 개씩 꺼내서 본다. 
				// 각 row의 회원의 정보를 담을 MemberVO객체
				MemberVO vo = new MemberVO();
				vo.setMemId(rs.getString("mem_id"));
				vo.setMemName(rs.getString("mem_name"));
				vo.setMemMail(rs.getString("mem_mail"));
				vo.setMemHp(rs.getString("mem_hp"));
				vo.setMemAdd1(rs.getString("mem_add1"));
				vo.setMemMileage(rs.getInt("mem_mileage"));
				// 한 명씩 목록에 추가
				memberList.add(vo);
			}
			return memberList;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public MemberVO selectMember(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String memId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
