# BuySell — Платформа объявлений

Веб-приложение для размещения и поиска товаров, построенное на Spring Boot.

## Стек технологий

- **Backend:** Java 17, Spring Boot, Spring Security, Spring Data JPA, Hibernate
- **База данных:** PostgreSQL
- **Шаблонизатор:** FreeMarker
- **Сборка:** Maven


## Функциональность

- Регистрация и авторизация пользователей
- Размещение объявлений с фотографиями (до 3 штук)
- Поиск товаров по названию и городу
- Личный кабинет с управлением своими товарами
- Панель администратора (управление пользователями, бан)
- Хранение изображений в базе данных

## Требования

- Java 17+
- PostgreSQL 14+
- Maven 3.8+

## Установка и запуск

### 1. Клонируй репозиторий

```bash
git clone https://github.com/your-username/buysell.git
cd buysell
```

### 2. Создай базу данных PostgreSQL

```sql
CREATE DATABASE postgres;
```

### 3. Настрой `application.properties`

```properties
spring.application.name=web

spring.datasource.url=jdbc:postgresql://localhost:5433/postgres
spring.datasource.username=your_username
spring.datasource.password=your_password

spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true

spring.freemarker.expose-request-attributes=true

spring.servlet.multipart.max-file-size=100MB
spring.servlet.multipart.max-request-size=100MB

spring.datasource.hikari.auto-commit=false
```

### 4. Запусти приложение

```bash
mvn spring-boot:run
```

Приложение будет доступно по адресу: [http://localhost:8080](http://localhost:8080)

## Структура проекта

```
src/main/java/First/web/
├── configurations/     # Spring Security конфигурация
├── controllers/        # HTTP контроллеры
├── models/             # JPA сущности (User, Product, Image)
│   └── enums/          # Перечисления (Role)
├── repositories/       # Spring Data репозитории
├── services/           # Бизнес-логика
└── WebApplication.java # Точка входа

src/main/resources/
├── static/
│   ├── css/            # Стили
│   └── images/         # Статичные изображения
└── templates/          # FreeMarker шаблоны
```

## Доступные маршруты

| Метод | URL | Описание |
|-------|-----|----------|
| GET | `/` | Главная страница со списком товаров |
| GET | `/registration` | Страница регистрации |
| GET | `/login` | Страница входа |
| GET | `/product/{id}` | Страница товара |
| GET | `/my/products` | Мои объявления |
| POST | `/product/create` | Создание товара |
| POST | `/product/delete/{id}` | Удаление товара |
| GET | `/images/{id}` | Получение изображения |
| GET | `/admin` | Панель администратора |
| POST | `/admin/user/ban/{id}` | Бан пользователя |