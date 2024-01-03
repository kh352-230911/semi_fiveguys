document.querySelector("#btn-edit").addEventListener("click", (e) => {
    $.ajax({
        url : `${contextPath}/admin/adminRoleUpList`,
        success() {

        }
    })
})