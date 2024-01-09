<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-12-31
  Time: 오전 12:15
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
                    회원정보 입력
                </h1>
                <form name="userRegisterFrm" method="post" class="space-y-4 md:space-y-6">
                    <div class="relative">
                        <label for="id" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">아이디</label>
                        <input type="text" name="id" id="id" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" value="cjsanwls" required>
                        <span class="guide ok text-green-700 absolute hidden top-10 end-1">이 아이디는 사용가능합니다.</span>
                        <span class="guide error text-red-700 absolute hidden top-10 end-1">이 아이디는 이미 사용중입니다.</span>
                        <%-- idValid=1 사용가능한 아이디, idValid=0 사용불가한 아이디 --%>
                        <input type="hidden" id="idValid" value="0">
                    </div>
                    <div>
                        <label for="password" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">비밀번호</label>
                        <input type="password" name="password" id="password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" value="1234a@" required>
                    </div>
                    <div>
                        <label for="confirm-password" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">비밀번호 확인</label>
                        <input type="password" id="confirm-password" placeholder="••••••••" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" value="1234a@" required>
                    </div>
                    <div>
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">이름</label>
                        <input type="text" name="name" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" value="무진" required>
                    </div>
                    <div>
                        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">별명</label>
                        <input type="text" name="nickName" id="nickName" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"  value="무딘코" required>
                    </div>

                    <div>
                        <label for="email" class="block mb-2 text-sm font-medium text-gray-900 ">이메일</label>
                        <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="name@company.com" value="mujin@gmail.com" required>
                    </div>
                    <div>
                        <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">전화번호</label>
                        <input type="text" name="phone" id="phone" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="(-) 없이 입력하세요." value="01023280276" required>
                    </div>
                    <fieldset>
                        <legend class="mb-3">성별</legend>
                        <div class="inline-flex items-center mr-4">
                            <input id="country-option-1" type="radio" name="gender" value="M" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300">
                            <label for="country-option-1" class="block ms-2  text-sm font-medium text-gray-900">남</label>
                        </div>
                        <div class="inline-flex items-center mr-4">
                            <input id="country-option-2" type="radio" name="gender" value="F" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300">
                            <label for="country-option-2" class="block ms-2 text-sm font-medium text-gray-900">여</label>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</section>
<script src="${pageContext.request.contextPath}/js/user/userRegister.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    