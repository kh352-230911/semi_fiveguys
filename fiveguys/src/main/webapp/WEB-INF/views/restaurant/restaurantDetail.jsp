<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.sh.guys.user.model.entity.Role" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<%-- 식당 디테일 페이지 우진 --%>
<div id="photo-container" class="w-full flex flex-col items-center"
     data-address="${restaurantVo.address}">
        <div class="my-5 max-w-sm bg-white border border-gray-200 rounded-lg shadow hover:shadow-lg">
            <div class="bxslider">
                <c:forEach items="${restaurantVo.menuPictures}" var="restaurantVo" begin="0" end="5" step="1">
                    <div><img class="w-full h-full max-w-full max-h-full rounded-t-lg"
                              src="${pageContext.request.contextPath}/upload/picture/${restaurantVo.renamedFilename}"/>
                    </div>
                </c:forEach>
            </div>

            <div class="p-5">
                <h5 class="mb-2 inline text-2xl font-bold tracking-tight text-gray-900">${restaurantVo.name}</h5><br>
                <c:if test="${(loginUser.role == Role.O and (loginUser.no == restaurantVo.usersNo)) or loginUser.role == Role.M}">
                    <div class="sticky w-full bg-white rounded-lg shadow my-4 sm:max-w-full xl:p-0 relative">
                        <button type="button"
                                class="bg-blue-500 text-white py-2 px-4 rounded focus:outline-none focus:shadow-outline-blue active:bg-blue-800 absolute top-6 right-1">
                            <a href="${pageContext.request.contextPath}/menu/menuRegister?no=${restaurantVo.no}">메뉴 추가</a>
                        </button>
                    </div>
                </c:if>
                <c:if test="${starAverageVo[0].averageRating == 5.0}">
                    <div class="flex items-center mt-2.5 mb-5">
                        <div class="flex items-center space-x-1 rtl:space-x-reverse">
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                        </div>
                        <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">${starAverageVo[0].averageRating}</span>
                    </div>
                </c:if>
                <c:if test="${starAverageVo[0].averageRating >= 4.0 and starAverageVo[0].averageRating < 5.0}">
                    <div class="flex items-center mt-2.5 mb-5">
                        <div class="flex items-center space-x-1 rtl:space-x-reverse">
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                        </div>
                        <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">${starAverageVo[0].averageRating}</span>
                    </div>
                </c:if>
                <c:if test="${starAverageVo[0].averageRating >= 3.0 and starAverageVo[0].averageRating < 4.0}">
                    <div class="flex items-center mt-2.5 mb-5">
                        <div class="flex items-center space-x-1 rtl:space-x-reverse">
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                        </div>
                        <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">${starAverageVo[0].averageRating}</span>
                    </div>
                </c:if>
                <c:if test="${starAverageVo[0].averageRating >= 2.0 and starAverageVo[0].averageRating < 3.0}">
                    <div class="flex items-center mt-2.5 mb-5">
                        <div class="flex items-center space-x-1 rtl:space-x-reverse">
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                        </div>
                        <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">${starAverageVo[0].averageRating}</span>
                    </div>
                </c:if>
                <c:if test="${starAverageVo[0].averageRating >= 1.0 and starAverageVo[0].averageRating < 2.0}">
                    <div class="flex items-center mt-2.5 mb-5">
                        <div class="flex items-center space-x-1 rtl:space-x-reverse">
                            <svg class="w-4 h-4 text-yellow-300" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                            <svg class="w-4 h-4 text-gray-200 dark:text-gray-600" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                            </svg>
                        </div>
                        <span class="bg-blue-100 text-blue-800 text-xs font-semibold px-2.5 py-0.5 rounded dark:bg-blue-200 dark:text-blue-800 ms-3">${starAverageVo[0].averageRating}</span>
                    </div>
                </c:if>
            <c:if test="${loginUser != null}">
                <button type="button" class="attraction-btn like inline text-base cursor-pointer">좋아요</button>
<%--                <span class="text-base text-gray-500"></span>--%>
                <c:if test="${attractions != null}">
                    <i data-rest-no="${restaurantVo.no}" data-users-no="${loginUser.no}"
                            class="fa-solid fa-heart"></i>
                </c:if>
                <c:if test="${attractions == null}">
                    <i data-rest-no="${restaurantVo.no}" data-users-no="${loginUser.no}"
                            class="fa-regular fa-heart"></i>
                </c:if>
            </c:if>
            <c:if test="${loginUser == null}">
                <h6 class="inline text-base text-gray-500">좋아요</h6>
