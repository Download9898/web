<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div style="max-width: 560px; margin: 40px auto;">

        <!-- Индикатор шагов -->
        <div style="display: flex; align-items: center; gap: 8px; margin-bottom: 1.5rem;">
            <div id="dot-1" style="width: 28px; height: 28px; border-radius: 50%; background: #fff; display: flex; align-items: center; justify-content: center; font-size: 13px; font-weight: 500; color: #000;">1</div>
            <div id="line-1" style="flex: 1; height: 2px; background: #555;"></div>
            <div id="dot-2" style="width: 28px; height: 28px; border-radius: 50%; background: #555; display: flex; align-items: center; justify-content: center; font-size: 13px; font-weight: 500; color: #aaa;">2</div>
            <div id="line-2" style="flex: 1; height: 2px; background: #555;"></div>
            <div id="dot-3" style="width: 28px; height: 28px; border-radius: 50%; background: #555; display: flex; align-items: center; justify-content: center; font-size: 13px; font-weight: 500; color: #aaa;">3</div>
        </div>

        <form action="/survey" method="post" id="surveyForm">
            <input type="hidden" name="_csrf" value="${_csrf.token}">

            <!-- Шаг 1 — Категория -->
            <div id="step-1" class="card bg-dark text-white p-4">
                <h4 style="text-align: center; margin-bottom: 0.5rem;">Какой вид товара вас интересует?</h4>
                <p style="text-align: center; color: #aaa; margin-bottom: 1.5rem;">Выберите одну категорию</p>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-bottom: 1.5rem;">
                    <div class="cat-card" onclick="selectCard(this, 'category', 'Электроника')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">Электроника</div>
                    <div class="cat-card" onclick="selectCard(this, 'category', 'Одежда')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">Одежда</div>
                    <div class="cat-card" onclick="selectCard(this, 'category', 'Мебель')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">Мебель</div>
                    <div class="cat-card" onclick="selectCard(this, 'category', 'Транспорт')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">Транспорт</div>
                    <div class="cat-card" onclick="selectCard(this, 'category', 'Спорт')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">Спорт</div>
                    <div class="cat-card" onclick="selectCard(this, 'category', 'Другое')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">Другое</div>
                </div>
                <input type="hidden" name="category" id="categoryInput">
                <button type="button" onclick="nextStep(2)" class="btn btn-light" style="width: 100%;">Далее →</button>
            </div>

            <!-- Шаг 2 — Цена -->
            <div id="step-2" class="card bg-dark text-white p-4" style="display: none;">
                <h4 style="text-align: center; margin-bottom: 0.5rem;">Приблизительная цена?</h4>
                <p style="text-align: center; color: #aaa; margin-bottom: 1.5rem;">Укажите ваш бюджет</p>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-bottom: 1.5rem;">
                    <div class="price-card" onclick="selectCard(this, 'price', '1000')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">До 1 000 ₽</div>
                    <div class="price-card" onclick="selectCard(this, 'price', '5000')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">1 000 — 5 000 ₽</div>
                    <div class="price-card" onclick="selectCard(this, 'price', '20000')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">5 000 — 20 000 ₽</div>
                    <div class="price-card" onclick="selectCard(this, 'price', '50000')" style="border: 1px solid #555; border-radius: 8px; padding: 12px 16px; cursor: pointer; color: #fff; text-align: center;">Свыше 20 000 ₽</div>
                </div>
                <input type="hidden" name="price" id="priceInput">
                <div style="display: flex; gap: 10px;">
                    <button type="button" onclick="nextStep(1)" class="btn btn-secondary" style="flex: 1;">← Назад</button>
                    <button type="button" onclick="nextStep(3)" class="btn btn-light" style="flex: 2;">Далее →</button>
                </div>
            </div>

            <!-- Шаг 3 — Контакты -->
            <div id="step-3" style="display: none; border-radius: 8px; overflow: hidden; background: linear-gradient(135deg, #1a1a2e, #0f3460); padding: 2rem;">
                <h4 style="text-align: center; color: #fff; margin-bottom: 0.5rem;">Заявка на консультацию</h4>
                <p style="text-align: center; color: rgba(255,255,255,0.6); margin-bottom: 1.5rem;">Оставьте контакты — мы свяжемся с вами</p>
                <div class="form-group">
                    <input type="text" name="nameUser" class="form-control" placeholder="Имя" required
                           minlength="2" maxlength="50"
                           pattern="[А-Яа-яЁёA-Za-z\s]+"
                           title="Имя должно содержать только буквы"
                           style="background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2); color: #fff;">
                </div>
                <div class="form-group">
                    <input type="tel" name="phoneUser" class="form-control" placeholder="+79991234567" required
                           pattern="(\+7|8)[0-9]{10}"
                           title="Введите номер в формате +79991234567 или 89991234567"
                           style="background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2); color: #fff;">
                    <small id="phoneError" style="color: red; display: none;">Формат: +79991234567 или 89991234567</small>
                </div>
                <div class="form-group">
                    <input type="email" name="emailUser" class="form-control" placeholder="example@mail.ru" required
                           pattern="[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}"
                           title="Введите корректный email"
                           style="background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.2); color: #fff;">
                    <small id="emailError" style="color: red; display: none;">Введите корректный email например: example@mail.ru</small>
                </div>
                <button type="submit" style="width: 100%; background: linear-gradient(90deg, #e85d04, #d62828); border: none; color: #fff; font-weight: 500; padding: 10px; border-radius: 6px; cursor: pointer; margin-bottom: 10px;">Записаться</button>
                <button type="button" onclick="nextStep(2)" style="width: 100%; background: transparent; border: 1px solid rgba(255,255,255,0.3); color: rgba(255,255,255,0.7); padding: 8px; border-radius: 6px; cursor: pointer;">← Назад</button>
            </div>

        </form>
    </div>

    <script>
        function nextStep(n) {
            document.querySelectorAll('[id^="step-"]').forEach(s => s.style.display = 'none');
            document.getElementById('step-' + n).style.display = 'block';

            for (let i = 1; i <= 3; i++) {
                const dot = document.getElementById('dot-' + i);
                dot.style.background = i <= n ? '#fff' : '#555';
                dot.style.color = i <= n ? '#000' : '#aaa';
                if (i < 3) {
                    document.getElementById('line-' + i).style.background = i < n ? '#fff' : '#555';
                }
            }
        }

        function selectCard(el, inputId, value) {
            const cards = el.parentElement.querySelectorAll('[class$="-card"]');
            cards.forEach(c => {
                c.style.border = '1px solid #555';
                c.style.background = 'transparent';
            });
            el.style.border = '2px solid #fff';
            el.style.background = 'rgba(255,255,255,0.1)';
            document.getElementById(inputId + 'Input').value = value;
        }
        document.getElementById('surveyForm').addEventListener('submit', function(e) {
            const phone = document.querySelector('[name="phoneUser"]');
            const name = document.querySelector('[name="nameUser"]');
            const email = document.querySelector('[name="emailUser"]');

            if (!name.validity.valid) {
                name.style.border = '1px solid red';
                document.getElementById('nameError').style.display = 'block';
                e.preventDefault();
            } else {
                name.style.border = '1px solid rgba(255,255,255,0.2)';
                document.getElementById('nameError').style.display = 'none';
            }

            if (!phone.validity.valid) {
                phone.style.border = '1px solid red';
                document.getElementById('phoneError').style.display = 'block';
                e.preventDefault();
            } else {
                phone.style.border = '1px solid rgba(255,255,255,0.2)';
                document.getElementById('phoneError').style.display = 'none';
            }

            if (!email.validity.valid) {
                email.style.border = '1px solid red';
                document.getElementById('emailError').style.display = 'block';
                e.preventDefault();
            } else {
                email.style.border = '1px solid rgba(255,255,255,0.2)';
                document.getElementById('emailError').style.display = 'none';
            }
        });

        ['[name="phoneUser"]', '[name="nameUser"]', '[name="emailUser"]'].forEach(function(selector) {
            document.querySelector(selector).addEventListener('input', function() {
                const errorMap = {
                    'phoneUser': 'phoneError',
                    'nameUser': 'nameError',
                    'emailUser': 'emailError'
                };
                const error = document.getElementById(errorMap[this.name]);
                if (!this.validity.valid) {
                    this.style.border = '1px solid red';
                    error.style.display = 'block';
                } else {
                    this.style.border = '1px solid rgba(255,255,255,0.2)';
                    error.style.display = 'none';
                }
            });
        });
    </script>
</@t.template>