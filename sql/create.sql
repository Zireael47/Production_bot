DROP TABLE IF EXISTS users;

CREATE TABLE users(
    id   INT  PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT CHECK (role IN ('admin', 'director', 'foreman', 'logistician', 'manager', 'client') )
              NOT NULL DEFAULT 'manager'
);

INSERT INTO users VALUES(649471710, 'KI', 'admin');

DROP TABLE IF EXISTS prices;

CREATE TABLE prices(
    id       INT,
    category TEXT,
    ord      TEXT, -- order | vendor code
    price    FLOAT  NOT NULL,
    code     TEXT,
    PRIMARY KEY (id, code)
);

INSERT INTO prices VALUES(1, 'Маты Base', '0.5', 1200.5, '00-00002315');
INSERT INTO prices VALUES(1, 'Маты Base', '1', 1350.3, '00-00002316');
INSERT INTO prices VALUES(1, 'Маты Base', '1.5', 1450.6, '00-00002317');
INSERT INTO prices VALUES(1, 'Маты Base', '2', 1600.2, '00-00002318');
INSERT INTO prices VALUES(1, 'Маты Base', '2.5', 1700.8, '00-00002319');
INSERT INTO prices VALUES(1, 'Маты Base', '3', 1800.1, '00-00002320');
INSERT INTO prices VALUES(1, 'Маты Base', '3.5', 1950.9, '00-00002321');
INSERT INTO prices VALUES(1, 'Маты Base', '4', 2100.4, '00-00002322');
INSERT INTO prices VALUES(1, 'Маты Base', '4.5', 2250.7, '00-00002323');
INSERT INTO prices VALUES(1, 'Маты Base', '5', 2400.3, '00-00002324');
INSERT INTO prices VALUES(1, 'Маты Base', '6', 2550.5, '00-00002325');
INSERT INTO prices VALUES(1, 'Маты Base', '7', 2700.6, '00-00002326');
INSERT INTO prices VALUES(1, 'Маты Base', '8', 2850.2, '00-00002327');
INSERT INTO prices VALUES(1, 'Маты Base', '9', 3000.8, '00-00002328');
INSERT INTO prices VALUES(1, 'Маты Base', '10', 3200.4, '00-00002329');
INSERT INTO prices VALUES(1, 'Маты Base', '12', 3400.7, '00-00002330');
INSERT INTO prices VALUES(1, 'Маты Base', '14', 3600.1, 'ОТ-00006952');
INSERT INTO prices VALUES(1, 'Маты Base', '16', 3800.5, 'ОТ-00006953');
INSERT INTO prices VALUES(1, 'Маты Base', '18', 4000.9, 'ОТ-00006954');

INSERT INTO prices VALUES(1, 'Секции Base', '150', 1200.5, '00-00003206');
INSERT INTO prices VALUES(1, 'Секции Base', '250', 1300.8, '00-00003207');
INSERT INTO prices VALUES(1, 'Секции Base', '400', 1400.3, '00-00003208');
INSERT INTO prices VALUES(1, 'Секции Base', '500', 1500.6, '00-00003209');
INSERT INTO prices VALUES(1, 'Секции Base', '600', 1600.2, '00-00003210');
INSERT INTO prices VALUES(1, 'Секции Base', '700', 1700.9, '00-00003211');
INSERT INTO prices VALUES(1, 'Секции Base', '850', 1800.1, '00-00003212');
INSERT INTO prices VALUES(1, 'Секции Base', '1000', 1900.4, '00-00003213');
INSERT INTO prices VALUES(1, 'Секции Base', '1200', 2000.7, '00-00003214');
INSERT INTO prices VALUES(1, 'Секции Base', '1350', 2100.3, '00-00003215');
INSERT INTO prices VALUES(1, 'Секции Base', '1500', 2200.6, '00-00003216');
INSERT INTO prices VALUES(1, 'Секции Base', '1700', 2300.8, '00-00003217');
INSERT INTO prices VALUES(1, 'Секции Base', '2000', 2400.5, '00-00003218');

INSERT INTO prices VALUES(1, 'Маты Premium', '1', 8000.0, 'ОТ-00008088');
INSERT INTO prices VALUES(1, 'Маты Premium', '1.5', 9000.0, 'ОТ-00008089');
INSERT INTO prices VALUES(1, 'Маты Premium', '2', 10000.0, 'ОТ-00008090');
INSERT INTO prices VALUES(1, 'Маты Premium', '2.5', 11000.0, 'ОТ-00008091');
INSERT INTO prices VALUES(1, 'Маты Premium', '3', 12000.0, 'ОТ-00008092');
INSERT INTO prices VALUES(1, 'Маты Premium', '3.5', 13000.0, 'ОТ-00008093');
INSERT INTO prices VALUES(1, 'Маты Premium', '4', 14000.0, 'ОТ-00008094');
INSERT INTO prices VALUES(1, 'Маты Premium', '4.5', 15000.0, 'ОТ-00008095');
INSERT INTO prices VALUES(1, 'Маты Premium', '5', 16000.0, 'ОТ-00008096');
INSERT INTO prices VALUES(1, 'Маты Premium', '6', 17000.0, 'ОТ-00008097');
INSERT INTO prices VALUES(1, 'Маты Premium', '7', 18000.0, 'ОТ-00008098');
INSERT INTO prices VALUES(1, 'Маты Premium', '8', 19000.0, 'ОТ-00008099');
INSERT INTO prices VALUES(1, 'Маты Premium', '9', 20000.0, 'ОТ-00008100');
INSERT INTO prices VALUES(1, 'Маты Premium', '10', 21000.0, 'ОТ-00008101');
INSERT INTO prices VALUES(1, 'Маты Premium', '12', 22000.0, 'ОТ-00008102');

INSERT INTO prices VALUES(1, 'Секции Premium', '180', 6000.0, 'ОТ-00008103');
INSERT INTO prices VALUES(1, 'Секции Premium', '260', 7000.0, 'ОТ-00008104');
INSERT INTO prices VALUES(1, 'Секции Premium', '440', 8000.0, 'ОТ-00008105');
INSERT INTO prices VALUES(1, 'Секции Premium', '520', 9000.0, 'ОТ-00008106');
INSERT INTO prices VALUES(1, 'Секции Premium', '600', 10000.0, 'ОТ-00008107');
INSERT INTO prices VALUES(1, 'Секции Premium', '680', 11000.0, 'ОТ-00008108');
INSERT INTO prices VALUES(1, 'Секции Premium', '840', 12000.0, 'ОТ-00008109');
INSERT INTO prices VALUES(1, 'Секции Premium', '1090', 13000.0, 'ОТ-00008110');
INSERT INTO prices VALUES(1, 'Секции Premium', '1170', 14000.0, 'ОТ-00008111');
INSERT INTO prices VALUES(1, 'Секции Premium', '1450', 15000.0, 'ОТ-00008112');
INSERT INTO prices VALUES(1, 'Секции Premium', '1600', 16000.0, 'ОТ-00008113');
INSERT INTO prices VALUES(1, 'Секции Premium', '1800', 17000.0, 'ОТ-00008114');
INSERT INTO prices VALUES(1, 'Секции Premium', '2100', 18000.0, 'ОТ-00008115');

INSERT INTO prices VALUES(1, 'Прогрев бетона', '3.1', 1000.0, '00-00003219');
INSERT INTO prices VALUES(1, 'Прогрев бетона', '9.3', 1800.0, '00-00003220');
INSERT INTO prices VALUES(1, 'Прогрев бетона', '19', 1900.0, '00-00003221');
INSERT INTO prices VALUES(1, 'Прогрев бетона', '37', 2000.0, '00-00003222');
INSERT INTO prices VALUES(1, 'Прогрев бетона', '50', 2100.0, '00-00003223');
INSERT INTO prices VALUES(1, 'Прогрев бетона', '75', 2200.0, '00-00003224');
INSERT INTO prices VALUES(1, 'Прогрев бетона', '100', 2300.0, '00-00003225');
INSERT INTO prices VALUES(1, 'Прогрев бетона', '150', 2400.0, 'ОТ-00007674');

INSERT INTO prices VALUES(1, 'Обогрев кровли', '7', 1000.0, 'ОТ-00006235');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '11', 1500.0, 'ОТ-00006236');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '14.5', 2000.0, 'ОТ-00006237');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '22', 2500.0, 'ОТ-00006238');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '29.5', 3000.0, 'ОТ-00006239');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '36', 3500.0, 'ОТ-00006240');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '50', 4000.0, 'ОТ-00006241');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '64', 4500.0, 'ОТ-00006242');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '72', 5000.0, 'ОТ-00006243');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '86', 5500.0, 'ОТ-00006244');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '101', 6000.0, 'ОТ-000601  ');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '115', 6500.0, 'ОТ-00006245');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '130', 7000.0, 'ОТ-00006246');
INSERT INTO prices VALUES(1, 'Обогрев кровли', '150', 7500.0, 'ОТ-00006247');

INSERT INTO prices VALUES(1, 'Терморегулятор механический', 'MT26', 500.0, '00-00002063');
INSERT INTO prices VALUES(1, 'Терморегулятор электронный', 'Warmlife', 3500.0, '00-00002062');


DROP TABLE IF EXISTS clients;

CREATE TABLE clients(
    user_id     INT  PRIMARY KEY,
    client_name TEXT NOT NULL,
    price_id    INT  NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (price_id) REFERENCES prices (id)
);

INSERT INTO clients VALUES(649471710, 'ООО 1', 1);

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id         INT NOT NULL,
    shipping_date   TEXT NOT NULL,
    dt              TEXT NOT NULL,
    comment         TEXT,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS order_list;

CREATE TABLE order_list(
    order_id    INT  NOT NULL,
    price_id    INT  NOT NULL,
    category    TEXT NOT NULL,
    ord         TEXT NOT NULL,
    amount      INT  NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (price_id, category, ord) REFERENCES prices (id, category, ord),
    PRIMARY KEY (order_id, price_id, category, ord, amount)
);

DROP TABLE IF EXISTS products;

CREATE TABLE products(
    code             TEXT  PRIMARY KEY,
    name             TEXT  NOT NULL,
    code_ap          TEXT  NOT NULL,
    ord              INT   NOT NULL,
    type             TEXT  NOT NULL,
    subcategory      TEXT  NOT NULL,
    accounting_price FLOAT NOT NULL
);

INSERT INTO products VALUES('ОТ-00006235', 'Секция для обогрева кровли 2-210 Вт/7,0м', 'ОК 2-7.010', 7.0, 'Секции ОК', 'Обогрев кровли', 4719);
INSERT INTO products VALUES('ОТ-00006236', 'Секция для обогрева кровли 2-330 Вт/11,0м', 'ОК 2-11.010', 11.0, 'Секции ОК', 'Обогрев кровли', 4121);
INSERT INTO products VALUES('ОТ-00006237', 'Секция для обогрева кровли 2-435 Вт/14,5м', 'ОК 2-14,5.010', 14.5, 'Секции ОК', 'Обогрев кровли', 4092);
INSERT INTO products VALUES('ОТ-00006238', 'Секция для обогрева кровли 2-660 Вт/22,0м', 'ОК 2-22.010', 22.0, 'Секции ОК', 'Обогрев кровли', 4142);
INSERT INTO products VALUES('ОТ-00006239', 'Секция для обогрева кровли 2-885 Вт/29,5м', 'ОК 2-29,5.010', 29.5, 'Секции ОК', 'Обогрев кровли', 3315);
INSERT INTO products VALUES('ОТ-00006240', 'Секция для обогрева кровли 2-1080 Вт/36,0м', 'ОК 2-36.010', 36.0, 'Секции ОК', 'Обогрев кровли', 2160);
INSERT INTO products VALUES('ОТ-00006241', 'Секция для обогрева кровли 2-1500 Вт/50,0м', 'ОК 2-50.010', 50.0, 'Секции ОК', 'Обогрев кровли', 1111);
INSERT INTO products VALUES('ОТ-00006242', 'Секция для обогрева кровли 2-1920 Вт/64,0м', 'ОК 2-64.010', 64.0, 'Секции ОК', 'Обогрев кровли', 1224);
INSERT INTO products VALUES('ОТ-00006243', 'Секция для обогрева кровли 2-2160 Вт/72,0м', 'ОК 2-72.010', 72.0, 'Секции ОК', 'Обогрев кровли', 1445);
INSERT INTO products VALUES('ОТ-00006244', 'Секция для обогрева кровли 2-2580 Вт/86,0м', 'ОК 2-86.010', 86.0, 'Секции ОК', 'Обогрев кровли', 3023);
INSERT INTO products VALUES('ОТ-000601', 'Секция для обогрева кровли 2-3030 Вт/101,0м', 'ОК 2-101.010', 101.0, 'Секции ОК', 'Обогрев кровли', 4618);
INSERT INTO products VALUES('ОТ-00006245', 'Секция для обогрева кровли 2-3450 Вт/115,0м', 'ОК 2-115.010', 115.0, 'Секции ОК', 'Обогрев кровли', 3563);
INSERT INTO products VALUES('ОТ-00006246', 'Секция для обогрева кровли 2-3900 Вт/130,0м', 'ОК 2-130.010', 130.0, 'Секции ОК', 'Обогрев кровли', 2903);
INSERT INTO products VALUES('ОТ-00006247', 'Секция для обогрева кровли 2-4500 Вт/150,0м', 'ОК 2-150.010', 150.0, 'Секции ОК', 'Обогрев кровли', 4561);

