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
                   class="inline-block p-4 text-blue-600 border-b-2 border-blue-600 rounded-t-lg active dark:text-blue-500 dark:border-blue-500"
                   aria-current="page">회원 정보 관리</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminApprovalList"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">
                    식당 승인 관리</a>
            </li>
            <li class="me-2">
                <a href="${pageContext.request.contextPath}/admin/adminRestaurantListController"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">
                    식당 정보 관리</a>
            </li>
            <li class="me-2">
                <a href="#"
                   class="inline-block p-4 border-b-2 border-transparent rounded-t-lg hover:text-gray-600 hover:border-gray-300 dark:hover:text-gray-300">
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
                <option value="id" ${param['search-type'] eq 'id' ? 'selected' : ''}>아이디</option>
                <option value="name" ${param['search-type'] eq 'name' ? 'selected' : ''}>이름</option>
                <option value="nickName" ${param['search-type'] eq 'nickName' ? 'selected' : ''}>닉네임</option>
                <option value="email" ${param['search-type'] eq 'email' ? 'selected' : ''}>이메일</option>
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
                회원 번호
            </th>
            <th scope="col" class="px-6 py-3">
                아이디
            </th>
            <th scope="col" class="px-6 py-3">
                이름
            </th>
            <th scope="col" class="px-6 py-3">
                닉네임
            </th>
            <th scope="col" class="px-6 py-3">
                성별
            </th>
            <th scope="col" class="px-6 py-3">
                이메일
            </th>
            <th scope="col" class="px-6 py-3">
                전화번호
            </th>
            <th scope="col" class="px-6 py-3">
                등급
            </th>
            <th scope="col" class="px-6 py-3">
                선호 카테고리
            </th>
            <th scope="col" class="px-6 py-3">
                등록일자
            </th>
            <th scope="col" class="px-6 py-3">
                Option
            </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${users}" var="user">
            <tr class="odd:bg-white odd:dark:bg-gray-900 even:bg-gray-50 even:dark:bg-gray-800 border-b dark:border-gray-700">
                <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        ${user.no}
                </th>
                <td class="px-6 py-4">
                        ${user.id}
                </td>
                <td class="px-6 py-4">
                        ${user.name}
                </td>
                <td class="px-6 py-4">
                        ${user.nickName}
                </td>
                <td class="px-6 py-4">
                        ${user.gender}
                </td>
                <td class="px-6 py-4">
                        ${user.email}
                </td>
                <td class="px-6 py-4">
                        ${user.phone}
                </td>
                <td class="px-6 py-4">
                        ${user.role}
                </td>
                <td class="px-6 py-4">
                        ${user.category}
                </td>
                <td class="px-6 py-4">
                    ${user.regDate}
                    <fmt:parseDate value="${user.regDate}" pattern="yyyy-MM-dd" var="regDate" scope="page"/>
                    <fmt:formatDate value="${regDate}" pattern="yyyy/MM/dd" var="regDate"/>
                </td>
                <td class="px-6 py-4">
                    <a data-no="${user.no}"
                       data-id="${user.id}"
                       data-name="${user.name}"
                       data-nickname="${user.nickName}"
                       data-gender="${user.gender}"
                       data-email="${user.email}"
                       data-phone="${user.phone}"
                       data-role="${user.role}"
                       data-category="${user.category}"
                       data-regdate="${user.regDate}"
                            <fmt:parseDate value="${user.regDate}" pattern="yyyy-MM-dd" var="regDate" scope="page"/>
                            <fmt:formatDate value="${regDate}" pattern="yyyy/MM/dd" var="regDate"/>
                       class="openModal font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- 모달 -->
