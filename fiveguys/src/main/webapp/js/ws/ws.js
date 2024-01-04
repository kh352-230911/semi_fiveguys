const ws = new WebSocket(`ws://${location.host}${contextPath}/echo`);

ws.addEventListener('open', (e) => {
    console.log('open', e);
});

ws.addEventListener('message', (e) => {
    console.log('message', e);

    const container = document.querySelector("#notification-container");
    const {no, usersId, content, type, checked, regDate} = JSON.parse(e.data);
    const html = `
        <li class="w-full px-4 border-b border-gray-200 rounded-t-lg">
<!--            <a href="#" class="hover:underline text-blue-500">${content}</a>-->
            ${content}
        </li>`
    container.insertAdjacentHTML('afterbegin', html);
});

ws.addEventListener('error', (e) => {
    console.log('error', e);
});
ws.addEventListener('close', (e) => {
    console.log('close', e);
});