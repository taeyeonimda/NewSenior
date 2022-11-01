package kr.or.nsClass.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.nsClass.model.vo.FileVo;
import kr.or.nsClass.model.vo.NsClass;
import kr.or.nsClass.model.vo.NsClassPageData;

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
	
	// 은비 class 리스트
	public ArrayList<NsClass> selectAllClass() {
		List list = sqlSession.selectList("nsClass.selectAllClass");
		return (ArrayList<NsClass>)list;
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
}