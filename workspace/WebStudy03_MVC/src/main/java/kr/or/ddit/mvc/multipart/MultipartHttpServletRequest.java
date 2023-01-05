package kr.or.ddit.mvc.multipart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;


/**
 * Part -> MultipartFile
 * 왜 이렇게 바꾸냐구?...
 * Part는 버전을 타니까!
 * Part(3.x)
 * FileItem(2.x)
 *
 */
public class MultipartHttpServletRequest extends HttpServletRequestWrapper {

	private Map<String, List<MultipartFile>> fileMap; // List는 파트는 다르지만 파트는 받는 이름이 같을  수 있으니
	
	public MultipartHttpServletRequest(HttpServletRequest request) throws IOException, ServletException {
		super(request);
		parseRequest(request);
	}

	private void parseRequest(HttpServletRequest request) throws IOException, ServletException {
		fileMap = new LinkedHashMap<>();
		request.getParts().stream()
						.filter((p) -> p.getContentType() != null)
						.forEach((p) -> {
							String partName = p.getName();
							MultipartFile file = new StandardServletMultipartFile(p);
							List<MultipartFile> fileList = Optional.ofNullable(fileMap.get(partName))
									.orElse(new ArrayList<>());
							fileList.add(file);
							fileMap.put(partName, fileList);
						});
	}

	public Map<String, List<MultipartFile>> getFileMap() {
		return fileMap;
	}
	
	public MultipartFile getFile(String name){ // 그냥 Part로 리턴타입을 잡으면 버전을 타버린다.
		List<MultipartFile> files = fileMap.get(name);
		if (files != null && !files.isEmpty()) return files.get(0);
		else return null;
	}
	
	public List<MultipartFile> getFiles(String name) {
		return fileMap.get(name);
	}
	
	public Enumeration<String> getFileNames() {
		Iterator<String> names = fileMap.keySet().iterator();
		return new Enumeration<String>() { // Interface도 익명객체면 상황이 달라짐

			@Override
			public boolean hasMoreElements() { // Iterator hasNext()
				
				return names.hasNext();
			}

			@Override
			public String nextElement() { // Iterator next()
				
				return names.next();
			}
			
		};
	}
	
}
