<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2024-01-04
  Time: 오후 5:44
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
                <a href="${pageContext.request.contextPath}/oner/onerReservationList" class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">예약 내역</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/oner/onerRestaurantList" class="inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500" aria-current="page">식당 목록</a>
            </li>
        </ul>
    </div>
    <form name="memberSearchFrm">
        <div class="p-4 bg-white flex">
            <select id="search-type" name="search-type" required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 p-1.5">
                <option value="" disabled selected>검색</option>
<%--                <option value="id" ${param['search-type'] eq 'id' ? 'selected' : ''}>아이디</option>--%>
<%--                <option value="id" ${param['search-type'] eq 'name' ? 'selected' : ''}>이름</option>--%>
<%--                <option value="r.name" ${param['search-type'] eq 'r.name' ? 'selected' : ''}>식당 이름</option>--%>
<%--                <option value="r.address" ${param['search-type'] eq 'r.address' ? 'selected' : ''}>식당 주소</option>--%>
<%--                <option value="r.phone" ${param['search-type'] eq 'r.phone' ? 'selected' : ''}>전화번호</option>--%>
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
                승인 여부
            </th>
            <th scope="col" class="px-6 py-3">
                식당명
            </th>
            <th scope="col" class="px-6 py-3">
                주소
            </th>
            <th scope="col" class="px-6 py-3">
                식당 내용
            </th>
            <th scope="col" class="px-6 py-3">
                전화번호
            </th>
            <th scope="col" class="px-6 py-3">
                카테고리
            </th>
            <th scope="col" class="px-6 py-3">
                오픈 타임
            </th>
            <th scope="col" class="px-6 py-3">
                클로즈 타임
            </th>
            <th scope="col" class="px-6 py-3">
                예약 가능 여부
            </th>
            <th scope="col" class="px-6 py-3">
                별점
            </th>
            <th scope="col" class="px-6 py-3">
                등록일자
            </th>
            <th scope="col" class="px-6 py-3">
                옵션
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${restaurant}" var="restaurant">
            <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${restaurant.approval}
                </th>
                <td class="px-6 py-4">
                    <a href="${pageContext.request.contextPath}/restaurant/restaurantDetail?no=${restaurant.no}">
                        ${restaurant.name}
                    </a>
                </td>
                <td class="px-6 py-4">
                        ${restaurant.address}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.content}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.phone}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.category}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.openTime}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.closeTime}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.reservPossible}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.totalStar}
                </td>
                <td class="px-6 py-4">
                        ${restaurant.regDate}
                    <fmt:parseDate value="${restaurant.regDate}" pattern="yyyy-MM-dd" var="regDate"
                                   scope="page"/>
                    <fmt:formatDate value="${regDate}" pattern="yyyy/MM/dd" var="regDate"/>
                </td>
            <td id="btn-edit" class="px-6 py-4">
                <a data-approval="${restaurant.approval}"
                   data-no="${restaurant.no}"
                   data-name="${restaurant.name}"
                   data-address="${restaurant.address}"
                   data-content="${restaurant.content}"
                   data-phone="${restaurant.phone}"
                   data-category="${restaurant.category}"
                   data-opentime="${restaurant.openTime}"
                   data-closetime="${restaurant.closeTime}"
                   data-reservpossible="${restaurant.reservPossible}"
                   data-totalstar="${restaurant.totalStar}"
                   data-regdate="${restaurant.regDate}"
                        <fmt:parseDate value="${restaurant.regDate}" pattern="yyyy-MM-dd" var="regDate" scope="page"/>
                        <fmt:formatDate value="${regDate}" pattern="yyyy/MM/dd" var="regDate"/>
                   class="openModal font-medium text-blue-600 dark:text-blue-500 hover:underline">More</a>
            </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%-- --%>

<script src="${pageContext.request.contextPath}/js/oner/onerRestaurantList.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>