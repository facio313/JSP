package kr.or.ddit.memo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kr.or.ddit.mybatis.MybatisUtils;
import kr.or.ddit.vo.MemoVO;

public class MemoDAOImpl implements MemoDAO {

	private SqlSessionFactory sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	// SqlSessionFactory는 싱글톤으로 되는데, SqlSession은 하면 안 됨(사용 범위가 다름)
	
	@Override
	public List<MemoVO> selectMemoList() {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			// mapper(xml)과 Mapper는 1:1관계임. -> qualifiedname과 관련
			MemoDAO mapperProxy = sqlSession.getMapper(MemoDAO.class); // 다 똑같이 들어감. 전역화하고 싱글톤으로 만들면?! -> 효율적. => MyBatis Scanner가 이 역할을 함. but spring이랑 연동돼야 함
			return mapperProxy.selectMemoList();
//			return sqlSession.selectList("kr.or.ddit.memo.dao.MemoDAO.selectMemoList");
		}
	}

	@Override
	public int insertMemo(MemoVO memo) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			MemoDAO mapperProxy = sqlSession.getMapper(MemoDAO.class);
			int rowcnt = mapperProxy.insertMemo(memo); // 해당 시그니처가 인터페이스에서부터 정해지기 때문에 파라미터를 빼놓거나, 오타가 발생할 수가 없음 => 이걸 추천함!! => 한 단계 더 발전하면 spring에서는 DAO의 구현체가 자동으로 만들어짐
//			int rowcnt = sqlSession.insert("kr.or.ddit.memo.dao.MemoDAO.insertMemo", memo); // 파라미터를 빼놓는 실수, 오타실수가 많아서 위에 걸로도 함
			sqlSession.commit(); // 쿼리 실행 후 필요함(커밋!) -> 트랜잭션 종료
			return rowcnt;
		}
	}

	@Override
	public int updateMemo(MemoVO memo) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			MemoDAO mapperProxy = sqlSession.getMapper(MemoDAO.class);
			int rowcnt = mapperProxy.updateMemo(memo);
//			int rowcnt = sqlSession.update("kr.or.ddit.memo.dao.MemoDAO.updateMemo", memo);
			sqlSession.commit();
			return rowcnt;
		}
	}

	@Override
	public int deleteMemo(int code) {
		try (
			SqlSession sqlSession = sqlSessionFactory.openSession();
		){
			MemoDAO mapperProxy = sqlSession.getMapper(MemoDAO.class);
			int rowcnt = mapperProxy.deleteMemo(code);
//			int rowcnt = sqlSession.delete("kr.or.ddit.memo.dao.MemoDAO.deleteMemo", code);
			sqlSession.commit();
			return rowcnt;
		}
	}

}
