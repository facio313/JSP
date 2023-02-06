package kr.or.ddit.resume.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.resume.dao.CertificationDAO;
import kr.or.ddit.resume.vo.CertificationVO;

/**
 * @author 최경수
 * @since 2023. 2. 6.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 	    수정일               수정자                                     수정내용
 * --------     --------    ----------------------
 * 2023. 2. 6.       최경수        최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
@Service
public class CertificationServiceImpl implements CertificationService {

	@Inject
	private CertificationDAO dao;
	
	@Override
	public CertificationVO retrieveCertification(String certSn) {
		CertificationVO cert = dao.selectCertification(certSn);
		return cert;
	}

	@Override
	public List<CertificationVO> retrieveCertificationList(String memId) {
		List<CertificationVO> certList = dao.selectCertificationList(memId);
		return certList;
	}

	@Override
	public ServiceResult createCertification(CertificationVO cert) {

		return null;
	}

	@Override
	public ServiceResult modifyCertification(CertificationVO cert) {

		return null;
	}

}
