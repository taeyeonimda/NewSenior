<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- page Content 시작-->
    <div class="page-content rounded">
        <!-- sideBar-right 회원 목록 /  채팅하기 버튼 -->
        <div class="sidenav-right bg-white rounded p-sm-5 wow fadeIn">
            <div class="side-box rounded mt-2">
                <p class="fs-5 fw-bold text-primary mt-5">내 동아리 정보</p>
                <div class="side-info-box text-center">
                    <div class="side-info-box text-center">
                        <div><span>동아리이름</span><span>(이동)</span></div>
                        <div><span>동아리이름</span><span>(이동)</span></div>
                        <div><span>동아리이름</span><span>(이동)</span></div>
                        <div><span>동아리이름</span><span>(이동)</span></div>
                    </div>
                </div>
                <div>
                    <div class="btn-group mt-2" role="group" aria-label="Basic outlined example">
                        <button type="button" class="btn btn-outline-primary">Left</button>
                        <button type="button" class="btn btn-outline-primary">Left</button>
                        <button type="button" class="btn btn-outline-primary">Right</button>
                    </div>
                </div>
            </div>
            <div class="side-box rounded mt-5">
                <p class="fs-5 fw-bold text-primary">강사소개</p>
                <div class="side-info-box text-center">
                    <div><span>회원이름</span><span>(간단정보)</span></div>
                    <div><span>회원이름</span><span>(간단정보)</span></div>
                    <div><span>회원이름</span><span>(간단정보)</span></div>
                    <div><span>회원이름</span><span>(간단정보)</span></div>
                </div>
                <div>
                    <div class="btn-group mt-2" role="group" aria-label="Basic outlined example">
                        <button type="button" class="btn btn-outline-primary">Left</button>
                        <button type="button" class="btn btn-outline-primary">Left</button>
                        <button type="button" class="btn btn-outline-primary">Right</button>
                    </div>
                    <button class="btn btn-primary py-2 px-4 mt-2" id="club-boardFrm-btn">채팅방 참여</button>
                </div>
            </div>
        </div>

        <!-- sideBar-left 동호회 정보 목록 /  채팅하기 버튼 -->
        <div class="sidenav-left bg-light rounded p-sm-5 wow fadeIn">
            <div class="side-box rounded mt-5">
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-3">
                        <li class="breadcrumb-item"><a href="#">Club</a></li>
                        <li class="breadcrumb-item"><a href="/class-list.html">My Club</a></li>
                        <li class="breadcrumb-item active" aria-current="page">코딩동호회</li>
                    </ol>
                </nav>
                <div class="club-title">
                    <div class="club-img-div">
                        <img src="img/모델클래스 (1).jpg" class="club-img">
                    </div>
                </div>
                <p class="fs-5 fw-bold text-primary mt-2">안산시 코딩동호회</p>
                <div class="side-info-box text-center">
                    <p>우리동호회는요 매일 자바를 하고요 스퓨ㅡ링하고여</p>
                </div>
                <div>
                    <button>동호회 탈퇴하기</button>
                </div>
            </div>
        </div>

        <!-- class main -->
        <div class="center-div">

            <!-- 글쓰기 버튼 구역 -->
            <div class="container-xxl py-5">
                <div class="container class-container">
                    <div class="row g-5 flex-space-between">
                        <div class="wow fadeInUp flex-space-between" data-wow-delay="0.1s">
                            <p class="fs-5 fw-bold text-primary">동호회 게시판</p>
                            <button class="btn btn-primary py-2 px-4" id="club-boardFrm-btn">글쓰기</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- About End -->

            <!-- 회원 게시글 -->
            <div class="container-xxl py-5">
                <div class="container class-container">
                    <div class="row g-5 align-items-end">
                        <div class="col-lg-3 col-md-5 wow fadeInUp flex-space-between" data-wow-delay="0.1s">
                            <p class="fs-5 fw-bold text-primary">동호회 게시판</p>
                            <button class="btn btn-primary py-2 px-4" id="club-boardFrm-btn">글쓰기</button>
                        </div>
                        <div class="col-lg-6 col-md-7 wow fadeInUp" data-wow-delay="0.3s">
                            <p class="text-primary mb-4">Year of Experience</p>
                            <h4 class="display-6 mb-4">"당당하게 걸어요"</h4>
                            <p class="mb-4">연세대 당당걷기과</p>
                            <p class="mb-4">새바람 걷기대회 우승</p>
                            <p class="mb-4">무신사 시니어 모델로 활동 중</p>
                        </div>
                    </div>
                </div>
            </div>
        <!-- About End -->

        <!-- 후기 -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5">
                </div>
                <hr>
                <div class="row">
                    <div class="profil-title">
                        <div class="profil-img-div">
                            <img src="img/person_1.jpg" class="profil-img">
                        </div>
                        <div class="profil-info-div">
                            <div>
                                ★★★★★
                            </div>
                            <div>
                                닉네임
                            </div>
                            <div>
                                작성일
                            </div>
                        </div>
                    </div>
                    <div >
                        <div>컨텡층ㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
                        <div>수정 / 삭제</div>
                    </div>
                </div>
            </div>
        </div>
        </div> <!-- 넓이제한-->
    </div><!--page-content End-->
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
	
</body>
</html>