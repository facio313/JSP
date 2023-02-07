<<<<<<< HEAD
package kr.or.ddit.commons;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController{
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest req){
		return "index";
	}

}
=======
package kr.or.ddit.commons;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController{
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest req){
		return "index";
	}

	@GetMapping("/xedni")
	public String xedni(HttpServletRequest req){
		return "xedni";
	}
}
>>>>>>> 297d35dfb3730ed4e9f79c3bf7146a3950ab948a
