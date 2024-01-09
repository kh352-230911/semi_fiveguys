<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.sh.guys.user.model.entity.*" %>
<%@ page import="java.util.Arrays" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <%-- 상단 관리 Tabs --%>
    <div class="text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
        <ul class="flex flex-wrap -mb-px">
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminUsersList"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300"
                   aria-current="page">회원 정보 관리</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminApprovalList"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">
                    식당 승인 관리</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminRestaurantList"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">
                    식당 정보 관리</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminReservationList"
                   class="inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500">
                    예약 정보 관리</a>
            </li>
        </ul>
    </div>

    <%-- 검색바 --%>
        <form name="memberSearchFrm">
            <div class="p-4 bg-white flex">
                <select id="search-type" name="search-type" required
                        class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 p-1.5">
                    <option value="" disabled selected>검색</option>
                    <option value="reserv_name" ${param['search-type'] eq 'reserv_name' ? 'selected' : ''}>이름</option>
                    <option value="reserv_date" ${param['search-type'] eq 'reserv_date' ? 'selected' : ''}>예약 날짜</option>
                    <option value="reserv_time" ${param['search-type'] eq 'reserv_time' ? 'selected' : ''}>예약 시간</option>
                    <option value="phone" ${param['search-type'] eq 'phone' ? 'selected' : ''}>전화번호</option>
                </select>
                <div class="ml-1">
                    <input type="search" id="search-keyword" name="search-keyword" placeholder="검색어를 입력하세요..."
                           value="${param['search-keyword']}" required
                           class="block p-2 text-sm text-gray-900 border border-gray-300 rounded-lg w-80 bg-gray-50 focus:ring-blue-500 focus:border-blue-500">
                </div>
            </div>
        </form>
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        식당 이름
                    </th>
                    <th scope="col" class="px-6 py-3">
                        이름
                    </th>
                    <th scope="col" class="px-6 py-3">
                        전화번호
                    </th>
                    <th scope="col" class="px-6 py-3">
                        예약 날짜
                    </th>
                    <th scope="col" class="px-6 py-3">
                        예약 시간
                    </th>
                    <th scope="col" class="px-6 py-3">
                        인원
                    </th>
                    <th scope="col" class="px-6 py-3">
                        요구 사항
                    </th>
                    <th scope="col" class="px-6 py-3">
                        예약 일자
                    </th>
                    <th scope="col" class="px-6 py-3">
                        <span class="sr-only">편집</span>
                    </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${restaurantVos}" var="restaurantVo">
                    <c:forEach items="${restaurantVo.reservations}" var="reservation">
                        <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                            <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                    ${restaurantVo.name}
                            </th>
                            <td class="px-6 py-4">
                                    ${reservation.reservName}
                            </td>
                            <td class="px-6 py-4">
                                    <%--                ${reservation.phone}--%>
                            </td>
                            <td class="px-6 py-4">
                                    ${reservation.reservDate}
                            </td>
                            <td class="px-6 py-4">
                                    ${reservation.reservTime}
                            </td>
                            <td class="px-6 py-4">
                                    ${reservation.reservPeople}
                            </td>
                            <td class="px-6 py-4">
                                    ${reservation.request}
                            </td>
                            <td class="px-6 py-4">
                                <fmt:parseDate value="${reservation.regDate}" pattern="yyyy-MM-dd'T'HH:mm" var="regDate"/>
                                <fmt:formatDate value="${regDate}" pattern="yy/MM/dd HH:mm"/>
                            </td>
                            <td class="px-6 py-4 text-right">
                                <button type="button"
                                        onclick="confirm('취소 하시겠습니까?') && document.querySelector('#reservationCancelFrm').submit()"
                                        class="font-medium text-blue-600 dark:text-blue-500 hover:underline">
                                    예약 취소
                                </button>
                                <form id="reservationCancelFrm"
                                      action="${pageContext.request.contextPath}/admin/reservationCancel"
                                      method="post">
                                    <input type="hidden" name="reservNo" id="reservNo" value="${reservation.no}">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
    </div>

<nav class="mb-4 mt-4 flex justify-center">
    <ul class="flex items-center -space-x-px h-8 text-sm">
        ${pagebar}
    </ul>
</nav>
<!-- 모달 -->
<%--<div id="userDetailModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">--%>
<%--    <div id="userDetail" class="bg-white p-8 rounded-lg"></div>--%>
<%--</div>--%>

<%--<form action="${pageContext.request.contextPath}/user/userDelete" method="post" name="userDeleteFrm"></form>--%>

<%--<script src="${pageContext.request.contextPath}/js/user/userDetail.js"></script>--%>
<%--<script src="${pageContext.request.contextPath}/js/admin/adminUsersList.js"></script>--%>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>