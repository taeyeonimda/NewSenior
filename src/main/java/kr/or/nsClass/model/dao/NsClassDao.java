package kr.or.nsClass.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import kr.or.nsClass.model.vo.ClassHistory;
import kr.or.nsClass.model.vo.ClassReview;
import kr.or.nsClass.model.vo.FileVo;
import kr.or.nsClass.model.vo.NsClass;
import kr.or.nsClass.model.vo.NsClassPageData;

@Repository
public class NsClassDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<NsClass> getAllClass(HashMap<String, Object> map) {
		List list = sqlSession.selectList("nsClass.getAllClass", map);
		return (ArrayList<NsClass>)list;
	}
	public int selectClassCnt() {
		int totalCount = sqlSession.selectOne("nsClass.totalCount");
		return totalCount;
	}
	public int insertClass(NsClass nsCl) {
		int result = sqlSession.insert("nsClass.insertClass",nsCl);
		return result;
	}
	public int insertFile(FileVo fileVo) {
		int result = sqlSession.insert("nsClass.insertFile",fileVo);
		return result;
	}
	public int selectClassNo() {
		int result = sqlSession.selectOne("nsClass.selectClassNo");
		return result;
	}
	public ArrayList<String> getAllCategory() {
		List list = sqlSession.selectList("nsClass.getAllCategory");
		return (ArrayList<String>)list;
	}

	
	
	
	// 은비 카테고리별 class 리스트
	public ArrayList<NsClass> selectClassList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("nsClass.selectClassList", map);
		return (ArrayList<NsClass>)list;
	}
	public int categoryClassCnt(HashMap<String, String> str) {
		int cnt = sqlSession.selectOne("nsClass.getClassTotal", str);
		return cnt;
	}
	public NsClass selectOneClass(NsClass nc) {
		NsClass cla = sqlSession.selectOne("nsClass.selectOneClass", nc);
		return cla;
	}

	
	
	
	public ArrayList<NsClass> holdClass() {
		List list = sqlSession.selectList("nsClass.holdClass");
		return (ArrayList<NsClass>)list;
	}
	public int classUpdate(int classNo) {
		int result = sqlSession.update("nsClass.classUpdate",classNo);
		return result;
	}
	
	public NsClass getOneClass(int classNo) {
		NsClass nsCla = sqlSession.selectOne("nsClass.getOneClass",classNo);
		return nsCla;
	}
	public ArrayList<FileVo> getOneFile(int classNo) {
		List list = sqlSession.selectList("nsClass.getOneFiles",classNo);
		return (ArrayList<FileVo>)list;
	}
	public int changeStatus(NsClass nsCl) {
		int result = sqlSession.update("nsClass.changeStatus",nsCl);
		return result;
	}
	public ArrayList<NsClass> getMyClass(int memberNo) {
		List list = sqlSession.selectList("nsClass.getMyClass",memberNo);
		return (ArrayList<NsClass>)list;
	}
	
	public ArrayList<NsClass> getMyEndClass(int memberNo) {
		List list = sqlSession.selectList("nsClass.getMyEndClass",memberNo);
		return (ArrayList<NsClass>)list;
	}
	
	public int changeStatus2(NsClass nscl) {
		int result = sqlSession.update("nsClass.changeStatus2",nscl);
		return result;
	}
	//클래스 등록 후 등록한 회원 GRADE변경
	public int updateMemberGrade(int classTeacher) {
		int result = sqlSession.update("nsClass.updateMemberGrade",classTeacher);
		return 0;
	}

	// 클래스 리뷰작성
	public int insertClassReview(ClassReview cr) {
		int result = sqlSession.insert("nsClass.insertClassReview", cr);
		return result;
	}
	public ArrayList<ClassReview> getTeacherReview(NsClass cla) {
		List list = sqlSession.selectList("nsClass.selectTeacherReview", cla);
		return (ArrayList<ClassReview>)list;
	}
	
	// 클래스 신청 (결제)
	public int insertPayClassHistory(ClassHistory clh) {
		return sqlSession.insert("nsClass.insertPayClassHistory", clh);
	}
	public int selectClassHistorySum(NsClass nc) {
		return sqlSession.selectOne("nsClass.selectClassHistorySum", nc);
	}

}