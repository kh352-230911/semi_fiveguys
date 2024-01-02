<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div id="photo-container" class="w-full flex flex-col items-center">
        <div class="my-5 max-w-sm bg-white border border-gray-200 rounded-lg shadow hover:shadow-lg">
        <img class="rounded-t-lg"
             src="${pageContext.request.contextPath}/images/1삼겹살.jpg"
             alt="" />
        <div class="p-5">
            <h5 class="mb-2 inline text-sm font-bold tracking-tight text-gray-900">owj7182</h5>
            <h6 class="inline text-sm text-gray-500">2024-01-01 00:00:00</h6>
            <p class="mb-3 font-sans text-gray-700">DB연결 전입니다....</p>
            <h6 class="inline text-sm text-gray-500">조회수</h6>
            <span class="text-sm text-gray-500">22</span>
            <h6 class="like inline text-sm cursor-pointer">🤍</h6>
        </div>
        <div class="my-5 max-w-sm bg-white border border-gray-200 rounded-lg shadow hover:shadow-lg">
        <img class="rounded-t-lg"
             src="${pageContext.request.contextPath}/images/1삼겹살.jpg"
             alt="" />
        <div class="p-5">
            <h5 class="mb-2 inline text-sm font-bold tracking-tight text-gray-900">owj7182</h5>
            <h6 class="inline text-sm text-gray-500">2024-01-01 00:00:00</h6>
            <p class="mb-3 font-sans text-gray-700">DB연결 전입니다....</p>
            <h6 class="inline text-sm text-gray-500">조회수</h6>
            <span class="text-sm text-gray-500">22</span>
            <h6 class="like inline text-sm cursor-pointer">🤍</h6>
        </div>
    </div>
</div>
<div class="flex justify-center">
    <button type="button"
            id="btn-page"
            class="py-2.5 px-5 me-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-gray-200">
        더보기 <span id="page"></span>/<span id="totalPage">${totalPage}</span>
    </button>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
