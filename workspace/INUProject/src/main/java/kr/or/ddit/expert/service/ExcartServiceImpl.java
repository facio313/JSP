package kr.or.ddit.expert.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.expert.dao.ExcartDAO;
import kr.or.ddit.expert.vo.ExcartVO;
import kr.or.ddit.resume.vo.CareerVO;

@Service
public class ExcartServiceImpl implements ExcartService {

	@Inject
	public ExcartDAO excartDAO;
	
	@Override
	public List<ExcartVO> selectExcartList(String memId) {
		List<ExcartVO> excartList =  excartDAO.selectExcartList(memId);
		return excartList;
	}

	@Override
	public ExcartVO slectExcart(String excartId) {
		ExcartVO cartVO = new ExcartVO();
		cartVO = excartDAO.selectExcart(excartId);
		return cartVO;
	}

}
