document.querySelectorAll('.openModal').forEach((a) => {

    a.addEventListener('click', function (e) {
        const info = e.target;
        console.log(info);
        const {no, rname, id, name, role, rno, raddress, rcontent, rphone, rcategory, ropentime, rclosetime, rreservpossible, rtotalstar, rregdate, rapproval} = info.dataset;
        // console.log(ropentime);
        document.querySelector(".btnWrapper").innerHTML = null;

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
        document.querySelector(".btnWrapper").innerHTML += `
        <form class="inline" action="${contextPath}/admin/adminApprovalOk" method="post">
            <input type="hidden" name="no" value="${no}">
            <input type="hidden" name="role" value="${role}">
            <input type="hidden" name="rno" value="${rno}">
            <input type="hidden" name="approval" value="${rapproval}">
            <button id="approvalBtn" type="submit"
                class="ok bg-green-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-green active:bg-green-700">
                승인
            </button>
        </form>
        <form class="inline"  action="${contextPath}/admin/adminApprovalNo" method="post">
            <input type="hidden" name="rno" value="${rno}">
            <button id="refuseBtn" type="submit"
                class="ok bg-green-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-green active:bg-green-700">
                거절
            </button>
        </form>
        <button type="button"
                onclick="window.close();"
                class="closeUserDetailModalBtn bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
            닫기
        </button>
        `;

        // 모달 보이기
        document.getElementById('userDetailModal').classList.remove('hidden');
    });
});

function close() {
    console.log('close');
    document.getElementById('userDetailModal').classList.add('hidden');
}