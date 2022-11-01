package kr.or.nsClass.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.nsClass.model.dao.NsClassDao;
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

				String pageNavi = "<ul class='pagination circle-style'>";
				if (pageNo != 1) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/adminMgrClass.do?reqPage=" + (pageNo - 1) + "'>";
					pageNavi += "<span class='material-icons'>chevron_left</span>";
					pageNavi += "</a></li>";
				}
				for (int i = 0; i < pageNaviSize; i++) {
					if (pageNo == reqPage) {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item active-page' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
						pageNavi += pageNo;
						// pageNavi +="<span class='material-icons'>chevron_left</span>";
						pageNavi += "</a></li>";
					} else {
						pageNavi += "<li>";
						pageNavi += "<a class='page-item' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
						pageNavi += pageNo;
						// pageNavi +="<span class='material-icons'>chevron_left</span>";
						pageNavi += "</a></li>";
					}
					pageNo++;
					if (pageNo > totalPage) {
						break;
					}
				}
				// 다음버튼
				if (pageNo <= totalPage) {
					pageNavi += "<li>";
					pageNavi += "<a class='page-item' href='/adminMgrClass.do?reqPage=" + pageNo + "'>";
					pageNavi += "<span class='material-icons'>chevron_right</span>";
					pageNavi += "</a></li>";
				}
				pageNavi += "</ul>";
				NsClassPageData npd = new NsClassPageData(list, pageNavi, reqPage, numPerPage);
				return npd;

	}
	@Transactional
	public int insertClass(NsClass nsCl) {
		int result = dao.insertClass(nsCl);
	System.out.println("result결과값"+result);
	System.out.println("nscl넘버값"+nsCl.getClassNo());
	System.out.println(nsCl);
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
	
	
	
	// 은비 클래스 리스트
	public ArrayList<NsClass> selectClassList(NsClass nc) {
		return dao.selectClassList(nc);
	}

	// 은비 클래스 detail
	public NsClass selectOneClass(NsClass nc) {
		return dao.selectOneClass(nc);
	}
	
	//보류중인클래스
	public ArrayList<NsClass> holdClass() {
		ArrayList<NsClass> list = dao.holdClass();
		for(int i=0;i<list.size();i++) {
			System.out.println("시작날::::"+list.get(i).getStartDate());
			System.out.println("끝난날::::"+list.get(i).getEndDate());
			System.out.println("계산?::::"+list.get(i).getDayDate());
		}
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
		return dao.changeStatus(nsCl);
	}

	public ArrayList<NsClass> getMyClass(int memberNo) {
		return dao.getMyClass(memberNo);
	}
}
