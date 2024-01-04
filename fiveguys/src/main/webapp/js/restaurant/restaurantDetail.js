document.querySelector(".attraction-btn").addEventListener('click', (e) => {
   const attraction = e.target.nextElementSibling.nextElementSibling;
   console.log(attraction);
   const {restNo, userNo} = attraction.dataset;
    console.log(restNo, userNo);

       $.ajax({
          url: `${contextPath}/attraction/attractionInsert`,
          method: 'post',
          data: {
             restNo, userNo
          },
          success(result) {
             console.log(result);
             const html = `
               <h6 class="like inline text-base cursor-pointer">🤍</h6><br>
             `
            const i = e.target.nextElementSibling.nextElementSibling.nextElementSibling;
             i.insertAdjacentHTML('afterbegin', html);
          }
       });
});