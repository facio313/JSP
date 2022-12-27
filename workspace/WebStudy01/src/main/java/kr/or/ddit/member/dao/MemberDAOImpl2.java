package kr.or.ddit.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.db.ConnectionFactory;
import kr.or.ddit.vo.MemberVO;

public class MemberDAOImpl2 extends AbstractJDBCDAO implements MemberDAO {

	@Override
	public int insertMember(MemberVO member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void queryParameterSetting(PreparedStatement pstmt, Object... param) {

	}

	@Override
	public <T> T resultBindingForOneRecord(ResultSet rs, Class<T> resultType) {
		try {
			T resultObject = resultType.newInstance();
			
			MemberVO member = (MemberVO) resultObject;
			
			member.setMemId(rs.getString("mem_id"));
			member.setMemName(rs.getString("mem_name"));
			member.setMemMail(rs.getString("mem_mail"));
			member.setMemHp(rs.getString("mem_hp"));
			member.setMemAdd1(rs.getString("mem_add1"));
			member.setMemMileage(rs.getInt("mem_mileage"));
			
			return resultObject;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public List<MemberVO> selectMemberList() {
		StringBuffer sql = new StringBuffer();
//		1.
		sql.append(" SELECT                                                                        ");
		sql.append("     MEM_ID,    MEM_PASS,    MEM_NAME,                                         ");
		sql.append("     MEM_REGNO1,    MEM_REGNO2,                                                ");
		sql.append("     TO_CHAR(MEM_BIR, 'YYYY-MM-DD') MEM_BIR,                                   ");
		sql.append("     MEM_ZIP,    MEM_ADD1,    MEM_ADD2,                                        ");
		sql.append("     MEM_HOMETEL,    MEM_COMTEL,    MEM_HP,                                    ");
		sql.append("     MEM_MAIL,    MEM_JOB,    MEM_LIKE,                                        ");
		sql.append("     MEM_MEMORIAL,                                                             ");
		sql.append("     TO_CHAR(MEM_MEMORIALDAY, 'YYYY-MM-DD') MEM_MEMORIALDAY,	MEM_MILEAGE,   ");
		sql.append("     MEM_DELETE                                                                ");
		sql.append(" FROM                                                                          ");
		sql.append("     MEMBER                                                                    ");
		sql.append(" WHERE MEM_ID = ?                                                              ");
		
		return selectList(sql.toString(), MemberVO.class);
	}

	@Override
	public MemberVO selectMember(String memId) {
		StringBuffer sql = new StringBuffer();
//		1.
		
		try (
			Connection conn = ConnectionFactory.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
//			2.
			ResultSet rs = pstmt.executeQuery();
			
//			3.
			
			return null;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
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
