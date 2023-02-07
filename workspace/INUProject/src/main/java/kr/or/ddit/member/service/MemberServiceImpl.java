<<<<<<< HEAD
package kr.or.ddit.member.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	// 결합력 최상
	@Inject
	private MemberDAO memberDAO;
	@Resource(name="authenticationManager")
	private AuthenticationManager authenticationManager;
	@Inject
	private PasswordEncoder encoder;
	
	@PostConstruct
	public void init() {
		log.info("주입된 객체 : {}, {}, {}", memberDAO, authenticationManager, encoder);
	}
	
//	member테이블 insert
	@Override
	public ServiceResult createSeeker(SeekerVO member) {
		ServiceResult result = null;
		try {
			retrieveMember(member.getMemId());
			result = ServiceResult.PKDUPLICATED;
		}catch (UserNotFoundException e) {
			String encoded = encoder.encode(member.getMemPass());
			member.setMemPass(encoded);
			int rowcnt = memberDAO.insertMember(member);
			rowcnt = memberDAO.insertSeeker(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

//  incruiter테이블 insert
	@Override
	public ServiceResult createIcruiter(IncruiterVO member) {
		ServiceResult result = null;
		try {
			retrieveMember(member.getMemId());
			result = ServiceResult.PKDUPLICATED;
		}catch (UserNotFoundException e) {
			String encoded = encoder.encode(member.getMemPass());
			member.setMemPass(encoded);
			int rowcnt = memberDAO.insertMember(member);
			rowcnt = memberDAO.insertIncruiter(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

	
	
	
	@Override
	public List<MemberVO> retrieveMemberList(PagingVO<MemberVO> pagingVO) {
		pagingVO.setTotalRecord(memberDAO.selectTotalRecord(pagingVO));
		
		List<MemberVO> memberList = memberDAO.selectMemberList(pagingVO);
		
		pagingVO.setDataList(memberList);
		
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String memId) {
		MemberVO member = memberDAO.selectMember(memId);
		if(member==null)
			throw new UserNotFoundException(String.format(memId+"에 해당하는 사용자 없음."));
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
//		MemberVO inputData = new MemberVO();
//		inputData.setMemId(member.getMemId());
//		inputData.setMemPass(member.getMemPass());
//		
//		ServiceResult result = authenticationManager.authenticate(inputData);
//		if(ServiceResult.OK.equals(result)) {
//			int rowcnt = memberDAO.updateMember(member);
//			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//		}
//		return result;
//		
		ServiceResult result = null;
		Authentication inputData = new UsernamePasswordAuthenticationToken(member.getMemId(), member.getMemPass());
		try {
			authenticationManager.authenticate(inputData);
			int rowcnt = memberDAO.updateMember(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (UsernameNotFoundException e) {
			result = ServiceResult.NOTEXIST;
		}catch (AuthenticationException e) {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
//		ServiceResult result = authService.authenticate(member);
//		if(ServiceResult.OK.equals(result)) {
//			int rowcnt = memberDAO.deleteMember(member.getMemId());
//			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//		}
//		return result;
		
		ServiceResult result = null;
		Authentication inputData = 
				new UsernamePasswordAuthenticationToken(member.getMemId(), member.getMemPass());
		
		try {
			authenticationManager.authenticate(inputData);
			int rowcnt = memberDAO.deleteMember(member.getMemId());
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (UsernameNotFoundException e) {
			result = ServiceResult.NOTEXIST;
		}catch (AuthenticationException e) {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

}




















=======
package kr.or.ddit.member.service;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.vo.IncruiterVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PagingVO;
import kr.or.ddit.vo.SeekerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	// 결합력 최상
	@Inject
	private MemberDAO memberDAO;
	@Resource(name="authenticationManager")
	private AuthenticationManager authenticationManager;
	@Inject
	private PasswordEncoder encoder;
	
	@PostConstruct
	public void init() {
		log.info("주입된 객체 : {}, {}, {}", memberDAO, authenticationManager, encoder);
	}
	
//	member테이블 insert
	@Override
	public ServiceResult createSeeker(SeekerVO member) {
		ServiceResult result = null;
		try {
			retrieveMember(member.getMemId());
			result = ServiceResult.PKDUPLICATED;
		}catch (UserNotFoundException e) {
			String encoded = encoder.encode(member.getMemPass());
			member.setMemPass(encoded);
			int rowcnt = memberDAO.insertMember(member);
			rowcnt = memberDAO.insertSeeker(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

//  incruiter테이블 insert
	@Override
	public ServiceResult createIcruiter(IncruiterVO member) {
		ServiceResult result = null;
		try {
			retrieveMember(member.getMemId());
			result = ServiceResult.PKDUPLICATED;
		}catch (UserNotFoundException e) {
			String encoded = encoder.encode(member.getMemPass());
			member.setMemPass(encoded);
			int rowcnt = memberDAO.insertMemberIN(member);
			rowcnt = memberDAO.insertIncruiter(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

	
	
	
	@Override
	public List<MemberVO> retrieveMemberList(PagingVO<MemberVO> pagingVO) {
		pagingVO.setTotalRecord(memberDAO.selectTotalRecord(pagingVO));
		
		List<MemberVO> memberList = memberDAO.selectMemberList(pagingVO);
		
		pagingVO.setDataList(memberList);
		
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String memId) {
		MemberVO member = memberDAO.selectMember(memId);
		if(member==null)
			throw new UserNotFoundException(String.format(memId+"에 해당하는 사용자 없음."));
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
//		MemberVO inputData = new MemberVO();
//		inputData.setMemId(member.getMemId());
//		inputData.setMemPass(member.getMemPass());
//		
//		ServiceResult result = authenticationManager.authenticate(inputData);
//		if(ServiceResult.OK.equals(result)) {
//			int rowcnt = memberDAO.updateMember(member);
//			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//		}
//		return result;
//		
		ServiceResult result = null;
		Authentication inputData = new UsernamePasswordAuthenticationToken(member.getMemId(), member.getMemPass());
		try {
			authenticationManager.authenticate(inputData);
			int rowcnt = memberDAO.updateMember(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (UsernameNotFoundException e) {
			result = ServiceResult.NOTEXIST;
		}catch (AuthenticationException e) {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
//		ServiceResult result = authService.authenticate(member);
//		if(ServiceResult.OK.equals(result)) {
//			int rowcnt = memberDAO.deleteMember(member.getMemId());
//			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//		}
//		return result;
		
		ServiceResult result = null;
		Authentication inputData = 
				new UsernamePasswordAuthenticationToken(member.getMemId(), member.getMemPass());
		
		try {
			authenticationManager.authenticate(inputData);
			int rowcnt = memberDAO.deleteMember(member.getMemId());
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}catch (UsernameNotFoundException e) {
			result = ServiceResult.NOTEXIST;
		}catch (AuthenticationException e) {
			result = ServiceResult.INVALIDPASSWORD;
		}
		return result;
	}

	
	
	/*=======================================아이디,비번 찾기 부분======================================*/
	//일반회원 아이디 찾기
	@Override
	public List<SeekerVO> searchSeekerId(SeekerVO seeker) {
		return memberDAO.seekerFindId(seeker);
	}
	//일반회원의 비밀번호를 찾기위한 회원존재 확인
	@Override
	public int retrieveGetSeekerResult(SeekerVO seeker) {
		return memberDAO.getSeekerFindResult(seeker);
	}
	//기업회원 아이디 찾기
	@Override
	public MemberVO retrieveIncruiterId(IncruiterVO incruiter) {
		return memberDAO.incruiterFindId(incruiter);
	}
	//기업회원의 비밀번호를 찾기위한 회원존재 확인
	@Override
	public int retrieveGetIncruiterResult(IncruiterVO incruiter) {
		return memberDAO.getIncruiterFindResult(incruiter);
	}
	
	//비밀번호 수정
	@Override
	public int modifyPw(MemberVO member) {
		String encoded = encoder.encode(member.getMemPass());
		member.setMemPass(encoded); 
		return memberDAO.updatePw(member);
		
	}


	

}




















>>>>>>> refs/remotes/origin/main
