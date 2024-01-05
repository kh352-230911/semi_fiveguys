<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2024-01-04
  Time: 오후 8:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section>
    <div class="flex flex-col items-center justify-center px-6 py-8 mx-auto lg:py-0">
        <div class="w-full bg-white rounded-lg shadow my-6 sm:max-w-md xl:p-0">
            <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
                <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
                    가게 정보 입력
                </h1>
                <form name="userRegisterFrm" method="post" class="space-y-4 md:space-y-6">
                    <input type="hidden" name="usersNo" id="usersNo" value="${loginUser.no}">
                    <div>
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">식당명</label>
                        <input type="text" name="name" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="식당명을 입력하세요." required>
                    </div>
                    <div>
                        <label for="address" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">주소</label>
                        <input type="text" name="address" id="address" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="식당 주소를 입력하세요." required>
                    </div>
                    <div>
                        <label for="content" class="block mb-2 text-sm font-medium text-gray-900">소개글</label>
                        <input type="textarea" name="content" id="content" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="식당 소개글을 입력하세요." required>
                    </div>
                    <div class="relative">
                        <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">전화번호</label>
                        <input type="text" name="phone" id="phone" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="전화번호를 입력하세요. (- 제외)" required>
                        <span class="guide ok text-green-700 absolute hidden top-10 end-1">사용가능한 전화번호입니다.</span>
                        <span class="guide error text-red-700 absolute hidden top-10 end-1">이미 사용중인 전화번호입니다.</span>
                        <input type="hidden" id="phoneValid" value="0">
                    </div>
                    <div>
                        <label for="category" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">카테고리</label>
                        <select name="category" id="category" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5">
                            <option value="">카테고리를 선택하세요.</option>
                            <option value="한식">한식</option>
                            <option value="일식">일식</option>
                            <option value="중식">중식</option>
                            <option value="양식">양식</option>
                            <option value="동남아식">동남아식</option>
                            <option value="패스트푸드">패스트푸드</option>
                        </select>
                    </div>
                    <div>
                        <label for="opentime" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">오픈 타임</label>
                        <input type="time" name="opentime" id="opentime" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
                    </div>
                    <div>
                        <label for="closetime" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">마감 시간</label>
                        <input type="time" name="closetime" id="closetime" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
                    </div>
                    <fieldset>
                        <legend class="mb-3">예약 가능 여부</legend>
                        <div class="inline-flex items-center mr-4">
                            <input id="reservPossible-option-1" type="radio" name="reservPossible" value="Y" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300">
                            <label for="reservPossible-option-1" class="block ms-2  text-sm font-medium text-gray-900">Y</label>
                        </div>
                        <div class="inline-flex items-center mr-4">
                            <input id="reservPossible-option-2" type="radio" name="reservPossible" value="N" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300">
                            <label for="reservPossible-option-2" class="block ms-2 text-sm font-medium text-gray-900">N</label>
                        </div>
                    </fieldset>
                    <button type="submit" class="text-white w-full bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">등록</button>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="${pageContext.request.contextPath}/js/restaurant/restaurantRegister.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>