package kr.or.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.member.model.service.MemberService;

@Component
public class ScheduleTest {
	@Autowired
	private MemberService service;
	/*
		@Scheduled(fixedDelay = 30000)
	public void scheduleTest1() {
		System.out.println("예약작업 자동 실행 메소드!!--30초");
	}
	
	@Scheduled(fixedDelay = 20000)
	public void scheduleTest2() {
		System.out.println("예약작업 자동 실행 메소드!! -- 20초");
	}
	
	@Scheduled(cron = "10 * * * * *")
	public void scheduleTest3() {
		System.out.println("크론식으로 동작하는 함수");
	} 
	 */

	//회원 탈퇴 60분마다 (쿼리문은 하루 지난 회원만)
	@Scheduled(cron = "0 */2 * * * *")
	public void scheduleTest4() {
		int result = service.deleteMember();
		if(result>0) {
			System.out.println("state 있는 멤버 삭제 성공");
		}else {
			System.out.println("state 있는 멤버 삭제  실패");
		}
	}
	 
}
