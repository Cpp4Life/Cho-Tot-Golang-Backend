USE cho_tot;

-- insert to users table
insert into users (id, phone, username, passwd, address, email, user_role)
values (1, '2045619606', 'Letisha', 'P@ssw0rd', '159 Kenwood Hill', 'lmcquilliam0@clickbank.net', false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (2, '6148906776', 'Renault', '3jF89p7l', '36667 Nancy Road', 'rdacke1@nbcnews.com', true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (3, '4756844992', 'Jenelle', '2aEvbjMf', null, null, true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (4, '3096102983', 'Terry', '3lYzgpSt', null, null, true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (5, '1379302651', 'Elfrieda', '6fTkuq8a', '0 Marquette Junction', 'elambard4@csmonitor.com', true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (6, '6103266284', 'Welsh', '4hUn5gHc', null, null, true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (7, '7415173433', 'Courtney', '2sMHphQl', '383 Forest Point', 'cdissman6@xing.com', false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (8, '6955706241', 'Gregoire', '6jSpnwCm', '00 Haas Trail', 'gmelledy7@e-recht24.de', false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (9, '5563022423', 'Herbert', '9dIszr9f', null, null, false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (10, '2365350522', 'Bernardine', '1fPDtmNg', '851 Harper Plaza', 'btixall9@goodreads.com', true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (11, '9633256091', 'Frederic', '8nVZof9e', '1340 Carey Trail', 'feltunea@tinyurl.com', false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (12, '1188197333', 'Dasie', '9kLAio2t', '384 Eggendart Lane', 'dtomkiesb@shinystat.com', false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (13, '9682009586', 'Dayna', '4tFN4zPe', '5 Glacier Hill Court', 'dgurgc@smugmug.com', false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (14, '4401600490', 'Marlena', '1kINv9Gg', '0 Bellgrove Crossing', 'mmacandreisd@sohu.com', true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (15, '3348417949', 'Dorice', '1rBK8xQq', null, null, true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (16, '5068393753', 'Eartha', '7lWGj09y', null, null, true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (17, '5993831778', 'Marci', '0uK2g6Eu', '9354 Ridge Oak Parkway', 'mgullaneg@toplist.cz', false);
insert into users (id, phone, username, passwd, address, email, user_role)
values (18, '8392791808', 'Niki', '1bREtyUh', '04 Farwell Circle', 'nwarnerh@hostgator.com', true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (19, '9648613893', 'Padget', '7bRTu2Dq', '71226 American Ash Drive', 'pdymidowiczi@yale.edu', true);
insert into users (id, phone, username, passwd, address, email, user_role)
values (20, '3439342620', 'Raquela', '4jJMaw8z', '039 Thompson Alley', 'rnajaraj@cloudflare.com', true);

-- insert to products table
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (1, 'Caladrius Biosciences, Inc.', 1, 'CAT111', 'SUB117', 1000000.99, false, null, null, '2852 Donald Lane',
        'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (2, 'NorthStar Realty Europe Corp.', 11, 'CAT101', 'SUB103', 458535160, false, null, null, '505 Elgar Junction',
        'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (3, 'Basic Energy Services, Inc.', 13, 'CAT100', 'SUB100', 663607410, true, null, null,
        '40311 Karstens Junction',
        'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (4, 'PS Business Parks, Inc.', 11, 'CAT102', 'SUB109', 936323291, false, null, null, '64 Heffernan Crossing',
        'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (5, 'Athersys, Inc.', 1, 'CAT105', 'SUB108', 815005883, true, null, null, '899 Duke Plaza',
        'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (6, 'MakeMyTrip Limited', 16, 'CAT102', 'SUB109', 883729568, false, null, null, '14 Troy Alley',
        'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (7, 'Chemed Corp.', 12, 'CAT113', 'SUB120', 319058227, true, null, null, '02 Havey Place',
        'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (8, 'Eagle Bancorp, Inc.', 15, 'CAT102', 'SUB109', 367928510, true, null, null, '64 Spaight Lane',
        'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (9, 'Verisk Analytics, Inc.', 6, 'CAT102', 'SUB109', 318771564, true, null, null, '855 Columbus Center',
        'Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (10, 'eHi Car Services Limited', 8, 'CAT101', 'SUB105', 29756384, true, null, null, '3 Ronald Regan Hill',
        'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (11, 'Toro Company (The)', 11, 'CAT105', 'SUB106', 513605662, true, null, null, '6 Chive Trail',
        'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (12, 'Zion Oil & Gas Inc', 13, 'CAT108', 'SUB112', 927247245, true, null, null, '57567 Meadow Ridge Court',
        'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (13, 'Newtek Business Services Corp.', 18, 'CAT109', 'SUB115', 599519815, false, null, null, '757 Mallard Drive',
        'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (14, 'Twenty-First Century Fox, Inc.', 3, 'CAT113', 'SUB120', 535706074, false, null, null,
        '1197 Bellgrove Place',
        'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.');
insert into products (id, product_name, user_id, cat_id, type_id, price, state, created_time, expired_time, address,
                      content)
values (15, 'Public Storage', 17, 'CAT102', 'SUB109', 717645435, false, null, null, '35 Hooker Hill',
        'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.');

-- insert to categories table
insert into categories (id, cat_name)
values ('CAT100', 'Bat Dong San');
insert into categories (id, cat_name)
values ('CAT101', 'Viec Lam');
insert into categories (id, cat_name)
values ('CAT102', 'Xe Co');
insert into categories (id, cat_name)
values ('CAT103', 'Thu Cung');
insert into categories (id, cat_name)
values ('CAT104', 'Do Dien Tu');
insert into categories (id, cat_name)
values ('CAT105', 'Thuc Pham');
insert into categories (id, cat_name)
values ('CAT106', 'Do Noi That');
insert into categories (id, cat_name)
values ('CAT107', 'Tu Lanh, May Lanh, May Giat');
insert into categories (id, cat_name)
values ('CAT108', 'Giai Tri, The Thao, So Thich');
insert into categories (id, cat_name)
values ('CAT109', 'Thoi Trang');
insert into categories (id, cat_name)
values ('CAT110', 'Me Va Be');
insert into categories (id, cat_name)
values ('CAT111', 'Van Phong Pham');
insert into categories (id, cat_name)
values ('CAT112', 'Dich Vu, Du Lich');
insert into categories (id, cat_name)
values ('CAT113', 'Cho Tang Mien Phi');

-- insert to sub-categories table
insert into sub_categories (id, type_name, cat_id)
values ('SUB100', 'Mua Ban', 'CAT100');
insert into sub_categories (id, type_name, cat_id)
values ('SUB101', 'Cho Thue', 'CAT100');
insert into sub_categories (id, type_name, cat_id)
values ('SUB102', 'Du An', 'CAT100');
insert into sub_categories (id, type_name, cat_id)
values ('SUB103', 'Lao Dong Thanh Pho', 'CAT101');
insert into sub_categories (id, type_name, cat_id)
values ('SUB104', 'Ban Hang', 'CAT101');
insert into sub_categories (id, type_name, cat_id)
values ('SUB105', 'Cong Nhan', 'CAT101');
insert into sub_categories (id, type_name, cat_id)
values ('SUB106', 'Do Dac San', 'CAT105');
insert into sub_categories (id, type_name, cat_id)
values ('SUB107', 'Thit Ga', 'CAT105');
insert into sub_categories (id, type_name, cat_id)
values ('SUB108', 'Set Qua Tet', 'CAT105');
insert into sub_categories (id, type_name, cat_id)
values ('SUB109', 'O To', 'CAT102');
insert into sub_categories (id, type_name, cat_id)
values ('SUB110', 'Cho', 'CAT103');
insert into sub_categories (id, type_name, cat_id)
values ('SUB111', 'Dien Thoai', 'CAT104');
insert into sub_categories (id, type_name, cat_id)
values ('SUB112', 'Nhac Cu', 'CAT108');
insert into sub_categories (id, type_name, cat_id)
values ('SUB113', 'Laptop', 'CAT104');
insert into sub_categories (id, type_name, cat_id)
values ('SUB114', 'Tu Lanh', 'CAT107');
insert into sub_categories (id, type_name, cat_id)
values ('SUB115', 'Dong Ho', 'CAT109');
insert into sub_categories (id, type_name, cat_id)
values ('SUB116', 'Ban Ghe', 'CAT106');
insert into sub_categories (id, type_name, cat_id)
values ('SUB117', 'Do Dung Van Phong', 'CAT111');
insert into sub_categories (id, type_name, cat_id)
values ('SUB118', 'Xe Day Em Be', 'CAT110');
insert into sub_categories (id, type_name, cat_id)
values ('SUB119', 'Du Lich', 'CAT112');
insert into sub_categories (id, type_name, cat_id)
values ('SUB120', 'Khac', 'CAT113');
