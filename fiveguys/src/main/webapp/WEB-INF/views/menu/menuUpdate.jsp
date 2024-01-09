<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 2024-01-08
  Time: 오후 5:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="py-8 px-4 mx-auto max-w-2xl lg:py-16">
    <h2 class="mb-4 text-xl font-bold text-gray-900">메뉴 추가</h2>
    <form name="menuUpdateFrm" method="post" enctype="multipart/form-data">
        <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
            <input id="no" name="no" type="hidden" value="${menuVo.no}">
            <input id="restNo" name="restNo" type="hidden" value="${menuVo.restNo}">
            <div class="sm:col-span-2">
                <label for="name" class="block mb-2 text-sm font-medium text-gray-900">메뉴명</label>
                <input type="text" name="name" id="name" value="${menuVo.name}" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="메뉴명을 입력하세요." required>
            </div>
            <div class="sm:col-span-2">
                <label class="block mb-2 text-sm font-medium text-gray-900" for="upFile">첨부파일</label>
                <input type="file" id="upFile" name="upFile" class="block p-2.5 w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none">
            </div>
            <div class="sm:col-span-2">
                <label for="content" class="block mb-2 text-sm font-medium text-gray-900">내용</label>
                <textarea id="content" name="content" rows="8" value="${menuVo.content}" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500" placeholder="내용을 작성하세요."></textarea>
            </div>
            <div class="sm:col-span-2">
                <label for="price" class="block mb-2 text-sm font-medium text-gray-900">가격</label>
                <input type="text" id="price" name="price" value="${menuVo.price}" rows="8" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500" placeholder="가격을 입력하세요.(',' 제외)" required>
            </div>
        </div>
        <button type="submit" class="inline-flex items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200 sm:col-span-2">
            저장
        </button>
    </form>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>