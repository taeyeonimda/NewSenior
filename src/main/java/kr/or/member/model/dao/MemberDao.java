package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.club.model.vo.ChatRecord;
import kr.or.member.model.vo.Member;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> getAllMembers(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.allMembmerList",map);
		return (ArrayList<Member>)list;
	}

	public int selectMembersCnt() {
		int totalCount = sqlSession.selectOne("member.totalCount");
		return totalCount;
	}

	public int changeLevel(Member m) {
		int result = sqlSession.update("member.changeLevel",m);
		return result;
	}

	
}
