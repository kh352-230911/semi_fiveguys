<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 12/12/2023
  Time: 10:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8 bg-gray-100">
    <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-md bg-white p-8 rounded-md shadow-md">
        <h1 class="mb-6 text-2xl font-bold text-gray-800 text-center">
            로그인
        </h1>
        <form name="userLoginFrm" class="space-y-4" method="POST">
            <div>
                <label for="id" class="block text-sm font-medium text-gray-700">아이디</label>
                <div class="mt-2">
                    <input id="id" name="id" type="text" autocomplete="id" required class="input-field">
                </div>
            </div>

            <div>
                <label for="password" class="block text-sm font-medium text-gray-700">비밀번호</label>
                <div class="mt-2">
                    <input id="password" name="password" type="password" autocomplete="password" value="1234a@" required class="input-field">
                </div>
            </div>
            <div class="flex items-center">
                <input id="saveId" name="saveId" type="checkbox" class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500">
                <label for="saveId" class="ml-2 text-sm font-medium text-gray-700">아이디 저장</label>
            </div>

            <div>
                <button
                    type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">로그인</button>
            </div>
        </form>
    </div>
<%--    <div class="col-lg-6">--%>
<%--        <div class="flex justify-center">--%>
<%--            <img src="${pageContext.request.contextPath}/images/fiveguys.jpg" alt="이미지 설명" class="mt-4 max-w-full max-h-full" />--%>
<%--        </div>--%>
<%--    </div>--%>
</div>

<script src="${pageContext.request.contextPath}/js/user/userLogin.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>