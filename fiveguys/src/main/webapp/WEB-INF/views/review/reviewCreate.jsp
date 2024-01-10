<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-01-05
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container mx-auto my-6">
    <div class="flex justify-start">
        <h1 class="m-4 text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
            리뷰 작성
        </h1>
    </div>

    <form name="reviewCreateFrm" method="post"  enctype="multipart/form-data">
        <input type="hidden" name="restNo" id="restNo" value="${restNo}">
        <input type="hidden" name="usersNo" id="usersNo" value="${loginUser.no}">
        <div class="grid gap-4 sm:grid-cols-2 sm:gap-6">
            <div class="w-full mt-4">
                <label for="revScore">리뷰 점수 선택 : </label>
                <select id="revScore" name="revScore" class="ml-4 w-1/8 border-0">
                    <option value="select">선택</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
            <div class="sm:col-span-2">
                <label for="content" class="block mb-2 text-sm font-medium text-gray-900">리뷰 내용</label>
                <textarea name="content" id="content" rows="8" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500" placeholder="리뷰 내용을 작성하세요." required></textarea>
            </div>
        </div>
        <div class="sm:col-span-2">
            <label class="block mb-2 text-sm font-medium text-gray-900" for="upFile">첨부파일</label>
            <input type="file" id="upFile" name="upFile" multiple class="block p-2.5 w-full text-sm text-gray-900 border border-gray-300 rounded-lg cursor-pointer bg-gray-50 focus:outline-none">
        </div>
        <button type="submit" class="inline-flex items-center px-5 py-2.5 mt-4 sm:mt-6 text-sm font-medium text-center text-white bg-primary-700 rounded-lg focus:ring-4 focus:ring-primary-200">
            리뷰 작성
        </button>

    </form>

</div>
<script src="${pageContext.request.contextPath}/js/review/reviewList.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    