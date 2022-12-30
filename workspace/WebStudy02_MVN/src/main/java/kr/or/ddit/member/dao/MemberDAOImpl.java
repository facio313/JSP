package kr.or.ddit.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.mybatis.MybatisUtils;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;

public class MemberDAOImpl implements MemberDAO {
	
	private SqlSessionFactory sqlSessionFactory = MybatisUtils.getSqlSessionFactory();

	@Override
	public int insertMember(MemberVO member) {
		try (
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				MemberDAO mapperProxy = sqlSession.getMapper(MemberDAO.class);
				int rowcnt = mapperProxy.insertMember(member);
				sqlSession.commit();
				return rowcnt;
			}
	}
	
	@Override
	public int selectTotalRecord(PagingVO<MemberVO> pagingVO) { // 전체 조회와 한 세트
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			MemberDAO mapperProxy = sqlSession.getMapper(MemberDAO.class); // 다 똑같이 들어감. 전역화하고 싱글톤으로 만들면?! -> 효율적. => MyBatis Scanner가 이 역할을 함. but spring이랑 연동돼야 함
			return mapperProxy.selectTotalRecord(pagingVO);
		}
	}

	@Override
	public List<MemberVO> selectMemberList(PagingVO<MemberVO> pagingVO) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			MemberDAO mapperProxy = sqlSession.getMapper(MemberDAO.class); // 다 똑같이 들어감. 전역화하고 싱글톤으로 만들면?! -> 효율적. => MyBatis Scanner가 이 역할을 함. but spring이랑 연동돼야 함
			return mapperProxy.selectMemberList(pagingVO);
		}
	}

	@Override
	   public MemberVO selectMember(String memId) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			MemberDAO mapperProxy = sqlSession.getMapper(MemberDAO.class);
			return mapperProxy.selectMember(memId);
		}
	}

	@Override
	public int updateMember(MemberVO member) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession();			
		){
			MemberDAO mapperProxy = sqlSession.getMapper(MemberDAO.class);
			int rowcnt = mapperProxy.updateMember(member);
			sqlSession.commit();
			return rowcnt;
		}
	}

	@Override
	public int deleteMember(String memId) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession();	
		){
			MemberDAO mapperProxy = sqlSession.getMapper(MemberDAO.class);
			int rowcnt = mapperProxy.deleteMember(memId);
			sqlSession.commit();
			return rowcnt;
		}
	}

}
