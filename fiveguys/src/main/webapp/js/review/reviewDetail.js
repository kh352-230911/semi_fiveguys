document.addEventListener('submit', (e) => {
    // 정적으로 생성된 폼, 동적으로 생성된 폼 모두 적용
    if(e.target.matches("[name=reviewCommentCreateFrm]")) {
        const frm = e.target;
        const usersNo = frm.usersNo;
        const content = frm.content;

        if(!usersNo.value) {
            alert('로그인후 댓글을 작성해주세요. 😎');
            e.preventDefault();
            return;
        }

        if(!/^(.|\n)+$/.test(content.value.trim())) {
            alert('댓글 내용을 작성해주세요. 😎');
            e.preventDefault();
            return;
        }
    }


});
