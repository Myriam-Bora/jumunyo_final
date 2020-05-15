package com.finalp.jumunyo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalp.jumunyo.service.CustomerService;
import com.finalp.jumunyo.vo.UserVO;


@Controller
public class MainControllerTest {
	
	@Autowired  //의존주입
	CustomerService service;
	
	//테스트용
	@RequestMapping("selectAll")
	public String select(Model model) throws Exception {
		
		List<UserVO> list = service.selectAll();
				
		model.addAttribute("list",list);
		
		return "selectAll";
	}
	
	// mapping 이름 최대한 안겹치게 써주시면 됩니다
	// return 쓸때 앞에 폴더명 적어주어야 할겁니다  ex) "customer/index"; 이런식으로
	// 자신의 이름이 적힌 주석 '사이에' 코드 적어주세요
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	@RequestMapping("/login.do")
	public String loginPage() {
		return "customer/customerIndex";
	}
	
	@RequestMapping(value="/customer/customerIndex.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UserVO vo, HttpSession session){
		//@ModelAttribute : Model 객체에 vo의 데이터를 전달한다
		//Model : 키값와 value값을 가진다
		boolean result = service.login(vo, session); //로그인 결과를 result에 담는다
		ModelAndView mav = new ModelAndView();
		//ModelAndView : = Model
		if(result == true) { //로그인이 성공하면
			mav.setViewName("result");
			mav.addObject("msg", "success");
		}else {  //로그인 실패하면
			mav.setViewName("customer/customerIndex");
			mav.addObject("msg", "fail");
		}
		return mav;
	}
	
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	
	
	

}