<%--                <span class="text-base text-gray-500">${restaurantVo.attractionCount}</span>--%>
                <i data-rest-no="${restaurantVo.no}" data-users-no="${loginUser.no}"
                   class="fa-regular fa-heart"></i>
            </c:if>
            <p class="mb-3 font-sans text-gray-700">${restaurantVo.content}</p>
        </div>

            <hr>
        <%-- 예약 관련 프론트 --%>
        <div class="p-5">
            <h5 class="mb-2 inline text-2xl font-bold tracking-tight text-gray-900">예약 일시</h5><br>
            <hr>
            <br>
            <br>
            <div class="mb-8">
                <label for="calendar">예약 날짜</label>
                <input type="date" id="calendar" name="calendar"
                       data-restNo="${restaurantVo.no}"
                       data-usersNo="${loginUser.no}"
                       data-openTime="${reservationVO.openTime}"
                       data-diffCount="${reservationVO.diffCount}">
                <br>
                <label>예약 시간</label>
                <div id="timeBtnWrapper">
<%--                    <button id="reservationRegisterModalBtn" type="button"--%>
<%--                            class="bg-blue-500 text-white py-2 px-4 rounded focus:outline-none focus:shadow-outline-blue active:bg-blue-800 top-10 right-24">--%>
<%--                    </button>--%>
                </div>
            </div>
        </div>
        <hr>
        <%-- 식당마다 메뉴 --%>
        <div class="p-5">
            <h5 class="mb-2 inline text-2xl font-bold tracking-tight text-gray-900">메뉴</h5><br>
            <hr>
            <div class="content-center"></div>
<%--            <c:forEach items="${restaurantVo.menuPictures}" var="restaurantVo.menuPictures" varStatus="status">--%>
<%--                <c:if test="${status.last}">--%>
<%--                    <img src="${pageContext.request.contextPath}/images/${restaurantVo.menuPictures.renamedFilename}"/>--%>
<%--                </c:if>--%>
<%--            </c:forEach>--%>
            <img src="${pageContext.request.contextPath}/upload/picture/${restaurantVo.menuPictures[restaurantVo.menuPictures.size() - 1].renamedFilename}"/>
            <br>
            <hr>
            <c:forEach items="${restaurantVo.menus}" var="restaurantVom">
                    <div class="font-bold">${restaurantVom.name}</div>
                    <div class="inline">${restaurantVom.price}원</div>
                    <div class="plusminus-wrapper inline grid grid-cols-6 gap-6 place-content-center h-10 ...">
                        <c:if test="${(loginUser.role == Role.O and (loginUser.no == restaurantVo.usersNo)) or loginUser.role == Role.M}">
                        <button id="update-etc" name="update-etc">
                            <a href="${pageContext.request.contextPath}/menu/menuUpdate?no=${no}">
                                <img src="${pageContext.request.contextPath}/upload/img/free-icon-add-3394636.png"/>
                            </a>
                        </button>
                        <form name="menuDeleteFrm${no}" action="${pageContext.request.contextPath}/menu/menuDelete" method="post">
                            <input type="hidden" name="no" value="${restaurantVom.no}">
                            <input type="hidden" name="restNo" value="${restaurantVom.restNo}">
                            <button id="delete-etc" name="delete-etc" onclick="confirm('해당 메뉴를 삭제하시겠습니까?') && document.menuDeleteFrm${no}.submit();">
                                <img src="${pageContext.request.contextPath}/upload/img/free-icon-minus-3485999.png"/>
                            </button>
                        </form>
                        </c:if>
                    </div>
                <br>
                <hr>
            </c:forEach>
        </div>
        <hr>
        <%-- 편의 시설 --%>
        <div class="p-5">
            <h5 class="mb-2 inline text-2xl font-bold tracking-tight text-gray-900">편의 시설</h5><br>
            <hr>
            <div class="grid grid-cols-6 gap-6 place-content-center h-48 ...">
                <c:forEach items="${convenienceVo[0].conveniences}" var="convenience">
                    <div class="text-xs"><img src="${pageContext.request.contextPath}/upload/convenience/${convenience.conveniencePic}"/>${convenience.kind}</div>

                </c:forEach>

