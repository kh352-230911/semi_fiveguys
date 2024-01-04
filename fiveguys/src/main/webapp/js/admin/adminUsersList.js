// 모달 열기
document.querySelectorAll('.openModal').forEach((a) => {

    a.addEventListener('click', function (e) {
        const info = e.target;
        const {id, name, nickname, gender, email, phone, role, category} = info.dataset;
        const categoryDefaultList = ["한식", "양식", "중식", "일식"];
        const categoryDefaultListSize = categoryDefaultList.size;

        document.querySelector("#userDetail").innerHTML = `
        <h2 class="text-2xl font-bold mb-4">사용자 정보 변경</h2>
        <form name="userUpdateFrm" id="userUpdateFrm"
              action="${contextPath}/user/userUpdate" method="post"
              class="space-y-4 md:space-y-6">
            <div>
                <label for="id"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">아이디</label>
                <input type="text" name="id" id="id" value="${id}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       readonly required>
            </div>
            <div>
                <label for="name"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">이름</label>
                <input type="text" name="name" id="name" value="${name}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       required>
            </div>
            <div>
                <label for="nickName"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">별명</label>
                <input type="text" name="nickName" id="nickName" value="${nickname}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       required>
            </div>

            <div>
                <label for="email"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">이메일</label>
                <input type="email" name="email" id="email" value="${email}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       placeholder="name@company.com" required>
            </div>
            <div>
                <label for="phone" class="block mb-2 text-sm font-medium text-gray-900">전화번호</label>
                <input type="text" name="phone" id="phone" value="${phone}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       placeholder="(-) 없이 입력하세요.">
            </div>
            <fieldset>
                <legend class="mb-3">성별</legend>
                <div class="inline-flex items-center mr-4">
                    <input id="gender-M" type="radio" name="gender" value="M"
                           class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" ${gender == 'M' ? 'checked' : ''}>
                    <label for="gender-M" class="block ms-2  text-sm font-medium text-gray-900">남</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="gender-F" type="radio" name="gender" value="F"
                           class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300" ${gender == 'F' ? 'checked' : ''}>
                    <label for="gender-F" class="block ms-2 text-sm font-medium text-gray-900">여</label>
                </div>
            </fieldset>
            <fieldset>
                <legend class="mb-3">음식선택</legend>
                <div class="inline-flex items-center mr-4">
                    <input id="category-1" type="checkbox" name="category" value="한식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${category == '한식' ? 'checked' : ''}>
                    <label for="category-1" class="ms-2 text-sm font-medium text-gray-900">한식</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="category-2" type="checkbox" name="category" value="양식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${category == '양식' ? 'checked' : ''}>
                    <label for="category-2" class="ms-2 text-sm font-medium text-gray-900">양식</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="category-3" type="checkbox" name="category" value="중식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${category == '중식' ? 'checked' : ''}>
                    <label for="category-3" class="ms-2 text-sm font-medium text-gray-900">중식</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="category-4" type="checkbox" name="category" value="일식"
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" ${category == '일식' ? 'checked' : ''}>
                    <label for="category-4" class="ms-2 text-sm font-medium text-gray-900">일식</label>
                </div>
                <c:forEach items="${category}" var="category" varStatus="vs">
                <!-- el연산자 not(!) eq(==) ne(!=) gt(>) ge(>=) lt(<) le(<=) -->
                <c:if test="${!categoryDefaultList == category}">
                <div class="inline-flex items-center mr-4">
                    <input id="category-${category.count + categoryDefaultListSize}" type="checkbox"
                           name="category" value="${category}" checked
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2">
                    <label for="category-${category.count + categoryDefaultListSize}"
                           class="ms-2 text-sm font-medium text-gray-900">${category}</label>
                </div>
                </c:if>
                </c:forEach>
                <div class="inline-flex items-center mr-4" id="category-etc-wrapper">
                    <input type="checkbox" value=""
                           class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2">
                    <label id="category-etc" class="ms-2 text-sm font-medium text-gray-500"
                           contenteditable>직접입력</label>
                </div>
                <button type="button"
                        onclick="location.href = '${contextPath}/user/updatePassword';"
                        class="text-white w-full bg-purple-400 hover:bg-purple-500 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">
                    비밀번호 변경
                </button>
                <p class="text-sm font-light text-red-500">
                    서비스를 그만 사용하고 싶으신가요? <a href="${contextPath}/user/userDelete" ;
                                           class="font-medium text-red-600 hover:underline">여기서 회원탈퇴하세요😭</a>
                </p>
                <button id="saveUserDetailBtn" type="button"
                        onclick="window.save();"
                        class="bg-green-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-green active:bg-green-700">
                    저장
                </button>
                <button id="closeUserDetailModalBtn" type="button"
                        onclick="window.close()"
                        class="bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
                    닫기
                </button>
            </fieldset>
        </form>`;

        // 모달 보이기
        document.getElementById('userDetailModal').classList.remove('hidden');
    });
});

// 모달 닫기
function close() {
    // 모달 숨기기
    document.getElementById('userDetailModal').classList.add('hidden');
};

// 저장 버튼 클릭 시 처리
function save() {
    // 수정된 정보를 서버로 전송하는 로직 추가
    document.getElementById('userUpdateFrm').submit();
    // 모달 닫기
    document.getElementById('userDetailModal').classList.add('hidden');
};