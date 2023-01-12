package kr.or.ddit.login.service;

import java.lang.reflect.InvocationTargetException;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.vo.MemberVO;

@Service
public class AuthenticateServiceImpl implements AuthenticateService {
	private MemberDAO memberDAO;
	
	// memberDao가 bean으로 등록되어 있어야 함
	@Inject // 기본 생성자가 없어져서 이 생성자로 주입돼서 들어오지만 확실하게 해주고 싶을 때..
	public AuthenticateServiceImpl(MemberDAO memberDAO) { // 기본 생성자가 없어져서 이 생성자로 주입돼서 들어옴
		super();
		this.memberDAO = memberDAO;
	}

//	@Inject
	@Resource(name="passwordEncoder") // 혹시 PasswordEncoder가 여러 개 있다면 특정한 하나를 지칭할 수 ㅣㅇㅆ음
	private PasswordEncoder encoder; // 얘가 bean으로 등록되어 있어야 함, 우리가 만든 것이 아니라 수동으로 등록해줘야 함
	
	@Override
	public ServiceResult authenticate(MemberVO member) {
		MemberVO savedMember = memberDAO.selectMember(member.getMemId());
		
		if (savedMember == null) 
			throw new UserNotFoundException(String.format("%s 사용자 없음.", member.getMemId()));
		
		String inputPass = member.getMemPass();
		String savedPass = savedMember.getMemPass();
		
		ServiceResult result = null;
		
		if (encoder.matches(inputPass, savedPass)) {
//			member.setMemName(savedMember.getMemName());
			try {
				BeanUtils.copyProperties(member, savedMember);
				result = ServiceResult.OK;
			} catch (IllegalAccessException | InvocationTargetException e) {
				throw new RuntimeException(e);
			}
		} else {
			result = ServiceResult.INVALIDPASSWORD;
		}
		
		return result;
	}

}
