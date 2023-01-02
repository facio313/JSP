package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.mybatis.MybatisUtils;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;

public class ProdDAOImpl implements ProdDAO {
	
	private SqlSessionFactory sqlSessionFactory = MybatisUtils.getSqlSessionFactory();

	@Override
	public ProdVO selectProd(String prodId) {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession();	
		){
			ProdDAO mapperProxy = sqlSession.getMapper(ProdDAO.class);
			return mapperProxy.selectProd(prodId);
		}
	}

	@Override
	public int selectTotalRecord(PagingVO<ProdVO> pagingVO) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			ProdDAO mapperProxy = sqlSession.getMapper(ProdDAO.class); // 다 똑같이 들어감. 전역화하고 싱글톤으로 만들면?! -> 효율적. => MyBatis Scanner가 이 역할을 함. but spring이랑 연동돼야 함
			return mapperProxy.selectTotalRecord(pagingVO);
		}
	}

	@Override
	public List<ProdVO> selectProdList(PagingVO<ProdVO> pagingVO) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			ProdDAO mapperProxy = sqlSession.getMapper(ProdDAO.class); // 다 똑같이 들어감. 전역화하고 싱글톤으로 만들면?! -> 효율적. => MyBatis Scanner가 이 역할을 함. but spring이랑 연동돼야 함
			return mapperProxy.selectProdList(pagingVO);
		}
	}

}
