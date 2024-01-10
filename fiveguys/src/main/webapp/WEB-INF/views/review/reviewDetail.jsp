<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sh.guys.user.model.entity.Role" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div>
    <div class="xl:container p-8">
        <a  href="${pageContext.request.contextPath}/review/reviewList?no=${reviewVo.restaurant.no}">reviewList</a>
        <div class="w-full p-6 bg-white border border-gray-200 rounded-lg shadow">
            <c:if test="${not empty reviewVo.reviewPictures}">
                <div class="bxslider">
                    <c:forEach items="${reviewVo.reviewPictures}" var="review">
                        <img class="h-80 w-80 max-w-full rounded-lg" src="${pageContext.request.contextPath}/upload/review/${review.renamedFilename}" alt="">
                    </c:forEach>
                </div>
            </c:if>
                <p class="mb-3 font-bold text-gray-700">${reviewVo.user.nickName} (${reviewVo.user.id})</p>
                <p class="mb-3 font-style: italic text-black-900">${reviewVo.content}</p>
        </div>
        <div class="text-sm mt-2 font-medium text-gray-400">
            <span>
                작성일
                <fmt:parseDate value="${reviewVo.regDate}" pattern="yyyy-MM-dd" var="regDate"/>
                <fmt:formatDate value="${regDate}" pattern="yy/MM/dd"/>
            </span>
        </div>
    </div>

    <!-- 댓글 폼 -->
    <c:if test="${loginUser.role eq Role.O}">
        <div class="xl:container p-8 ">
        <form
            name="reviewCommentCreateFrm"
            action="${pageContext.request.contextPath}/review/reviewCommentCreate"
            method="post">
            <input type="hidden" name="reviewNo" value="${reviewVo.no}">
            <input type="hidden" name="userNo" value="${loginUser.no}">
            <input type="hidden" name="commentLevel" value="1">
            <div class="w-full mb-4 border border-gray-200 rounded-lg bg-gray-50">
                <div class="px-4 p-2 bg-white rounded-t-lg">
                    <label for="content" class="sr-only">답글 작성하기</label>
                    <textarea id="content"
                              name="content"
                              rows="4"
                              onclick="'${loginUser.no}' || alert('로그인후 댓글을 작성하세요');"
                              class="resize-none w-full px-0 text-sm text-gray-900 bg-white border-0"
                              placeholder="답글을 작성하세요" required></textarea>
                </div>
                <div class="flex items-center justify-end px-3 py-2 border-t">
                    <button type="submit"
                            class="inline-flex items-center py-2.5 px-4 text-xs font-medium text-center text-white bg-blue-700 rounded-lg focus:ring-4 focus:ring-blue-200 hover:bg-blue-800">
                        댓글 등록
                    </button>
                </div>
            </div>
        </form>
    </div>
    </c:if>


    <!-- 댓글 테이블 -->
    <div class="xl:container p-8 ">
        <div class="relative my-8 shadow-xl sm:rounded-lg">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500">
                <tbody>
                    <c:forEach items="${reviewVo.reviewComments}" var="comments" varStatus="vs">
                        <c:if test="${comments.commentLevel eq 1}">
                            <%-- 댓글 tr --%>
                            <tr class="bg-white border-b hover:bg-gray-50">
                                <td scope="row" colspan="2" class="w-4/6 px-6 py-4 font-medium text-gray-800">
                                    <sub class="text-gray-500">${reviewVo.restaurant.name}</sub>
                                    <sub class="text-gray-400">
                                        <fmt:parseDate value="${comments.regDate}" pattern="yyyy-MM-dd" var="regDate"/>
                                        <fmt:formatDate value="${regDate}" pattern="yy/MM/dd"/>
                                    </sub>
                                    <p class="mt-2">
                                            ${comments.content}
                                    </p>
                                </td>
                                <td class="px-6 py-4">
                                    <c:if test="${loginUser.role eq Role.O}">
                                        <div class="flex">
                                            <a href="javascript:confirm('정말 삭제하시겠습니까? 😲') && document.reviewCommentDeleteFrm${comments.no}.submit();" class="font-medium text-red-600 hover:underline ms-3">Remove</a>
                                        </div>
                                        <form name="boardCommentDeleteFrm${comments.no}" action="${pageContext.request.contextPath}/review/reviewCommentDelete" method="post">
                                            <input type="hidden" name="id" value="${comments.no}">
                                            <input type="hidden" name="reviewNo" value="${reviewVo.no}">
                                        </form>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.js"></script>
<script src="${pageContext.request.contextPath}/js/restaurant/restaurantPicture.js"></script>
<script src="${pageContext.request.contextPath}/js/review/reviewDetail.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>