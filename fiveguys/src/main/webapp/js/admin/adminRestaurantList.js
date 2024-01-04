document.querySelectorAll('.openModal').forEach((a) => {

    a.addEventListener('click', function (e) {
        const info = e.target;
        console.log(info);
        const {rno, id, name, rname, raddress, rcontent, rphone, rcategory, ropentime, rclosetime, rreservpossible, rtotalstar, rregdate} = info.dataset;

        document.querySelector(".rNo").innerHTML = rno;
        document.querySelector(".id").innerHTML = id;
        document.querySelector(".name").innerHTML = name;
        document.querySelector(".rName").innerHTML = rname;
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
        document.getElementById('restaurantDetailModal').classList.remove('hidden');
    });
});