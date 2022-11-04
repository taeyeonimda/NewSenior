package kr.or.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.club.model.vo.ChatRecord;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MemberPageData;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao dao;
	public MemberPageData getAllMembers(int reqPage) {
		// 한페이지당 보여줄 게시물 수
		int numPerPage = 5;
		// reqPage에 게시물 번호 읽어오기
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Member> list = dao.getAllMembers(map);
		// pageNavi 시작
		// 전체페이지 수 계산필요
		int totalCount = dao.selectMembersCnt();
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
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/adminPage.do?reqPage=" + (pageNo - 1) + "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo == reqPage) {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link active-page' href='/adminPage.do?reqPage=" + pageNo + "'>";
				pageNavi += pageNo;
				pageNavi += "</a></li>";
			} else {
				pageNavi += "<li class='page-item' >";
				pageNavi += "<a class='page-link' href='/adminPage.do?reqPage=" + pageNo + "'>";
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
			pageNavi += "<a class='page-link'  tabindex='-1' aria-disabled='true' href='/adminPage.do?reqPage=" + pageNo + "'>";
			pageNavi += "Previous";
			pageNavi += "</a></li>";
		}
		pageNavi += "</ul></nav>";
		MemberPageData mpd = new MemberPageData(list, pageNavi, reqPage, numPerPage);
		return mpd;

	}


	@Transactional
	public int chnageLevel(Member m) {
		int result = dao.changeLevel(m);
		return result;
	}

	public boolean checkedChangeLevel(String num, String level) {
		StringTokenizer sT1 = new StringTokenizer(num, "/");
		StringTokenizer sT2 = new StringTokenizer(level, "/");
		boolean result = true;

		while (sT1.hasMoreTokens()) {
			int mNo = Integer.parseInt(sT1.nextToken());
			int mGrade = Integer.parseInt(sT2.nextToken());
			Member m = new Member();
			m.setMemberNo(mNo);
			m.setMemberGrade(mGrade);
			int changeResult = dao.changeLevel(m);
			if (changeResult == 0) {
				result = false;
				break;
			}
		}
		return result;
	}

	public Member loginCheckMember(Member m) {
		
		return dao.loginCheck(m);
	}

	public Member selectOneMember(Member m1) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(m1);
	}

	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return  dao.updateMember(member);
	}

	public int insertMember(Member m) {
		System.out.println("바뀐 비밀번호:"+m.getMemberPw());
		return dao.insertMember(m);
	}

	public int changePwMember(Member m) {
		// TODO Auto-generated method stub
		return  dao.changePw(m);
	}


	//관리자목록가져오기
	public ArrayList<Member> getAllAdmin() {
		return dao.getAllAdmin();
	}

	public int updatePwMember(Member member) {
		// TODO Auto-generated method stub
		return dao.updatePw(member);
	}
}
