#language: ru

@tree

Функционал: Проверка расчета поля Количество (итог) документа Заказ

Как тестировщик я хочу
хочу убедиться в правильности расчета итогового поля Количество
чтобы не было ошибок в интерпретации итоговых сумм документа

контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
 
Сценарий: 001_Подготовка данных
	И Загружаю данные для тестирования документа Заказ
	
Сценарий: 002_Проверка расчета поля Количество (итог) документа Заказ

* Создание Заказа

	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

* Заполнение шапки документа
	
	И Заполнение шапки документа Заказ
		
* Заполнение ТЧ Заказа

	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000028' | 'Veko345MO'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '200'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	И я запоминаю значение текущего поля как "Количество1"
	
	И в таблице "Товары" я добавляю строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000031' | 'Босоножки'    |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '500'
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
	И в таблице "Товары" я завершаю редактирование строки
	И я запоминаю значение текущего поля как "Количество2"
	
* Проверка поля Количество Итог
	И Я запоминаю значение выражения 'Число($Количество1$) + Число($Количество2$)' в переменную "КоличествоОбщее"
		
	И элемент формы с именем "ТоварыИтогКоличество" стал равен '$КоличествоОбщее$'

* Проведение документа 

	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Заказ (создание) *' в течение 20 секунд
	
		