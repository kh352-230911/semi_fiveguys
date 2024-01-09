const saveId = localStorage.getItem('saveId');
if (saveId){
    document.querySelector("#id").value = saveId;
    document.querySelector("#saveId").checked = true;
}

document.userLoginFrm.addEventListener('submit', (e) =>{
    const saveId = e.target.saveId;
    const id = e.target.id;
    if (saveId.checked){
        localStorage.setItem('saveId', id.value);
    }
    else {
        localStorage.removeItem('saveId');
    }
});