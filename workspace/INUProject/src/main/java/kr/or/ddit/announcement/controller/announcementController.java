package kr.or.ddit.announcement.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.announcement.dao.AnnoSearchDAO;
import kr.or.ddit.announcement.service.AnnoService;
import kr.or.ddit.announcement.vo.AnnoVO;
import kr.or.ddit.ui.PaginationRenderer;
import kr.or.ddit.vo.PagingVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

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
@Slf4j
@Controller
@RequestMapping("/announcement")
@RequiredArgsConstructor
public class announcementController {
   private final AnnoService service;
   private final AnnoSearchDAO annoSearchDAO;

//      @ModelAttribute("regionList")
//   public List<Map<String, Object>> regionList(){
//      return annoSearchDAO.selectRegionList(null);
//   }
   
//   @ModelAttribute("industryList")
//   public List<Map<String, Object>> industryList(){
//      return annoSearchDAO.selectIndustry(null);
//   }
   
//   @ModelAttribute("jobList")
//   public List<Map<String, Object>> jobList(){
//      return annoSearchDAO.selectJob(null);
//   }
   
   @Resource(name="bootstrapPaginationRender")
   private PaginationRenderer renderer;
   
   @GetMapping
   public String listUI() {
      return "announcement/annoList";
   }
   
   @GetMapping(produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
   public String annoList(
      @RequestParam(value="page",required=false, defaultValue="1") int currentPage
//      , @ModelAttribute("simpleCondition") SearchVO searchVO
//      , @ModelAttribute SearchVO simpleCondition
      , @ModelAttribute("detailCondition") AnnoVO detailCondition
      , Model model
   ) {
      PagingVO<AnnoVO> pagingVO = new PagingVO<>(10,5);
      pagingVO.setCurrentPage(currentPage);
      
//      pagingVO.setSimpleCondition(searchVO);
//      pagingVO.setSimpleCondition(simpleCondition);
      pagingVO.setDetailCondition(detailCondition);
      
      service.retrieveAnnoList(pagingVO);
      model.addAttribute("pagingVO", pagingVO);
      if(!pagingVO.getDataList().isEmpty())
         model.addAttribute("pagingHTML", renderer.renderPagination(pagingVO));
      
      return "jsonView";
   }
   
   @GetMapping("view/{annoNo}")
   public String annoView(
      @PathVariable String annoNo
      , Model model
   ) {
      AnnoVO anno = service.retrieveAnno(annoNo);
      model.addAttribute("anno",anno);
      return "announcement/annoView";
   }   
   
   @GetMapping("insert")
   public String insertAnno(Model model) {
      return "announcement/annoForm";
   }
   
   @PostMapping("insert")
   public String insertAnnoProcess(Model model) {
      //혹은 annoView
      return "announcement/annoList";
   }
   
   @PostMapping("region")
   public String regionList(
      Model model
      , @RequestBody(required = false) Map<String, Object> param
   ){
      String type = (String) param.get("type");
      String code = (String) param.get("code");
      List<Map<String, Object>> searchList=null;
      System.out.println(type);
      System.out.println(code);
      if(type.equals("region")) {
         System.out.println("이곳");
         searchList = annoSearchDAO.selectRegionList(code);
      }
      model.addAttribute("searchList", searchList);
      return "jsonView";
   }
}