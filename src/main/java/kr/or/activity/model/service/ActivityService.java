package kr.or.activity.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.activity.model.dao.ActivityDao;
import kr.or.activity.model.vo.Activity;
import kr.or.activity.model.vo.ActivityPageData;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Service
public class ActivityService {

	@Autowired
	private ActivityDao dao;

	@Transactional
	public int insertActivity(Activity activity) {
		String detail = activity.getActivityDetail();
		detail.replace("\r\n", "<br>");
		activity.setActivityDetail(detail);
		int result = dao.insertActivity(activity);
		return result;
	}

	public ActivityPageData getAllActivity(int reqPage) {
		int numPerPage = 5;
		// reqPage에 게시물 번호 읽어오기
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Activity> list = dao.getAllActivity(map);
		// pageNavi 시작
		// 전체페이지 수 계산필요
		int totalCount = dao.selectActivityCnt();
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
			pageNavi += "<a class='page-item' href='/activityMgrAdmin.do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "<span class='material-icons'>chevron_left</span>";
			pageNavi += "</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item active-page' href='/activityMgrAdmin.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				// pageNavi +="<span class='material-icons'>chevron_left</span>";
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li>";
				pageNavi += "<a class='page-item' href='/activityMgrAdmin.do?reqPage=" + pageNo + "'>";
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
			pageNavi += "<a class='page-item' href='/activityMgrAdmin.do?reqPage=" + pageNo + "'>";
			pageNavi += "<span class='material-icons'>chevron_right</span>";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul>";
		ActivityPageData apd = new ActivityPageData(list, pageNavi, reqPage, numPerPage);
		return apd;

	}
}
