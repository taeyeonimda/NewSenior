package kr.or.nsClass.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.vo.MemberPageData;
import kr.or.nsClass.model.dao.NsClassDao;
import kr.or.nsClass.model.vo.ClassReview;
import kr.or.nsClass.model.vo.FileVo;
import kr.or.nsClass.model.vo.NsClass;
import kr.or.nsClass.model.vo.NsClassPageData;

@Service
public class NsClassService {
	@Autowired
	private NsClassDao dao;

	public NsClassPageData getAllClass(int reqPage) {
		// 한페이지당 보여줄 게시물 수
				int numPerPage = 5;
				// reqPage에 게시물 번호 읽어오기
				int end = reqPage * numPerPage;
				int start = end - numPerPage + 1;
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("start", start);
				map.put("end", end);
				ArrayList<NsClass> list = dao.getAllClass(map);
				System.out.println("list::::"+list);
				// pageNavi 시작
				// 전체페이지 수 계산필요
				int totalCount = dao.selectClassCnt();
				System.out.println("totalCount::::::"+totalCount);
				int totalPage = 0;
				if (totalCount % numPerPage == 0) {
					totalPage = totalCount / numPerPage;
				} else {
					totalPage = totalCount / numPerPage + 1;
				}

				int pageNaviSize = 5;
				int pageNo = 1;
				if (reqPage > 3) {
					pageNo = reqPage - 2;
				}
				String pageNavi = "<nav aria-label=\"Page navigation example\">";
				pageNavi += "<ul class='pagination justify-content-center'>";
				if (pageNo != 1) {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='adminMgrClass.do?reqPage=" + (pageNo - 1) + "'>";
					pageNavi += "Previous";
					pageNavi += "</a></li>";
				}
				for (int i = 0; i < pageNaviSize; i++) {
					if (pageNo == reqPage) {
						pageNavi += "<li class='page-item' >";
						pageNavi += "<a class='page-link active-page' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					} else {
						pageNavi += "<li class='page-item' >";
						pageNavi += "<a class='page-link' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
						pageNavi += pageNo;
						pageNavi += "</a></li>";
					}
					pageNo++;
					if (pageNo > totalPage) {
						break;
					}
				}
				// 다음버튼 
				if (pageNo <= totalPage) {
					pageNavi += "<li class='page-item' >";
					pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
					pageNavi += "Nextpage";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul></nav>";
				NsClassPageData npd = new NsClassPageData(list, pageNavi, reqPage, numPerPage);
				return npd;
				
				
//				String pageNavi = "<ul class='pagination circle-style'>";
//				if (pageNo != 1) {
//					pageNavi += "<li>";
//					pageNavi += "<a class='page-item' href='/adminMgrClass.do?reqPage=" + (pageNo - 1) + "'>";
//					pageNavi += "<span class='material-icons'>chevron_left</span>";
//					pageNavi += "</a></li>";
//				}
//				for (int i = 0; i < pageNaviSize; i++) {
//					if (pageNo == reqPage) {
//						pageNavi += "<li>";
//						pageNavi += "<a class='page-item active-page' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
//						pageNavi += pageNo;
//						// pageNavi +="<span class='material-icons'>chevron_left</span>";
//						pageNavi += "</a></li>";
//					} else {
//						pageNavi += "<li>";
//						pageNavi += "<a class='page-item' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
//						pageNavi += pageNo;
//						// pageNavi +="<span class='material-icons'>chevron_left</span>";
//						pageNavi += "</a></li>";
//					}
//					pageNo++;
//					if (pageNo > totalPage) {
//						break;
//					}
//				}
//				// 다음버튼
//				if (pageNo <= totalPage) {
//					pageNavi += "<li>";
//					pageNavi += "<a class='page-item' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
//					pageNavi += "<span class='material-icons'>chevron_right</span>";
//					pageNavi += "</a></li>";
//				}
//				pageNavi += "</ul>";
//				NsClassPageData npd = new NsClassPageData(list, pageNavi, reqPage, numPerPage);
//				return npd;

	}
	@Transactional
	public int insertClass(NsClass nsCl) {
		String teacherIntroduce = nsCl.getTeacherIntroduce();
		teacherIntroduce.replace("\r\n","<br>");
		String curriculum =nsCl.getCurriculum();
		curriculum.replace("\r\n","<br>");
		nsCl.setTeacherIntroduce(teacherIntroduce);
		nsCl.setCurriculum(curriculum);
		int result = dao.insertClass(nsCl);
		
		if(result>0) {
			if(!nsCl.getFileList().isEmpty()) {
			
						
				for(FileVo fileVo:nsCl.getFileList()) {
					System.out.println("클래스넘버:::"+nsCl.getClassNo());
					fileVo.setClassNo(nsCl.getClassNo());
					result += dao.insertFile(fileVo);
				}
			}
		}
		return result;
	}

	public ArrayList<String> getAllCategory() {
		return dao.getAllCategory();
	}
	
	
	
	// 은비 카테고리별 클래스 리스트
	public NsClassPageData selectClassList(String classCategory, int reqPage) {
		// 한페이지당 보여줄 게시물 수
		int numPerPage = 6;
		// reqPage에 게시물 번호 읽어오기
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("classCategory", classCategory);
		ArrayList<NsClass> list = dao.selectClassList(map);
		// pageNavi 시작
		// 전체페이지 수 계산필요
		HashMap<String, String> str = new HashMap<String, String>();
		str.put("classCategory", classCategory);
		int totalCount = dao.categoryClassCnt(str);
		int totalPage = 0;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}

		int pageNaviSize = 5;
		int pageNo = 1;
		if (reqPage > 3) {
			pageNo = reqPage-2;
		}
///classList.do?classCategory="+classCategory+"&reqPage="+(pageNo - 1)+"'>";
		String pageNavi = "<nav aria-label=\"Page navigation example\">";
		pageNavi += "<ul class='pagination justify-content-center'>";
		if (pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/classList.do?classCategory="+classCategory+"&reqPage="+(pageNo - 1)+ "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link active-page' href='/classList.do?classCategory="+classCategory+"&reqPage="+(pageNo) + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link' href='/classList.do?classCategory="+classCategory+"&reqPage="+(pageNo) + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			}
			pageNo++;
			if (pageNo > totalPage) {
				break;
			}
		}
		// 다음버튼 
		if (pageNo <= totalPage) {
			pageNavi += "<li class='page-item' >";
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/classList.do?classCategory="+classCategory+"&reqPage="+(pageNo) + "'>";
			pageNavi += "Nextpage";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul></nav>";
		
		NsClassPageData npd = new NsClassPageData(list, pageNavi, reqPage, numPerPage);
		
		return npd;
	}
	
