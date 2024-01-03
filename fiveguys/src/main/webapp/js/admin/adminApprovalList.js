document.querySelectorAll('.openModal').forEach((a) => {

    a.addEventListener('click', function (e) {
        const info = e.target;
        // console.log(info);
        const {rname, id, name, role, raddress, rcontent, rphone, rcategory, ropentime, rclosetime, rreservpossible, rtotalstar, rregdate} = info.dataset;
        // console.log(ropentime);

        document.querySelector(".rName").innerHTML = rname;
        document.querySelector(".id").innerHTML = `${name} (${id}, ${role})`;
        document.querySelector(".rAddress").innerHTML = raddress;
        document.querySelector(".rContent").innerHTML = rcontent;
        document.querySelector(".rPhone").innerHTML = rphone;
        document.querySelector(".rCategory").innerHTML = rcategory;
        document.querySelector(".rOpenTime").innerHTML = ropentime;
        document.querySelector(".rCloseTime").innerHTML = rclosetime;
        document.querySelector(".rReservPossible").innerHTML = rreservpossible;
        document.querySelector(".rTotalStar").innerHTML = rtotalstar;
        document.querySelector(".rRegDate").innerHTML = rregdate;

        // 모달 보이기
        document.getElementById('userDetailModal').classList.remove('hidden');
    });
});

// 모달 닫기
document.querySelectorAll('.closeUserDetailModalBtn').forEach((c) => {
    c.addEventListener('click', function () {
        // 모달 숨기기
        document.getElementById('userDetailModal').classList.add('hidden');
    });
});

// 저장 버튼 클릭 시 처리
document.getElementById('approvalBtn').addEventListener('click', function () {
    // 수정된 정보를 서버로 전송하는 로직 추가
    document.getElementById('userUpdateFrm').submit();
    // 모달 닫기
    document.getElementById('userDetailModal').classList.add('hidden');
});