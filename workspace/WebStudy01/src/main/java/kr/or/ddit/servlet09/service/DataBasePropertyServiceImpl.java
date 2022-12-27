package kr.or.ddit.servlet09.service;

import java.util.List;

import kr.or.ddit.servlet09.dao.DataBasePropertyDAO;
import kr.or.ddit.servlet09.dao.DataBasePropertyDAOImpl;
import kr.or.ddit.vo.DataBasePropertyVO;

public class DataBasePropertyServiceImpl implements DataBasePropertyService {
//	private DataBasePropertyDAO dao; // 구현체가 없더라도 서비스에는 영향력이 적음! 결합력이 낮음
	private DataBasePropertyDAO dao = new DataBasePropertyDAOImpl();;

	@Override
	public List<DataBasePropertyVO> retrievePropertyList(String propertyName) {
		List<DataBasePropertyVO> list = dao.selectPropertyList(propertyName);
		
		// 여기서 생각보다 많은 것을 할 수 있음
		list.stream().forEach(System.out::println); // 함수의 파라미터로 어떤 것만 쓰겠다?? = 메서드 레퍼런스
		
		
		return list;
	}

}
