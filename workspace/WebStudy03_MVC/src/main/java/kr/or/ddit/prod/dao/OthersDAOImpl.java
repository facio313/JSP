package kr.or.ddit.prod.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.mybatis.MybatisUtils;
import kr.or.ddit.vo.BuyerVO;

public class OthersDAOImpl implements OthersDAO {

	private SqlSessionFactory sqlSessionFactory = MybatisUtils.getSqlSessionFactory();

	@Override
	public List<Map<String, Object>> selectLprodList() {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			OthersDAO mapperProxy = sqlSession.getMapper(OthersDAO.class); // 다 똑같이 들어감. 전역화하고 싱글톤으로 만들면?! -> 효율적. => MyBatis Scanner가 이 역할을 함. but spring이랑 연동돼야 함
			return mapperProxy.selectLprodList();
		}
	}

	@Override
	public List<BuyerVO> selectBuyerList(String buyerLgu) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			OthersDAO mapperProxy = sqlSession.getMapper(OthersDAO.class); // 다 똑같이 들어감. 전역화하고 싱글톤으로 만들면?! -> 효율적. => MyBatis Scanner가 이 역할을 함. but spring이랑 연동돼야 함
			return mapperProxy.selectBuyerList(buyerLgu);
		}
	}

}
