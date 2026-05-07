<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Регистрация</h1>
    <hr>
    <form action="/registration" method="post">
        <div class="form-group">
            <label for="name">Имя пользователя</label>
            <input type="text" class="form-control" required id="name" name="name">
        </div>
        <div class="form-group">
            <label for="email">Электронная почта</label>
            <input type="email" class="form-control" id="email" required name="email">
        </div>
        <div class="form-group">
            <label for="phoneNumber">Номер телефона</label>
            <input type="text" class="form-control" id="phoneNumber" required name="phoneNumber">
        </div>
        <div class="form-group">
            <label for="password">Пароль</label>
            <input type="password" class="form-control" id="password" required name="password">
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" style="width: 100%" class="btn btn-dark">Зарегистрироваться</button>
    </form>
    <#if errorMessage??>
        <h2 style="color: red">${errorMessage}</h2>
    </#if>
    <script>
        const validators = {
            'name': /^[А-Яа-яЁёA-Za-z\s]{2,50}$/,
            'email': /^[a-zA-Z0-9._%+\-]+@(gmail\.com|mail\.ru)$/,
            'phoneNumber': /^(\+7|8)\d{10}$/,
            'password': /.{6,}/
        };
        const errorIds = {
            'name': 'nameError',
            'email': 'emailError',
            'phoneNumber': 'phoneError',
            'password': 'passwordError'
        };

        document.getElementById('regForm').addEventListener('submit', function(e) {
            let valid = true;
            Object.keys(validators).forEach(function(fieldName) {
                const field = document.querySelector('[name="' + fieldName + '"]');
                const error = document.getElementById(errorIds[fieldName]);
                if (!validators[fieldName].test(field.value)) {
                    field.style.border = '1px solid red';
                    error.style.display = 'block';
                    valid = false;
                } else {
                    field.style.border = '';
                    error.style.display = 'none';
                }
            });
            if (!valid) e.preventDefault();
        });

        Object.keys(validators).forEach(function(fieldName) {
            document.querySelector('[name="' + fieldName + '"]').addEventListener('input', function() {
                const error = document.getElementById(errorIds[fieldName]);
                if (!validators[fieldName].test(this.value)) {
                    this.style.border = '1px solid red';
                    error.style.display = 'block';
                } else {
                    this.style.border = '';
                    error.style.display = 'none';
                }
            });
        });
    </script>
</@t.template>