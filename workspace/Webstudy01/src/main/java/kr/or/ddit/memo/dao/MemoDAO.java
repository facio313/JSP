package kr.or.ddit.memo.dao;

import java.util.List;

import kr.or.ddit.memo.vo.MemoVO;

public interface MemoDAO {
	public List<MemoVO> selectMemoList();
	public int insertMemo(MemoVO memo);
	public int updateMemo(MemoVO memo); // 코드 값이 필요
	public int deleteMemo(int code);
}
