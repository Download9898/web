<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Анкеты пользователей</h1>
    <hr>
    <table class="table table-dark">
        <thead>
        <tr>
            <th>Имя</th>
            <th>Телефон</th>
            <th>Категория</th>
            <th>Цена</th>
            <th>Дата</th>
            <th>Пользователь</th>
        </tr>
        </thead>
        <tbody>
        <#list surveys as survey>
            <tr>
                <td>${survey.nameUser}</td>
                <td>${survey.phoneUser}</td>
                <td>${survey.category}</td>
                <td>${survey.price} ₽</td>
                <td>${survey.dateOfCreated}</td>
                <td>
                    <#if survey.user?? && survey.user.email??>
                        <a href="/user/${survey.user.id}">${survey.user.email}</a>
                    <#else>
                        Не авторизован
                    </#if>
                </td>
            </tr>
        <#else>
            <tr>
                <td colspan="6" style="text-align: center">Анкет нет</td>
            </tr>
        </#list>
        </tbody>
    </table>
</@t.template>