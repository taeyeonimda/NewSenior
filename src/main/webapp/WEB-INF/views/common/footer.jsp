<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-4">NewSenior</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>서울특별시 영등포구 선유동2로 57 이레빌딩</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+02-1544-9970</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>kh@naver.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-4">Services</h4>
                        <a class="btn btn-link" onclick="location.href='/classList.do?classCategory=AL&reqPage=1'">클래스</a>
                        <a class="btn btn-link" onclick="location.href='/activityList.do?activityCategory=AL&reqPage=1'">액티비티</a>
                        <a class="btn btn-link" href="/popularClubList.do?memberNo=${sessionScope.m.memberNo }" >동호회</a>
                        
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-4">Quick Links</h4>
                        <a class="btn btn-link" href="/boardList.do?reqPage=1&boardType=F" >자유게시판</a>
                        <a class="btn btn-link" href="boardList.do?reqPage=1&boardType=P">동호회모집</a>
                        <a class="btn btn-link" href="boardList.do?reqPage=1&boardType=I" >정보게시판</a>
                        <a class="btn btn-link" href="/boardList.do?reqPage=1&boardType=F">커뮤니티</a>
                        <a class="btn btn-link" href="/productList.do?reqPage=1">마켓</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="text-white mb-4">Newsletter</h4>
                        <p>NewSenior에 새로운 소식을 전하고 싶으신가요?</p>
                        <div class="position-relative w-100">
                            <input class="form-control bg-light border-light w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->
</body>
</html>