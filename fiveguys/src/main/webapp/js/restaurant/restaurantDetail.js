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