INSERT INTO products VALUES('00-00002315', 'Мат Base-75-0,5', 'Base-75-0,5.010', 0.5, 'Теплый пол  (мат) Base', 'Маты Base', 4005);
INSERT INTO products VALUES('00-00002316', 'Мат Base-150-1,0', 'Base-150-1.010', 1.0, 'Теплый пол  (мат) Base', 'Маты Base', 4576);
INSERT INTO products VALUES('00-00002317', 'Мат Base-225-1,5', 'Base-225-1,5.010', 1.5, 'Теплый пол  (мат) Base', 'Маты Base', 2039);
INSERT INTO products VALUES('00-00002318', 'Мат Base-300-2,0', 'Base-300-2.010', 2.0, 'Теплый пол  (мат) Base', 'Маты Base', 1499);
INSERT INTO products VALUES('00-00002319', 'Мат Base-375-2,5', 'Base-375-2,5.010', 2.5, 'Теплый пол  (мат) Base', 'Маты Base', 3514);
INSERT INTO products VALUES('00-00002320', 'Мат Base-450-3,0', 'Base-450-3.010', 3.0, 'Теплый пол  (мат) Base', 'Маты Base', 3340);
INSERT INTO products VALUES('00-00002321', 'Мат Base-525-3,5', 'Base-525-3,5.010', 3.5, 'Теплый пол  (мат) Base', 'Маты Base', 3940);
INSERT INTO products VALUES('00-00002322', 'Мат Base-600-4,0', 'Base-600-4.010', 4.0, 'Теплый пол  (мат) Base', 'Маты Base', 3021);
INSERT INTO products VALUES('00-00002323', 'Мат Base-675-4,5', 'Base-675-4,5.010', 4.5, 'Теплый пол  (мат) Base', 'Маты Base', 1740);
INSERT INTO products VALUES('00-00002324', 'Мат Base-750-5,0', 'Base-750-5.010', 5.0, 'Теплый пол  (мат) Base', 'Маты Base', 4473);
INSERT INTO products VALUES('00-00002325', 'Мат Base-900-6,0', 'Base-900-6.010', 6.0, 'Теплый пол  (мат) Base', 'Маты Base', 1509);
INSERT INTO products VALUES('00-00002326', 'Мат Base-1050-7,0', 'Base-1050-7.010', 7.0, 'Теплый пол  (мат) Base', 'Маты Base', 1025);
INSERT INTO products VALUES('00-00002327', 'Мат Base-1200-8,0', 'Base-1200-8.010', 8.0, 'Теплый пол  (мат) Base', 'Маты Base', 3287);
INSERT INTO products VALUES('00-00002328', 'Мат Base-1350-9,0', 'Base-1350-9.010', 9.0, 'Теплый пол  (мат) Base', 'Маты Base', 3329);
INSERT INTO products VALUES('00-00002329', 'Мат Base-1500-10,0', 'Base-1500-10.010', 10.0, 'Теплый пол  (мат) Base', 'Маты Base', 3680);
INSERT INTO products VALUES('00-00002330', 'Мат Base-1800-12,0', 'Base-1800-12.010', 12.0, 'Теплый пол  (мат) Base', 'Маты Base', 4978);
INSERT INTO products VALUES('ОТ-00006952', 'Мат Base-2100-14,0', 'Base-2100-14.010', 14.0, 'Теплый пол  (мат) Base', 'Маты Base', 1582);
INSERT INTO products VALUES('ОТ-00006953', 'Мат Base-2400-16,0', 'Base-2400-16.010', 16.0, 'Теплый пол  (мат) Base', 'Маты Base', 3038);
INSERT INTO products VALUES('ОТ-00006954', 'Мат Base-2700-18.0', 'Base-2700-18.010', 18.0, 'Теплый пол  (мат) Base', 'Маты Base', 4989);

INSERT INTO products VALUES('ОТ-00008088', 'Мат Premium 200-1,0', 'Premium-200-1.010', 1.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 4032);
INSERT INTO products VALUES('ОТ-00008089', 'Мат Premium 300-1,5', 'Premium-300-1,5.010', 1.5, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1516);
INSERT INTO products VALUES('ОТ-00008090', 'Мат Premium 400-2,0', 'Premium-400-2.010', 2.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 3148);
INSERT INTO products VALUES('ОТ-00008091', 'Мат Premium 500-2,5', 'Premium-500-2,5.010', 2.5, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1152);
INSERT INTO products VALUES('ОТ-00008092', 'Мат Premium 600-3,0', 'Premium-600-3.010', 3.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1971);
INSERT INTO products VALUES('ОТ-00008093', 'Мат Premium 700-3,5', 'Premium-700-3,5.010', 3.5, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1961);
INSERT INTO products VALUES('ОТ-00008094', 'Мат Premium 800-4,0', 'Premium-800-4.010', 4.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 3385);
INSERT INTO products VALUES('ОТ-00008095', 'Мат Premium 900-4,5', 'Premium-900-4,5.010', 4.5, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1859);
INSERT INTO products VALUES('ОТ-00008096', 'Мат Premium 1000-5,0', 'Premium-1000-5.010', 5.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 2246);
INSERT INTO products VALUES('ОТ-00008097', 'Мат Premium 1200-6,0', 'Premium-1200-6.010', 6.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1113);
INSERT INTO products VALUES('ОТ-00008098', 'Мат Premium 1400-7,0', 'Premium-1400-7.010', 7.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1145);
INSERT INTO products VALUES('ОТ-00008099', 'Мат Premium 1600-8,0', 'Premium-1600-8.010', 8.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 3504);
INSERT INTO products VALUES('ОТ-00008100', 'Мат Premium 1800-9,0', 'Premium-1800-9.010', 9.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 1164);
INSERT INTO products VALUES('ОТ-00008101', 'Мат Premium 2000-10,0', 'Premium-2000-10.010', 10.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 4642);
INSERT INTO products VALUES('ОТ-00008102', 'Мат Premium 2400-12,0', 'Premium-2400-12.010', 12.0, 'Теплый пол  (мат) Premium', 'Маты Premium ', 3316);

INSERT INTO products VALUES('00-00003219', 'Секция для прогрева бетона 40-3', 'ПБ40-3,1.010', 3.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 1469);
INSERT INTO products VALUES('00-00003220', 'Секция для прогрева бетона 40-9', 'ПБ40-9,3.010', 9.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 2281);
INSERT INTO products VALUES('00-00003221', 'Секция для прогрева бетона 40-19', 'ПБ40-19.010', 19.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 1108);
INSERT INTO products VALUES('00-00003222', 'Секция для прогрева бетона 40-37', 'ПБ40-37.010', 37.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 3388);
INSERT INTO products VALUES('00-00003223', 'Секция для прогрева бетона 40-50', 'ПБ40-50.010', 50.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 1592);
INSERT INTO products VALUES('00-00003224', 'Секция для прогрева бетона 40-75', 'ПБ40-75.010', 75.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 2482);
INSERT INTO products VALUES('00-00003225', 'Секция для прогрева бетона 40-100', 'ПБ40-100.010', 100.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 1271);
INSERT INTO products VALUES('ОТ-00007674', 'Секция для прогрева бетона 40-150', 'ПБ40-150.010', 150.0, 'Теплый пол (секции бетон)', 'Прогрев бетона', 1556);

INSERT INTO products VALUES('00-00003206', 'Кабельная секция 150', 'КС-150.010', 150.0, 'Кабельная секция', 'Секции Base', 1946);
INSERT INTO products VALUES('00-00003207', 'Кабельная секция 250', 'КС-250.010', 250.0, 'Кабельная секция', 'Секции Base', 4752);
INSERT INTO products VALUES('00-00003208', 'Кабельная секция 400', 'КС-400.010', 400.0, 'Кабельная секция', 'Секции Base', 3866);
INSERT INTO products VALUES('00-00003209', 'Кабельная секция 500', 'КС-500.010', 500.0, 'Кабельная секция', 'Секции Base', 4217);
INSERT INTO products VALUES('00-00003210', 'Кабельная секция 600', 'КС-600.010', 600.0, 'Кабельная секция', 'Секции Base', 4078);
INSERT INTO products VALUES('00-00003211', 'Кабельная секция 700', 'КС-700.010', 700.0, 'Кабельная секция', 'Секции Base', 2372);
INSERT INTO products VALUES('00-00003212', 'Кабельная секция 850', 'КС-850.010', 850.0, 'Кабельная секция', 'Секции Base', 1174);
INSERT INTO products VALUES('00-00003213', 'Кабельная секция 1000', 'КС-1000.010', 1000.0, 'Кабельная секция', 'Секции Base', 1088);
INSERT INTO products VALUES('00-00003214', 'Кабельная секция 1200', 'КС-1200.010', 1200.0, 'Кабельная секция', 'Секции Base', 2995);
INSERT INTO products VALUES('00-00003215', 'Кабельная секция 1350', 'КС-1350.010', 1350.0, 'Кабельная секция', 'Секции Base', 2065);
INSERT INTO products VALUES('00-00003216', 'Кабельная секция 1500', 'КС-1500.010', 1500.0, 'Кабельная секция', 'Секции Base', 2498);
INSERT INTO products VALUES('00-00003217', 'Кабельная секция 1700', 'КС-1700.010', 1700.0, 'Кабельная секция', 'Секции Base', 2904);
INSERT INTO products VALUES('00-00003218', 'Кабельная секция 2000', 'КС-2000.010', 2000.0, 'Кабельная секция', 'Секции Base', 1226);

INSERT INTO products VALUES('ОТ-00008103', 'Секция Premium-180', 'Premium-180.010', 180.0, 'Кабельная секция Premium', 'КС Premium', 4836);
INSERT INTO products VALUES('ОТ-00008104', 'Секция Premium-260', 'Premium-260.010', 260.0, 'Кабельная секция Premium', 'КС Premium', 2672);
INSERT INTO products VALUES('ОТ-00008105', 'Секция Premium-440', 'Premium-440.010', 440.0, 'Кабельная секция Premium', 'КС Premium', 2692);
INSERT INTO products VALUES('ОТ-00008106', 'Секция Premium-520', 'Premium-520.010', 520.0, 'Кабельная секция Premium', 'КС Premium', 4925);
INSERT INTO products VALUES('ОТ-00008107', 'Секция Premium-600', 'Premium-600.010', 600.0, 'Кабельная секция Premium', 'КС Premium', 2537);
INSERT INTO products VALUES('ОТ-00008108', 'Секция Premium-680', 'Premium-680.010', 680.0, 'Кабельная секция Premium', 'КС Premium', 4467);
INSERT INTO products VALUES('ОТ-00008109', 'Секция Premium-840', 'Premium-840.010', 840.0, 'Кабельная секция Premium', 'КС Premium', 3834);
INSERT INTO products VALUES('ОТ-00008110', 'Секция Premium-1090', 'Premium-1090.010', 1090.0, 'Кабельная секция Premium', 'КС Premium', 1891);
INSERT INTO products VALUES('ОТ-00008111', 'Секция Premium-1170', 'Premium-1170.010', 1170.0, 'Кабельная секция Premium', 'КС Premium', 4360);
INSERT INTO products VALUES('ОТ-00008112', 'Секция Premium-1450', 'Premium-1450.010', 1450.0, 'Кабельная секция Premium', 'КС Premium', 1852);
INSERT INTO products VALUES('ОТ-00008113', 'Секция Premium-1600', 'Premium-1600.010', 1600.0, 'Кабельная секция Premium', 'КС Premium', 2295);
INSERT INTO products VALUES('ОТ-00008114', 'Секция Premium-1800', 'Premium-1800.010', 1800.0, 'Кабельная секция Premium', 'КС Premium', 3922);
INSERT INTO products VALUES('ОТ-00008115', 'Секция Premium-2100', 'Premium-2100.010', 2100.0, 'Кабельная секция Premium', 'КС Premium', 3912);

INSERT INTO products VALUES('00-00002063', 'Терморегулятор механический MT26', 'ТМ-32-010', 1.0, 'ТЕРМОСТАТЫ', 'ТР', 600);
INSERT INTO products VALUES('00-00002062', 'Терморегулятор электронный  WARMLIFE', '0', 2.0, 'ТЕРМОСТАТЫ', 'ТР', 3200);

DROP TABLE IF EXISTS subcategories;

CREATE TABLE subcategories(
    subcategory TEXT PRIMARY KEY,
    category    TEXT NOT NULL,
    workshop    TEXT NOT NULL,
    units       TEXT NOT NULL,
    FOREIGN KEY (subcategory) REFERENCES products (subcategory)
);

INSERT INTO subcategories VALUES('Маты Base', 'Теплый пол', 'Цех 1', 'шт');
INSERT INTO subcategories VALUES('Маты Premium ', 'Теплый пол', 'Цех 1', 'шт');
INSERT INTO subcategories VALUES('Секции Base', 'Теплый пол', 'Цех 1', 'шт');
INSERT INTO subcategories VALUES('Секции Premium', 'Теплый пол', 'Цех 1', 'шт');
INSERT INTO subcategories VALUES('Прогрев бетона', 'Арх обогрев', 'Цех 1', 'шт');
INSERT INTO subcategories VALUES('Обогрев кровли', 'Арх обогрев', 'Цех 1', 'шт');
INSERT INTO subcategories VALUES('ТР', 'ТР', 'Цех 2', 'шт');

