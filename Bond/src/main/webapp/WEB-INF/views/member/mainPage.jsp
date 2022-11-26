<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>본드 홈 | 본드</title>


    <link rel="stylesheet" href="/resources/css/member/mainPage.css">
    <script src="https://kit.fontawesome.com/345198b845.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/member/mainPage-header.jsp" />

    <!-- 네비게이션 -->
    <section class="nav-area">
        <nav>
            <div class="mainPage-menu">
                <a class="active" href="/member/mainPage">내 모임</a>
                <a href="/member/findBond">모임찾기</a>
            </div>

            <%-- <div class="mainPage-optionBox">
                <a href="#">목록 편집</a>
                <a href="#">본드 가이드</a>
            </div> --%>
        </nav>
    </section>

    <main>
        <!-- 내 모임 리스트 -->
        <section class="myGroup-area">
            <ul class="myGroup-list">
                <li class="groupCardItem">
                    <a href="/bond-create">
                        <div class="make-icon">
                            <span id="plus-icon">
                                <i class="fa-solid fa-plus"></i>
                            </span>
                        </div>
                        <div class="groupInfo make-text">
                            <span class="make-group">만들기</span>
                        </div>
                    </a>
                </li>
                <c:forEach var="myGroup" items="${myGroupList}">
                    <li class="groupCardItem">
                        <a href="/bond/${myGroup.groupNo}">
                            <c:choose>
                                <c:when test="${not empty myGroup.groupImage}">
                                    <img src="${myGroup.groupImage}">
                                </c:when>
                                <c:otherwise>
                                    <img src="/resources/images/bond/profile/non-profile.png">
                                </c:otherwise>
                            </c:choose>
                            <div class="groupInfo">
                                <p>${myGroup.groupName}</p>
                                <span>멤버 ${myGroup.memberCount}</span>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                <%-- <li class="groupCardItem">
                
                    <a href="#">
                        <img src="/resources/images/member/main1/group2.jpg">

                        <div class="groupInfo">
                            <p>여행 가즈아</p>
                            <span>멤버 20</span>
                        </div>
                    </a>
                </li>
                <li class="groupCardItem">
                    <a href="#">
                        <img src="/resources/images/member/main1/group3.jpg">

                        <div class="groupInfo">
                            <p>맛집 탐사대</p>
                            <span>멤버 10</span>
                        </div>
                    </a>
                </li> --%>
            </ul>
        </section>
        <section class="myGroup-schedule">
            <h3>내 모임 정모</h3>
            <div class="schedule">
                
            </div>
        </section>
    </main>
    
    <h3>session scope 확인</h3>
    이름 : "${loginMember.memberName}";
    생일 : "${loginMember.memberBirth}";
    전화번호 : "${loginMember.memberTel}";

    <a href="/logout">로그아웃</a>

    <c:if test="${!empty message}">
        <script>
            alert("${message}");
        </script>
        <%-- message 1회 출력 후 모든 scope에서 message 삭제 --%>
        <c:remove var="message" />
    </c:if>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script src="/resources/js/member/mainPage.js"></script>
</body>
</html>

