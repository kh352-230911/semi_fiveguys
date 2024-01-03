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
<div class="flex flex-col items-center justify-center px-6 py-8 mx-auto lg:py-0">
    <div class="w-full bg-white rounded-lg shadow my-4 sm:max-w-md xl:p-0 relative">
        <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl ml-[-20px] absolute top-4">
            my page
        </h1>

        <button id="openUserDetailModalBtn" type="button"
                class="bg-blue-500 text-white py-2 px-4 rounded focus:outline-none focus:shadow-outline-blue active:bg-blue-800 absolute top-6 right-4">
            정보 변경
        </button>
        <br><br><br><br><br><br><br><br><br><br>

        <div class="relative overflow-x-auto shadow-md sm:rounded-lg text-center">
            <table class="inline-block text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        가게 이름
                    </th>
                    <th scope="col" class="px-6 py-3">
                        색상
                    </th>
                    <th scope="col" class="px-6 py-3">
                        카테고리
                    </th>
                    <th scope="col" class="px-6 py-3">
                        가격
                    </th>
                    <th scope="col" class="px-6 py-3">
                        <span class="sr-only">편집</span>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        내가 찜한 가게 1
                    </th>
                    <td class="px-6 py-4">
                        Red
                    </td>
                    <td class="px-6 py-4">
                        음식점
                    </td>
                    <td class="px-6 py-4">
                        $20
                    </td>
                    <td class="px-6 py-4 text-right">
                        <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">편집</a>
                    </td>
                </tr>
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        내가 찜한 가게 2
                    </th>
                    <td class="px-6 py-4">
                        Blue
                    </td>
                    <td class="px-6 py-4">
                        카페
                    </td>
                    <td class="px-6 py-4">
                        $15
                    </td>
                    <td class="px-6 py-4 text-right">
                        <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">편집</a>
                    </td>
                </tr>
                <tr class="bg-white dark:bg-gray-800 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        내가 찜한 가게 3
                    </th>
                    <td class="px-6 py-4">
                        Green
                    </td>
                    <td class="px-6 py-4">
                        편의점
                    </td>
                    <td class="px-6 py-4">
                        $10
                    </td>
                    <td class="px-6 py-4 text-right">
                        <a href="#" class="font-medium text-blue-600 dark:text-blue-500 hover:underline">편집</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>


        <!-- 모달 -->
        <div id="userDetailModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
            <div class="bg-white p-8 rounded-lg">
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
                        <button type="button" onclick="location.href = '${pageContext.request.contextPath}/user/updatePassword';" class="text-white w-full bg-purple-400 hover:bg-purple-500 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">비밀번호 변경</button>
                        <p class="text-sm font-light text-red-500">
                            서비스를 그만 사용하고 싶으신가요? <a href="${pageContext.request.contextPath}/user/userDelete";  class ="font-medium text-red-600 hover:underline">여기서 회원탈퇴하세요😭</a>
                        </p>
                        <button id="saveUserDetailBtn" type="button"
                                class="bg-green-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-green active:bg-green-700">
                            저장
                        </button>
                        <button id="closeUserDetailModalBtn" type="button"
                                class="bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
                            닫기
                        </button>
                     </form>
                    </fieldset>

                <form action="${pageContext.request.contextPath}/user/userDelete" method="post" name="userDeleteFrm"></form>

                <script src="${pageContext.request.contextPath}/js/user/userDetail.js"></script>
                    <script>
                        // 모달 열기
                        document.getElementById('openUserDetailModalBtn').addEventListener('click', function () {
                            // 모달 보이기
                            document.getElementById('userDetailModal').classList.remove('hidden');
                        });

                        // 모달 닫기
                        document.getElementById('closeUserDetailModalBtn').addEventListener('click', function () {
                            // 모달 숨기기
                            document.getElementById('userDetailModal').classList.add('hidden');
                        });

                        // 저장 버튼 클릭 시 처리
                        document.getElementById('saveUserDetailBtn').addEventListener('click', function () {
                            // 수정된 정보를 서버로 전송하는 로직 추가
                            document.getElementById('userUpdateFrm').submit();
                            // 모달 닫기
                            document.getElementById('userDetailModal').classList.add('hidden');
                        });
                    </script>



                    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    