DROP TABLE IF EXISTS leftovers;

CREATE TABLE leftovers(
    code        TEXT  NOT NULL,
    name        TEXT  NOT NULL,
    ord         INT  NOT NULL,
    subcategory TEXT  NOT NULL,
    category    TEXT  NOT NULL,
    warehouse   TEXT  NOT NULL,
    amount      FLOAT NOT NULL,    
    FOREIGN KEY (code) REFERENCES products (code),
    PRIMARY KEY (code, warehouse)
);

INSERT INTO leftovers VALUES('ОТ-00006236', 'Секция для обогрева кровли 2-330 Вт/11,0м', 11, 'Обогрев кровли', 'Арх обогрев', 'v', 37);
INSERT INTO leftovers VALUES('ОТ-00006237', 'Секция для обогрева кровли 2-435 Вт/14,5м', 14, 'Обогрев кровли', 'Арх обогрев', 'v', 112);
INSERT INTO leftovers VALUES('ОТ-00006238', 'Секция для обогрева кровли 2-660 Вт/22,0м', 22, 'Обогрев кровли', 'Арх обогрев', 'v', 43);
INSERT INTO leftovers VALUES('ОТ-00006239', 'Секция для обогрева кровли 2-885 Вт/29,5м', 29, 'Обогрев кровли', 'Арх обогрев', 'v', 135);
INSERT INTO leftovers VALUES('ОТ-00006240', 'Секция для обогрева кровли 2-1080 Вт/36,0м', 36, 'Обогрев кровли', 'Арх обогрев', 'v', 105);
INSERT INTO leftovers VALUES('ОТ-00006241', 'Секция для обогрева кровли 2-1500 Вт/50,0м', 50, 'Обогрев кровли', 'Арх обогрев', 'v', 35);
INSERT INTO leftovers VALUES('ОТ-00006242', 'Секция для обогрева кровли 2-1920 Вт/64,0м', 64, 'Обогрев кровли', 'Арх обогрев', 'v', 3);
INSERT INTO leftovers VALUES('ОТ-00006243', 'Секция для обогрева кровли 2-2160 Вт/72,0м', 72, 'Обогрев кровли', 'Арх обогрев', 'v', 12);
INSERT INTO leftovers VALUES('ОТ-00006244', 'Секция для обогрева кровли 2-2580 Вт/86,0м', 86, 'Обогрев кровли', 'Арх обогрев', 'v', 29);
INSERT INTO leftovers VALUES('ОТ-00006245', 'Секция для обогрева кровли 2-3450 Вт/115,0м', 115, 'Обогрев кровли', 'Арх обогрев', 'v', 7);
INSERT INTO leftovers VALUES('ОТ-00006246', 'Секция для обогрева кровли 2-3900 Вт/130,0м', 130, 'Обогрев кровли', 'Арх обогрев', 'v', 11);
INSERT INTO leftovers VALUES('ОТ-00006247', 'Секция для обогрева кровли 2-4500 Вт/150,0м', 150, 'Обогрев кровли', 'Арх обогрев', 'v', 52);
INSERT INTO leftovers VALUES('ОТ-000601  ', 'Секция для обогрева кровли 2-3030 Вт/101,0м', 101, 'Обогрев кровли', 'Арх обогрев', 'v', 53);

INSERT INTO leftovers VALUES('00-00002315', 'Мат Base-75-0,5', 0, 'Маты Base', 'Теплый пол', 'v', 559);
INSERT INTO leftovers VALUES('00-00002317', 'Мат Base-225-1,5', 1, 'Маты Base', 'Теплый пол', 'v', 189);
INSERT INTO leftovers VALUES('00-00002322', 'Мат Base-600-4,0', 4, 'Маты Base', 'Теплый пол', 'v', 114);
INSERT INTO leftovers VALUES('00-00002323', 'Мат Base-675-4,5', 4, 'Маты Base', 'Теплый пол', 'v', 40);
INSERT INTO leftovers VALUES('00-00002325', 'Мат Base-900-6,0', 6, 'Маты Base', 'Теплый пол', 'v', 2);
INSERT INTO leftovers VALUES('00-00002326', 'Мат Base-1050-7,0', 7, 'Маты Base', 'Теплый пол', 'v', 17);
INSERT INTO leftovers VALUES('00-00002327', 'Мат Base-1200-8,0', 8, 'Маты Base', 'Теплый пол', 'v', 32);
INSERT INTO leftovers VALUES('ОТ-00006954', 'Мат Base-2700-18.0', 18, 'Маты Base', 'Теплый пол', 'v', 15);

INSERT INTO leftovers VALUES('ОТ-00008088', 'Мат Premium 200-1,0', 1, 'Маты Premium ', 'Теплый пол', 'v', 5);
INSERT INTO leftovers VALUES('ОТ-00008089', 'Мат Premium 300-1,5', 1, 'Маты Premium ', 'Теплый пол', 'v', 69);
INSERT INTO leftovers VALUES('ОТ-00008090', 'Мат Premium 400-2,0', 2, 'Маты Premium ', 'Теплый пол', 'v', 22);
INSERT INTO leftovers VALUES('ОТ-00008091', 'Мат Premium 500-2,5', 2, 'Маты Premium ', 'Теплый пол', 'v', 85);
INSERT INTO leftovers VALUES('ОТ-00008092', 'Мат Premium 600-3,0', 3, 'Маты Premium ', 'Теплый пол', 'v', 20);
INSERT INTO leftovers VALUES('ОТ-00008093', 'Мат Premium 700-3,5', 3, 'Маты Premium ', 'Теплый пол', 'v', 48);
INSERT INTO leftovers VALUES('ОТ-00008094', 'Мат Premium 800-4,0', 4, 'Маты Premium ', 'Теплый пол', 'v', 13);
INSERT INTO leftovers VALUES('ОТ-00008095', 'Мат Premium 900-4,5', 4, 'Маты Premium ', 'Теплый пол', 'v', 13);
INSERT INTO leftovers VALUES('ОТ-00008096', 'Мат Premium 1000-5,0', 5, 'Маты Premium ', 'Теплый пол', 'v', 20);
INSERT INTO leftovers VALUES('ОТ-00008097', 'Мат Premium 1200-6,0', 6, 'Маты Premium ', 'Теплый пол', 'v', 27);
INSERT INTO leftovers VALUES('ОТ-00008098', 'Мат Premium 1400-7,0', 7, 'Маты Premium ', 'Теплый пол', 'v', 14);
INSERT INTO leftovers VALUES('ОТ-00008099', 'Мат Premium 1600-8,0', 8, 'Маты Premium ', 'Теплый пол', 'v', 25);
INSERT INTO leftovers VALUES('ОТ-00008100', 'Мат Premium 1800-9,0', 9, 'Маты Premium ', 'Теплый пол', 'v', 9);
INSERT INTO leftovers VALUES('ОТ-00008101', 'Мат Premium 2000-10,0', 10, 'Маты Premium ', 'Теплый пол', 'v', 33);
INSERT INTO leftovers VALUES('ОТ-00008102', 'Мат Premium 2400-12,0', 12, 'Маты Premium ', 'Теплый пол', 'v', 20);

INSERT INTO leftovers VALUES('00-00003219', 'ПБ40-3', 3, 'Прогрев бетона', 'Арх обогрев', 'v', 4);
INSERT INTO leftovers VALUES('00-00003225', 'ПБ40-100', 100, 'Прогрев бетона', 'Арх обогрев', 'v', 13);

INSERT INTO leftovers VALUES('00-00003206', 'Кабельная секция 150', 150, 'Секции Base', 'Теплый пол', 'v', 317);
INSERT INTO leftovers VALUES('00-00003207', 'Кабельная секция 250', 250, 'Секции Base', 'Теплый пол', 'v', 446);
INSERT INTO leftovers VALUES('00-00003208', 'Кабельная секция 400', 400, 'Секции Base', 'Теплый пол', 'v', 400);
INSERT INTO leftovers VALUES('00-00003209', 'Кабельная секция 500', 500, 'Секции Base', 'Теплый пол', 'v', 201);
INSERT INTO leftovers VALUES('00-00003210', 'Кабельная секция 600', 600, 'Секции Base', 'Теплый пол', 'v', 236);
INSERT INTO leftovers VALUES('00-00003211', 'Кабельная секция 700', 700, 'Секции Base', 'Теплый пол', 'v', 239);
INSERT INTO leftovers VALUES('00-00003212', 'Кабельная секция 850', 850, 'Секции Base', 'Теплый пол', 'v', 138);
INSERT INTO leftovers VALUES('00-00003213', 'Кабельная секция 1000', 1000, 'Секции Base', 'Теплый пол', 'v', 241);
INSERT INTO leftovers VALUES('00-00003214', 'Кабельная секция 1200', 1200, 'Секции Base', 'Теплый пол', 'v', 182);
INSERT INTO leftovers VALUES('00-00003215', 'Кабельная секция 1350', 1350, 'Секции Base', 'Теплый пол', 'v', 50);
INSERT INTO leftovers VALUES('00-00003217', 'Кабельная секция 1700', 1700, 'Секции Base', 'Теплый пол', 'v', 26);

INSERT INTO leftovers VALUES('ОТ-00008103', 'Секция Premium-180', 180, 'Секции Premium', 'Теплый пол', 'v', 224);
INSERT INTO leftovers VALUES('ОТ-00008104', 'Секция Premium-260', 260, 'Секции Premium', 'Теплый пол', 'v', 185);
INSERT INTO leftovers VALUES('ОТ-00008105', 'Секция Premium-440', 440, 'Секции Premium', 'Теплый пол', 'v', 77);
INSERT INTO leftovers VALUES('ОТ-00008106', 'Секция Premium-520', 520, 'Секции Premium', 'Теплый пол', 'v', 25);
INSERT INTO leftovers VALUES('ОТ-00008107', 'Секция Premium-600', 600, 'Секции Premium', 'Теплый пол', 'v', 38);
INSERT INTO leftovers VALUES('ОТ-00008108', 'Секция Premium-680', 680, 'Секции Premium', 'Теплый пол', 'v', 55);
INSERT INTO leftovers VALUES('ОТ-00008109', 'Секция Premium-840', 840, 'Секции Premium', 'Теплый пол', 'v', 16);
INSERT INTO leftovers VALUES('ОТ-00008110', 'Секция Premium-1090', 1090, 'Секции Premium', 'Теплый пол', 'v', 24);
INSERT INTO leftovers VALUES('ОТ-00008111', 'Секция Premium-1170', 1170, 'Секции Premium', 'Теплый пол', 'v', 2);
INSERT INTO leftovers VALUES('ОТ-00008112', 'Секция Premium-1450', 1450, 'Секции Premium', 'Теплый пол', 'v', 13);
INSERT INTO leftovers VALUES('ОТ-00008113', 'Секция Premium-1600', 1600, 'Секции Premium', 'Теплый пол', 'v', 11);
INSERT INTO leftovers VALUES('ОТ-00008114', 'Секция Premium-1800', 1800, 'Секции Premium', 'Теплый пол', 'v', 70);
INSERT INTO leftovers VALUES('ОТ-00008115', 'Секция Premium-2100', 2100, 'Секции Premium', 'Теплый пол', 'v', 81);

