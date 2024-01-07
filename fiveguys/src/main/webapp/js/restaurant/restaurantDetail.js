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

document.querySelector("#calendar").addEventListener('change', (e) => {
   const info = e.target;
   // console.log(info);
   const {restno, usersno, opentime, diffcount} = info.dataset;
   // console.log(restno, usersno, opentime, diffcount);

   const timeBtn = document.querySelector("#timeBtnWrapper");
   timeBtn.innerHTML = `
      <button type="button" onclick="frmPlease(${restno}, ${usersno}, ${opentime}, ${e.target.value});" class="focus:outline-none text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:focus:ring-yellow-900">
            ${opentime}
         </button>`;

   let date = new Date();
   let time = opentime.split(":");
   // console.log(time);
   let openTimeMil = date.setHours(time[0], time[1]);
   // console.log(openTimeMil);
   let _copyOpenTime = openTimeMil

   for (let i = 0; i < (diffcount-1); i++) {
      _copyOpenTime += (1000 * 60 * 60);
      // console.log(_copyOpenTime);
      let copyOpentime = new Date(_copyOpenTime);
      // console.log(copyOpentime);
      let formattedCopyOpenTime = `${copyOpentime.getHours()}:${String(copyOpentime.getMinutes()).padStart(2, '0')}`;

      timeBtn.innerHTML += `
         <button type="button" onclick="frmPlease(${restno}, ${usersno}, ${formattedCopyOpenTime}, ${e.target.value});" class="focus:outline-none text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:focus:ring-yellow-900">
            ${formattedCopyOpenTime}
         </button>`;
   }
});

function frmPlease (restno, usersno, time, date) {
   document.querySelector("#timeBtnWrapper").innerHTML = `
      <div class="p-6 space-y-4 md:space-y-6 sm:p-8">
      <h1 class="text-xl font-bold leading-tight tracking-tight text-gray-900 md:text-2xl">
         예약 정보 입력
      </h1>
      <form name="memberRegisterFrm" method="post" class="space-y-4 md:space-y-6">
         <div>
            <input type="hidden" id="restNo" name="restNo" value="${restno}">
            <input type="hidden" id="usersNo" name="usersNo" value="${usersno}">
            <input type="hidden" id="reservDate" name="reservDate" value="${date}">
            <input type="hidden" id="reservTime" name="reservTime" value="${time}">
            <label for="reservName" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">예약자명</label>
            <input type="text" name="reservName" id="reservName" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
            <label for="reservPeople" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">인원수</label>
            <input type="text" name="reservPeople" id="reservPeople" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
            <label for="request" class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">요청사항</label>
            <input type="textarea" name="request" id="request" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" required>
         </div>
         <button type="submit" class="text-white w-full bg-primary-600 hover:bg-primary-700 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center">예약</button>
      </form>
   </div>`;
}
