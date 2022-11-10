package kr.or.activity.model.vo;

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
import kr.or.activity.model.vo.FileVo;

@Service
public class ActivityService2 {

	@Autowired
	private ActivityDao dao;

	@Transactional
	public int insertActivity(Activity activity) {
		String detail = activity.getActivityDetail();
		detail.replace("\r\n", "<br>");
		activity.setActivityDetail(detail);
		String etc = activity.getEtc();
		etc.replace("\r\n", "<br>");
		activity.setEtc(etc);
		int result = dao.insertActivity(activity);
		System.out.println("insertActivity service result값"+result);
		
		if(result>0 && activity.getFileList() == null) {
			return result;
		}else if(result>0) {
			System.out.println("insertActivity service No 체크"+activity.getActivityNo());
			if(!activity.getFileList().isEmpty()) {
				for(FileVo fileVo:activity.getFileList()) {
					fileVo.setActivityNo(activity.getActivityNo());
					result += dao.insertFile(fileVo);
				}
			}
		}
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

		String pageNavi = "<nav aria-label=\"Page navigation example\">";
		pageNavi += "<ul class='pagination justify-content-center'>";
		if (pageNo != 1) {
			pageNavi += "<li class='page-item disabled'>";
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/activityMgrAdmin.do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link active-page' href='/activityMgrAdmin.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link' href='/activityMgrAdmin.do?reqPage=" + pageNo + "'>";
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
			pageNavi += "<li class='page-item disabled' >";
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/activityMgrAdmin.do?reqPage=" + pageNo + "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul></nav>";
		ActivityPageData apd = new ActivityPageData(list, pageNavi, reqPage, numPerPage);
		return apd;
		
	}

	public Activity getOneActivity(Activity act) {
		return dao.getOneActivity(act);
	}

	public ArrayList<FileVo> getOneFile(int activityNo) {
		return dao.getOneFile(activityNo);
	}
}
