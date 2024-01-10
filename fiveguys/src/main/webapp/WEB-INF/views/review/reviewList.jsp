<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container mx-auto my-6">
    <div class="flex justify-start">
        <h1 class="m-4 text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
            리뷰
        </h1>
    </div>
    <c:if test="${loginUser != null}">
        <div class="flex justify-end">
            <button
                    type="button"
                    onclick="location.href = '${pageContext.request.contextPath}/review/reviewCreate?no=${reviews[0].restNo}';"
                    class="text-white bg-gradient-to-r from-blue-500 via-blue-600 to-blue-700 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center me-2 mb-2">리뷰작성
            </button>
        </div>
    </c:if>
    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50">
            <tr>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">번호</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">닉네임</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">이미지</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">리뷰 내용</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">작성일</th>
                <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">수정</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${reviews}" var="review">
                <tr class="odd:bg-white even:bg-gray-50 border-b">
                    <td class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">${review.no}</td>
                    <td class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                        <a href="${pageContext.request.contextPath}/review/reviewDetail?no=${review.no}" class="hover:underline">
                           ${review.usersNo}
                        </a>
                    </td>
                    <td class="px-6 py-4">
                        <img class="w-[16px]" src="${pageContext.request.contextPath}/images/free-icon-menu-149199.png" alt="">
                    </td>
                    <td class="px-6 py-4">
                        <span class="inline-flex items-center rounded-md bg-red-50 px-2 py-1 text-xs font-medium text-red-700 ring-1 ring-inset ring-red-600/10">${review.content}</span>
                    </td>

                    <td class="px-6 py-4">
                        <fmt:parseDate value="${review.regDate}" pattern="yyyy-MM-dd" var="regDate"/>
                        <fmt:formatDate value="${regDate}" pattern="yyyy/MM/dd"/>
                    </td>
                    <td class="px-6 py-4">
                        <a href="${pageContext.request.contextPath}/review/reviewUpdate?no=${review.no}" class="hover:underline">${fn:escapeXml(review.no)}</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<%--<div class="flex justify-center mt-6">--%>
<%--    <nav aria-label="Page navigation example">--%>
<%--        <ul class="my-8 flex items-center -space-x-px h-8 text-sm">--%>
<%--            &lt;%&ndash; 생성한 pagebar &ndash;%&gt;--%>
<%--            ${pagebar}--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--</div>--%>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>