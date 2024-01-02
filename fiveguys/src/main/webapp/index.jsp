<%@ page contentType="text/html; charset=utf-8" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div id="picture-container" class="grid grid-cols-2 md:grid-cols-3 gap-4"></div>
    <div class="flex justify-center">
        <button type="button"
                id="btn-page"
                class="m-4 py-2.5 px-5 me-2 mb-2 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-sky-200 hover:bg-sky-100 hover:text-blue-700 focus:z-10 focus:ring-4 focus:ring-sky-200">
            더보기 <span id="page"></span>/<span id="totalPage">${totalPage}</span>
        </button>
    </div>

<script src="${pageContext.request.contextPath}/js/menu/menuPicture.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
