package kr.or.ddit.company.service;


import kr.or.ddit.company.vo.CompanyVO;
import kr.or.ddit.exception.UserNotFoundException;

/**
 * 회사(CRUD)를 위한 Business Logic Layer
 */
public interface CompanyService {

	
	/**
	 * 회사 정보 상세 조회
	 * @param comId
	 * @return 존재하지 않는 경우, {@link UserNotFoundException} 발생.
	 */
	public CompanyVO retrieveCompany(String comId);
}

















