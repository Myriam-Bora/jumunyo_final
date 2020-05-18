package com.finalp.jumunyo.service;

import java.util.List;
import java.util.Map;

import com.finalp.jumunyo.model.LoginRequest;
import com.finalp.jumunyo.model.QuestionRequest;
import com.finalp.jumunyo.model.RestaurantRequest;
import com.finalp.jumunyo.util.PagingVO;
import com.finalp.jumunyo.vo.RestaurantVO;
import com.finalp.jumunyo.vo.UserVO;

public interface ManagerService {
	
	UserVO loginCheck(LoginRequest loginReq);
	
	public int countQuestion() throws Exception;
	
	public int answerCountQuestion() throws Exception;
	
	List<QuestionRequest> selectAnswerQuestionList(PagingVO pagingVO) throws Exception;
	
	List<QuestionRequest> selectQuestionList(PagingVO pagingVO) throws Exception;

	QuestionRequest getQuestion(int question_id) throws Exception;
	
	void questionAnswer(int question_id) throws Exception;
	
	void insertQuestion(QuestionRequest questionReq) throws Exception;
	
	public int countUsers() throws Exception;
	
	public int countBuisness() throws Exception;
	
	List<UserVO> selectUserList(PagingVO pagingVO) throws Exception;
	
	List<RestaurantVO> selectBuisness(PagingVO pagingVO) throws Exception;
	
	UserVO getUser(int user_id) throws Exception;
	
	RestaurantRequest getRestaurants(int user_id) throws Exception;
	
	void updateUser(Map<String, Object> map) throws Exception;

	void businessAcknowledge(int user_id) throws Exception;

}
