## Телеграмм-бот для автоматизации бизнес-процессов производственной компании
Телеграм-бот предназначен для сотрудников и клиентов производственной компании. Он позволяет сотрудникам компании сократить время на выполнение рутинных операций, организовать быструю и удобную коммуникации с клиентами, улучшить взаимодействие структурных подразделений и ускорить процесс принятия управленческих решений.

### Демонстрация
![Alt Text](./example.gif)

### Вебсайт
Вы можете посмотреть работающий пример приложения [здесь](https://t.me/prod_update_test_bot).

### Возможности
Бот включает в себя веб-приложение и имеет следующие возможности:
1. Получение остатков продукции на складе по категориям
2. Вывод план-факта производства продукции по месяцам
3. Получение количества произведенной продукции по дням
4. Расчет стоимости товаров на складах в учетных ценах
5. Формирование нового заказа через веб-приложениe
6. Просмотр текущих заказов

### Установка
Чтобы запустить приложение, можно использовать команду `make run-webapp`.
Чтобы запустить бота, можно использовать команду `make run-bot`.
Для генерации сертификатов *SSL*, можно использовать команду `make get-cert`.
Чтобы сгенерировать тестовую БД, можно использовать команду `make create-db`.

Для работы приложения необхожимо заполнить конфигурационный файл.
Пример файла: [`config.yaml`](./example/example_config.yaml).
- "Token" - токен для доступа к боту, полученный через BotFather
- "FilePath" - путь к файлам, в которых находятся отчеты в формате excel
- "DBPath" - путь к базе данных
- "LogPath" - путь к файлу с логами
- "WebAppUrl" - адрес веб приложения
- "Url" - адрес бота
