package kr.or.ddit.announcement;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 작성자명
 * @since 2023. 2. 1.
 * @version 1.0
 * @see javax.servlet.http.HttpServlet
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2023. 2. 1.      양서연       최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

@Controller
@RequestMapping("/announcement")
public class announcementRetrieveController {
	
	@GetMapping
	public String annoList(Model model) {
		return "announcement/annoList";
	}
	
	@GetMapping("{annoId}")
	public String annoView(
		@PathVariable String annoId
		, Model model
	) {
		
		model.addAttribute("annoId",annoId);
		return "announcement/annoView";
	}
}
