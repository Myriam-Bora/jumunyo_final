package com.finalp.jumunyo.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalp.jumunyo.model.LoginRequest;
import com.finalp.jumunyo.model.QuestionRequest;
import com.finalp.jumunyo.service.ManagerService;
import com.finalp.jumunyo.util.PagingVO;
import com.finalp.jumunyo.vo.UserVO;

@Controller
public class ManagerController {
	
	@Autowired  //의존주입
	ManagerService service;
	
	@RequestMapping("/login")
	public String login() {
		return "manager/login";
	}
	
	@RequestMapping("/loginCheck")
	public String loginCheck(@ModelAttribute LoginRequest loginReq, HttpServletRequest request) {
		UserVO userVO = service.loginCheck(loginReq);
		if(userVO == null || !loginReq.passwordCheck(userVO.getUser_password()))
			return "manager/login";
		HttpSession session = request.getSession();
		session.setAttribute("auth", userVO);
		return "manager/managerMain";
	}
	
	@RequestMapping("/main")
	public String main() {
		return "manager/managerMain";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "manager/login";
	}
	
	@RequestMapping("/questionList")
	public String questionList(PagingVO pagingVO, Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		int total = service.countQuestion();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "10";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(pagingVO.toString());
		model.addAttribute("paging", pagingVO);
		model.addAttribute("questionList", service.selectQuestionList(pagingVO));
		return "manager/questionList";
	}
	
	@RequestMapping("/answerQuestionList")
	public String answerQuestionList(PagingVO pagingVO, Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		int total = service.answerCountQuestion();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "10";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(pagingVO.toString());
		model.addAttribute("paging", pagingVO);
		model.addAttribute("questionList", service.selectAnswerQuestionList(pagingVO));
		return "manager/questionList";
	}
	
	@RequestMapping("/getQuestion/{question_id}")
	public String getQuestion(@PathVariable("question_id") int question_id, Model model) throws Exception {
		model.addAttribute("question", service.getQuestion(question_id));
		return "manager/questionAnswer";
	}
	
	@RequestMapping("insertQuestion/{question_id}")
	public String insertQuestion(@PathVariable("question_id") int question_id, QuestionRequest questionReq) throws Exception {
		service.questionAnswer(question_id);
		service.insertQuestion(questionReq);
		return "redirect:/questionList";
	}
	
	@RequestMapping("/userList")
	public String userList(PagingVO pagingVO, Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		int total = service.countUsers();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "10";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(pagingVO.toString());
		model.addAttribute("paging", pagingVO);
		model.addAttribute("userList", service.selectUserList(pagingVO));
		return "manager/userList";
	}
	
	@RequestMapping("/userInformation/{user_id}")
	public String userInformation(@PathVariable("user_id") int user_id, Model model) throws Exception {
		model.addAttribute("user", service.getUser(user_id));
		model.addAttribute("restaurants", service.getRestaurants(user_id));
		return "manager/userInformation";
	}
	
	@RequestMapping(value = "/updateUser", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateUser(HttpServletRequest req) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("user_address", req.getParameter("user_address"));
		map.put("user_tell", req.getParameter("user_tell"));
		map.put("user_nickname", req.getParameter("user_nickname"));
		map.put("user_level", req.getParameter("user_level"));
		map.put("user_point", req.getParameter("user_point"));
		map.put("user_email", req.getParameter("user_email"));
		map.put("user_id", req.getParameter("user_id"));
		
		service.updateUser(map);
		return "redirect:/userInformation/"+req.getParameter("user_id");
	}
	
	@RequestMapping("/businessList")
	public String businessList(PagingVO pagingVO, Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		int total = service.countBuisness();
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "10";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(pagingVO.toString());
		model.addAttribute("paging", pagingVO);
		model.addAttribute("businessList", service.selectBuisness(pagingVO));
		return "manager/buisnessList";
	}
	
	@RequestMapping("/businessInformation/{user_id}")
	public String buisnessInformation(@PathVariable("user_id") int user_id, Model model) throws Exception {
		model.addAttribute("restaurants", service.getRestaurants(user_id));
		return "manager/buisnessInformation";
	}
	
	@RequestMapping("/businessAcknowledge/{user_id}")
	public String businessAcknowledge(@PathVariable("user_id") int user_id) throws Exception {
		service.businessAcknowledge(user_id);
		return "redirect:/businessList";
	}


}
