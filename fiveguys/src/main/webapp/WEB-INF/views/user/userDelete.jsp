<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-02
  Time: 오후 5:27
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
        </h1>

        <!-- 비밀번호 입력 폼 -->
        <form name="passwordForm" id="passwordForm" action="${pageContext.request.contextPath}/user/userDelete" method="post" class="space-y-4 md:space-y-6">
            <div>
                <label for="password" class="block mb-2 text-sm font-medium text-gray-900">비밀번호</label>
                <input type="password" name="password" id="password" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
            </div>
            <div>
                <label for="confirmPassword" class="block mb-2 text-sm font-medium text-gray-900">비밀번호 확인</label>
                <input type="password" name="confirmPassword" id="confirmPassword" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
            </div>
            <button type="submit" class="bg-blue-500 text-white py-2 px-4 rounded focus:outline-none focus:shadow-outline-blue active:bg-blue-800">
                확인
            </button>

        </form>
    </div>
</div>
<form action="${pageContext.request.contextPath}/user/userDelete.js" method="post" name="userDeleteFrm"></form>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    