const categoryEtc = document.querySelector("#category-etc");
categoryEtc.addEventListener('keyup', (e) => {
    // 엔터를 누른 경우, 입력완료로 간주한다.
    if(e.keyCode === 13){
        // 자동으로 생겨난 <br><br>을 제거. blur처리
        // console.log(e.target.innerHTML); // 값<br><br>
        e.target.innerHTML = e.target.innerHTML.replace(/<br>/g, '');
        e.target.blur();
    }
});
categoryEtc.addEventListener('blur', (e) => {
    const value = e.target.innerHTML;
    if(value && value != '직접입력') {
        const html = `
            <div class="inline-flex items-center mr-5">
              <input id="category-${value}" type="checkbox" name="category" value="${value}" checked class="w-5 h-4 text-blue-600 bg-gray-100 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" >
              <label for="category-${value}" class="ms-3 text-sm font-medium text-gray-900">${value}</label>
            </div>`;
        // 특정요소기준으로 새요소 추가
        // - beforebegin 시작태그앞. 이전 형제요소로 추가
        // - afterbegin 시작태그뒤. 첫 자식요소로 추가
        // - beforeend 종료태그앞. 마지막 자식요소로 추가
        // - afterend 종료태그뒤. 다음 형제요소로 추가
        // e.target.parentElement : label#hobby-etc를 감싼 div태그
        e.target.parentElement.insertAdjacentHTML('beforebegin', html);
        e.target.innerHTML = '직접입력';
    }

});

/**
 * 회원정보 수정 유효성검사
 */
document.userUpdateFrm.addEventListener('submit', (e) => {
    const frm = e.target;
    const name = frm.name;
    const email = frm.email;
    // const nickName =frm.nickName;

    // 이름 한글2글자 이상
    if(!/^[가-힣]{2,}$/.test(name.value)) {
        alert('이름은 한글 2글자 이상 작성하세요.');
        e.preventDefault();
        return;
    }
    // 이메일 형식
    if(!/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/.test(email.value)) {
        alert('유효한 이메일을 작성하세요.');
        e.preventDefault();
        return;
    }
});

document.querySelectorAll('.openModal').forEach((a) => {
    a.addEventListener('click', function(e) {
        const info = e.target;
        console.log(info);
        const {approval, no, name, address, content, phone, category, opentime, closetime, reservpossible} = info.dataset;

        document.querySelector("#restaurantDetail").innerHTML = `
            <form name="userUpdateFrm" id="userUpdateFrm"
                  action="${contextPath}/user/restaurantUpdate" method="post"
                  class="space-y-4 md:space-y-6">
            <input type="hidden" name="no" id="no" value="${no}">
            <div>
                <label for="approval"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">예약 승인 여부</label>
                <input type="text" name="approval" id="approval" value="${approval}"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       readonly required>
            </div>
            <div>
                <label for="name" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">식당명</label>
                <input type="text" name="name" id="name" value="${name}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="식당명을 입력하세요." required>
            </div>
            <div>
                <label for="address" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">주소</label>
                <input type="text" name="address" id="address" value="${address}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="식당 주소를 입력하세요." required>
            </div>
            <div>
                <label for="content" class="block mb-2 text-sm font-medium text-gray-900">소개글</label>
                <input type="textarea" name="content" id="content" value="${content}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="식당 소개글을 입력하세요." required>
            </div>
            <div class="relative">
                <label for="phone" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">전화번호</label>
                <input type="text" name="phone" id="phone" value="${phone}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="전화번호를 입력하세요. (- 제외)" required>
                <span class="guide ok text-green-700 absolute hidden top-10 end-1">사용가능한 전화번호입니다.</span>
                <span class="guide error text-red-700 absolute hidden top-10 end-1">이미 사용중인 전화번호입니다.</span>
                <input type="hidden" id="phoneValid" value="0">
            </div>
            <div>
                <label for="category" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">카테고리</label>
                <select name="category" id="category" value="${category}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5">
                    <option value="">카테고리를 선택하세요.</option>
                    <option value="한식">한식</option>
                    <option value="일식">일식</option>
                    <option value="중식">중식</option>
                    <option value="양식">양식</option>
                    <option value="동남아식">동남아식</option>
                    <option value="패스트푸드">패스트푸드</option>
                </select>
            </div>
            <div>
                <label for="opentime" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">오픈 타임</label>
                <input type="time" name="opentime" id="opentime" value="${opentime}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
            </div>
            <div>
                <label for="closetime" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">마감 시간</label>
                <input type="time" name="closetime" id="closetime" value="${closetime}" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
            </div>
            <fieldset>
                <legend class="mb-3">예약 가능 여부</legend>
                <div class="inline-flex items-center mr-4">
                    <input id="reservPossible-option-1" type="radio" name="reservPossible" value="Y" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300">
                    <label for="reservPossible-option-1" class="block ms-2  text-sm font-medium text-gray-900">Y</label>
                </div>
                <div class="inline-flex items-center mr-4">
                    <input id="reservPossible-option-2" type="radio" name="reservPossible" value="N" class="w-4 h-4 border-gray-300 focus:ring-2 focus:ring-blue-300">
                    <label for="reservPossible-option-2" class="block ms-2 text-sm font-medium text-gray-900">N</label>
                </div>
            </fieldset>
            <button id="closeUserDetailModalBtn"
                    type="submit"
                    onclick="window.close()"
                    class="bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
                수정
            </button>
            <button id="closeUserDetailModalBtn"
                    type="button"
                    onclick="window.close()"
                    class="bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
                닫기
            </button>`;

        // 모달 보이기
        document.getElementById('restaurantDetailModal').classList.remove('hidden');
    });
});

function close() {
    // 모달 숨기기
    document.getElementById('restaurantDetailModal').classList.add('hidden');
};