	// 은비 클래스 detail
	public NsClass selectOneClass(NsClass nc) {
		return dao.selectOneClass(nc);
	}
	
	
	//보류중인클래스
	public ArrayList<NsClass> holdClass() {
		ArrayList<NsClass> list = dao.holdClass();
		return list;
	}

	@Transactional
	public int classUpdate(int classNo) {
		return dao.classUpdate(classNo);
	}

	public NsClass getOneClass(int classNo) {
		return dao.getOneClass(classNo);
	}

	public ArrayList<FileVo> getOneFile(int classNo) {
		return dao.getOneFile(classNo);
	}

	@Transactional
	public int chnageStatus(NsClass nsCl) {
		int result = dao.changeStatus(nsCl);
		if(result>0) {
			//보류중인 클래스 등록해주고 등록해주면서 강사등급으로 변경
			dao.updateMemberGrade(nsCl.getClassTeacher());
		}
		
		return result;
	}

	//강사관리페이지에서 진행중인 본인 관련 강의들
	public ArrayList<NsClass> getMyClass(int memberNo) {
		return dao.getMyClass(memberNo);
	}
	
	//강사관리페이지에서 종료된 본인 관련 강의들
	public ArrayList<NsClass> getMyEndClass(int memberNo) {
		return dao.getMyEndClass(memberNo);
	}
	
	@Transactional
	public int changeStatus2(NsClass nscl) {
		return dao.changeStatus2(nscl);
	}
	public int insertClassReview(ClassReview cr) {
		return dao.insertClassReview(cr);
	}
	public ArrayList<ClassReview> getTeacherReview(NsClass cla) {
		return dao.getTeacherReview(cla);
	}
}
