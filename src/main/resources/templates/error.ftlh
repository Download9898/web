<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Что-то пошло не так 😔</h1>
    <p style="text-align: center">${errorMessage!"Неизвестная ошибка"}</p>
    <a href="/" class="btn btn-dark" style="width: 100%">На главную</a>
</@t.template>