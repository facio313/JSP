package kr.or.ddit.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 페이징과 관련한 모든 데이터를 가진 객체
 *
 */
@Getter
@NoArgsConstructor
@ToString
public class PagingVO<T> {
	
	public PagingVO(int screenSize, int blockSize) {
		super();
		this.screenSize = screenSize;
		this.blockSize = blockSize;
		// 두 개를 고정시켜놓겠다.
	}

	private int totalRecord; // DB 조회 --> setter가 호출될 때 결정 됨(DB에서 조회해와서 결과가 나왔을 때!)
	private int screenSize = 10; // 임의 설정 -> 값을 넣는다면 생성자가 생겨야 함. @NoArgsContructor
	private int blockSize = 5; // 임의 설정 -> 값을 넣는다면 생성자가 생겨야 함. @NoArgsContructor
	/////////////////////////////////////
	private int currentPage; // 클라이언트 파라미터 --> setter가 호출될 때 결정 됨(currentpPage가 이 PagingVO 객체 안으로 들어올 때 밑에 네 개가 결정됨!)
	/////////////////////////////////////
	private int totalPage; // totalRecord, screenSize
	private int startRow; // currentPage, screenSize
	private int endRow; // currentPage, screenSize
	private int startPage; // currentPage, blockSize
	private int endPage; // currentPage, blockSize
	
	private List<T> dataList;
	
	private SearchVO simpleCondition; // 단순 키워드 검색

	private T detailCondition; // 상세 검색용
	
	public void setDataList(List<T> dataList) {
		this.dataList = dataList;
	}
	
	public void setSimpleCondition(SearchVO simpleCondition) {
		this.simpleCondition = simpleCondition;
	}
	
	public void setDetailCondition(T detailCondition) {
		this.detailCondition = detailCondition;
	}
	
	// 꼭 자기 setter에서만 만들어지라는 법은 없다!
	// 관련된 setter에서 만들어지기도 한다.
	// paging에서 프로그램 언어의 특성 중 정수형 처리 관련에서 버림(실제론 그냥 몫 가져오기)을 잘 생각하면 다음과 같음
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		totalPage = (totalRecord + (screenSize - 1)) / screenSize;
	}
	
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		endRow = currentPage * screenSize;
		startRow = endRow - (screenSize - 1);
		endPage = ((currentPage + (blockSize - 1)) / blockSize) * blockSize;
		startPage = endPage - (blockSize - 1);
	}
	
	public int getEndPage() {
		return endPage > totalPage ? totalPage : endPage;
	}
	
}
