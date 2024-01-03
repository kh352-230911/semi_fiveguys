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
            success(menuPictures) {
                console.log(menuPictures);
                const container = document.querySelector("#picture-container");
                if(searchKeyword.value == null || searchKeyword.value == ''){
                    container.innerHTML += menuPictures.reduce((html, picture) => {
                        console.log(picture);
                        const {address, menuPictures: [{renamedFilename}], name} = picture;
                        return `${html}
                       <div>
                            <img
                                class="h-auto max-w-full rounded-lg"
                                src="${contextPath}/upload/picture/${renamedFilename}"
                                alt="" />
                            <div class="p-5">
                                <h5 class="mb-2 inline text-sm font-bold tracking-tight text-gray-900">${name}</h5>
                                <img src="${contextPath}/images/icons8-point.gif" alt=""><p class="mb-3 font-bold text-gray-700">${address}</p>
                          </div>
                       </div>`;
                        }, '');
                }
                else{
                    const {address, menuPictures: [{renamedFilename}], name, totalPage} = menuPictures;
                    const html=
                       `<div>
                            <img
                                class="h-auto max-w-full rounded-lg"
                                src="${contextPath}/upload/picture/${renamedFilename}"
                                alt="" />
                            <div class="p-5">
                                <h5 class="mb-2 inline text-sm font-bold tracking-tight text-gray-900">${name}</h5>
                                <img src="${contextPath}/images/icons8-point.gif" alt=""><p class="mb-3 font-bold text-gray-700">${address}</p>
                          </div>
                       </div>`;
                    container.insertAdjacentHTML('afterbegin', html);
                    }
                },
            complete() {
                document.querySelector("#page").innerHTML = page;
            }
        });
    searchKeyword.value = '';
}

document.querySelector("#btn-page").addEventListener('click', (e) => {
    const page = Number(document.querySelector("#page").innerHTML) + 1;
    const totalPage = Number(document.querySelector("#totalPage").innerHTML);
    page <= totalPage && getPicture(page);
});
window.addEventListener('DOMContentLoaded', () => {
        getPicture(1);
});