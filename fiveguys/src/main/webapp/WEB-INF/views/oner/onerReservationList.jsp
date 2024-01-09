<%@ page import="java.util.Arrays" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-01
  Time: 오후 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <%-- 상단 관리 Tabs --%>
    <div class="relative text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
        <ul class="flex flex-wrap -mb-px">
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/oner/onerReservationList" class="inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500" aria-current="page">예약 내역</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/oner/onerRestaurantList" class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">식당 목록</a>
            </li>
        </ul>
    </div>
    <form name="memberSearchFrm">
        <div class="p-4 bg-white flex">
            <select id="search-type" name="search-type" required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 p-1.5">
                <option value="" disabled selected>검색</option>
                <option value="reserv_name" ${param['search-type'] eq 'reserv_name' ? 'selected' : ''}>이름</option>
                <option value="reserv_date" ${param['search-type'] eq 'reserv_date' ? 'selected' : ''}>예약 날짜</option>
                <option value="reserv_time" ${param['search-type'] eq 'reserv_time' ? 'selected' : ''}>예약 시간</option>
                <option value="r.phone" ${param['search-type'] eq 'r.phone' ? 'selected' : ''}>전화번호</option>
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
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${reservations}" var="reservation">
                <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${reservation.reservName}
                    </th>
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
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    