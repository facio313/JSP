package kr.or.ddit.prod.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.web.context.WebApplicationContext;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.prod.dao.ProdDAO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.ProdVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProdServiceImpl implements ProdService {
	private final ProdDAO prodDAO;
	
	@Inject
	private WebApplicationContext context; // 컨테이너, 이거 자체로 resource order
	private File saveFolder;
	// 모든 Inject가 끝난 다음 마지막으로 실행되는 콜백함수
	// 모든 객체는 싱글톤으로 관리되기 때문에 이것도 한 번만 실행됨
	// 에러는 spring container가 가져갔다가 tomcat이 가져감
	@PostConstruct
	public void init() throws IOException {
		String saveFolderURL = "/resources/prodImages";
		Resource saveFolderRes = context.getResource(saveFolderURL); // 얘가 뭔지 자세히 살펴봐..
		saveFolder = saveFolderRes.getFile(); // 이전 시간에 사용한 코드의 형태
		if (!saveFolder.exists()) {
			saveFolder.mkdirs();
		}
	}

	private void processProdImage(ProdVO prod) {
		try {
			if (1==1) throw new RuntimeException("트랜잭션 관리 여부 확인을 위한 강제 발생 예외");
			prod.saveTo(saveFolder);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	@Override
	public ProdVO retrieveProd(String prodId) {
		ProdVO prod = prodDAO.selectProd(prodId);
		if (prod==null)
			throw new RuntimeException(String.format("%s 는 없는 상품", prodId));
		return prod;
	}

	// call by reference : 참조에 의한 호출을 의미합니다. 전달받은 값을 직접 참조합니다. 즉 전달받은 값을 변경할 경우 원본도 같이 변경이 됩니다.
	@Override
	public void retrieveProdList(PagingVO<ProdVO> pagingVO) { // 검색 조건도 포함되어 있을 것!!!
		pagingVO.setTotalRecord(prodDAO.selectTotalRecord(pagingVO));
		List<ProdVO> dataList = prodDAO.selectProdList(pagingVO);
		pagingVO.setDataList(dataList);
	}

	@Inject
	private SqlSessionFactory sqlSessionFactory;
	
	@Override
	public ServiceResult createProd(ProdVO prod) {
//		session open
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession(); // 트랜잭션 시작
		){
			int rowcnt = prodDAO.insertProd(prod, sqlSession); // 이진 데이터 빼고 나머지만 디비에 저장
			
			processProdImage(prod); // 얘 위치 기준 어디? 상품 등록시  되돌릴 수 있는 것부터 해야 함. 트랜잭션(롤백)이 있기 때문에 나중에 잘못돼도 되돌리면 됨 (1,0) 되거나, 안 되거나 - 원자성
			
			sqlSession.commit();
			
			return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
	}

	@Override
	public ServiceResult modifyProd(ProdVO prod) {
		retrieveProd(prod.getProdId());
		int rowcnt = prodDAO.updateProd(prod);
		processProdImage(prod);
		ServiceResult result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}
}
