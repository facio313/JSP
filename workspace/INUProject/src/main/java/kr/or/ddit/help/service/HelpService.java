package kr.or.ddit.help.service;


import kr.or.ddit.help.vo.HelpVO;
import kr.or.ddit.vo.PagingVO;

/**
 * 
 * @author 박형준
 * @since 2023. 2. 10.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                  수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 10.  박형준               최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */
public interface HelpService {

	/**
	 * 도움말 목록
	 * @param helpVO
	 */
	public void retrieveHelpList(PagingVO<HelpVO> pagingVO);
	
	/**
	 * 도움말 세부
	 * @param helpSn
	 * @return
	 */
	public HelpVO retrieveHelp(String helpSn);
	
	/**
	 * 등록
	 * @param help
	 * @return
	 */
	public int createHelp(HelpVO help);
	
	/**
	 * 수정
	 * @param help
	 * @return
	 */
	public int modifyHelp(HelpVO help);
	
	/**
	 * 삭제
	 * @param help
	 * @return
	 */
	public int removeHelp(HelpVO help);
	
}













