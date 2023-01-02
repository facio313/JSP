package kr.or.ddit.memo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.MemoVO;

public interface MemoDAO {
	public List<MemoVO> selectMemoList();
	public int insertMemo(MemoVO memo);
	public int updateMemo(MemoVO memo); // 코드 값이 필요
	public int deleteMemo(@Param("code") int code);
}
