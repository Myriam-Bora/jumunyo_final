package com.finalp.jumunyo.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.jumunyo.model.LoginRequest;
import com.finalp.jumunyo.model.QuestionRequest;
import com.finalp.jumunyo.model.RestaurantRequest;
import com.finalp.jumunyo.util.PagingVO;
import com.finalp.jumunyo.vo.RestaurantVO;
import com.finalp.jumunyo.vo.UserVO;

@Repository 
public class ManagerServiceImpl implements ManagerService {
	
	@Autowired   //의존주입
	SqlSessionTemplate my;  //SqlSession을 구현

	@Override
	public UserVO loginCheck(LoginRequest loginReq) {
		return my.selectOne("Manager.loginCheck", loginReq);
	}

	@Override
	public int countQuestion() throws Exception {
		return my.selectOne("Manager.countQuestion");
	}

	@Override
	public List<QuestionRequest> selectQuestionList(PagingVO pagingVO) throws Exception {
		return my.selectList("Manager.selectQuestionList", pagingVO);
	}

	@Override
	public QuestionRequest getQuestion(int question_id) throws Exception {
		return my.selectOne("Manager.getQuestion", question_id);
	}

	@Override
	public void questionAnswer(int question_id) throws Exception {
		my.update("Manager.questionAnswer", question_id);
	}

	@Override
	public void insertQuestion(QuestionRequest questionReq) throws Exception {
		my.insert("Manager.insertQuestion", questionReq);
	}

	@Override
	public int answerCountQuestion() throws Exception {
		return my.selectOne("Manager.answerCountQuestion");
	}

	@Override
	public List<QuestionRequest> selectAnswerQuestionList(PagingVO pagingVO) throws Exception {
		return my.selectList("Manager.selectAnswerQuestionList", pagingVO);
	}
	
	@Override
	public List<UserVO> selectUserList(PagingVO pagingVO) throws Exception {
		return my.selectList("Manager.selectUserList", pagingVO);
	}

	@Override
	public int countUsers() throws Exception {
		return my.selectOne("Manager.countUsers");
	}

	@Override
	public UserVO getUser(int user_id) throws Exception {
		return my.selectOne("Manager.getUser", user_id);
	}

	@Override
	public RestaurantRequest getRestaurants(int user_id) throws Exception {
		return my.selectOne("Manager.getRestaurants", user_id);
	}

	@Override
	public void updateUser(Map<String, Object> map) throws Exception {
		my.update("Manager.updateUser", map);
	}

	@Override
	public int countBuisness() throws Exception {
		return my.selectOne("Manager.countBuisness");
	}

	@Override
	public List<RestaurantVO> selectBuisness(PagingVO pagingVO) throws Exception {
		return my.selectList("Manager.selectBuisness", pagingVO);
	}

	@Override
	public void businessAcknowledge(int user_id) throws Exception {
		my.update("Manager.businessLevel", user_id);
		my.update("Manager.businessAcknowledge", user_id);
	}

}
