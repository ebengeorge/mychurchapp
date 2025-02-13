function submitLogout() {
    const form = document.getElementById('logoutform');
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      
    });
    form.submit();
  }

function convertToJson(formId) {
    let form = document.getElementById(formId);
    let formData = {};
    for (let i = 0; i < form.elements.length; i++) {
        let element = form.elements[i];
        if (element.type !== "submit" || element.type !== "button" ) {
            formData[element.name] = element.value;
        }
    }
    return JSON.stringify(formData);
}

function confirmationBox(fn, obj){
    $('#confirmationBox').modal('show');
    $( "#confirmationYes" ).unbind();
    alert(obj);
    $("#confirmationYes").click(function(){
       fn(obj);
    });
}