INSERT INTO leftovers VALUES('00-00002063', 'Терморегулятор механический', 1, 'ТР', 'ТР', 'v', 691);
INSERT INTO leftovers VALUES('00-00002326', 'Мат Base-1050-7,0', 7, 'Маты Base', 'Теплый пол', 'a', 160);
INSERT INTO leftovers VALUES('00-00002327', 'Мат Base-1200-8,0', 8, 'Маты Base', 'Теплый пол', 'a', 98);
INSERT INTO leftovers VALUES('00-00002328', 'Мат Base-1350-9,0', 9, 'Маты Base', 'Теплый пол', 'a', 144);
INSERT INTO leftovers VALUES('00-00002330', 'Мат Base-1800-12,0', 12, 'Маты Base', 'Теплый пол', 'a', 2);
INSERT INTO leftovers VALUES('ОТ-00008088', 'Мат Premium 200-1,0', 1, 'Маты Premium ', 'Теплый пол', 'a', 144);
INSERT INTO leftovers VALUES('ОТ-00008089', 'Мат Premium 300-1,5', 1, 'Маты Premium ', 'Теплый пол', 'a', 288);
INSERT INTO leftovers VALUES('ОТ-00008090', 'Мат Premium 400-2,0', 2, 'Маты Premium ', 'Теплый пол', 'a', 288);
INSERT INTO leftovers VALUES('ОТ-00008092', 'Мат Premium 600-3,0', 3, 'Маты Premium ', 'Теплый пол', 'a', 160);
INSERT INTO leftovers VALUES('ОТ-00008094', 'Мат Premium 800-4,0', 4, 'Маты Premium ', 'Теплый пол', 'a', 72);
INSERT INTO leftovers VALUES('ОТ-00008099', 'Мат Premium 1600-8,0', 8, 'Маты Premium ', 'Теплый пол', 'a', 24);
INSERT INTO leftovers VALUES('ОТ-00008100', 'Мат Premium 1800-9,0', 9, 'Маты Premium ', 'Теплый пол', 'a', 24);
INSERT INTO leftovers VALUES('ОТ-00008101', 'Мат Premium 2000-10,0', 10, 'Маты Premium ', 'Теплый пол', 'a', 24);
INSERT INTO leftovers VALUES('ОТ-00008102', 'Мат Premium 2400-12,0', 12, 'Маты Premium ', 'Теплый пол', 'a', 24);
INSERT INTO leftovers VALUES('ОТ-00006235', 'Секция для обогрева кровли 2-210 Вт/7,0м', 7, 'Обогрев кровли', 'Арх обогрев', 'm', 39);
INSERT INTO leftovers VALUES('ОТ-00006236', 'Секция для обогрева кровли 2-330 Вт/11,0м', 11, 'Обогрев кровли', 'Арх обогрев', 'm', 68);
INSERT INTO leftovers VALUES('ОТ-00006237', 'Секция для обогрева кровли 2-435 Вт/14,5м', 14, 'Обогрев кровли', 'Арх обогрев', 'm', 19);
INSERT INTO leftovers VALUES('ОТ-00006238', 'Секция для обогрева кровли 2-660 Вт/22,0м', 22, 'Обогрев кровли', 'Арх обогрев', 'm', 13);
INSERT INTO leftovers VALUES('ОТ-00006239', 'Секция для обогрева кровли 2-885 Вт/29,5м', 29, 'Обогрев кровли', 'Арх обогрев', 'm', 16);
INSERT INTO leftovers VALUES('ОТ-00006240', 'Секция для обогрева кровли 2-1080 Вт/36,0м', 36, 'Обогрев кровли', 'Арх обогрев', 'm', 10);
INSERT INTO leftovers VALUES('ОТ-00006241', 'Секция для обогрева кровли 2-1500 Вт/50,0м', 50, 'Обогрев кровли', 'Арх обогрев', 'm', 9);
INSERT INTO leftovers VALUES('ОТ-00006242', 'Секция для обогрева кровли 2-1920 Вт/64,0м', 64, 'Обогрев кровли', 'Арх обогрев', 'm', 14);
INSERT INTO leftovers VALUES('ОТ-00006243', 'Секция для обогрева кровли 2-2160 Вт/72,0м', 72, 'Обогрев кровли', 'Арх обогрев', 'm', 4);
INSERT INTO leftovers VALUES('ОТ-00006244', 'Секция для обогрева кровли 2-2580 Вт/86,0м', 86, 'Обогрев кровли', 'Арх обогрев', 'm', 9);
INSERT INTO leftovers VALUES('ОТ-00006245', 'Секция для обогрева кровли 2-3450 Вт/115,0м', 115, 'Обогрев кровли', 'Арх обогрев', 'm', 6);
INSERT INTO leftovers VALUES('ОТ-00006246', 'Секция для обогрева кровли 2-3900 Вт/130,0м', 130, 'Обогрев кровли', 'Арх обогрев', 'm', 15);
INSERT INTO leftovers VALUES('ОТ-00006247', 'Секция для обогрева кровли 2-4500 Вт/150,0м', 150, 'Обогрев кровли', 'Арх обогрев', 'm', 8);
INSERT INTO leftovers VALUES('ОТ-000601  ', 'Секция для обогрева кровли 2-3030 Вт/101,0м', 101, 'Обогрев кровли', 'Арх обогрев', 'm', 8);
INSERT INTO leftovers VALUES('00-00002315', 'Мат Base-75-0,5', 0, 'Маты Base', 'Теплый пол', 'm', 62);
INSERT INTO leftovers VALUES('00-00002316', 'Мат Base-150-1,0', 1, 'Маты Base', 'Теплый пол', 'm', 41);
INSERT INTO leftovers VALUES('00-00002317', 'Мат Base-225-1,5', 1, 'Маты Base', 'Теплый пол', 'm', 7);
INSERT INTO leftovers VALUES('00-00002318', 'Мат Base-300-2,0', 2, 'Маты Base', 'Теплый пол', 'm', 45);
INSERT INTO leftovers VALUES('00-00002319', 'Мат Base-375-2,5', 2, 'Маты Base', 'Теплый пол', 'm', 24);
INSERT INTO leftovers VALUES('00-00002320', 'Мат Base-450-3,0', 3, 'Маты Base', 'Теплый пол', 'm', 14);
INSERT INTO leftovers VALUES('00-00002321', 'Мат Base-525-3,5', 3, 'Маты Base', 'Теплый пол', 'm', 20);
INSERT INTO leftovers VALUES('00-00002322', 'Мат Base-600-4,0', 4, 'Маты Base', 'Теплый пол', 'm', 23);
INSERT INTO leftovers VALUES('00-00002323', 'Мат Base-675-4,5', 4, 'Маты Base', 'Теплый пол', 'm', 16);
INSERT INTO leftovers VALUES('00-00002324', 'Мат Base-750-5,0', 5, 'Маты Base', 'Теплый пол', 'm', 13);
INSERT INTO leftovers VALUES('00-00002325', 'Мат Base-900-6,0', 6, 'Маты Base', 'Теплый пол', 'm', 13);
INSERT INTO leftovers VALUES('00-00002326', 'Мат Base-1050-7,0', 7, 'Маты Base', 'Теплый пол', 'm', 15);
INSERT INTO leftovers VALUES('00-00002327', 'Мат Base-1200-8,0', 8, 'Маты Base', 'Теплый пол', 'm', 12);
INSERT INTO leftovers VALUES('00-00002329', 'Мат Base-1500-10,0', 10, 'Маты Base', 'Теплый пол', 'm', 14);
INSERT INTO leftovers VALUES('00-00002330', 'Мат Base-1800-12,0', 12, 'Маты Base', 'Теплый пол', 'm', 9);
INSERT INTO leftovers VALUES('ОТ-00006953', 'Мат Base-2400-16,0', 16, 'Маты Base', 'Теплый пол', 'm', 4);
INSERT INTO leftovers VALUES('ОТ-00006954', 'Мат Base-2700-18.0', 18, 'Маты Base', 'Теплый пол', 'm', 3);

INSERT INTO leftovers VALUES('ОТ-00008088', 'Мат Premium 200-1,0', 1, 'Маты Premium ', 'Теплый пол', 'm', 1);
INSERT INTO leftovers VALUES('ОТ-00008089', 'Мат Premium 300-1,5', 1, 'Маты Premium ', 'Теплый пол', 'm', 5);
INSERT INTO leftovers VALUES('ОТ-00008090', 'Мат Premium 400-2,0', 2, 'Маты Premium ', 'Теплый пол', 'm', 9);
INSERT INTO leftovers VALUES('ОТ-00008091', 'Мат Premium 500-2,5', 2, 'Маты Premium ', 'Теплый пол', 'm', 3);
INSERT INTO leftovers VALUES('ОТ-00008092', 'Мат Premium 600-3,0', 3, 'Маты Premium ', 'Теплый пол', 'm', 9);
INSERT INTO leftovers VALUES('ОТ-00008093', 'Мат Premium 700-3,5', 3, 'Маты Premium ', 'Теплый пол', 'm', 7);
INSERT INTO leftovers VALUES('ОТ-00008094', 'Мат Premium 800-4,0', 4, 'Маты Premium ', 'Теплый пол', 'm', 10);
INSERT INTO leftovers VALUES('ОТ-00008095', 'Мат Premium 900-4,5', 4, 'Маты Premium ', 'Теплый пол', 'm', 8);
INSERT INTO leftovers VALUES('ОТ-00008096', 'Мат Premium 1000-5,0', 5, 'Маты Premium ', 'Теплый пол', 'm', 10);
INSERT INTO leftovers VALUES('ОТ-00008097', 'Мат Premium 1200-6,0', 6, 'Маты Premium ', 'Теплый пол', 'm', 8);
INSERT INTO leftovers VALUES('ОТ-00008098', 'Мат Premium 1400-7,0', 7, 'Маты Premium ', 'Теплый пол', 'm', 14);
INSERT INTO leftovers VALUES('ОТ-00008099', 'Мат Premium 1600-8,0', 8, 'Маты Premium ', 'Теплый пол', 'm', 9);
INSERT INTO leftovers VALUES('ОТ-00008100', 'Мат Premium 1800-9,0', 9, 'Маты Premium ', 'Теплый пол', 'm', 8);
INSERT INTO leftovers VALUES('ОТ-00008101', 'Мат Premium 2000-10,0', 10, 'Маты Premium ', 'Теплый пол', 'm', 15);
INSERT INTO leftovers VALUES('ОТ-00008102', 'Мат Premium 2400-12,0', 12, 'Маты Premium ', 'Теплый пол', 'm', 9);
INSERT INTO leftovers VALUES('00-00003220', 'ПБ40-9', 9, 'Прогрев бетона', 'Арх обогрев', 'm', 4);

INSERT INTO leftovers VALUES('00-00003206', 'Кабельная секция 150', 150, 'Секции Base', 'Теплый пол', 'm', 17);
INSERT INTO leftovers VALUES('00-00003207', 'Кабельная секция 250', 250, 'Секции Base', 'Теплый пол', 'm', 17);
INSERT INTO leftovers VALUES('00-00003208', 'Кабельная секция 400', 400, 'Секции Base', 'Теплый пол', 'm', 10);
INSERT INTO leftovers VALUES('00-00003209', 'Кабельная секция 500', 500, 'Секции Base', 'Теплый пол', 'm', 13);
INSERT INTO leftovers VALUES('00-00003210', 'Кабельная секция 600', 600, 'Секции Base', 'Теплый пол', 'm', 9);
INSERT INTO leftovers VALUES('00-00003211', 'Кабельная секция 700', 700, 'Секции Base', 'Теплый пол', 'm', 16);
INSERT INTO leftovers VALUES('00-00003212', 'Кабельная секция 850', 850, 'Секции Base', 'Теплый пол', 'm', 16);
INSERT INTO leftovers VALUES('00-00003213', 'Кабельная секция 1000', 1000, 'Секции Base', 'Теплый пол', 'm', 4);
INSERT INTO leftovers VALUES('00-00003214', 'Кабельная секция 1200', 1200, 'Секции Base', 'Теплый пол', 'm', 2);
INSERT INTO leftovers VALUES('00-00003215', 'Кабельная секция 1350', 1350, 'Секции Base', 'Теплый пол', 'm', 13);
INSERT INTO leftovers VALUES('00-00003216', 'Кабельная секция 1500', 1500, 'Секции Base', 'Теплый пол', 'm', 15);
INSERT INTO leftovers VALUES('00-00003217', 'Кабельная секция 1700', 1700, 'Секции Base', 'Теплый пол', 'm', 5);
INSERT INTO leftovers VALUES('00-00003218', 'Кабельная секция 2000', 2000, 'Секции Base', 'Теплый пол', 'm', 10);

INSERT INTO leftovers VALUES('ОТ-00008103', 'Секция Premium-180', 180, 'Секции Premium', 'Теплый пол', 'm', 8);
INSERT INTO leftovers VALUES('ОТ-00008104', 'Секция Premium-260', 260, 'Секции Premium', 'Теплый пол', 'm', 2);
INSERT INTO leftovers VALUES('ОТ-00008105', 'Секция Premium-440', 440, 'Секции Premium', 'Теплый пол', 'm', 4);
INSERT INTO leftovers VALUES('ОТ-00008106', 'Секция Premium-520', 520, 'Секции Premium', 'Теплый пол', 'm', 1);
INSERT INTO leftovers VALUES('ОТ-00008107', 'Секция Premium-600', 600, 'Секции Premium', 'Теплый пол', 'm', 5);
INSERT INTO leftovers VALUES('ОТ-00008108', 'Секция Premium-680', 680, 'Секции Premium', 'Теплый пол', 'm', 5);
INSERT INTO leftovers VALUES('ОТ-00008109', 'Секция Premium-840', 840, 'Секции Premium', 'Теплый пол', 'm', 7);
INSERT INTO leftovers VALUES('ОТ-00008110', 'Секция Premium-1090', 1090, 'Секции Premium', 'Теплый пол', 'm', 1);
INSERT INTO leftovers VALUES('ОТ-00008111', 'Секция Premium-1170', 1170, 'Секции Premium', 'Теплый пол', 'm', 6);
INSERT INTO leftovers VALUES('ОТ-00008112', 'Секция Premium-1450', 1450, 'Секции Premium', 'Теплый пол', 'm', 5);
INSERT INTO leftovers VALUES('ОТ-00008114', 'Секция Premium-1800', 1800, 'Секции Premium', 'Теплый пол', 'm', 2);
INSERT INTO leftovers VALUES('ОТ-00008115', 'Секция Premium-2100', 2100, 'Секции Premium', 'Теплый пол', 'm', 3);

INSERT INTO leftovers VALUES('00-00002063', 'Терморегулятор механический', 1, 'ТР', 'ТР', 'm', 101);

DROP TABLE IF EXISTS leftovers_last_update;
CREATE TABLE leftovers_last_update(
    date        TEXT  NOT NULL,
    PRIMARY KEY (date)
);
INSERT INTO leftovers_last_update VALUES('Остатки (b) от 01.07.2024 18-40-00');

