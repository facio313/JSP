package kr.or.ddit.member.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.exception.UserNotFoundException;
import kr.or.ddit.vo.MemberVO;

/**
 * 회원관리를 위한 Business Logic Layer
 *
 */
public interface MemberService {

	/**
	 * 회원 가입
	 * @param member
	 * @return 아이디 중복으로 인한 실패(PKDUPLICATED), 가입 성공(OK), 가입 실패(FAIL) => 식별성을 주도록 enumeration을 사용 가능
	 */
	public ServiceResult createMember(MemberVO member);
	

	/**
	 * 회원 전체 목록 조회
	 * @return List<MemberVO>
	 */
	public List<MemberVO> retrieveMemberList();
	
	/**
	 * 회원 정보 상세 조회
	 * @param memId
	 * @return 존재하지 않는 경우, {@link UserNotFountException} 발생
	 *  throws UserNotFoundException는 unchecked여서 넣나 안 넣나 똑같은 구조임
	 */	
	public MemberVO retrieveMember(String memId);
	
	/**
	 * 회원 수정
	 * @param member
	 * @return 존재 부(NOTEXIST), 비번 인증 실패(INVALIDPASSWORD), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult modifyMember(MemberVO member);
	
	/**
	 * 회원 탈퇴
	 * @param memId
	 * @return 존재 부(NOTEXIST), 비번 인증 실패(INVALIDPASSWORD), 성공(OK), 실패(FAIL)
	 */
	public ServiceResult removeMember(MemberVO member);
}
