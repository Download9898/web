<!DOCTYPE html>
<html>
<head>
    <title> WEB </title>
</head>
<body>
<h1>WEB</h1><hr>
<h4>Подробная информация о товаре</h4>
<#list images as img>
    <img src="data:img/jpeg;base64,${img}"/><br><br>
</#list>
<b>Название товара: </b>${product.title}<br>
<b>Описание товара: </b>${product.description}<br>
<b>Цена: </b>${product.price}<br>
<b>Город: </b>${product.city}<br>
<b>Автор: </b><a href="/user/${product.user.id}"> ${product.user.name}</a> <br>
</body>
<html>
