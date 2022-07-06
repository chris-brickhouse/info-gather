

function clearError(el) {
    el.classList.remove('is-invalid');
}
        

async function saveGather() {
    let errors = [];
    let form = document.querySelectorAll('form input, form textarea');
    let data = {}

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    const forms = document.querySelectorAll('.needs-validation')

    console.log(forms)
    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
        .forEach(function (form) {
            console.log(form.checkValidity())
            if (!form.checkValidity()) {
                event.preventDefault()
                event.stopPropagation()
                errors.push(form);
                form.classList.add('is-invalid');
            } else {
                form.classList.add('was-validated')
            }
        });

    if (errors.length > 0) {
        return false;
    }

    form.forEach(x => {        
        data[x.id] = x.value;
    })
    console.log(data)

    const response = await fetch('/api/gather', {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    });

    response.json().then(data => {
        console.log(data);
        form.forEach(x => {
            x.value = '';
        });

        let toasts = [].slice.call(document.querySelectorAll('#success'));
        let toastList = toasts.map(function (toastEl) {
            return new bootstrap.Toast(toastEl, { autohide: true });
        })

        toasts = document.getElementById('success')
        var toast = bootstrap.Toast.getOrCreateInstance(toasts)
        toast.show();
    });
}