<%--                <c:forEach items="${convenienceVo[0].conveniences}" var="convenience">--%>
<%--                    <div>${convenience.kind}</div>--%>
<%--                </c:forEach>--%>
            </div>
        </div>
        <hr>
        <%-- 지도 api이용해서 작성 할 예정 - 우진 --%>
        <div class="p-5">
            <h5 class="mb-2 inline text-2xl font-bold tracking-tight text-gray-900">매장 위치</h5><br>
            <hr>
            <br>
<%--            <img src="${pageContext.request.contextPath}/images/지도%20하드%20코딩%20샘플%20사진.png"/>--%>
            <%-- 카카오 api 적용 - 우진 --%>
            <div id="map" style="width:340px;height:400px;"></div>
            <br>
            <p class="font-bold">주소</p>
            <hr>
            <p class="mb-3 font-sans text-gray-700">${restaurantVo.address}</p>
        </div>
        <hr>
        <%-- 상세 정보 --%>
        <div class="p-5">
            <h5 class="mb-2 inline text-2xl font-bold tracking-tight text-gray-900">상세 정보</h5><br><br>
            <p class="mb-1 font-bold text-gray-700">전화번호</p>
            <p class="mb-5 font-bold text-sky-700">📞 ${restaurantVo.phone}</p>
            <p class="mb-1 font-bold text-gray-700">매장소개</p>
            <p class="mb-5 font-sans text-gray-700">${restaurantVo.content}</p>
            <p class="mb-1 font-bold text-gray-700">영업시간</p>
            <p class="mb-5 font-sans text-gray-700">${restaurantVo.openTime} ~ ${restaurantVo.closeTime}</p>
        </div>
        <hr>

        <div class="p-5">
            <h5 class="mb-2 inline text-2xl font-bold tracking-tight text-gray-900">
                <a href="${pageContext.request.contextPath}/review/reviewList?no=${restaurantVo.no}">리뷰</a></h5><br>
        </div>
</div>
<!-- 모달 -->
<div id="reservationRegisterModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg">
        <h2 class="text-2xl font-bold mb-4">사용자 정보 변경</h2>
        <form name="reservationRegisterFrm" id="reservationRegisterFrm"
              action="${pageContext.request.contextPath}/reservation/reservationRegister" method="post"
              class="space-y-4 md:space-y-6">
            <input type="hidden" name="usersNo" id="usersNo" value="${loginUser.no}">
            <input type="hidden" name="no" id="no" value="${restaurantVo.no}">
            <div>
                <label for="name"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">이름</label>
                <input type="text" name="name" id="name" value="${loginUser.name}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       required>
            </div>
            <div>
                <label for="phone" class="block mb-2 text-sm font-medium text-gray-900">전화번호</label>
                <input type="text" name="phone" id="phone" value="${loginUser.phone}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       placeholder="(-) 없이 입력하세요.">
            </div>

                <div class="w-full mt-4">
                    <label for="people" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">인원수</label>
                    <select id="people" name="people" class="ml-4 w-1/8 border-0">
                        <option value="select">선택</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
<%--                <label for="people" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">인원수</label>--%>

            <div>
                <label for="request" class="block mb-2 text-sm font-medium text-gray-900">요청사항</label>
                <input type="text" name="request" id="request" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="요청사항을 입력해주세요...">
            </div>
            <input type="hidden" name="id" id="id" value="${loginUser.id}">
            <fieldset>
                <button id="reservationSaveBtn" type="button"
                        class="bg-green-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-green active:bg-green-700">
                    확인
                </button>
                <button id="closeReservationRegisterModalBtn" type="button"
                        class="bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
                    닫기
                </button>
            </fieldset>
        </form>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.js"></script>
<script src="${pageContext.request.contextPath}/js/restaurant/restaurantPicture.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=095c604985806a4d1d1e9815c61b4627&libraries=services"></script>
<script language="JavaScript">
    var restaurantAddress = "${restaurantVo.address}";
    var address = restaurantAddress;
    var restaurantName = "${restaurantVo.name}";
    var rName = restaurantName;
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/restaurant/restaurantDetailMap.js"></script>
<script src="${pageContext.request.contextPath}/js/restaurant/restaurantDetail.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
