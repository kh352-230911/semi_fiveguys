document.querySelector(".attraction-btn").addEventListener('click', (e) => {
   const attraction = e.target.nextElementSibling;
   console.log(attraction);
   const {restNo, usersNo} = attraction.dataset;
    console.log(restNo, usersNo);

   if(attraction.classList.contains("fa-regular")) {
      $.ajax({
         url: `${contextPath}/attraction/attractionInsert`,
         method: 'post',
         data: {
            restNo, usersNo
         },
         success(result) {
            console.log(result);
            attraction.classList.remove("fa-regular");
            attraction.classList.add("fa-solid");
         }
      });
   }
   else {
      $.ajax({
         url: `${contextPath}/attraction/attractionDelete`,
         method: 'post',
         data: {
            restNo, usersNo
         },
         success(result) {
            console.log(result);
            attraction.classList.remove("fa-solid");
            attraction.classList.add("fa-regular");
         }
      });
   }
});

// 모달 열기
document.getElementById('reservationRegisterModalBtn').addEventListener('click', function () {
   // 모달 보이기
   document.getElementById('reservationRegisterModal').classList.remove('hidden');
});

// 모달 닫기
document.getElementById('closeReservationRegisterModalBtn').addEventListener('click', function () {
   // 모달 숨기기
   document.getElementById('reservationRegisterModal').classList.add('hidden');
});

// 저장 버튼 클릭 시 처리
document.getElementById('reservationSaveBtn').addEventListener('click', function () {
   // 수정된 정보를 서버로 전송하는 로직 추가
   document.getElementById('reservationRegisterFrm').submit();
   // 모달 닫기
   document.getElementById('reservationRegisterModal').classList.add('hidden');
});