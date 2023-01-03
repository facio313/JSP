//package kr.or.ddit.memo.dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//
//import kr.or.ddit.db.ConnectionFactory;
//import kr.or.ddit.vo.MemoVO;
//
//public class DataBaseMemoDAOImpl implements MemoDAO {
//	
//	private DataBaseMemoDAOImpl() {
//		super();
//	}
//	
//	private static DataBaseMemoDAOImpl dao;
//
//	public static DataBaseMemoDAOImpl getInstance() {
//		if (dao == null)
//			dao = new DataBaseMemoDAOImpl();
//		return dao;
//	}
//
//	@Override
//	public List<MemoVO> selectMemoList() {
//		StringBuffer sql = new StringBuffer();
//		sql.append(" select * from tbl_memo ");
//
//		try(
//			Connection conn = ConnectionFactory.getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//		){
//			ResultSet rs = pstmt.executeQuery();
//			List<MemoVO> list = new ArrayList<>();
//			while (rs.next()) {
//				MemoVO vo = new MemoVO();	
//				vo.setCode(rs.getInt("code"));
//				vo.setWriter(rs.getString("writer"));
//				vo.setContent(rs.getString("content"));
//				vo.setDate(rs.getString("date"));
//				list.add(vo);
//			}
//			return list;
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//
//	@Override
//	public int insertMemo(MemoVO memo) {
//		StringBuffer sql = new StringBuffer();
//		sql.append(" INSERT INTO tbl_memo ");
//		sql.append(" VALUES ( memo_seq.nextval, ?, ?, sysdate) ");
//		
//		try(
//			Connection conn = ConnectionFactory.getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//		){
//			pstmt.setString(1, memo.getWriter());
//			pstmt.setString(2, memo.getContent());
////			pstmt.setString(3, memo.getDate());
//			
//			int result= pstmt.executeUpdate();
//
//			return result;
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//
//	@Override
//	public int updateMemo(MemoVO memo) {
//		StringBuffer sql = new StringBuffer();
//		sql.append(" UPDATE tbl_memo ");
//		sql.append(" SET writer = ?, content = ?, \"DATE\" = sysdate ");
//		sql.append(" WHERE code = ? ");
//		
//		try(
//			Connection conn = ConnectionFactory.getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//		){
//			pstmt.setString(1, memo.getWriter());
//			pstmt.setString(2, memo.getContent());
////			pstmt.setString(3, memo.getDate());
//			pstmt.setInt(3, memo.getCode());
//			
//			int result= pstmt.executeUpdate();
//
//			return result;
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//
//	@Override
//	public int deleteMemo(int code) {
//		StringBuffer sql = new StringBuffer();
//		sql.append(" DELETE FROM TBL_MEMO WHERE CODE = ? ");
//		
//		try(
//			Connection conn = ConnectionFactory.getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
//		){
//			pstmt.setInt(1, code);
//			
//			int result= pstmt.executeUpdate();
//
//			return result;
//		} catch (SQLException e) {
//			throw new RuntimeException(e);
//		}
//	}
//}
