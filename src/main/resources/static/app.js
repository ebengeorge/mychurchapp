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
        $('#confirmationBox').modal('hide');
    });
}
