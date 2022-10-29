package kr.or.club.controller;

import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.or.member.model.service.MemberService;
import kr.or.club.model.vo.ChatRecord;
import kr.or.club.model.vo.Club;

public class ClubMemberChat extends TextWebSocketHandler{
	
	private ArrayList<WebSocketSession> sessionList;
	private HashMap<String, ArrayList<WebSocketSession>> clubMemberMap;
	private HashMap<WebSocketSession, String> memberList;
	private String club = null;
	String sessionId = null;
	@Autowired
	private MemberService service;
	 
	public ClubMemberChat() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		clubMemberMap = new HashMap<String, ArrayList<WebSocketSession>>();
		memberList = new HashMap<WebSocketSession, String>();
	}
	
	// 클라이언트가 웹소켓에 접속했을 대 자동으로 수행되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("클라이언트 접속");
		sessionList.add(session);
		// 접속중인 webSocketSession의 session 정보를 내가 가진 list로 옮겨놓음
	}
	// 클라이언트가 웹소켓 서버로 메시지를 전송하면 수행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
		System.out.println("전송 메시지 : "+message.getPayload());
		// 문자열을 Json 객체로 변환
		JsonParser parser = new JsonParser();
		// parser를 이용해서 문자열 > Json 변환
		JsonElement element = parser.parse(message.getPayload());
		// key가 type인 값을 추출
		String type = element.getAsJsonObject().get("type").getAsString(); // 배열이면 배열로 받으면 됨
		// key가 msg인 값을 추출
		String msg = element.getAsJsonObject().get("msg").getAsString();
		club = element.getAsJsonObject().get("club").getAsString();
		
		if(type.equals("enter")) {
			memberList.put(session, msg);// 현재 내 세션과 아이디 push
			sessionId = msg;
			// 최초 접속이므로 멤버 목록에 추가
			if(clubMemberMap.get(club)==null) { // 해당 클럽 key에 해당하는 배열이 없으면 배열 생성
				ArrayList<WebSocketSession> list = new ArrayList<WebSocketSession>();
				list.add(session);
				clubMemberMap.put(club, list);	// 같은 클럽 멤버 중 접속 멤버
			}else { // 있으면 배열 꺼내서 session추가
				ArrayList<WebSocketSession> list = clubMemberMap.get(club);
				list.add(session);
				clubMemberMap.put(club, list);
			}

			/*
			// 지난 대화 출력
			ArrayList<ChatRecord> crList = service.getMyClubRecord(club); // 지난 대화를 객체로 불러옴
			System.out.println("crList size : "+crList.size());
			if(crList.size()>0) {
				for (ChatRecord cr : crList) {
					if(cr.getChatMember().equals(sessionId)) {
						String sendMsg = "<div class='chat right'>"+cr.getChatContent()+"</div>";
						TextMessage tm = new TextMessage(sendMsg);
						session.sendMessage(tm);
					}else {
						String sendMsg = "<div class='chat left'><span class='chatId'>"+cr.getChatMember()+" : </span>"+cr.getChatContent()+"</div>";
						TextMessage tm = new TextMessage(sendMsg);
						session.sendMessage(tm);
					}
				}
			}
			*/
			
			String sendMsg = "<p>"+msg+"님이 입장하셨습니다.</p>";
			for(WebSocketSession s : clubMemberMap.get(club)) {
				// hashMap의 key값이 club 넘버와 일치하는 session의 리스트 순회
					if(!s.equals(session)) { // 매개변수로 받은 session과 같으면 나 자신이니까 나에게는 빼고 입정하셨슴다 보내주겠다
						// 클라이언트 전송용 객체 생성
						TextMessage tm = new TextMessage(sendMsg); // 보내고 싶은 메시지를 매개변수로
						// 클라이언트에게 전송
						s.sendMessage(tm);
					}
			}
		}else if(type.equals("chat")) { //  
			System.out.println("chat으로 받았을 때 " +memberList.get(session));
			//recordChat(memberList.get(session), msg); //대화내용을 저장하는 메서드
			String sendMsg = "<div class='chat left'><span class='chatId'>"+memberList.get(session)+" : </span>"+msg+"</div>"; // session으로 고유 key값 넣어줬으니
			TextMessage tm = new TextMessage(sendMsg); // 보내고 싶은 메시지를 매개변수로
			for(WebSocketSession s : clubMemberMap.get(club)) {
				if(!s.equals(session)) { // 매개변수로 받은 session과 같으면 나 자신이니까 나에게는 빼고 입정하셨슴다 보내주겠다
					// 클라이언트에게 전송 
					s.sendMessage(tm);
				}
			}
		}else if(type.equals("file")) {
			System.out.println("file으로 받았을 때 " +msg);
			String sendMsg = "<div class='chat left'><span class='chatId'>"+memberList.get(session)+" : </span><img width='150px' height='180px' src='/resources/upload/chat/"+msg+"'></div>"; // session으로 고유 key값 넣어줬으니
			TextMessage tm = new TextMessage(sendMsg); // 보내고 싶은 메시지를 매개변수로
			for(WebSocketSession s : clubMemberMap.get(club)) {
				if(!s.equals(session)) { // 매개변수로 받은 session과 같으면 나 자신이니까 나에게는 빼고 입정하셨슴다 보내주겠다
					// 클라이언트에게 전송 
					s.sendMessage(tm);
				}
			}
		}
	}
	// 클라이언트와 연결이 끊어졌을 때 자동으로 수행되는 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("클라이언트 접속 끗");
		clubMemberMap.get(club).remove(session);
		sessionList.remove(session);
	}
	
	public void recordChat(String memberId, String msg) {
		// 채팅 내용 insert > 저장하는 메서드
		System.out.println("recordChat메서드실행"+memberId);
		System.out.println(msg);
		ChatRecord cr = new ChatRecord();
		cr.setChatMember(memberId);
		cr.setChatContent(msg);
		cr.setChatClub(club);
		// int result = service.insertChat(cr);
		// System.out.println(result);
	}
}
