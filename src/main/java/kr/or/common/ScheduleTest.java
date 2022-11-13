package kr.or.common;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class ScheduleTest {
	
	
	
	@Scheduled(fixedDelay = 5000)
	public void scheduleTest1() {
		System.out.println("예약작업 자동 실행 메소드!!--5초");
	}
	
	@Scheduled(fixedDelay = 1000)
	public void scheduleTest2() {
		System.out.println("예약작업 자동 실행 메소드!! -- 1초");
	}
}
