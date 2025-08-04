
$(function () {
    if($('#orgTheme').val()=="dark") {
        $('body').addClass('dark-mode');
        $('.main-header').removeClass('navbar-white');
        $('.main-header').removeClass('navbar-light');
        $('.main-header').addClass('navbar-dark');
    }
    loadImage($("#orglogo").attr('data-imgUrl'), 'orglogo');

    if($("#user-role").data("role")=="user"){
        $('#create-post').hide();
        $('#create-event').hide();
        $('#update-event').hide();
        $('#userMenu li').each(function(i, obj) {
            var menuLabel = $(obj).find('a > p').text().trim();
            if(menuLabel=="User Management" || menuLabel=="Team Management"){
                $(obj).hide();
            }
        });
        $('#eventForm').find('input[type="text"], textarea').each(function(){
            $(this)
                .prop('readonly', true)
                .removeClass('form-control')
                .addClass('form-control-plaintext text-white');
        });

    }
});

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
        // Process only if element is not a submit or button type.
        if (element.type !== "submit" && element.type !== "button") {
            let name = element.name;
            let value = element.value;

            // If the name contains a dot, create nested objects
            if (name.includes(".")) {
                let keys = name.split(".");
                let current = formData;
                // Iterate over each key and create nested objects if needed
                for (let j = 0; j < keys.length; j++) {
                    let key = keys[j];
                    if (j === keys.length - 1) {
                        // Last key: assign the value
                        current[key] = value;
                    } else {
                        // If the key does not exist, create an empty object
                        if (!current.hasOwnProperty(key)) {
                            current[key] = {};
                        }
                        // Move deeper into the nested object
                        current = current[key];
                    }
                }
            } else {
                // If no dot, add directly to the object
                formData[name] = value;
            }
        }
    }
    return JSON.stringify(formData);
}


// Generic confirmation box function
function confirmationBox(callback, parameter) {
    $('#confirmationBox').modal('show');
    $("#confirmationYes").off('click');
    $("#confirmationYes").on('click', function(){
        callback(parameter);
        $('#confirmationBox').modal('hide')
    });
}


function loadImage(filename, imgElementId) {
    fetch('/cms/api/download/' + encodeURIComponent(filename))
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok: " + response.statusText);
            }
            return response.blob();
        })
        .then(blob => {
            // Create a local URL for the image blob
            const objectURL = URL.createObjectURL(blob);
            // Set the src attribute of the image element
            document.getElementById(imgElementId).src = objectURL;
        })
        .catch(error => {
            console.error('Error fetching image:', error);
        });
}

function showDangerToast(message) {
    $(document).Toasts('create', {
        class: 'bg-danger',
        title: 'Validation Error',
        body: message,
        autohide: true,
        delay: 3000
    });
}

