<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 | 신고 관리</title>

    <link rel="stylesheet" href="../../../resources/css/admin/layout-style.css">
    <link rel="stylesheet" href="../../../resources/css/admin/report-list-style.css">
    <link rel="stylesheet" href="../../../resources/css/admin/searchbar-style.css">
    <link rel="stylesheet" href="../../../resources/css/admin/sidebar-style.css">
    
</head>
<body>

    <jsp:include page="/WEB-INF/views/admin/adminPage-header.jsp" />

    <main> <!-- for background-color -->

        <section class="main"> 
            
	<jsp:include page="/WEB-INF/views/admin/sidebar.jsp" />

            <section class="content">
                <div class="content-header">
                    <h6>신고 관리</h6>
                    <h3>신고 조회</h3>
                </div>
                
				<form id="searchbar" action="/printReportList" method="GET">
				
				    <select name="type">
				        <option value="">분류1</option>
				        <option value="">분류2</option>
				        <option value="">분류3</option>
				    </select>
				
				    <div class="keyword-box">
				        <div class="input-box"><input type="text" name="keyword"></div>
				        <button class="btn">검색</button>
				    </div>
				
				    <select name="number">
				        <option value="">10</option>
				        <option value="">20</option>
				        <option value="">50</option>
				    </select>
				
				</form> <!-- end .searchbar -->

                <div class="content-body">
                    
                    <div class="list-header">
                        <span class="reportNo">번호</span>
                        <span class="reportType">유형</span>
                        <span class="memberName">신고자</span>
                        <span class="targetName">신고대상</span>
                        <span class="reportDate">신고일</span>
                        <span class="processYN">처리여부</span>
                        <span class="processDate">처리일</span>
                    </div>
					
					<!-- 목록 불러오기 반복문 -->
                    <c:forEach var="report" items="${reportList}">
                    <form action="/printReportList" class="list-frm" method="GET">
                        <button class="list-btn">
                            <span class="reportNo">${report.reportNo}</span>
                            <span class="reportType">${report.reportType}</span>
                            <span class="memberName">${report.memberName}</span>
                            <span class="targetName">${report.targetName}</span>
                            <span class="reportDate">${report.reportDate}</span>
                            <span class="processYN">${report.processYN}</span>
                            <span class="processDate">${report.processDate}</span>
                        </button>
                    </form>
					</c:forEach>
					
                </div>

            <div class="content-footer">
            	<span>prev</span>
            	<span>1</span>
            	<span>2</span>
            	<span>3</span>
            	<span>next</span>
            </div>
            </section> <!-- admin-content end -->
        </section> <!-- main-content end -->
    </main>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
    <script src="/resources/js/admin/sidebar.js"></script>
</body>
</html>