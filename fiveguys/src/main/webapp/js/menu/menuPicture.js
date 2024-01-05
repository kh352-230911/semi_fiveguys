document.searchFrm.addEventListener('submit', (e) => {
    e.preventDefault();
    const container = document.querySelector("#picture-container");
    container.innerHTML = ''
    getPicture(1);
});
const getPicture = (page) => {

    const searchKeyword = document.querySelector("#searchKeyword");

    $.ajax({
        url: `${contextPath}/picture/page`,
        data: {
            page,
            searchKeyword: searchKeyword.value
        },
        success(resultMap) {
            console.log(resultMap);
            const container = document.querySelector("#picture-container");
            const {menus: menuPictures, totalPage} = resultMap;
            // 내용 출력
            container.innerHTML += menuPictures.reduce((html, picture) => {
                console.log(picture);
               const {address, menuPictures : [{renamedFilename}], name, no} = picture;
               return `${html}
               <div class="ml-32">
                <a href="${contextPath}/restaurant/restaurantDetail?no=${no}">
                    <img 
                        class="h-96 w-96 object-cover rounded-lg"
                        src="${contextPath}/upload/picture/${renamedFilename}" 
                        alt="" />
                </a>
                    <div class="p-5">
                        <h5 class="mb-2 inline text-sm font-bold tracking-tight text-gray-900">${name}</h5>
                        <img src="${contextPath}/images/icons8-point.gif" alt=""><p class="mb-3 font-bold text-gray-700">${address}</p>
                  </div>
               </div>`;
            }, '');

            // totalPage 처리
            if(page === 1) {
                document.querySelector("#totalPage").innerHTML = totalPage;
            }
        },
        complete() {
            document.querySelector("#page").innerHTML = page;
        }
    });
    // searchKeyword.value = '';
}

document.querySelector("#btn-page").addEventListener('click', (e) => {
    const page = Number(document.querySelector("#page").innerHTML) + 1;
    const totalPage = Number(document.querySelector("#totalPage").innerHTML);
    page <= totalPage && getPicture(page);
});
window.addEventListener('DOMContentLoaded', () => {
    getPicture(1);
});