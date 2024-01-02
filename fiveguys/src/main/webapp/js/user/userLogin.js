const saveId = localStorage.getItem('saceId');
if (saveId){
    document.querySelector("#id").value = saveId;
    document.querySelector("#saveId").checkd = true;
}

document.userLoginFrm.addEventListener('submit', (e) =>{
   const  saveId = e.target.saveId;
    const id = e.target.id;
    if (saveId.checkd){
        localStorage.setItem('saveId', id.value);
    }
    else {
        localStorage.removeItem('saveId');
    }
});