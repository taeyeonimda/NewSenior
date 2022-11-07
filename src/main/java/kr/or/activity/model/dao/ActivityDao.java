package kr.or.activity.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.or.activity.model.vo.Activity;
import kr.or.activity.model.vo.FileVo;
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
}
