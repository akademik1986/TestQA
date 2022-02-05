#language: ru

@tree

Функционал: проверка отображения возвратов в отчете D2001 Продажи

Как Менеджер по продажам я хочу
проверить отображение возвратов в отчете по продажам
чтобы проанализировать данные по продажам без учета возвратов

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: подготовительный (проверка заполнения полей документа Заказ покупателя)
	Когда экспорт основных данных
	Когда экспорт возврата от покупателя


Сценарий: проверка отображения возвратов в отчете D2001 Продажи
	* Открытие отчета по продажам
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
		Тогда открылось окно 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormChangeVariant'
		И в таблице "SettingsComposerSettingsDataParameters" я перехожу к строке:
			| 'Значение'   | 'Использование' | 'Параметр' |
			| 'Этот месяц' | 'Да'            | 'Период'   |
		И в таблице "SettingsComposerSettingsDataParameters" я активизирую поле с именем "SettingsComposerSettingsDataParametersStartDate"
		И в таблице "SettingsComposerSettingsDataParameters" я выбираю текущую строку
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersStartDate' я ввожу текст '01.12.2021 00:00:00'
		И в таблице "SettingsComposerSettingsDataParameters" я активизирую поле с именем "SettingsComposerSettingsDataParametersEndDate"
		И в таблице "SettingsComposerSettingsDataParameters" в поле с именем 'SettingsComposerSettingsDataParametersEndDate' я ввожу текст '31.12.2021 00:00:00'
		И в таблице "SettingsComposerSettingsDataParameters" я завершаю редактирование строки
		И я нажимаю на кнопку с именем 'FormEndEdit'	
		И я нажимаю на кнопку с именем 'FormGenerate'
	* Проверка отображения в отчете возврата
		И табличный документ "Result" содержит строки из макета "Макет 2" по шаблону

		
		