document.addEventListener("DOMContentLoaded", () => {
    const passwordForm = document.getElementById('passwordForm');
    const passwordInput = document.getElementById('password');
    const confirmPasswordInput = document.getElementById('confirmPassword');

    passwordForm.addEventListener('submit', (event) => {
        event.preventDefault(); // 폼 제출 방지

        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;

        // 비밀번호 확인 로직 추가
        if (password === confirmPassword) {
            // 비밀번호가 일치하면 숨겨진 폼을 제출하여 탈퇴 서블릿 호출
            document.userDeleteFrm.submit();
        } else {
            // 비밀번호가 일치하지 않으면 사용자에게 알림 등을 표시
            alert('비밀번호가 일치하지 않습니다.');
        }
    });
});