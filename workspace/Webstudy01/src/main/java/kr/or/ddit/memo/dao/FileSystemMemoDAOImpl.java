package kr.or.ddit.memo.dao;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.memo.vo.MemoVO;

public class FileSystemMemoDAOImpl implements MemoDAO {
	private static FileSystemMemoDAOImpl instance;
	
	public static FileSystemMemoDAOImpl getInstance() {
		if (instance == null) {
			instance = new FileSystemMemoDAOImpl();
		}
		return instance;
	}
	
	private File dataBase = new File("D:/memos.dat");
	private Map<Integer, MemoVO> memoTable; // Integer -> memo의 code // 파일 객체를 담을 map 생성
	
	private FileSystemMemoDAOImpl() {
		try(
			FileInputStream fis = new FileInputStream(dataBase);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ObjectInputStream ois = new ObjectInputStream(bis);
		){
			memoTable = (Map<Integer, MemoVO>) ois.readObject();
		} catch (Exception e) {
			System.err.println(e.getMessage());
			this.memoTable = new HashMap<>();
		}
	}
	
	@Override
	public List<MemoVO> selectMemoList() {
		return new ArrayList<>(memoTable.values());
	}

	@Override
	public int insertMemo(MemoVO memo) {
		int maxCode = memoTable.keySet().stream()
								.mapToInt(key->key.intValue())
								.max()
								.orElse(0); // stream 사용 시 필터 적용 가능
		memo.setCode(maxCode + 1);
		memoTable.put(memo.getCode(), memo);
		serializeMemoTable();
		return 1;
	}
	
	private void serializeMemoTable() {
		try(
			FileOutputStream fos = new FileOutputStream(dataBase);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
		){
			oos.writeObject(memoTable);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateMemo(MemoVO memo) {
		memoTable.put(memo.getCode(), memo);
		serializeMemoTable();
//		List<MemoVO> original = selectMemoList();
//		
//		int memoCode = memo.getCode();
//		String memoWriter = memo.getWriter();
//		String memoDate = memo.getDate();
//		String memoContent = memo.getContent();
//		
//		for (MemoVO mv : original) {
//			if (mv.getCode() == memoCode) {
//				mv.setWriter(memoWriter);
//				mv.setDate(memoDate);
//				mv.setContent(memoContent);
//			}
//		}
		return 1;
	}

	@Override
	public int deleteMemo(int code) {
		memoTable.remove(code);
		serializeMemoTable();
		return 1;
	}
}
