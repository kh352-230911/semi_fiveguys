document.querySelector("#phone").addEventListener('keyup', (e) => {
    const value = e.target.value;
    console.log(e.target);
    // console.log(value);

    const guideOk = document.querySelector(".guide.ok");
    const guideError = document.querySelector(".guide.error");
    const phoneValid = document.querySelector("#phoneValid");

    if (value) {
        $.ajax({
            url: `${contextPath}/restaurant/checkPhoneDuplicate`,
            data: {
                phone : value
            },
            success(response) {
                const {result} = response;
                if (result) {
                    // 사용가능한 번호인 경우
                    // console.log("good");
                    guideOk.classList.remove("hidden");
                    guideError.classList.add("hidden");
                    phoneValid.value = 1;
                } else {
                    // 이미 사용중인 번호인 경우
                    // console.log("bad");
                    guideOk.classList.add("hidden");
                    guideError.classList.remove("hidden");
                    phoneValid.value = 0;
                }
            }
        });
    } else {
        // 다시쓰기하는 경우
        // console.log("oops");
        guideOk.classList.add("hidden");
        guideError.classList.add("hidden");
        phoneValid.value = 0;
    }
});

// 식당 등록 유효성검사
document.userRegisterFrm.addEventListener('submit', (e) => {
    const frm = e.target;
    const name = frm.name;
    const address = frm.address;
    const phone = frm.phone;
    const category = frm.category.value;
    const opentime = frm.opentime.value;
    const closetime = frm.closetime.value;
    const reservPossible = frm.reservPossible.value;

    if (!/^\d+$/.test(phone.value)) {
        alert('전화번호에 숫자 이외의 문자가 포함되어 있습니다.');
        e.preventDefault();
        return;
    }
    
    if (!name) {
        alert('식당명은 필수값입니다.');
        e.preventDefault();
        return;
    }
    if (!address) {
        alert('식당 주소는 필수값입니다.');
        e.preventDefault();
        return;
    }
    if (!phone) {
        alert('전화번호는 필수값입니다.');
        e.preventDefault();
        return;
    }
    if (!category) {
        alert('카테고리는 필수값입니다.');
        e.preventDefault();
        return;
    }
    if (!opentime) {
        alert('오픈 시간은 필수값입니다.');
        e.preventDefault();
        return;
    }
    if (!closetime) {
        alert('마감 시간은 필수값입니다.');
        e.preventDefault();
        return;
    }
    if (!reservPossible) {
        alert('예약 가능 여부는 필수값입니다.');
        e.preventDefault();
        return;
    }
});