package kr.or.activity.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.or.activity.model.vo.Activity;
import kr.or.activity.model.vo.ActivityHistory;
import kr.or.activity.model.vo.ActivityReview;
import kr.or.activity.model.vo.FileVo;
import kr.or.cart.model.vo.Cart;
import kr.or.member.model.vo.Member;
import kr.or.nsClass.model.vo.NsClass;

@Repository
public class ActivityDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int insertActivity(Activity activity) {
		int result = sqlSession.insert("activity.insertActivity",activity);
		return result;
	}


	public ArrayList<Activity> getAllActivity(HashMap<String, Object> map) {
		List list = sqlSession.selectList("activity.getAllActivity",map);
		return (ArrayList<Activity>)list;
	}


	public int selectActivityCnt() {
		int totalCount = sqlSession.selectOne("activity.totalCount");
		return totalCount;
	}


	public Activity getOneActivity(Activity act) {
		Activity activity = sqlSession.selectOne("activity.getOneActivity",act);
		return activity;
	}


	public int insertFile(FileVo fileVo) {
		int result = sqlSession.insert("activity.insertFile",fileVo);
		return result;
	}


	public ArrayList<FileVo> getOneFile(int activityNo) {
		List list = sqlSession.selectList("activity.getOneFiles",activityNo);
		return (ArrayList<FileVo>)list;
	}


	public int activityUpdate(Activity activity) {
		int result = sqlSession.update("activity.activityUpdate",activity);
		return result;
	}


	public int delActdFiles(int fileNo) {
		int result = sqlSession.delete("activity.delActdFiles",fileNo);
		return result;
	}

	//카테고리별로 페이징
	public ArrayList<Activity> categoryActivityList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("activity.categoryActivityList",map);
		return (ArrayList<Activity>)list;
	}

	//카테고리별로합쳐서카운팅
	public int categoryActivityCnt(HashMap<String, String> str) {
		int totalCount = sqlSession.selectOne("activity.categoryActivityCnt",str);
		return totalCount;
	}


	public int actInsertCart(Cart cart) {
		int result = sqlSession.insert("activity.actInsertCart",cart);
		return result;
	}


	public int activityDelete(Activity act) {
		int result = sqlSession.insert("activity.activityDelete",act);
		return result;
	}


	public int insertActHistory(ActivityHistory actH) {
		int result = sqlSession.insert("activity.insertActHistory",actH);
		return result;
	}


	public ActivityHistory checkActHistory(ActivityHistory actH) {
		ActivityHistory actHi = sqlSession.selectOne("activity.checkActHistory",actH);
		return actHi;
	}


	public int insertActivityReview(ActivityReview actR) {
		int result = sqlSession.insert("activity.insertActivityReview",actR);
		return result;
	}


	public ArrayList<ActivityReview> actReviewList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("activity.actReviewList",map);
		return (ArrayList<ActivityReview>)list;
	}


	public int selectActReviewCnt(int activityNo) {
		int totalCount = sqlSession.selectOne("activity.selectActReviewCnt",activityNo);
		return totalCount;
	}
}