<div id="userDetailModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
    <div id="userDetail" class="bg-white p-8 rounded-lg">
        <h2 class="text-2xl font-bold mb-4">사용자 정보 변경</h2>
        <form name="userUpdateFrm" id="userUpdateFrm"
              action="${pageContext.request.contextPath}/user/userUpdate" method="post"
              class="space-y-4 md:space-y-6">
            <div>
                <label for="id"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">아이디</label>
                <input type="text" name="id" id="id" value="${loginUser.id}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       readonly required>
            </div>
            <div>
                <label for="name"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">이름</label>
                <input type="text" name="name" id="name" value="${loginUser.name}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       required>
            </div>
            <div>
                <label for="nickName"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">별명</label>
                <input type="text" name="nickName" id="nickName" value="${loginUser.nickName}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       required>
            </div>

            <div>
                <label for="email"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">이메일</label>
                <input type="email" name="email" id="email" value="${loginUser.email}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       placeholder="name@company.com" required>
            </div>
            <div>
                <label for="phone" class="block mb-2 text-sm font-medium text-gray-900">전화번호</label>
                <input type="text" name="phone" id="phone" value="${loginUser.phone}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       placeholder="(-) 없이 입력하세요.">
            </div>
            <fieldset>
                <legend class="mb-3">성별</legend>
                <div class="inline-flex items-center mr-4">
                    <input id="gender-M" type="radio" name="gender" value="M"
                           class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" ${loginUser.gender == 'M' ? 'checked' : ''}>
                    <label for="gender-M" class="block ms-2  text-sm font-medium text-gray-900">남</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="gender-F" type="radio" name="gender" value="F"
                           class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" ${loginUser.gender == 'F' ? 'checked' : ''}>
                    <label for="gender-F" class="block ms-2 text-sm font-medium text-gray-900">여</label>
                </div>
            </fieldset>
            <fieldset>
                <legend class="mb-3">음식선택</legend>
                <div class="inline-flex items-center mr-4">
                    <input id="category-1" type="checkbox" name="category" value="한식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${loginUser.category.contains('한식') ? 'checked' : ''}>
                    <label for="category-1" class="ms-2 text-sm font-medium text-gray-900">한식</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="category-2" type="checkbox" name="category" value="양식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${loginUser.category.contains('양식') ? 'checked' : ''}>
                    <label for="category-2" class="ms-2 text-sm font-medium text-gray-900">양식</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="category-3" type="checkbox" name="category" value="중식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${loginUser.category.contains('중식') ? 'checked' : ''}>
                    <label for="category-3" class="ms-2 text-sm font-medium text-gray-900">중식</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="category-4" type="checkbox" name="category" value="일식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${loginUser.category.contains('일식') ? 'checked' : ''}>
                    <label for="category-4" class="ms-2 text-sm font-medium text-gray-900">일식</label>
                </div>
                <c:set var="categoryDefaultList" value='<%= Arrays.asList("한식", "양식", "중식", "일식")%>'
                       scope="page"></c:set>
                <c:forEach items="${loginMember.category}" var="category" varStatus="vs">
                <!-- el연산자 not(!) eq(==) ne(!=) gt(>) ge(>=) lt(<) le(<=) -->
                <c:if test="${not categoryDefaultList.contains(category)}">
                <div class="inline-flex items-center mr-4">
                    <input id="category-${vs.count + categoryDefaultList.size()}" type="checkbox"
                           name="category" value="${category}" checked
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2">
                    <label for="category-${vs.count + categoryDefaultList.size()}"
                           class="ms-2 text-sm font-medium text-gray-900">${category}</label>
                </div>
                </c:if>
                </c:forEach>
                <div class="inline-flex items-center mr-4" id="category-etc-wrapper">
                    <input type="checkbox" value=""
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2">
                    <label id="category-etc" class="ms-2 text-sm font-medium text-gray-500"
                           contenteditable>직접입력</label>
                </div>
                <button type="button"
                        onclick="location.href = '${pageContext.request.contextPath}/user/updatePassword';"
                        class="text-white w-full bg-purple-400 hover:bg-purple-500 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                    비밀번호 변경
                </button>
                <p class="text-sm font-light text-red-500">
                    서비스를 그만 사용하고 싶으신가요? <a href="${pageContext.request.contextPath}/user/userDelete" ;
                                           class="font-medium text-red-600 hover:underline">여기서 회원탈퇴하세요😭</a>
                </p>
                <button id="saveUserDetailBtn" type="button"
                        class="bg-green-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-green active:bg-green-700">
                    저장
                </button>
                <button id="closeUserDetailModalBtn" type="button"
                        class="bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
                    닫기
                </button>
            </fieldset>
        </form>
    </div>
</div>

<form action="${pageContext.request.contextPath}/user/userDelete" method="post" name="userDeleteFrm"></form>

<script src="${pageContext.request.contextPath}/js/user/userDetail.js"></script>
<script src="${pageContext.request.contextPath}/js/admin/adminUsersList.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>