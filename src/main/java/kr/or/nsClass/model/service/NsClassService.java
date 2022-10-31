package kr.or.nsClass.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;
import kr.or.nsClass.model.dao.NsClassDao;
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

	public ArrayList<NsClass> selectAllClass() {
		return dao.selectAllClass();
	}
}
