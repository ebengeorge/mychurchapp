function submitLogout() {
    const form = document.getElementById('logoutform');
    form.addEventListener('submit', (event) => {
      event.preventDefault();
      
    });
    form.submit();
  }
