package kr.or.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.member.model.vo.Delivery;
import kr.or.member.model.vo.Member;
import kr.or.nsClass.model.vo.ClassHistory;
import kr.or.nsClass.model.vo.ClassReview;
import kr.or.nsClass.model.vo.NsClass;

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
	// 로그인
	public Member loginCheck(Member m) {
		Member member = sqlSession.selectOne("member.selectLogin",m);
		return member;
	}
	
	//마이페이지 가기
	public Member selectOneMember(Member m1) {
		Member member = sqlSession.selectOne("member.selectOneMember",m1);
		return member;
	}

	public int updateMember(Member member) {
		int result = sqlSession.update("member.updateMember",member);
		return result;
	}

	public int insertMember(Member m) {
		int result = sqlSession.insert("member.insertMember",m);
		return result;
	}

	public int changePw(Member m) {
		int result = sqlSession.update("member.changePw",m);
		return result;
	}

	public ArrayList<Member> getAllAdmin() {
		List list = sqlSession.selectList("member.getAllAdmin");
		return (ArrayList<Member>)list;
	}

	public int updatePw(Member member) {
		int result = sqlSession.update("member.updatePw",member);
		return result;
	}

	public int insertAddr(Delivery delivery) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("delivery.insertAddr",delivery);
		return result;
	}

	public int updateAddr(Delivery delivery) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("delivery.updateAddr",delivery);
		return result;
	}

	public ArrayList<Delivery> selectAllDelivery(Member m) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("delivery.selectAllDelivery",m);
		return (ArrayList<Delivery>)list;
	}

	public int deleteAddr(Integer deliveryNo) {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("delivery.deleteAddr",deliveryNo);
		return result;
	}

	public Delivery selectOneDelivery(Integer deliveryNo) {
		// TODO Auto-generated method stub
		Delivery d = sqlSession.selectOne("delivery.selectOneDelivery",deliveryNo);
		return d;
	}


	public int updateOneAddr(Delivery delivery) {
		// TODO Auto-generated method stub
 		int result = sqlSession.update("delivery.updateOneAddr",delivery);
		return result;
	}

	public Member loginCheckKakao(Member m) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("member.selectKaKaoLogin",m);
		return member;
	}

	public int insertKakaoMemeber(Member m) {
		// TODO Auto-generated method stub
		int result = sqlSession.insert("member.insertKakaoMember",m);
		return result;
	}
	//member_state에 sysdate 주기
	public int deleteUser(Member m) {
		// TODO Auto-generated method stub
		int result = sqlSession.update("member.deleteUser",m);
		return result;
	}
	/*
	//일정 시간 지나면 db 삭제 진행 
	public int deleteMember() {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("member.deleteMember");
		return result;
	}
	*/

	public int deleteMember() {
		// TODO Auto-generated method stub
		int result = sqlSession.delete("member.deleteMember");
		return result;
	}

	public Delivery inputDelivery(int memberNo) {
		Delivery de = sqlSession.selectOne("delivery.inputDelivery", memberNo);
		return de;
	}
	
	public ArrayList<ClassHistory> selectAllHistory(Member member) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("nsClass.selectAllHistory",member);
		return (ArrayList<ClassHistory>)list;
	}

	public ArrayList<ClassHistory> selectEndHistory(Member member) {
		// TODO Auto-generated method stub
		List endList = sqlSession.selectList("nsClass.selectEndHistory",member);
		return (ArrayList<ClassHistory>)endList;
	}

	public NsClass selectClassName(int classNo) {
		NsClass ns = sqlSession.selectOne("member.selectClassName",classNo);
		return ns;
	}

	public ArrayList<ClassReview> selectAllReview(Member member) {
		// TODO Auto-generated method stub
		List list = sqlSession.selectList("nsClass.selectAllReview",member);
		return (ArrayList<ClassReview>)list;
	}
	
	
	
}
