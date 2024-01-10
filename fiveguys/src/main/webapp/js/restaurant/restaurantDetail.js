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

var now = Date.now();
var beforeTimeOff = new Date().getTimezoneOffset() * 60000;
var afterTimeOff = (1000 * 60 * 60 * 24 * 30);
var today = new Date(now - beforeTimeOff).toISOString().split("T")[0];
var aMonthLater= new Date(now - beforeTimeOff + afterTimeOff).toISOString().split("T")[0];

document.getElementById("calendar").setAttribute("min", today);
document.getElementById("calendar").setAttribute("max", aMonthLater);

document.querySelector("#calendar").addEventListener('change', (e) => {
   const info = e.target;
   // console.log(info);
   const {restno, usersno, opentime, diffcount, count} = info.dataset;
   // console.log(restno, usersno, opentime, diffcount);

   const timeBtn = document.querySelector("#timeBtnWrapper");
   timeBtn.innerHTML = `
      <button type="button" onclick="frmPlease('${restno}', '${usersno}', '${opentime}', '${e.target.value}');" class="focus:outline-none text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:focus:ring-yellow-900">
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
      <button type="button" onclick="frmPlease('${restno}', '${usersno}', '${formattedCopyOpenTime}', '${e.target.value}');" class="focus:outline-none text-white bg-yellow-400 hover:bg-yellow-500 focus:ring-4 focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 me-2 mb-2 dark:focus:ring-yellow-900">
         ${formattedCopyOpenTime}
      </button>`;

   }
});

function frmPlease(restno, usersno, time, date) {
   document.querySelector("#timeBtnWrapper").innerHTML = `
    <div id="reservationRegisterModal" class="hidden fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center">
    <div class="bg-white p-8 rounded-lg">
        <h2 class="text-2xl font-bold mb-4">예약</h2>
        <form name="reservationRegisterFrm" id="reservationRegisterFrm"
              action="${contextPath}/reservation/reservationRegister" method="post"
              class="space-y-4 md:space-y-6">
            <input type="hidden" id="restNo" name="restNo" value="${restno}">
            <input type="hidden" id="usersNo" name="usersNo" value="${usersno}">
            <input type="hidden" id="reservDate" name="reservDate" value="${date}">
            <input type="hidden" id="reservTime" name="reservTime" value="${time}">
            <div>
                <label for="name"
                       class="block mb-2 text-sm font-medium text-gray-900 after:content-['*'] after:ml-0.5 after:text-red-500">이름</label>
                <input type="text" name="name" id="name"
                       class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5"
                       required>
            </div>
            <div>
                <label for="phone" class="block mb-2 text-sm font-medium text-gray-900">전화번호</label>
                <input type="text" name="phone" id="phone"
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
            <div>
                <label for="request" class="block mb-2 text-sm font-medium text-gray-900">요청사항</label>
                <input type="textarea" name="request" id="request" class="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg focus:ring-primary-600 focus:border-primary-600 block w-full p-2.5" placeholder="요청사항을 입력해주세요...">
            </div>
            <fieldset>
                <button id="reservationSaveBtn" type="button" onclick="save();"
                        class="bg-green-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-green active:bg-green-700">
                    확인
                </button>
                <button id="closeReservationRegisterModalBtn" type="button" onclick="window.close();"
                        class="bg-gray-500 text-white py-2 px-4 mt-4 rounded focus:outline-none focus:shadow-outline-gray active:bg-gray-700">
                    닫기
                </button>
            </fieldset>
        </form>
    </div>
</div>`;

   document.getElementById('reservationRegisterModal').classList.remove('hidden');
}

function close() {
   // 모달 숨기기
   document.getElementById('reservationRegisterModal').classList.add('hidden');
}

// 저장 버튼 클릭 시 처리
function save() {
   // 수정된 정보를 서버로 전송하는 로직 추가
   document.getElementById('reservationRegisterFrm').submit();
   // 모달 닫기
   document.getElementById('reservationRegisterModal').classList.add('hidden');
}