DROP TABLE IF EXISTS production_last_update;
CREATE TABLE production_last_update(
    date        TEXT  NOT NULL,
    PRIMARY KEY (date)
);
INSERT INTO production_last_update VALUES('от 01.07.2024');

DROP TABLE IF EXISTS production;
CREATE TABLE production(
    month           INT     NOT NULL,
    date            TEXT    NOT NULL,
    type            TEXT    NOT NULL,
    workshop        TEXT    NOT NULL,
    category        TEXT    NOT NULL,
    code_ap         TEXT    NOT NULL,
    ord             FLOAT   NOT NULL,
    count           FLOAT   NOT NULL,
    FOREIGN KEY (code_ap) REFERENCES products (code_ap),
    PRIMARY KEY (date, type, workshop, code_ap)
);

INSERT INTO production VALUES(1, '2024-01-10', 'Производство', 'Цех 1', 'Прогрев бетона', 'ПБ40-100.010', 100.0, 113.0);
INSERT INTO production VALUES(1, '2024-01-10', 'Производство', 'Цех 1', 'Прогрев бетона', 'ПБ40-75.010', 75.0, 217.0);
INSERT INTO production VALUES(1, '2024-01-11', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 283.0);
INSERT INTO production VALUES(1, '2024-01-11', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 130.0);
INSERT INTO production VALUES(1, '2024-01-11', 'Производство', 'Цех 1', 'Прогрев бетона', 'ПБ40-9,3.010', 9.0, 252.0);
INSERT INTO production VALUES(1, '2024-01-12', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 291.0);
INSERT INTO production VALUES(1, '2024-01-13', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 397.0);
INSERT INTO production VALUES(1, '2024-01-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 300.0);
INSERT INTO production VALUES(1, '2024-01-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 338.0);
INSERT INTO production VALUES(1, '2024-01-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 128.0);
INSERT INTO production VALUES(1, '2024-01-18', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 297.0);
INSERT INTO production VALUES(1, '2024-01-18', 'Производство', 'Цех 1', 'Секции Base', 'КС-500.010', 500.0, 165.0);
INSERT INTO production VALUES(1, '2024-01-19', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 312.0);
INSERT INTO production VALUES(1, '2024-01-19', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 284.0);
INSERT INTO production VALUES(1, '2024-01-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 186.0);
INSERT INTO production VALUES(1, '2024-01-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 229.0);
INSERT INTO production VALUES(1, '2024-01-20', 'Производство', 'Цех 1', 'Прогрев бетона', 'ПБ40-100.010', 100.0, 127.0);
INSERT INTO production VALUES(1, '2024-01-23', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 103.0);
INSERT INTO production VALUES(1, '2024-01-24', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 287.0);
INSERT INTO production VALUES(1, '2024-01-24', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 226.0);
INSERT INTO production VALUES(1, '2024-01-24', 'Производство', 'Цех 1', 'Маты Base', 'Base-900-6.010', 6.0, 380.0);
INSERT INTO production VALUES(1, '2024-01-24', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 163.0);
INSERT INTO production VALUES(1, '2024-01-24', 'Производство', 'Цех 1', 'Секции Base', 'КС-700.010', 700.0, 237.0);
INSERT INTO production VALUES(1, '2024-01-25', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 275.0);
INSERT INTO production VALUES(1, '2024-01-25', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 184.0);
INSERT INTO production VALUES(1, '2024-01-25', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 299.0);
INSERT INTO production VALUES(1, '2024-01-25', 'Производство', 'Цех 1', 'Секции Base', 'КС-600.010', 600.0, 334.0);
INSERT INTO production VALUES(1, '2024-01-26', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 147.0);
INSERT INTO production VALUES(1, '2024-01-26', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 264.0);
INSERT INTO production VALUES(1, '2024-01-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 171.0);
INSERT INTO production VALUES(1, '2024-01-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-525-3,5.010', 3.5, 351.0);
INSERT INTO production VALUES(1, '2024-01-27', 'Производство', 'Цех 1', 'Секции Base', 'КС-1350.010', 1350.0, 179.0);
INSERT INTO production VALUES(1, '2024-01-27', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 235.0);
INSERT INTO production VALUES(1, '2024-01-27', 'Производство', 'Цех 1', 'Секции Base', 'КС-400.010', 400.0, 130.0);

INSERT INTO production VALUES(2, '2024-02-01', 'Производство', 'Цех 1', 'Маты Base', 'Base-2400-16.010', 16.0, 254.0);
INSERT INTO production VALUES(2, '2024-02-01', 'Производство', 'Цех 1', 'Маты Base', 'Base-2700-18.010', 18.0, 198.0);
INSERT INTO production VALUES(2, '2024-02-01', 'Производство', 'Цех 1', 'Прогрев бетона', 'ПБ40-100.010', 100.0, 316.0);
INSERT INTO production VALUES(2, '2024-02-01', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 125.0);
INSERT INTO production VALUES(2, '2024-02-02', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 279.0);
INSERT INTO production VALUES(2, '2024-02-02', 'Производство', 'Цех 1', 'Секции Base', 'КС-1500.010', 1500.0, 120.0);
INSERT INTO production VALUES(2, '2024-02-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 127.0);
INSERT INTO production VALUES(2, '2024-02-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 342.0);
INSERT INTO production VALUES(2, '2024-02-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 384.0);
INSERT INTO production VALUES(2, '2024-02-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 389.0);
INSERT INTO production VALUES(2, '2024-02-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-2100-14.010', 14.0, 374.0);
INSERT INTO production VALUES(2, '2024-02-07', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 181.0);
INSERT INTO production VALUES(2, '2024-02-07', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 273.0);
INSERT INTO production VALUES(2, '2024-02-07', 'Производство', 'Цех 1', 'Секции Base', 'КС-700.010', 700.0, 190.0);
INSERT INTO production VALUES(2, '2024-02-08', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 182.0);
INSERT INTO production VALUES(2, '2024-02-08', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 167.0);
INSERT INTO production VALUES(2, '2024-02-08', 'Производство', 'Цех 1', 'Маты Base', 'Base-525-3,5.010', 3.5, 293.0);
INSERT INTO production VALUES(2, '2024-02-09', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 333.0);
INSERT INTO production VALUES(2, '2024-02-09', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 399.0);
INSERT INTO production VALUES(2, '2024-02-10', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 195.0);
INSERT INTO production VALUES(2, '2024-02-10', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 279.0);
INSERT INTO production VALUES(2, '2024-02-10', 'Производство', 'Цех 1', 'Прогрев бетона', 'ПБ40-3,1.010', 3.0, 126.0);
INSERT INTO production VALUES(2, '2024-02-13', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 182.0);
INSERT INTO production VALUES(2, '2024-02-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 116.0);
INSERT INTO production VALUES(2, '2024-02-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-500.010', 500.0, 375.0);
INSERT INTO production VALUES(2, '2024-02-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 133.0);
INSERT INTO production VALUES(2, '2024-02-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-1050-7.010', 7.0, 257.0);
INSERT INTO production VALUES(2, '2024-02-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 249.0);
INSERT INTO production VALUES(2, '2024-02-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-2100-14.010', 14.0, 302.0);
INSERT INTO production VALUES(2, '2024-02-15', 'Производство', 'Цех 1', 'Маты Base', 'Base-1050-7.010', 7.0, 216.0);
INSERT INTO production VALUES(2, '2024-02-15', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 256.0);
INSERT INTO production VALUES(2, '2024-02-15', 'Производство', 'Цех 1', 'Секции Base', 'КС-400.010', 400.0, 324.0);
INSERT INTO production VALUES(2, '2024-02-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 392.0);
INSERT INTO production VALUES(2, '2024-02-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 319.0);
INSERT INTO production VALUES(2, '2024-02-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 361.0);
INSERT INTO production VALUES(2, '2024-02-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 181.0);
INSERT INTO production VALUES(2, '2024-02-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-2100-14.010', 14.0, 247.0);
INSERT INTO production VALUES(2, '2024-02-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-900-6.010', 6.0, 308.0);
INSERT INTO production VALUES(2, '2024-02-17', 'Производство', 'Цех 1', 'Секции Base', 'КС-1000.010', 1000.0, 356.0);
INSERT INTO production VALUES(2, '2024-02-17', 'Производство', 'Цех 1', 'Секции Base', 'КС-1700.010', 1700.0, 303.0);
INSERT INTO production VALUES(2, '2024-02-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-2100-14.010', 14.0, 324.0);
INSERT INTO production VALUES(2, '2024-02-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-2400-16.010', 16.0, 338.0);
INSERT INTO production VALUES(2, '2024-02-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-2700-18.010', 18.0, 376.0);
INSERT INTO production VALUES(2, '2024-02-20', 'Производство', 'Цех 1', 'Секции Base', 'КС-1000.010', 1000.0, 385.0);
INSERT INTO production VALUES(2, '2024-02-20', 'Производство', 'Цех 1', 'Секции Base', 'КС-1700.010', 1700.0, 390.0);
INSERT INTO production VALUES(2, '2024-02-21', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 247.0);

INSERT INTO production VALUES(3, '2024-02-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 191.0);
INSERT INTO production VALUES(3, '2024-02-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 180.0);
INSERT INTO production VALUES(3, '2024-02-28', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 339.0);
INSERT INTO production VALUES(3, '2024-02-28', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 194.0);
INSERT INTO production VALUES(3, '2024-03-01', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 289.0);
INSERT INTO production VALUES(3, '2024-03-01', 'Производство', 'Цех 1', 'Маты Base', 'Base-675-4,5.010', 4.5, 262.0);
INSERT INTO production VALUES(3, '2024-03-01', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 328.0);
INSERT INTO production VALUES(3, '2024-03-02', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 323.0);
INSERT INTO production VALUES(3, '2024-03-02', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 270.0);
INSERT INTO production VALUES(3, '2024-03-02', 'Производство', 'Цех 1', 'Маты Base', 'Base-900-6.010', 6.0, 312.0);
INSERT INTO production VALUES(3, '2024-03-02', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 243.0);
INSERT INTO production VALUES(3, '2024-03-03', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 163.0);
INSERT INTO production VALUES(3, '2024-03-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 366.0);
INSERT INTO production VALUES(3, '2024-03-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 276.0);
INSERT INTO production VALUES(3, '2024-03-06', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 294.0);
INSERT INTO production VALUES(3, '2024-03-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 175.0);
INSERT INTO production VALUES(3, '2024-03-07', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 184.0);
INSERT INTO production VALUES(3, '2024-03-07', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 294.0);
INSERT INTO production VALUES(3, '2024-03-07', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 382.0);
INSERT INTO production VALUES(3, '2024-03-07', 'Производство', 'Цех 1', 'Секции Base', 'КС-150.010', 150.0, 115.0);
INSERT INTO production VALUES(3, '2024-03-09', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 378.0);
INSERT INTO production VALUES(3, '2024-03-15', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 182.0);
INSERT INTO production VALUES(3, '2024-03-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 271.0);
INSERT INTO production VALUES(3, '2024-03-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 177.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 356.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 346.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 315.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Маты Premium', 'Premium-1200-6.010', 6.0, 213.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Маты Premium', 'Premium-200-1.010', 1.0, 344.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Маты Premium', 'Premium-400-2.010', 2.0, 123.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Секции Base', 'КС-150.010', 150.0, 107.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Секции Premium', 'Premium-180.010', 180.0, 233.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Секции Premium', 'Premium-440.010', 440.0, 395.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Прогрев бетона', 'ПБ40-150.010', 150.0, 138.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Прогрев бетона', 'ПБ40-50.010', 50.0, 190.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Прогрев бетона', 'ПБ40-9,3.010', 9.0, 313.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-64.010', 64.0, 294.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 270.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-675-4,5.010', 4.5, 358.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 362.0);
INSERT INTO production VALUES(3, '2024-03-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-900-6.010', 6.0, 175.0);
INSERT INTO production VALUES(3, '2024-03-21', 'Производство', 'Цех 1', 'Маты Base', 'Base-1050-7.010', 7.0, 187.0);
INSERT INTO production VALUES(3, '2024-03-21', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 349.0);
INSERT INTO production VALUES(3, '2024-03-22', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 214.0);
INSERT INTO production VALUES(3, '2024-03-23', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 266.0);
INSERT INTO production VALUES(3, '2024-03-24', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 118.0);
INSERT INTO production VALUES(3, '2024-03-24', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 349.0);
INSERT INTO production VALUES(3, '2024-03-24', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 371.0);
INSERT INTO production VALUES(3, '2024-03-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-675-4,5.010', 4.5, 233.0);
INSERT INTO production VALUES(3, '2024-03-28', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 305.0);
INSERT INTO production VALUES(3, '2024-03-28', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 290.0);
INSERT INTO production VALUES(3, '2024-03-29', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 315.0);
INSERT INTO production VALUES(3, '2024-03-30', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 283.0);

INSERT INTO production VALUES(4, '2024-04-04', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 268.0);
INSERT INTO production VALUES(4, '2024-04-04', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-130.010', 130.0, 398.0);
INSERT INTO production VALUES(4, '2024-04-04', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-14,5.010', 14.5, 232.0);
INSERT INTO production VALUES(4, '2024-04-04', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-22.010', 22.0, 231.0);
INSERT INTO production VALUES(4, '2024-04-04', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-29,5.010', 29.5, 378.0);
INSERT INTO production VALUES(4, '2024-04-04', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-36.010', 36.0, 302.0);
INSERT INTO production VALUES(4, '2024-04-04', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-50.010', 50.0, 386.0);
INSERT INTO production VALUES(4, '2024-04-04', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 102.0);
INSERT INTO production VALUES(4, '2024-04-05', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 317.0);
INSERT INTO production VALUES(4, '2024-04-05', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-130.010', 130.0, 364.0);
INSERT INTO production VALUES(4, '2024-04-05', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-14,5.010', 14.5, 327.0);
INSERT INTO production VALUES(4, '2024-04-05', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-7.010', 7.0, 299.0);
INSERT INTO production VALUES(4, '2024-04-05', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-72.010', 72.0, 264.0);
INSERT INTO production VALUES(4, '2024-04-05', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-86.010', 86.0, 387.0);
INSERT INTO production VALUES(4, '2024-04-07', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-11.010', 11.0, 131.0);
INSERT INTO production VALUES(4, '2024-04-07', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 229.0);
INSERT INTO production VALUES(4, '2024-04-07', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-22.010', 22.0, 171.0);
INSERT INTO production VALUES(4, '2024-04-07', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-29,5.010', 29.5, 259.0);
INSERT INTO production VALUES(4, '2024-04-07', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-36.010', 36.0, 199.0);
INSERT INTO production VALUES(4, '2024-04-10', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-50.010', 50.0, 188.0);
INSERT INTO production VALUES(4, '2024-04-10', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-64.010', 64.0, 269.0);
INSERT INTO production VALUES(4, '2024-04-10', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-7.010', 7.0, 146.0);
INSERT INTO production VALUES(4, '2024-04-10', 'Производство', 'Цех 1', 'Маты Base', 'Base-1350-9.010', 9.0, 267.0);
INSERT INTO production VALUES(4, '2024-04-10', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 397.0);
INSERT INTO production VALUES(4, '2024-04-11', 'Переупаковка', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 320.0);
INSERT INTO production VALUES(4, '2024-04-11', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-130.010', 130.0, 297.0);
INSERT INTO production VALUES(4, '2024-04-11', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-150.010', 150.0, 193.0);
INSERT INTO production VALUES(4, '2024-04-11', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 338.0);
INSERT INTO production VALUES(4, '2024-04-12', 'Производство', 'Цех 1', 'Маты Base', 'Base-2700-18.010', 18.0, 203.0);
INSERT INTO production VALUES(4, '2024-04-12', 'Производство', 'Цех 1', 'Секции Base', 'КС-1000.010', 1000.0, 177.0);
INSERT INTO production VALUES(4, '2024-04-12', 'Производство', 'Цех 1', 'Секции Base', 'КС-1350.010', 1350.0, 376.0);
INSERT INTO production VALUES(4, '2024-04-12', 'Производство', 'Цех 1', 'Секции Base', 'КС-1500.010', 1500.0, 234.0);
INSERT INTO production VALUES(4, '2024-04-12', 'Производство', 'Цех 1', 'Секции Base', 'КС-250.010', 250.0, 118.0);
INSERT INTO production VALUES(4, '2024-04-13', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 226.0);
INSERT INTO production VALUES(4, '2024-04-13', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 221.0);
INSERT INTO production VALUES(4, '2024-04-13', 'Производство', 'Цех 1', 'Маты Base', 'Base-2100-14.010', 14.0, 188.0);
INSERT INTO production VALUES(4, '2024-04-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 170.0);
INSERT INTO production VALUES(4, '2024-04-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-400.010', 400.0, 234.0);
INSERT INTO production VALUES(4, '2024-04-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 162.0);
INSERT INTO production VALUES(4, '2024-04-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-2100-14.010', 14.0, 340.0);
INSERT INTO production VALUES(4, '2024-04-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-2400-16.010', 16.0, 282.0);
INSERT INTO production VALUES(4, '2024-04-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-2700-18.010', 18.0, 258.0);
INSERT INTO production VALUES(4, '2024-04-14', 'Производство', 'Цех 1', 'Секции Base', 'КС-400.010', 400.0, 215.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 369.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-130.010', 130.0, 143.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-150.010', 150.0, 384.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-29,5.010', 29.5, 337.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-36.010', 36.0, 269.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-50.010', 50.0, 210.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-72.010', 72.0, 256.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-86.010', 86.0, 282.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 161.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 287.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Производство', 'Цех 1', 'Секции Base', 'КС-500.010', 500.0, 350.0);
INSERT INTO production VALUES(4, '2024-04-17', 'Производство', 'Цех 1', 'Секции Base', 'КС-700.010', 700.0, 194.0);
INSERT INTO production VALUES(4, '2024-04-18', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 318.0);
INSERT INTO production VALUES(4, '2024-04-18', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 215.0);
INSERT INTO production VALUES(4, '2024-04-18', 'Производство', 'Цех 1', 'Секции Base', 'КС-1700.010', 1700.0, 351.0);
INSERT INTO production VALUES(4, '2024-04-18', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 241.0);
INSERT INTO production VALUES(4, '2024-04-20', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 179.0);
INSERT INTO production VALUES(4, '2024-04-20', 'Производство', 'Цех 1', 'Маты Premium', 'Premium-700-3,5.010', 3.5, 381.0);
INSERT INTO production VALUES(4, '2024-04-20', 'Производство', 'Цех 1', 'Секции Base', 'КС-500.010', 500.0, 198.0);
INSERT INTO production VALUES(4, '2024-04-21', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 397.0);
INSERT INTO production VALUES(4, '2024-04-21', 'Производство', 'Цех 1', 'Маты Base', 'Base-1500-10.010', 10.0, 302.0);
INSERT INTO production VALUES(4, '2024-04-24', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 126.0);
INSERT INTO production VALUES(4, '2024-04-24', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-130.010', 130.0, 342.0);
INSERT INTO production VALUES(4, '2024-04-24', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-150.010', 150.0, 341.0);
INSERT INTO production VALUES(4, '2024-04-24', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-29,5.010', 29.5, 137.0);
INSERT INTO production VALUES(4, '2024-04-24', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-50.010', 50.0, 298.0);
INSERT INTO production VALUES(4, '2024-04-24', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-72.010', 72.0, 156.0);
INSERT INTO production VALUES(4, '2024-04-25', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-29,5.010', 29.5, 250.0);
INSERT INTO production VALUES(4, '2024-04-25', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 145.0);
INSERT INTO production VALUES(4, '2024-04-26', 'Производство', 'Цех 1', 'Маты Base', 'Base-675-4,5.010', 4.5, 391.0);
INSERT INTO production VALUES(4, '2024-04-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 238.0);
INSERT INTO production VALUES(4, '2024-04-28', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 104.0);
INSERT INTO production VALUES(4, '2024-04-28', 'Производство', 'Цех 1', 'Секции Base', 'КС-400.010', 400.0, 230.0);
INSERT INTO production VALUES(4, '2024-04-28', 'Производство', 'Цех 1', 'Секции Base', 'КС-600.010', 600.0, 214.0);
INSERT INTO production VALUES(4, '2024-04-28', 'Производство', 'Цех 1', 'Секции Base', 'КС-700.010', 700.0, 298.0);
INSERT INTO production VALUES(4, '2024-04-28', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 305.0);
INSERT INTO production VALUES(4, '2024-04-29', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 318.0);
INSERT INTO production VALUES(4, '2024-04-29', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-130.010', 130.0, 215.0);
INSERT INTO production VALUES(4, '2024-04-29', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-150.010', 150.0, 318.0);
INSERT INTO production VALUES(4, '2024-04-29', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-64.010', 64.0, 282.0);
INSERT INTO production VALUES(4, '2024-04-29', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-86.010', 86.0, 318.0);

INSERT INTO production VALUES(5, '2024-05-02', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 299.0);
INSERT INTO production VALUES(5, '2024-05-02', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 309.0);
INSERT INTO production VALUES(5, '2024-05-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-1200-8.010', 8.0, 201.0);
INSERT INTO production VALUES(5, '2024-05-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-900-6.010', 6.0, 181.0);
INSERT INTO production VALUES(5, '2024-05-03', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 168.0);
INSERT INTO production VALUES(5, '2024-05-04', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 200.0);
INSERT INTO production VALUES(5, '2024-05-05', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-22.010', 22.0, 273.0);
INSERT INTO production VALUES(5, '2024-05-05', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-36.010', 36.0, 228.0);
INSERT INTO production VALUES(5, '2024-05-05', 'Производство', 'Цех 1', 'Обогрев кровли', 'ОК 2-64.010', 64.0, 310.0);
INSERT INTO production VALUES(5, '2024-05-11', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 180.0);
INSERT INTO production VALUES(5, '2024-05-12', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-11.010', 11.0, 276.0);
INSERT INTO production VALUES(5, '2024-05-12', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 203.0);
INSERT INTO production VALUES(5, '2024-05-12', 'Производство', 'Цех 1', 'Секции Base', 'КС-1700.010', 1700.0, 328.0);
INSERT INTO production VALUES(5, '2024-05-12', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 341.0);
INSERT INTO production VALUES(5, '2024-05-15', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 390.0);
INSERT INTO production VALUES(5, '2024-05-15', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 196.0);
INSERT INTO production VALUES(5, '2024-05-15', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 384.0);
INSERT INTO production VALUES(5, '2024-05-15', 'Производство', 'Цех 1', 'Секции Base', 'КС-700.010', 700.0, 304.0);
INSERT INTO production VALUES(5, '2024-05-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-375-2,5.010', 2.5, 364.0);
INSERT INTO production VALUES(5, '2024-05-16', 'Производство', 'Цех 1', 'Маты Base', 'Base-525-3,5.010', 3.5, 179.0);
INSERT INTO production VALUES(5, '2024-05-16', 'Производство', 'Цех 1', 'Секции Base', 'КС-1500.010', 1500.0, 376.0);
INSERT INTO production VALUES(5, '2024-05-16', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 126.0);
INSERT INTO production VALUES(5, '2024-05-17', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 221.0);
INSERT INTO production VALUES(5, '2024-05-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 261.0);
INSERT INTO production VALUES(5, '2024-05-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-525-3,5.010', 3.5, 377.0);
INSERT INTO production VALUES(5, '2024-05-17', 'Производство', 'Цех 1', 'Секции Base', 'КС-1350.010', 1350.0, 355.0);
INSERT INTO production VALUES(5, '2024-05-19', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 307.0);
INSERT INTO production VALUES(5, '2024-05-19', 'Производство', 'Цех 1', 'Секции Base', 'КС-1000.010', 1000.0, 358.0);
INSERT INTO production VALUES(5, '2024-05-20', 'Производство', 'Цех 1', 'Секции Base', 'КС-250.010', 250.0, 400.0);
INSERT INTO production VALUES(5, '2024-05-22', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 234.0);
INSERT INTO production VALUES(5, '2024-05-22', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 330.0);
INSERT INTO production VALUES(5, '2024-05-24', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 298.0);
INSERT INTO production VALUES(5, '2024-05-24', 'Производство', 'Цех 1', 'Маты Base', 'Base-900-6.010', 6.0, 280.0);
INSERT INTO production VALUES(5, '2024-05-24', 'Производство', 'Цех 1', 'Секции Base', 'КС-500.010', 500.0, 330.0);
INSERT INTO production VALUES(5, '2024-05-26', 'Производство', 'Цех 1', 'Секции Base', 'КС-1200.010', 1200.0, 132.0);
INSERT INTO production VALUES(5, '2024-05-26', 'Производство', 'Цех 1', 'Секции Base', 'КС-1350.010', 1350.0, 281.0);
INSERT INTO production VALUES(5, '2024-05-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 301.0);
INSERT INTO production VALUES(5, '2024-05-27', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 283.0);
INSERT INTO production VALUES(5, '2024-05-29', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 339.0);
INSERT INTO production VALUES(5, '2024-05-29', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 145.0);
INSERT INTO production VALUES(5, '2024-05-30', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 110.0);
INSERT INTO production VALUES(5, '2024-05-30', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 325.0);
INSERT INTO production VALUES(5, '2024-05-31', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-11.010', 11.0, 155.0);
INSERT INTO production VALUES(5, '2024-05-31', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-29,5.010', 29.5, 295.0);
INSERT INTO production VALUES(5, '2024-05-31', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-50.010', 50.0, 290.0);
INSERT INTO production VALUES(5, '2024-05-31', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-72.010', 72.0, 103.0);
INSERT INTO production VALUES(5, '2024-05-31', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 137.0);
INSERT INTO production VALUES(5, '2024-06-01', 'Переупаковка', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 321.0);
INSERT INTO production VALUES(5, '2024-06-01', 'Производство', 'Цех 1', 'Маты Base', 'Base-150-1.010', 1.0, 228.0);
INSERT INTO production VALUES(5, '2024-06-01', 'Производство', 'Цех 1', 'Секции Base', 'КС-250.010', 250.0, 213.0);
INSERT INTO production VALUES(5, '2024-06-02', 'Производство', 'Цех 1', 'Маты Base', 'Base-675-4,5.010', 4.5, 132.0);
INSERT INTO production VALUES(5, '2024-06-02', 'Производство', 'Цех 1', 'Секции Base', 'КС-600.010', 600.0, 228.0);
INSERT INTO production VALUES(5, '2024-06-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 213.0);
INSERT INTO production VALUES(5, '2024-06-03', 'Производство', 'Цех 1', 'Секции Base', 'КС-500.010', 500.0, 132.0);

INSERT INTO production VALUES(6, '2024-06-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-2100-14.010', 14.0, 253.0);
INSERT INTO production VALUES(6, '2024-06-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-2400-16.010', 16.0, 251.0);
INSERT INTO production VALUES(6, '2024-06-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-2700-18.010', 18.0, 258.0);
INSERT INTO production VALUES(6, '2024-06-06', 'Производство', 'Цех 1', 'Секции Base', 'КС-400.010', 400.0, 262.0);
INSERT INTO production VALUES(6, '2024-06-06', 'Производство', 'Цех 1', 'Секции Base', 'КС-700.010', 700.0, 398.0);
INSERT INTO production VALUES(6, '2024-06-08', 'Производство', 'Цех 1', 'Секции Base', 'КС-400.010', 400.0, 275.0);
INSERT INTO production VALUES(6, '2024-06-09', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 102.0);
INSERT INTO production VALUES(6, '2024-06-09', 'Производство', 'Цех 1', 'Секции Base', 'КС-1350.010', 1350.0, 349.0);
INSERT INTO production VALUES(6, '2024-06-09', 'Производство', 'Цех 1', 'Секции Base', 'КС-150.010', 150.0, 182.0);
INSERT INTO production VALUES(6, '2024-06-10', 'Производство', 'Цех 1', 'Секции Base', 'КС-250.010', 250.0, 207.0);
INSERT INTO production VALUES(6, '2024-06-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-1200.010', 1200.0, 353.0);
INSERT INTO production VALUES(6, '2024-06-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-1500.010', 1500.0, 304.0);
INSERT INTO production VALUES(6, '2024-06-13', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 229.0);
INSERT INTO production VALUES(6, '2024-06-14', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 301.0);
INSERT INTO production VALUES(6, '2024-06-14', 'Производство', 'Цех 1', 'ОК PRO 30 Вт/м', '30 НРКPRO-6-411РР ', 411.0, 311.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-11.010', 11.0, 247.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-115.010', 115.0, 351.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-130.010', 130.0, 285.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-14,5.010', 14.5, 163.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-150.010', 150.0, 215.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-22.010', 22.0, 245.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-29,5.010', 29.5, 338.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-36.010', 36.0, 220.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-64.010', 64.0, 323.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-7.010', 7.0, 321.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-72.010', 72.0, 306.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Переупаковка', 'Цех 1', 'Обогрев кровли', 'ОК 2-86.010', 86.0, 309.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 241.0);
INSERT INTO production VALUES(6, '2024-06-15', 'Производство', 'Цех 1', 'Секции Base', 'КС-1200.010', 1200.0, 376.0);
INSERT INTO production VALUES(6, '2024-06-16', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 270.0);
INSERT INTO production VALUES(6, '2024-06-21', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 155.0);
INSERT INTO production VALUES(6, '2024-06-21', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 192.0);
INSERT INTO production VALUES(6, '2024-06-22', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 236.0);
INSERT INTO production VALUES(6, '2024-06-23', 'Производство', 'Цех 1', 'Секции Base', 'КС-2000.010', 2000.0, 309.0);
INSERT INTO production VALUES(6, '2024-06-26', 'Производство', 'Цех 1', 'Секции Base', 'КС-1000.010', 1000.0, 327.0);
INSERT INTO production VALUES(6, '2024-06-27', 'Производство', 'Цех 1', 'Секции Base', 'КС-1000.010', 1000.0, 372.0);
INSERT INTO production VALUES(6, '2024-06-28', 'Производство', 'Цех 1', 'Секции Base', 'КС-150.010', 150.0, 152.0);
INSERT INTO production VALUES(6, '2024-06-28', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 337.0);
INSERT INTO production VALUES(6, '2024-06-29', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 343.0);
INSERT INTO production VALUES(6, '2024-06-30', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 211.0);
INSERT INTO production VALUES(6, '2024-06-30', 'Производство', 'Цех 1', 'Маты Base', 'Base-675-4,5.010', 4.5, 232.0);
INSERT INTO production VALUES(6, '2024-06-30', 'Производство', 'Цех 1', 'Маты Base', 'Base-750-5.010', 5.0, 281.0);
INSERT INTO production VALUES(6, '2024-07-01', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 381.0);

INSERT INTO production VALUES(7, '2024-07-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 140.0);
INSERT INTO production VALUES(7, '2024-07-03', 'Производство', 'Цех 1', 'Маты Base', 'Base-525-3,5.010', 3.5, 347.0);
INSERT INTO production VALUES(7, '2024-07-04', 'Производство', 'Цех 1', 'Маты Base', 'Base-1050-7.010', 7.0, 229.0);
INSERT INTO production VALUES(7, '2024-07-04', 'Производство', 'Цех 1', 'Маты Base', 'Base-300-2.010', 2.0, 333.0);
INSERT INTO production VALUES(7, '2024-07-04', 'Производство', 'Цех 1', 'Маты Base', 'Base-525-3,5.010', 3.5, 393.0);
INSERT INTO production VALUES(7, '2024-07-05', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 380.0);
INSERT INTO production VALUES(7, '2024-07-06', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 328.0);
INSERT INTO production VALUES(7, '2024-07-06', 'Производство', 'Цех 1', 'Секции Base', 'КС-1500.010', 1500.0, 225.0);
INSERT INTO production VALUES(7, '2024-07-07', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 230.0);
INSERT INTO production VALUES(7, '2024-07-07', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 306.0);
INSERT INTO production VALUES(7, '2024-07-07', 'Производство', 'Цех 1', 'Секции Base', 'КС-600.010', 600.0, 247.0);
INSERT INTO production VALUES(7, '2024-07-07', 'Производство', 'Цех 1', 'Секции Base', 'КС-700.010', 700.0, 264.0);
INSERT INTO production VALUES(7, '2024-07-10', 'Производство', 'Цех 1', 'Маты Base', 'Base-1050-7.010', 7.0, 165.0);
INSERT INTO production VALUES(7, '2024-07-10', 'Производство', 'Цех 1', 'Маты Base', 'Base-1800-12.010', 12.0, 335.0);
INSERT INTO production VALUES(7, '2024-07-10', 'Производство', 'Цех 1', 'Секции Base', 'КС-150.010', 150.0, 178.0);
INSERT INTO production VALUES(7, '2024-07-11', 'Производство', 'Цех 1', 'Маты Base', 'Base-75-0,5.010', 0.5, 363.0);
INSERT INTO production VALUES(7, '2024-07-11', 'Производство', 'Цех 1', 'Секции Base', 'КС-150.010', 150.0, 198.0);
INSERT INTO production VALUES(7, '2024-07-12', 'Производство', 'Цех 2', 'ТР', 'ТМ-32-010', 1.0, 202.0);
INSERT INTO production VALUES(7, '2024-07-12', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 266.0);
INSERT INTO production VALUES(7, '2024-07-12', 'Производство', 'Цех 1', 'Секции Base', 'КС-500.010', 500.0, 108.0);
INSERT INTO production VALUES(7, '2024-07-13', 'Производство', 'Цех 1', 'Маты Base', 'Base-450-3.010', 3.0, 194.0);
INSERT INTO production VALUES(7, '2024-07-13', 'Производство', 'Цех 1', 'Маты Base', 'Base-900-6.010', 6.0, 260.0);
INSERT INTO production VALUES(7, '2024-07-14', 'Производство', 'Цех 1', 'Маты Base', 'Base-600-4.010', 4.0, 334.0);
INSERT INTO production VALUES(7, '2024-07-14', 'Производство', 'Цех 1', 'Секции Base', 'КС-1000.010', 1000.0, 120.0);
INSERT INTO production VALUES(7, '2024-07-15', 'Производство', 'Цех 1', 'Секции Base', 'КС-1700.010', 1700.0, 300.0);
INSERT INTO production VALUES(7, '2024-07-15', 'Производство', 'Цех 1', 'Секции Base', 'КС-850.010', 850.0, 191.0);
INSERT INTO production VALUES(7, '2024-07-17', 'Производство', 'Цех 1', 'Маты Base', 'Base-225-1,5.010', 1.5, 245.0);

DROP TABLE IF EXISTS plans;
CREATE TABLE plans(
    month           INT     NOT NULL,
    year            INT    NOT NULL,
    code_ap         TEXT    NOT NULL,
    count           FLOAT   NOT NULL,
    FOREIGN KEY (code_ap) REFERENCES products (code_ap),
    PRIMARY KEY (month, year, code_ap)
);
INSERT INTO plans VALUES(1, 2024, 'Base-75-0,5.010', 4925);
INSERT INTO plans VALUES(1, 2024, 'Base-150-1.010', 1962);
INSERT INTO plans VALUES(1, 2024, 'Base-225-1,5.010', 4569);
INSERT INTO plans VALUES(1, 2024, 'Base-300-2.010', 2285);
INSERT INTO plans VALUES(1, 2024, 'Base-375-2,5.010', 2668);
INSERT INTO plans VALUES(1, 2024, 'Base-450-3.010', 3220);
INSERT INTO plans VALUES(1, 2024, 'Base-525-3,5.010', 1894);
INSERT INTO plans VALUES(1, 2024, 'Base-600-4.010', 4793);
INSERT INTO plans VALUES(1, 2024, 'Base-750-5.010', 4831);
INSERT INTO plans VALUES(1, 2024, 'Base-900-6.010', 2662);
INSERT INTO plans VALUES(1, 2024, 'Base-1200-8.010', 2985);
INSERT INTO plans VALUES(1, 2024, 'Base-1500-10.010', 1102);
INSERT INTO plans VALUES(1, 2024, 'Base-1800-12.010', 4242);
INSERT INTO plans VALUES(1, 2024, 'КС-400.010', 1801);
INSERT INTO plans VALUES(1, 2024, 'КС-500.010', 3256);
INSERT INTO plans VALUES(1, 2024, 'КС-600.010', 2011);
INSERT INTO plans VALUES(1, 2024, 'КС-700.010', 2174);
INSERT INTO plans VALUES(1, 2024, 'КС-850.010', 4593);
INSERT INTO plans VALUES(1, 2024, 'КС-1350.010', 4202);
INSERT INTO plans VALUES(1, 2024, 'КС-1500.010', 2782);
INSERT INTO plans VALUES(1, 2024, 'КС-2000.010', 3441);
INSERT INTO plans VALUES(1, 2024, 'ОК 2-115.010', 1976);
INSERT INTO plans VALUES(1, 2024, 'ТМ-32-010', 4730);

INSERT INTO plans VALUES(2, 2024, 'Base-75-0,5.010', 4580);
INSERT INTO plans VALUES(2, 2024, 'Base-150-1.010', 3285);
INSERT INTO plans VALUES(2, 2024, 'Base-225-1,5.010', 1279);
INSERT INTO plans VALUES(2, 2024, 'Base-300-2.010', 1409);
INSERT INTO plans VALUES(2, 2024, 'Base-375-2,5.010', 4680);
INSERT INTO plans VALUES(2, 2024, 'Base-450-3.010', 2281);
INSERT INTO plans VALUES(2, 2024, 'Base-525-3,5.010', 3654);
INSERT INTO plans VALUES(2, 2024, 'Base-600-4.010', 4567);
INSERT INTO plans VALUES(2, 2024, 'Base-750-5.010', 3034);
INSERT INTO plans VALUES(2, 2024, 'Base-900-6.010', 2783);
INSERT INTO plans VALUES(2, 2024, 'Base-1050-7.010', 3813);
INSERT INTO plans VALUES(2, 2024, 'Base-1200-8.010', 4467);
INSERT INTO plans VALUES(2, 2024, 'Base-1500-10.010', 3168);
INSERT INTO plans VALUES(2, 2024, 'Base-1800-12.010', 3746);
INSERT INTO plans VALUES(2, 2024, 'Base-2100-14.010', 4057);
INSERT INTO plans VALUES(2, 2024, 'Base-2400-16.010', 4309);
INSERT INTO plans VALUES(2, 2024, 'Base-2700-18.010', 3801);
INSERT INTO plans VALUES(2, 2024, 'КС-400.010', 4279);
INSERT INTO plans VALUES(2, 2024, 'КС-500.010', 1923);
INSERT INTO plans VALUES(2, 2024, 'КС-700.010', 3403);
INSERT INTO plans VALUES(2, 2024, 'КС-850.010', 4879);
INSERT INTO plans VALUES(2, 2024, 'КС-1000.010', 1143);
INSERT INTO plans VALUES(2, 2024, 'КС-1700.010', 2685);
INSERT INTO plans VALUES(2, 2024, 'КС-2000.010', 1980);
INSERT INTO plans VALUES(2, 2024, 'ПБ40-3,1.010', 4723);
INSERT INTO plans VALUES(2, 2024, 'ТМ-32-010', 2245);

INSERT INTO plans VALUES(3, 2024, 'Base-75-0,5.010', 2626);
INSERT INTO plans VALUES(3, 2024, 'Base-150-1.010', 3173);
INSERT INTO plans VALUES(3, 2024, 'Base-225-1,5.010', 3914);
INSERT INTO plans VALUES(3, 2024, 'Base-300-2.010', 4382);
INSERT INTO plans VALUES(3, 2024, 'Base-375-2,5.010', 1110);
INSERT INTO plans VALUES(3, 2024, 'Base-450-3.010', 3435);
INSERT INTO plans VALUES(3, 2024, 'Base-600-4.010', 3714);
INSERT INTO plans VALUES(3, 2024, 'Base-675-4,5.010', 2426);
INSERT INTO plans VALUES(3, 2024, 'Base-750-5.010', 4416);
INSERT INTO plans VALUES(3, 2024, 'Base-900-6.010', 3305);
INSERT INTO plans VALUES(3, 2024, 'Base-1050-7.010', 2350);
INSERT INTO plans VALUES(3, 2024, 'Base-1200-8.010', 1192);
INSERT INTO plans VALUES(3, 2024, 'Premium-200-1.010', 2878);
INSERT INTO plans VALUES(3, 2024, 'Premium-400-2.010', 3016);
INSERT INTO plans VALUES(3, 2024, 'Premium-600-3.010', 2955);
INSERT INTO plans VALUES(3, 2024, 'Premium-800-4.010', 3767);
INSERT INTO plans VALUES(3, 2024, 'Premium-1000-5.010', 2848);
INSERT INTO plans VALUES(3, 2024, 'КС-850.010', 1954);
INSERT INTO plans VALUES(3, 2024, 'Premium-180.010', 2449);
INSERT INTO plans VALUES(3, 2024, 'Premium-440.010', 4451);
INSERT INTO plans VALUES(3, 2024, 'Premium-600.010', 2297);
INSERT INTO plans VALUES(3, 2024, 'Premium-840.010', 4966);
INSERT INTO plans VALUES(3, 2024, 'Premium-1450.010', 4043);
INSERT INTO plans VALUES(3, 2024, 'ПБ40-150.010', 2766);
INSERT INTO plans VALUES(3, 2024, 'ТМ-32-010', 1413);

INSERT INTO plans VALUES(4, 2024, 'Base-75-0,5.010', 2687);
INSERT INTO plans VALUES(4, 2024, 'Base-150-1.010', 1402);
INSERT INTO plans VALUES(4, 2024, 'Base-225-1,5.010', 3372);
INSERT INTO plans VALUES(4, 2024, 'Base-300-2.010', 3355);
INSERT INTO plans VALUES(4, 2024, 'Base-375-2,5.010', 1318);
INSERT INTO plans VALUES(4, 2024, 'Base-450-3.010', 3946);
INSERT INTO plans VALUES(4, 2024, 'Base-525-3,5.010', 2893);
INSERT INTO plans VALUES(4, 2024, 'Base-600-4.010', 3763);
INSERT INTO plans VALUES(4, 2024, 'Base-675-4,5.010', 3968);
INSERT INTO plans VALUES(4, 2024, 'Base-750-5.010', 3955);
INSERT INTO plans VALUES(4, 2024, 'Base-900-6.010', 1763);
INSERT INTO plans VALUES(4, 2024, 'Base-1050-7.010', 3712);
INSERT INTO plans VALUES(4, 2024, 'Base-1200-8.010', 3457);
INSERT INTO plans VALUES(4, 2024, 'Base-1350-9.010', 3150);
INSERT INTO plans VALUES(4, 2024, 'Base-1500-10.010', 3826);
INSERT INTO plans VALUES(4, 2024, 'Base-1800-12.010', 3665);
INSERT INTO plans VALUES(4, 2024, 'Base-2400-16.010', 3588);
INSERT INTO plans VALUES(4, 2024, 'Base-2700-18.010', 3908);
INSERT INTO plans VALUES(4, 2024, 'Premium-700-3,5.010', 4787);
INSERT INTO plans VALUES(4, 2024, 'КС-150.010', 1326);
INSERT INTO plans VALUES(4, 2024, 'КС-250.010', 4683);
INSERT INTO plans VALUES(4, 2024, 'КС-400.010', 4442);
INSERT INTO plans VALUES(4, 2024, 'КС-500.010', 2251);
INSERT INTO plans VALUES(4, 2024, 'КС-600.010', 3002);
INSERT INTO plans VALUES(4, 2024, 'КС-700.010', 3574);
INSERT INTO plans VALUES(4, 2024, 'КС-850.010', 2196);
INSERT INTO plans VALUES(4, 2024, 'КС-1000.010', 1067);
INSERT INTO plans VALUES(4, 2024, 'КС-1200.010', 3658);
INSERT INTO plans VALUES(4, 2024, 'КС-1350.010', 4779);
INSERT INTO plans VALUES(4, 2024, 'КС-1500.010', 3305);
INSERT INTO plans VALUES(4, 2024, 'КС-1700.010', 4908);
INSERT INTO plans VALUES(4, 2024, 'КС-2000.010', 2824);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-22.010', 2603);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-36.010', 3547);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-64.010', 2777);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-72.010', 3217);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-86.010', 4985);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-115.010', 1270);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-130.010', 1604);
INSERT INTO plans VALUES(4, 2024, 'ОК 2-150.010', 3846);
INSERT INTO plans VALUES(4, 2024, 'ТМ-32-010', 3630);

INSERT INTO plans VALUES(5, 2024, 'Base-75-0,5.010', 1824);
INSERT INTO plans VALUES(5, 2024, 'Base-150-1.010', 1512);
INSERT INTO plans VALUES(5, 2024, 'Base-225-1,5.010', 2403);
INSERT INTO plans VALUES(5, 2024, 'Base-300-2.010', 3252);
INSERT INTO plans VALUES(5, 2024, 'Base-375-2,5.010', 4951);
INSERT INTO plans VALUES(5, 2024, 'Base-450-3.010', 1725);
INSERT INTO plans VALUES(5, 2024, 'Base-525-3,5.010', 1942);
INSERT INTO plans VALUES(5, 2024, 'Base-600-4.010', 4813);
INSERT INTO plans VALUES(5, 2024, 'Base-675-4,5.010', 2586);
INSERT INTO plans VALUES(5, 2024, 'Base-750-5.010', 4884);
INSERT INTO plans VALUES(5, 2024, 'Base-900-6.010', 1333);
INSERT INTO plans VALUES(5, 2024, 'Base-1800-12.010', 1128);
INSERT INTO plans VALUES(5, 2024, 'КС-250.010', 3149);
INSERT INTO plans VALUES(5, 2024, 'КС-400.010', 1442);
INSERT INTO plans VALUES(5, 2024, 'КС-500.010', 3686);
INSERT INTO plans VALUES(5, 2024, 'КС-600.010', 4468);
INSERT INTO plans VALUES(5, 2024, 'КС-700.010', 1678);
INSERT INTO plans VALUES(5, 2024, 'КС-850.010', 3767);
INSERT INTO plans VALUES(5, 2024, 'КС-1000.010', 2968);
INSERT INTO plans VALUES(5, 2024, 'КС-1200.010', 2009);
INSERT INTO plans VALUES(5, 2024, 'КС-1350.010', 1531);
INSERT INTO plans VALUES(5, 2024, 'КС-1500.010', 3989);
INSERT INTO plans VALUES(5, 2024, 'КС-1700.010', 1964);
INSERT INTO plans VALUES(5, 2024, 'КС-2000.010', 1044);
INSERT INTO plans VALUES(5, 2024, 'ТМ-32-010', 2094);

INSERT INTO plans VALUES(6, 2024, 'Base-75-0,5.010', 3082);
INSERT INTO plans VALUES(6, 2024, 'Base-225-1,5.010', 2160);
INSERT INTO plans VALUES(6, 2024, 'Base-300-2.010', 3255);
INSERT INTO plans VALUES(6, 2024, 'Base-450-3.010', 2237);
INSERT INTO plans VALUES(6, 2024, 'Base-525-3,5.010', 4633);
INSERT INTO plans VALUES(6, 2024, 'Base-600-4.010', 1849);
INSERT INTO plans VALUES(6, 2024, 'Base-675-4,5.010', 3114);
INSERT INTO plans VALUES(6, 2024, 'Base-750-5.010', 3293);
INSERT INTO plans VALUES(6, 2024, 'Base-900-6.010', 3115);
INSERT INTO plans VALUES(6, 2024, 'Base-1050-7.010', 1835);
INSERT INTO plans VALUES(6, 2024, 'Base-1200-8.010', 1376);
INSERT INTO plans VALUES(6, 2024, 'Base-1800-12.010', 2910);
INSERT INTO plans VALUES(6, 2024, 'Base-2100-14.010', 1779);
INSERT INTO plans VALUES(6, 2024, 'Base-2400-16.010', 2053);
INSERT INTO plans VALUES(6, 2024, 'Base-2700-18.010', 1916);
INSERT INTO plans VALUES(6, 2024, 'КС-150.010', 3096);
INSERT INTO plans VALUES(6, 2024, 'КС-250.010', 4541);
INSERT INTO plans VALUES(6, 2024, 'КС-400.010', 1283);
INSERT INTO plans VALUES(6, 2024, 'КС-500.010', 3645);
INSERT INTO plans VALUES(6, 2024, 'КС-600.010', 1714);
INSERT INTO plans VALUES(6, 2024, 'КС-700.010', 1955);
INSERT INTO plans VALUES(6, 2024, 'КС-850.010', 3509);
INSERT INTO plans VALUES(6, 2024, 'КС-1000.010', 4784);
INSERT INTO plans VALUES(6, 2024, 'КС-1200.010', 4411);
INSERT INTO plans VALUES(6, 2024, 'КС-1350.010', 1643);
INSERT INTO plans VALUES(6, 2024, 'КС-1500.010', 1381);
INSERT INTO plans VALUES(6, 2024, 'КС-1700.010', 1887);
INSERT INTO plans VALUES(6, 2024, 'КС-2000.010', 3081);
INSERT INTO plans VALUES(6, 2024, 'ОК 2-14,5.010', 3644);
INSERT INTO plans VALUES(6, 2024, 'ОК 2-29,5.010', 1408);
INSERT INTO plans VALUES(6, 2024, 'ОК 2-50.010', 1125);
INSERT INTO plans VALUES(6, 2024, 'ОК 2-72.010', 2155);
INSERT INTO plans VALUES(6, 2024, 'ОК 2-101.010', 1600);
INSERT INTO plans VALUES(6, 2024, 'ТМ-32-010', 1272);

INSERT INTO plans VALUES(7, 2024, 'Base-75-0,5.010', 1084);
INSERT INTO plans VALUES(7, 2024, 'Base-150-1.010', 4265);
INSERT INTO plans VALUES(7, 2024, 'Base-225-1,5.010', 1716);
INSERT INTO plans VALUES(7, 2024, 'Base-300-2.010', 2896);
INSERT INTO plans VALUES(7, 2024, 'Base-375-2,5.010', 3236);
INSERT INTO plans VALUES(7, 2024, 'Base-450-3.010', 2972);
INSERT INTO plans VALUES(7, 2024, 'Base-525-3,5.010', 4899);
INSERT INTO plans VALUES(7, 2024, 'Base-600-4.010', 2308);
INSERT INTO plans VALUES(7, 2024, 'Base-750-5.010', 4349);
INSERT INTO plans VALUES(7, 2024, 'Base-900-6.010', 4387);
INSERT INTO plans VALUES(7, 2024, 'Base-1050-7.010', 4396);
INSERT INTO plans VALUES(7, 2024, 'Base-1200-8.010', 4447);
INSERT INTO plans VALUES(7, 2024, 'Base-1350-9.010', 4294);
INSERT INTO plans VALUES(7, 2024, 'Base-1500-10.010', 3314);
INSERT INTO plans VALUES(7, 2024, 'Base-1800-12.010', 1650);
INSERT INTO plans VALUES(7, 2024, 'Base-2100-14.010', 4490);
INSERT INTO plans VALUES(7, 2024, 'Base-2400-16.010', 2943);
INSERT INTO plans VALUES(7, 2024, 'Base-2700-18.010', 4991);
INSERT INTO plans VALUES(7, 2024, 'КС-150.010', 3673);
INSERT INTO plans VALUES(7, 2024, 'КС-250.010', 1490);
INSERT INTO plans VALUES(7, 2024, 'КС-400.010', 3016);
INSERT INTO plans VALUES(7, 2024, 'КС-500.010', 4207);
INSERT INTO plans VALUES(7, 2024, 'КС-600.010', 4366);
INSERT INTO plans VALUES(7, 2024, 'КС-700.010', 4180);
INSERT INTO plans VALUES(7, 2024, 'КС-850.010', 1957);
INSERT INTO plans VALUES(7, 2024, 'КС-1000.010', 2444);
INSERT INTO plans VALUES(7, 2024, 'КС-1200.010', 4841);
INSERT INTO plans VALUES(7, 2024, 'КС-1350.010', 1947);
INSERT INTO plans VALUES(7, 2024, 'КС-1500.010', 1307);
INSERT INTO plans VALUES(7, 2024, 'КС-1700.010', 3330);
INSERT INTO plans VALUES(7, 2024, 'ТМ-32-010', 2547);