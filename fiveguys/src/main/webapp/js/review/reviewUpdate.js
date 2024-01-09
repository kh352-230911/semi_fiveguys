document.reviewUpdateFrm.addEventListener('submit', (e) => {
    const frm = e.target;
    const content = frm.content;

    // 내용 유효성 검사
    if(!/^(.|\n)+$/.test(content.value.trim())) {
        alert('내용을 작성해주세요. 😁');
        e.preventDefault();
        return;
    }
});