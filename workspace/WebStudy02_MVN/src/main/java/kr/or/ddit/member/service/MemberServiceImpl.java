package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.login.service.AuthenticateService;
import kr.or.ddit.login.service.AuthenticateServiceImpl;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.dao.MemberDAOImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberServiceImpl implements MemberService {
	// 아래 코드로 인해 결합력 최상
	private MemberDAO memberDAO = new MemberDAOImpl(); // 싱글톤은 나중에 스프링을 통해 자동으로 만들 거임

//	public boolean isDuplicated(String memId) {
//		MemberVO savedMember = memberDAO.selectMember(memId);
//		if (savedMember.getMemId() == null) {
//			return true;
//		} else {
//			return false;
//		}
//		
//	}
	
	@Override
	public ServiceResult createMember(MemberVO member) {
		ServiceResult result = null;
		try {
			retrieveMember(member.getMemId());
			result = ServiceResult.PKDUPLICATED;
		} catch (UserNotFoundException e) {
			int rowcnt = memberDAO.insertMember(member);
			result = rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		}
		return result;
	}

	@Override
	public List<MemberVO> retrieveMemberList() {
		List<MemberVO> memberList = memberDAO.selectMemberList();
		return memberList;
	}

	@Override
	public MemberVO retrieveMember(String memId) {
		MemberVO member = memberDAO.selectMember(memId);
		if (member == null) throw new UserNotFoundException(String.format(memId + "에 해당하는 사용자 없음."));
		return member;
	}

	@Override
	public ServiceResult modifyMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeMember(MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

}
