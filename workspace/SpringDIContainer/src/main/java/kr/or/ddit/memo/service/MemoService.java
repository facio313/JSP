package kr.or.ddit.memo.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.memo.dao.FileSystemMemoDAOImpl;
import kr.or.ddit.memo.dao.MemoDAO;
import kr.or.ddit.vo.MemoVO;

@Service
public class MemoService{
//	private MemoDAO dao = FileSystemMemoDAOImpl.getInstance();
	private MemoDAO dao;

	@Inject
	public MemoService(MemoDAO dao) {
	super();
	this.dao = dao;
}

	public List<MemoVO> retrieveMemoList(){
		return dao.selectMemoList();
	}
}
