<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme" style="top: 30px; display: inline-block; width: 300px;  min-height: 700px;">
          <ul class="menu-inner py-1">


	<c:if test="${sessionScope.m ne null and sessionScope.m.memberGrade eq 3}">
		<!-- 회원관리(운영자) -->
			<li class="menu-item  mypage">
              <a href="mypage.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">마이페이지</div>
              </a>
            </li>
		
            <li class="menu-item adminMenuItem">
              <a href="/adminPage.do?reqPage=1" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">회원 관리</div>
              </a>
            </li>
            
            <!-- Tables(운영자) -->
            <li class="menu-item adminClassMenu">
              <a href="/adminMgrClass.do?reqPage=1" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">클래스관리(관리자페이지)</div>
              </a>
            </li>
            
               <!-- 액티비티등록(운영자) -->
            <li class="menu-item activityEnroll">
              <a href="activityEnroll.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">액티비티 등록</div>
              </a>
            </li>
         

          

          <!-- 액티비티관리 -->
            <li class="menu-item activityMgrAdmin">
              <a href="activityMgrAdmin.do?reqPage=1" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">액티비티 관리</div>
              </a>
            </li>

           
			
            <!-- 상품등록 -->
            <li class="menu-item insertProductFrm">
              <a href="insertProductFrm.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">상품 등록</div>
              </a>
            </li>

            <!-- 상품관리 -->
            <li class="menu-item goodsMgrAdmin">
              <a href="/adminProductList.do?reqPage=1" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">상품 관리</div>
              </a>
            </li>
			</c:if>
			
			<c:if test="${sessionScope.m.memberGrade eq 2}">
			<li class="menu-item  mypage">
              <a href="mypage.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">마이페이지</div>
              </a>
            </li>
			
			<!-- 클래스관리 -->
            <li class="menu-item classMgrTeacher">
              <a href="classMgrTeacher.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">클래스관리(강사페이지)</div>
              </a>
            </li>
            
            <!-- 클래스등록 -->
            <li class="menu-item classEnroll">
              <a href="classEnroll.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">클래스 등록</div>
              </a>
            </li>
            
			</c:if>

		<c:if test="${sessionScope.m.memberGrade eq 1}">
			<!-- 마이페이지 -->
            <li class="menu-item  mypage">
              <a href="mypage.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">마이페이지</div>
              </a>
            </li>
            
            <!-- 장바구니 -->
            <li class="menu-item cart">
              <a href="cart.do?memberNo=${sessionScope.m.memberNo }" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">장바구니</div>
              </a>
            </li>

            
                      <!-- 주문내역 -->
          <li class="menu-item orderHistory">
            <a href="orderHistory.do?memberNo=${sessionScope.m.memberNo }" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">주문내역</div>
            </a>
          </li>
          
          <!-- 내동호회 -->
          <li class="menu-item myClub ">
            <a href="myClubList.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">내동호회</div>
            </a>
          </li>
          
          <!-- 수강현황 -->
          <li class="menu-item  classHistory">
            <a href="classHistory.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">수강현황</div>
            </a>
          </li>
          <!-- 나의후기 -->
          <li class="menu-item  myComment">
            <a href="myComment.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">나의후기</div>
            </a>
          </li>
          </c:if>
          
          </ul>
        </aside>
        
        <script>
            	const url = window.location.href;
            	let chk = /adminPage.do/g;
            	if(chk.test(url)){
            		$(".adminMenuItem").addClass("active");
            	}
            	
            	chk = /adminMgrClass.do/g;
            	if(chk.test(url)){
            		$(".adminClassMenu").addClass("active");
            	}
            	
            	chk = /classMgrTeacher.do/g;
            	if(chk.test(url)){
            		$(".classMgrTeacher").addClass("active");
            	}
            	chk = /classEnroll.do/g;
            	if(chk.test(url)){
            		$(".classEnroll").addClass("active");
            	}
            	chk = /activityEnroll.do/g;
            	if(chk.test(url)){
            		$(".activityEnroll").addClass("active");
            	}
            	chk = /activityMgrAdmin.do/g;
            	if(chk.test(url)){
            		$(".activityMgrAdmin").addClass("active");
            	}
            	chk = /insertProductFrm.do/g;
            	if(chk.test(url)){
            		$(".insertProductFrm").addClass("active");
            	}
            	chk = /goodsMgrAdmin.do/g;
            	if(chk.test(url)){
            		$(".goodsMgrAdmin").addClass("active");
            	}
            	chk = /cart.do/g;
            	if(chk.test(url)){
            		$(".cart").addClass("active");
            	}
            	chk = /mypage.do/g;
            	if(chk.test(url)){
            		$(".mypage").addClass("active");
            	}
            	chk = /orderHistory.do/g;
            	if(chk.test(url)){
            		$(".orderHistory").addClass("active");
            	}
         
            	chk = /classHistory.do/g;
            	if(chk.test(url)){
            		$(".classHistory").addClass("active");
            	}
            	chk = /myComment.do/g;
            	if(chk.test(url)){
            		$(".myComment").addClass("active");
            	}
            	
            	chk = /teacherInfo.do/g;
            	if(chk.test(url)){
            		$(".teacherInfo").addClass("active");
            	}
            	
            	chk = /myClubList.do/g;
            	if(chk.test(url)){
            		$(".myClub").addClass("active");
            	}
         </script>