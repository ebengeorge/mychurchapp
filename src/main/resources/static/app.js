function submitLogout() {
    const form = document.getElementById('logoutform');
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      
    });
    form.submit();
  }

  $(function() {
    $( document ).ready(function() {
      if($("#loginerr").val().trim() != "") {
        toastr.error($("#loginerr").val().trim());
      }
    });    
  });
  