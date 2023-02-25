package kr.or.ddit.process.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.process.dao.ProcessDAO;
import kr.or.ddit.process.vo.ItemVO;
import kr.or.ddit.process.vo.ProcessVO;

@Service
public class ProcessServiceImpl implements ProcessService {

	@Inject
	private ProcessDAO dao; 
	
	@Override
	public List<ProcessVO> retrieveProcessList(String cmpId) {
		List<ProcessVO> processList = dao.selectProcessList(cmpId);
		return processList;
	}
	
	@Override
	public ProcessVO retrieveProcess(String daNo, String pc) {
		ProcessVO process = dao.selectProcess(daNo, pc);
		return process;
	}

	@Override
	public ServiceResult createProcess(ProcessVO process) {
		int rowcnt = dao.insertProcess(process);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyProcess(ProcessVO process) {
		int rowcnt = dao.updateProcess(process);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeProcess(String daNo) {
		int rowcnt = dao.deleteProcess(daNo);
		return rowcnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<ItemVO> retrieveItemList(String daNo) {
		List<ItemVO> list = dao.selectItemList(daNo);
		return list;
	}

	@Override
	public List<ItemVO> retireveItemListNotAdded(String daNo) {
		List<ItemVO> list = dao.selectItemListNotAdded(daNo);
		return list;
	}

	@Override
	public void removeItem(ItemVO item) {
		dao.deleteItem(item);
	}

	@Override
	public void createItemList(List<ItemVO> itemList, String cmpId) {
		// 항목(ITEM)에 입력
		dao.insertItemList(itemList);
		
		// 양식(ITEM_FORM)에 입력
		if (itemList.get(0).getItemCodeName() == null || itemList.get(0).getItemCodeName().equals("")) {
			Map<String, Object> map = new HashMap<>();
			map.put("itemList", itemList);
			map.put("cmpId", cmpId);
			dao.insertItemFormList(map);
		}
	}

	@Override
	public void modifyItem(ItemVO item, String originCodeId, String cmpId) {
		Map<String, Object> map = new HashMap<>();
		map.put("item", item);
		map.put("originCodeId", originCodeId);
		dao.updateItem(map);
		
		List<ItemVO> itemList = new ArrayList<>();
		itemList.add(item);
		map.put("itemList", itemList);
		map.put("cmpId", cmpId);
		dao.insertItemFormList(map);
	}

	@Override
	public List<ItemVO> retrieveItemFormList(String cmpId) {
		List<ItemVO> list = dao.selectItemFormList(cmpId); 
		return list;
	}

}
