package kr.or.nsClass.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Member;
import kr.or.nsClass.model.vo.NsClass;

@Repository
public class NsClassDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<NsClass> getAllClass(HashMap<String, Object> map) {
		List list = sqlSession.selectList("nsClass.getAllClass",map);
		return (ArrayList<NsClass>)list;
	}
	
	public int selectClassCnt() {
		int totalCount = sqlSession.selectOne("nsClass.totalCount");
		return totalCount;
	}
}
