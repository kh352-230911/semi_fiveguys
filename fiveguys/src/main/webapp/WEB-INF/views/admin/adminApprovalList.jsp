<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.sh.guys.user.model.entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
    <%-- 상단 관리 Tabs --%>
    <div class="text-sm font-medium text-center text-gray-500 border-b border-gray-200 dark:text-gray-400 dark:border-gray-700">
        <ul class="flex flex-wrap -mb-px">
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminUsersList" class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">회원 정보 관리</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminApprovalList" class="inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500" aria-current="page">식당 승인 관리</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminRestaurantListController" class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">식당 정보 관리</a>
            </li>
            <li class="me-2">
                <a href="#" class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">예약 정보 관리</a>
            </li>
        </ul>
    </div>
    <form name="memberSearchFrm">
        <div class="p-4 bg-white flex">
            <select id="search-type" name="search-type" required
                    class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 p-1.5">
                <option value="" disabled selected>검색</option>
                <option value="id" ${param['search-type'] eq 'id' ? 'selected' : ''}>아이디</option>
                <option value="id" ${param['search-type'] eq 'name' ? 'selected' : ''}>이름</option>
                <option value="r.name" ${param['search-type'] eq 'r.name' ? 'selected' : ''}>식당 이름</option>
                <option value="r.address" ${param['search-type'] eq 'r.address' ? 'selected' : ''}>식당 주소</option>
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
                회원 아이디
            </th>
            <th scope="col" class="px-6 py-3">
                회원 이름
            </th>
            <th scope="col" class="px-6 py-3">
                식당 이름
            </th>
            <th scope="col" class="px-6 py-3">
                식당 주소
            </th>
            <th scope="col" class="px-6 py-3">
                식당 소개
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
                등록일자
            </th>
            <th scope="col" class="px-6 py-3">
                옵션
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${usersVO}" var="userVO">
            <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${userVO.id}
                </th>
                <td class="px-6 py-4">
                        ${userVO.name}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.name}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.address}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.content}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.phone}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.category}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.openTime}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.closeTime}
                </td>
                <td class="px-6 py-4">
                        ${userVO.restaurant.reservPossible}
                </td>
                <td class="px-6 py-4">
                    ${userVO.restaurant.regDate}
                    <fmt:parseDate value="${userVO.restaurant.regDate}" pattern="yyyy-MM-dd" var="regDate" scope="page"/>
                    <fmt:formatDate value="${regDate}" pattern="yyyy/MM/dd" var="regDate"/>
                </td>
                <td id="btn-edit" class="px-6 py-4">
                    <a data-no="${userVO.no}"
                       data-id="${userVO.id}"
                       data-name="${userVO.name}"
                       data-role="${userVO.role}"
                       data-rNo="${userVO.restaurant.no}"
                       data-rName="${userVO.restaurant.name}"
                       data-rAddress="${userVO.restaurant.address}"
                       data-rContent="${userVO.restaurant.content}"
                       data-rPhone="${userVO.restaurant.phone}"
                       data-rCategory="${userVO.restaurant.category}"
                       data-rOpenTime="${userVO.restaurant.openTime}"
                       data-rCloseTime="${userVO.restaurant.closeTime}"
                       data-rReservPossible="${userVO.restaurant.reservPossible}"
                       data-rRegDate="${userVO.restaurant.regDate}"
                            <fmt:parseDate value="${userVO.restaurant.regDate}" pattern="yyyy-MM-dd" var="regDate" scope="page"/>
                            <fmt:formatDate value="${regDate}" pattern="yyyy/MM/dd" var="regDate"/>
                       data-rApproval="${userVO.restaurant.approval}"
                       class="openModal font-medium text-blue-600 dark:text-blue-500 hover:underline">More</a>
                </td>
            </tr>

            <!-- 모달 -->
            <div id="userDetailModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
                <div class="bg-white p-8 rounded-lg">
                    <h2 class="text-2xl font-bold mb-4">식당 승인 정보</h2>
                    <form name="ApprovalFrm" id="ApprovalFrm"
                          class="space-y-4 md:space-y-6">
                        <div class="w-full p-6 bg-white border border-gray-200 rounded-lg shadow">
                            <h5 name="rName" class="rName mb-2 text-2xl font-semibold tracking-tight text-gray-900 "></h5>
                            <p name="id" class="id mb-3 font-normal text-gray-500"></p>
                            <p name="rAddress" class="rAddress mb-3 font-normal text-gray-700"></p>
                            <p name="rContent" class="rContent mb-3 font-normal text-gray-700"></p>
                            <p name="rPhone" class="rPhone mb-3 font-normal text-gray-700"></p>
                            <p name="rCategory" class="rCategory mb-3 font-normal text-gray-700"></p>
                            <p name="rOpenTime" class="rOpenTime mb-3 font-normal text-gray-700"></p>
                            <p name="rCloseTime" class="rCloseTime mb-3 font-normal text-gray-700"></p>
                            <p name="rReservPossible" class="rReservPossible mb-3 font-normal text-gray-700"></p>
                            <p name="rTotalStar" class="rTotalStar mb-3 font-normal text-gray-700"></p>
                            <div class="text-sm mt-2 font-medium text-gray-400">
                                등록일자
                            </div>
                            <p name="rRegDate" class="rRegDate mb-3 font-normal text-gray-700"></p>
                            <input type="hidden" name="rApproval" class="rApproval">
                        </div>
                        <div class="btnWrapper"></div>
                    </form>
                </div>
            </div>
        </c:forEach>
        </tbody>
    </table>
</div>

<form action="${pageContext.request.contextPath}/user/userDelete" method="post" name="userDeleteFrm"></form>

<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script>
    const contextPath = '${pageContext.request.contextPath}';
</script>
<script src="${pageContext.request.contextPath}/js/admin/adminApprovalList.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>