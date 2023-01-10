package kr.or.ddit.memo.dao;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MemoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
//public class FileSystemMemoDAOImpl implements MemoDAO, ApplicationContextAware { // Spring Bean Configuration 어쩌고 만들어야 함
public class FileSystemMemoDAOImpl implements MemoDAO { // Spring Bean Configuration 어쩌고 만들어야 함
	@Inject
	private ApplicationContext context;
	
//	@Override
//	public void setApplicationContext(ApplicationContext context) throws BeansException { // 주입
//		this.context = context; // 이걸로 밑의 Resource를 찾아야 함
//	}
	
	// 모든 객체 주입이 끝난 후 사용하는 콜백 메서드. 라이프사이클 관련
	@PostConstruct
	public void init() { // 위에서 이미 context가 주입된 상태, getResource가 사용 가능
		dataBase = context.getResource("file:D:/memos.dat"); // 접근할 수 있는 것 두 가지 1.클래스패스 콜론, 2.파일 콜론 		// 이게 밑에 생성자(싱글톤으로 만들어진)를 대신함
		// 다 실행돼서 주입된 다음 가장 먼저 해야 함
		log.info("리소스 로딩 : {}", dataBase);
		try(
			InputStream fis = dataBase.getInputStream(); // 이거 하면 밑에 1차 스트림을 개방할 필요가 없음
//			FileInputStream fis = new FileInputStream(dataBase);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ObjectInputStream ois = new ObjectInputStream(bis);
		){
			memoTable = (Map<Integer, MemoVO>) ois.readObject();
		}catch(Exception e) {
			System.err.println(e.getMessage());
			this.memoTable = new HashMap<>();
		}
	}
	
//	싱글톤 패턴
//	private static FileSystemMemoDAOImpl instance;
//	public static FileSystemMemoDAOImpl getInstance() {
//		if(instance==null) {
//			instance = new FileSystemMemoDAOImpl();
//		}
//		return instance;
//	}

	//new를 할 필요 없이 리소스로 사용한다
	//초급 프로젝트에 스프링을 붙여봐라.
	//여기에 DB를 붙일꺼다.
	//초급 프로젝트에 
//	private File dataBase = new File("d:/memos.dat"); // Spring Container는 그 자체로 resouce order를 한다.
	private Resource dataBase;
	private Map<Integer, MemoVO> memoTable; //메모의 코드값을 키로 잡음 integer
	
//	public FileSystemMemoDAOImpl() {
//		//역질렬화작업을 해야함, 최초로 데이터에 접근할 때 복원하는 작업
//		
//	}
	
	@Override
	public List<MemoVO> selectMemoList() {
		return new ArrayList<>(memoTable.values());
	}

	@Override
	public int insertMemo(MemoVO memo) {
		int maxCode = memoTable.keySet().stream()
						.mapToInt(key->key.intValue())
						.max() // 있으면 맥스값으로 설정되고
						.orElse(0); //없으면 엘스값으로 설정된다는 의미
		//키를 싹 꺼내와야함,스트림으로 키 하나하나 필터를 걸 수 있다
		
		memo.setCode(maxCode+1);
		memoTable.put(memo.getCode(),memo); //코드는 안에 들어있으니까 그걸 키로 잡는다
		serializeMemoTable();
		return 1;
	}
	
	private void serializeMemoTable() {
		try(
//			FileOutputStream fos = new FileOutputStream(dataBase); // 미디어가 파일이 아니게 됐기 때문에 에러가 날 수밖에 없다
			FileOutputStream fos = new FileOutputStream(dataBase.getFile());
			ObjectOutputStream oos = new ObjectOutputStream(fos);
		){
			oos.writeObject(memoTable);
		}catch (Exception e){
			throw new RuntimeException(e);
		}
	}

	@Override
	public int updateMemo(MemoVO memo) {
		// 파일시스템으로 파일까지 수정해야한다. 그 작업은 serializeMemo에서 다 해줌
		return 0;
	}

	@Override
	public int deleteMemo(int code) {
		// TODO Auto-generated method stub
		return 0;
	}

}
