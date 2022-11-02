<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme"
         style="top: 30px; display: inline-block; width: 300px; height: 400px;">
          
          <ul class="menu-inner py-1">

            <!-- 회원관리 -->
            <li class="menu-item active">
              <a href="/adminPage.do?reqPage=1" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">회원 관리</div>
              </a>
            </li>
            
            <!-- Tables -->
            <li class="menu-item">
              <a href="/adminMgrClass.do?reqPage=1" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">클래스관리(관리자페이지)</div>
              </a>
            </li>

            <!-- 클래스관리 -->
            <li class="menu-item">
              <a href="classMgrTeacher.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-collection"></i>
                <div data-i18n="Basic">클래스관리(강사페이지)</div>
              </a>
            </li>
            <!-- 클래스등록 -->
            <li class="menu-item">
              <a href="classEnroll.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">클래스 등록</div>
              </a>
            </li>

            <!-- 액티비티등록 -->
            <li class="menu-item ">
              <a href="activityEnroll.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">액티비티 등록</div>
              </a>
            </li>

            <!-- 액티비티관리 -->
            <li class="menu-item ">
              <a href="activityMgrAdmin.do?reqPage=1" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">액티비티 관리</div>
              </a>
            </li>

            <!-- 상품등록 -->
            <li class="menu-item ">
              <a href="goodsEnroll.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">상품 등록</div>
              </a>
            </li>

            <!-- 상품관리 -->
            <li class="menu-item">
              <a href="goodsMgrAdmin.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">상품 관리</div>
              </a>
            </li>


            <!-- 장바구니 -->
            <li class="menu-item ">
              <a href="cart.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">장바구니</div>
              </a>
            </li>

            <!-- 마이페이지 -->
            <li class="menu-item  ">
              <a href="mypage.do" class="menu-link">
                <i class="menu-icon tf-icons bx bx-detail"></i>
                <div data-i18n="Basic Inputs">마이페이지</div>
              </a>
            </li>
                      <!-- 주문내역 -->
          <li class="menu-item">
            <a href="orderHistory.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">주문내역</div>
            </a>
          </li>
          </ul>
        </aside>