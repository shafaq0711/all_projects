-- ============================================================
-- RETAIL SALES DATABASE — 7-TABLE NORMALIZED SCHEMA
-- BSCS Semester 4 | Database Systems CSC 281
-- ============================================================

DROP DATABASE IF EXISTS RetailSales;
CREATE DATABASE RetailSales;
USE RetailSales;


-- ============================================================
-- DDL — CREATE TABLES (7 tables)
-- ============================================================

-- TABLE 1: CUSTOMERS
CREATE TABLE CUSTOMERS (
    Customer_ID         INT           PRIMARY KEY,
    Name                VARCHAR(100),
    Email               VARCHAR(150),
    Phone               VARCHAR(30),
    Age                 INT,
    Gender              VARCHAR(10),
    Income              VARCHAR(20),
    Customer_Segment    VARCHAR(20),
    Customer_Since      DATE
);

-- TABLE 2: ADDRESSES
CREATE TABLE ADDRESSES (
    Address_ID          VARCHAR(10)   PRIMARY KEY,
    Customer_ID         INT,
    Address             VARCHAR(255),
    City                VARCHAR(100),
    State               VARCHAR(100),
    Zipcode             VARCHAR(20),
    Country             VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS(Customer_ID)
);

-- TABLE 3: PRODUCTS
CREATE TABLE PRODUCTS (
    Product_ID          VARCHAR(10)   PRIMARY KEY,
    Product_Name        VARCHAR(150),
    Product_Category    VARCHAR(50),
    Product_Brand       VARCHAR(50),
    Product_Type        VARCHAR(50)
);

-- TABLE 4: TRANSACTION_HEADERS (110 rows — one per transaction)
CREATE TABLE TRANSACTION_HEADERS (
    Transaction_ID      INT           PRIMARY KEY,
    Customer_ID         INT,
    Address_ID          VARCHAR(10),
    Date                DATE,
    Time                TIME,
    Total_Purchases     INT,
    Amount              DECIMAL(10,2),
    Feedback            VARCHAR(20),
    Ratings             INT,
    Loyalty_Score_Raw   INT,
    Notes               TEXT,
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMERS(Customer_ID),
    FOREIGN KEY (Address_ID)  REFERENCES ADDRESSES(Address_ID)
);

-- TABLE 5: TRANSACTION_ITEMS (138 rows — one per product line)
CREATE TABLE TRANSACTION_ITEMS (
    TransactionProduct_ID  VARCHAR(10)  PRIMARY KEY,
    Transaction_ID         INT,
    Product_ID             VARCHAR(10),
    FOREIGN KEY (Transaction_ID) REFERENCES TRANSACTION_HEADERS(Transaction_ID),
    FOREIGN KEY (Product_ID)     REFERENCES PRODUCTS(Product_ID)
);

-- TABLE 6: SHIPMENTS
CREATE TABLE SHIPMENTS (
    Shipping_ID         VARCHAR(10)   PRIMARY KEY,
    Transaction_ID      INT,
    Shipping_Method     VARCHAR(30),
    Order_Status        VARCHAR(30),
    FOREIGN KEY (Transaction_ID) REFERENCES TRANSACTION_HEADERS(Transaction_ID)
);

-- TABLE 7: PAYMENTS
CREATE TABLE PAYMENTS (
    Payment_ID          VARCHAR(10)   PRIMARY KEY,
    Transaction_ID      INT,
    Payment_Method      VARCHAR(30),
    FOREIGN KEY (Transaction_ID) REFERENCES TRANSACTION_HEADERS(Transaction_ID)
);


-- ============================================================
-- DML — INSERT INTO CUSTOMERS (110 rows)
-- ============================================================

INSERT INTO CUSTOMERS VALUES
(10041, 'Heather Bean',        'Edward51@Gmail.com',          '+30 383 51856',      69,   'Female', 'Low',    'Regular', '2019-07-21'),
(10371, 'COURTNEY MATHIS',     'Rhonda98@gmail.COM',          '+1-684-821-9317',    70,   'Male',   NULL,     'Regular', '2022-09-24'),
(10813, 'Dustin Barber',       'THERESA67@GMAIL.COM',         '7230325451',         26,   'Male',   NULL,     'New',     '2016-04-17'),
(10862, 'William Rice',        'Tina2@gmail.com',             '+42 685 05060',      46,   'Male',   'Medium', 'New',     '2016-06-10'),
(11029, 'Christine Mcgee',     'William69@gmail.com',         '8845357942',         34,   'Male',   'Low',    'New',     '2023-04-28'),
(13236, 'Robert Sloan',        'Joseph57@gmail.com',          '+79 712 53664',      46,   'Female', 'Medium', 'Regular', '2018-01-12'),
(14018, 'Ruben Bell',          'AARON36@GMAIL.COM',           '(412) 901-9496',     20,   'Male',   'Low',    'New',     '2015-04-12'),
(14372, 'Sara Cruz',           'REBECCA38@GMAIL.COM',         '+1-666-615-4051',    32,   'Female', 'Medium', 'Premium', '2015-06-12'),
(15477, 'Teresa Gonzalez',     'Cameron24@gmail.com',         '755.665.4013',       46,   'Male',   'Medium', 'Regular', '2023-04-18'),
(16416, 'Jeremy Dillon',       'Angela55@gmail.COM',          '(783) 050-5947',     22,   'Female', 'Low',    'Premium', '2022-04-27'),
(16810, 'Kevin Green',         'Alyssa72@gmail.com',          '(118) 086-9718',     67,   'Male',   'Medium', 'Regular', '2017-08-17'),
(16975, 'JOSHUA THOMPSON',     'SAMUEL52@GMAIL.COM',          '+1-341-664-8718',    23,   'Male',   'High',   'Premium', '2022-07-16'),
(17565, 'Jennifer Brown',      'Sarah19@gmail.com',           '4928409041',         34,   'Female', 'Low',    'Premium', '2016-02-23'),
(18734, 'Angela Cobb',         'Robin24@gmail.com',           '+86 364 39640',      70,   'Female', NULL,     'Premium', '2020-07-23'),
(18748, 'Christopher Stewart', 'Teresa79@gmail.com',          '+15 492 72184',      26,   'Male',   'Medium', 'Regular', '2022-01-13'),
(20423, 'Dr. Jesse Roberts',   'John57@gmail.com',            '+61 204 22311',      23,   'Male',   'High',   'Regular', '2015-07-20'),
(21406, 'Timothy Pineda',      'Laurie14@gmail.com',          '(331) 686-7107',     NULL, 'Male',   'Medium', 'Premium', '2016-04-16'),
(21621, 'Traci Lopez',         'Robin48@gmail.COM',           '+73 799 47138',      NULL, 'Female', 'Medium', 'New',     '2018-09-24'),
(21826, 'Cesar Miller',        'April19@gmail.com',           '+39 080 74635',      24,   'Male',   'High',   'Regular', '2017-07-15'),
(22412, 'Randy Parsons',       'Sarah34@gmail.com',           '551.790.4755',       38,   'Female', 'Medium', 'Premium', '2019-08-17'),
(23316, 'CHAD GOODMAN',        'Erik58@Gmail.com',            '+1-260-095-3390',    58,   'Female', 'Low',    'Regular', '2016-08-27'),
(24134, 'AMANDA WILLIAMSON',   'Natalie87@gmail.com',         '+1-609-588-7823',    22,   'Male',   'Medium', 'Regular', '2016-01-27'),
(24749, 'KEVIN BARNETT',       'ANDREW84@GMAIL.COM',          '+1-804-716-1488',    26,   'Female', 'Medium', 'New',     '2015-02-17'),
(25770, 'Sara Holloway',       'Joyce5@gmail.com',            '7573236489',         20,   'Male',   'Medium', 'Regular', '2017-07-25'),
(26174, 'Sally Steele',        'Margaret48@gmail.com',        '9761441370',         20,   'Male',   'Medium', 'Regular', '2022-04-22'),
(26844, 'Elizabeth Anderson',  'Tina95@gmail.com',            '331.675.0689',       39,   'Male',   'Medium', 'Premium', '2015-03-22'),
(26963, 'Tony Carter',         'Julie59@gmail.com',           '331.714.4734',       54,   'Female', 'Low',    'Premium', '2015-07-18'),
(27020, 'Clifford Fisher',     'Alexa3@gmail.com',            '3005484206',         20,   'Female', 'Low',    'Regular', '2022-05-23'),
(28693, 'SARA DANIELS',        'Michelle71@Gmail.com',        '+1-727-432-1910',    34,   'Male',   'Medium', 'New',     '2023-08-14'),
(31203, 'Victoria Martin',     'LAURIE59@GMAIL.COM',          '359.877.7977',       54,   'Male',   'Medium', 'New',     '2018-05-16'),
(31255, 'Eric Hall',           'Natalie88@gmail.com',         '902.463.2613',       36,   'Female', 'Low',    'New',     '2015-09-11'),
(32299, 'Amy Smith',           'Matthew4@Gmail.com',          '(175) 845-4112',     32,   'Female', 'Low',    'New',     '2020-01-11'),
(34000, 'James Keller',        'Deborah49@gmail.com',         '216.937.8284',       24,   'Male',   'Medium', 'Regular', '2022-09-26'),
(34011, 'JASON JACKSON',       'Michael15@gmail.com',         '+1-547-624-3719',    34,   'Male',   'Medium', 'New',     '2017-01-26'),
(36360, 'Vincent Bates',       'Raymond90@gmail.COM',         '+38 725 36065',      26,   'Male',   'High',   'Premium', '2016-03-12'),
(36493, 'ISABELLA HARRELL',    'DONALD84@GMAIL.COM',          '+1-467-004-1204',    46,   'Male',   NULL,     'Premium', '2016-04-22'),
(37006, 'David Martin',        'Erin16@Gmail.com',            '2131047125',         22,   'Male',   'Medium', 'New',     '2016-04-28'),
(37567, 'JASON MARTINEZ',      'Caitlin59@gmail.com',         '+1-215-343-4035',    NULL, 'Female', 'Medium', 'New',     '2015-02-23'),
(37756, 'Aaron Thomas',        'Jason18@gmail.com',           '557.196.7760',       20,   'Male',   'High',   'Regular', '2023-06-18'),
(37816, 'KRISTEN SMITH',       'Terri68@gmail.com',           '+1-933-974-8860',    18,   'Female', 'Low',    'Premium', '2018-06-17'),
(38605, 'Joseph Jenkins',      'Jacob38@gmail.COM',           '2479973232',         44,   'Male',   'Low',    'Premium', '2019-07-14'),
(39305, 'Gary Brown',          'ROBERT78@GMAIL.COM',          '(468) 822-2858',     43,   'Male',   'Medium', 'New',     '2019-08-20'),
(39899, 'Brandon Mckenzie',    'Heather48@gmail.COM',         '703.640.4923',       23,   'Female', 'High',   'Regular', '2016-01-24'),
(40857, 'Mark Martin',         'Bryan74@Gmail.com',           '894.421.1937',       51,   'Male',   'Medium', 'New',     '2016-02-27'),
(44854, 'April Mccarthy',      'Melissa58@gmail.com',         '+43 015 71879',      20,   'Female', 'Low',    'New',     '2018-09-18'),
(44887, 'Kathy Cole',          'Victor91@Gmail.com',          '9350024988',         25,   'Male',   'High',   'Premium', '2017-06-12'),
(46272, 'Thomas Bernard',      'TIMOTHY48@GMAIL.COM',         '914.807.1132',       63,   'Male',   'High',   'New',     '2018-06-19'),
(47141, 'Ryan Adkins',         'Crystal52@gmail.com',         '(895) 782-4938',     34,   'Male',   'Medium', 'Regular', '2017-08-27'),
(49811, 'Mrs. Susan Jimenez',  'Susan100@gmail.COM',          '4681771964',         51,   'Male',   'High',   'Regular', '2019-09-10'),
(50885, 'Ashley Jackson',      'Julie69@gmail.COM',           '+54 558 69629',      31,   'Male',   'Medium', 'Premium', '2023-05-13'),
(51832, 'Brandon Adams',       'Dustin45@gmail.com',          '409.515.3263',       25,   'Male',   'Low',    'New',     '2017-05-13'),
(53421, 'Ana Lester',          'ERIK5@GMAIL.COM',             '+76 569 87668',      22,   'Male',   'Medium', 'Premium', '2016-09-14'),
(54271, 'Ryan Poole',          'CHRISTOPHER8@GMAIL.COM',      '(385) 031-4106',     46,   'Female', 'Medium', 'Regular', '2019-05-16'),
(54476, 'ANTONIO RICE',        'Jared82@gmail.com',           '+1-893-355-7535',    64,   'Male',   'High',   'Regular', '2020-04-18'),
(55034, 'Paula Bird',          'Michael6@gmail.com',          '+51 949 41709',      34,   'Female', 'High',   'Premium', '2023-08-18'),
(56595, 'KYLE BURTON',         'Corey96@gmail.com',           '+1-563-980-3464',    NULL, 'Male',   'High',   'Regular', '2015-02-23'),
(56768, 'TRACY SMITH',         'David10@Gmail.com',           '+1-717-579-9554',    20,   'Male',   'Low',    'New',     '2019-01-10'),
(57257, 'Natasha Jennings',    'David55@gmail.com',           '5206341813',         39,   'Male',   'Medium', 'Regular', '2020-03-18'),
(57326, 'Joseph Santana',      'Taylor13@gmail.com',          '6526901323',         43,   'Male',   'Low',    'New',     '2017-08-27'),
(59676, 'Wayne Bowman',        'William35@gmail.COM',         '7193369563',         19,   'Male',   'Medium', 'Regular', '2021-09-10'),
(60415, 'Kelli Brock',         'Timothy96@gmail.COM',         '2138972596',         NULL, 'Male',   'Low',    'Premium', '2016-02-14'),
(60857, 'Julia Lester',        'Heather16@Gmail.com',         '+35 885 68009',      37,   'Male',   'Medium', 'New',     '2023-01-21'),
(61410, 'Sarah White',         'Kayla45@gmail.COM',           '(943) 981-5115',     35,   'Male',   'Medium', 'Regular', '2023-03-23'),
(61807, 'David Zamora',        'Jennifer45@gmail.com',        '+47 287 92398',      46,   'Female', NULL,     'Regular', '2017-01-19'),
(62219, 'Samuel Brown',        'Luis95@gmail.com',            '(510) 145-2840',     61,   'Male',   'Low',    'New',     '2020-01-21'),
(62281, 'Timothy Reed',        'SUSAN73@GMAIL.COM',           '827.297.0923',       43,   'Male',   'Low',    'Premium', '2018-04-13'),
(64205, 'Valerie Griffin',     'Stephanie50@gmail.com',       '(235) 391-4129',     19,   'Female', 'Medium', 'Premium', '2020-09-23'),
(64547, 'NICOLE CUMMINGS',     'Julia50@gmail.com',           '+1-526-683-0792',    40,   'Female', 'Medium', 'Premium', '2017-04-15'),
(65091, 'Larry Cole',          'Angela42@gmail.com',          '5263475275',         23,   'Male',   'Medium', 'New',     '2017-07-10'),
(65955, 'Jeffery Watkins',     'Jenny67@gmail.com',           '(904) 568-7824',     42,   'Male',   'Medium', 'Regular', '2017-06-23'),
(67676, 'Marc Vargas',         'Kevin48@gmail.com',           '(581) 176-6977',     61,   'Male',   'Low',    'Premium', '2018-05-15'),
(68013, 'Sherry Ochoa',        'EDWIN28@GMAIL.COM',           '7796752409',         34,   'Female', 'Low',    'Regular', '2016-07-11'),
(68086, 'Veronica Austin',     'Abigail65@gmail.com',         NULL,                 46,   'Male',   'Low',    'New',     '2022-04-16'),
(68375, 'Lawrence Martinez',   'Natalie2@Gmail.com',          '(460) 514-9843',     35,   'Female', 'Low',    'New',     '2022-06-19'),
(69736, 'Taylor Martin',       'Stephanie95@gmail.com',       '100.229.8716',       26,   'Male',   'High',   'Premium', '2018-04-10'),
(70261, 'Shelly Cross',        'Nancy14@gmail.com',           '5696330434',         NULL, 'Male',   'Low',    'Regular', '2018-07-20'),
(71315, 'Elizabeth Soto',      'Kiara75@Gmail.com',           '573.921.5253',       55,   'Female', NULL,     'New',     '2019-02-18'),
(72555, 'Richard Tyler',       'LOUIS38@GMAIL.COM',           '+11 843 59827',      49,   'Male',   NULL,     'New',     '2020-09-22'),
(73021, 'Mrs. Mary Ferguson',  'Michael43@gmail.COM',         '290.200.1501',       49,   'Male',   'Low',    'Premium', '2023-06-10'),
(73651, 'JOHN FLOWERS',        'Gabrielle4@gmail.com',        '+1-121-093-4050',    23,   'Male',   'High',   'Regular', '2016-05-15'),
(74172, 'Mark Bowers',         'KEITH31@GMAIL.COM',           '+48 293 13804',      46,   'Male',   'Low',    'Premium', '2019-01-13'),
(74578, 'Alex Hale',           'Wendy52@gmail.COM',           '653.236.5255',       20,   'Male',   'Low',    'Premium', '2021-06-20'),
(74839, 'Amy Potter',          'Steven51@Gmail.com',          '483.739.1990',       26,   'Female', 'Medium', 'Regular', '2021-09-13'),
(76316, 'Melvin Cook',         'Dawn44@gmail.com',            '+29 237 85929',      34,   'Male',   'Medium', 'New',     '2021-04-18'),
(76429, 'Brittany Roberts',    'Heather6@gmail.COM',          '(695) 352-7610',     20,   'Male',   'Medium', 'Regular', '2015-07-10'),
(77031, 'Nicole Abbott',       'Steven3@gmail.com',           '3717178896',         22,   'Male',   'High',   'Regular', '2023-09-16'),
(78306, 'ALEJANDRO SALAS',     'Kayla91@gmail.COM',           '+1-581-611-4736',    46,   'Male',   'Low',    'Premium', '2020-07-12'),
(81403, 'JANE PRINCE',         'Nancy11@gmail.com',           '+1-587-161-0592',    47,   'Female', 'Low',    'New',     '2020-06-13'),
(83702, 'Michael Welch',       'Michelle59@Gmail.com',        '+47 720 22241',      22,   'Male',   'Medium', 'New',     '2019-09-19'),
(84190, 'Jeremy Garcia',       'Bobby36@gmail.com',           '417.615.1583',       50,   'Female', 'Low',    'Premium', '2021-06-22'),
(84433, 'Gerald Cox',          'Jessica20@Gmail.com',         '4287764859',         42,   'Male',   'High',   'New',     '2019-09-14'),
(86260, 'Brian Gardner',       'Crystal33@gmail.com',         '(104) 040-3802',     19,   'Male',   'Medium', 'Premium', '2018-07-22'),
(86301, 'Eric Peters',         'David82@gmail.com',           '373.422.3751',       26,   'Male',   'High',   'Regular', '2017-05-22'),
(86977, 'Danielle Cole',       'Robert55@gmail.com',          '(356) 033-3620',     68,   'Female', 'Medium', 'Premium', '2023-01-19'),
(88993, 'AUDREY TURNER',       'Christopher91@gmail.com',     '+1-420-299-8937',    24,   'Male',   'Medium', 'Premium', '2019-04-23'),
(89260, 'Kimberly Mitchell',   'Erica1@gmail.com',            '395.415.7681',       24,   'Female', 'Medium', 'Premium', '2020-08-24'),
(89748, 'ALICIA BOLTON',       'Brooke31@gmail.com',          '+1-965-794-9697',    45,   'Male',   'Medium', 'Premium', '2022-04-26'),
(90854, 'Christopher Young',   'John66@gmail.com',            '+12 014 11590',      20,   'Female', 'Low',    'New',     '2022-03-12'),
(94463, 'Alvin James',         'Veronica78@gmail.com',        '2471683320',         22,   'Male',   'Medium', 'Regular', '2019-09-20'),
(94787, 'Sherry Smith',        'Alexandra19@gmail.com',       '(744) 144-9303',     55,   'Female', 'Medium', 'New',     '2016-04-19'),
(94812, 'Renee Ward',          'Amber12@Gmail.com',           '719.492.3673',       46,   'Female', 'Medium', 'New',     '2018-04-14'),
(95152, 'SEAN WELCH',          'Maria25@gmail.com',           '+1-252-230-7212',    58,   'Female', 'Medium', 'Regular', '2015-01-17'),
(95413, 'Diane Harrington',    'Crystal64@gmail.com',         '4013843545',         20,   'Male',   'Low',    'New',     '2022-02-24'),
(95778, 'Raymond Howard',      'NICHOLAS64@GMAIL.COM',        '8966149719',         34,   'Male',   'Low',    'Regular', '2021-04-22'),
(97224, 'Robert Meyer',        'Amanda95@gmail.com',          '(130) 087-2253',     39,   'Female', 'Low',    'New',     '2022-07-17'),
(97864, 'STEVEN MORRIS',       'Michael96@gmail.COM',         '+1-640-012-4651',    34,   'Male',   'Medium', 'New',     '2017-01-13'),
(98280, 'Rachel Harrington',   'Olivia25@gmail.com',          '+93 187 88222',      41,   'Male',   'Low',    'Premium', '2021-04-15'),
(99003, 'Sean Munoz',          'Bill5@Gmail.com',             '(591) 836-7599',     46,   'Male',   'Medium', 'Premium', '2023-08-11'),
(99340, 'Reginald Espinoza',   'Shane41@gmail.com',           '+46 276 94809',      32,   'Female', 'Medium', 'New',     '2023-04-13'),
(99975, 'Kathy Santos',        'Joshua42@gmail.com',          '(551) 452-1575',     56,   'Male',   'Medium', 'Premium', '2022-03-24');


-- ============================================================
-- DML — INSERT INTO ADDRESSES (110 rows)
-- ============================================================

INSERT INTO ADDRESSES VALUES
('A001', 10041, '60231 Trevor Viaduct Suite 854',      'Cardiff',            'England',          '43153', 'UK'),
('A002', 10371, '9768 Victor Streets',                  'Gold Coast',         'New South Wales',  '18558', 'Australia'),
('A003', 10813, '24584 Patricia Cape',                  'San Francisco',      'Maine',            '67616', 'USA'),
('A004', 10862, '4231 Samantha Divide Suite 100',       'New Orleans',        'Arkansas',         '71739', 'USA'),
('A005', 11029, '989 Caroline Rest Apt. 270',           'Raleigh',            'Vermont',          '5379',  'USA'),
('A006', 13236, '238 Green Village',                    'Arlington',          'South Dakota',     '57597', 'USA'),
('A007', 14018, '10391 Timothy Canyon Suite 351',       'Victoria',           'Ontario',          '40978', 'Canada'),
('A008', 14372, '357 Adam Fields Suite 413',            'Stuttgart',          'Berlin',           NULL,    'Germany'),
('A009', 15477, '640 Wheeler Parks Apt. 622',           'Hamburg',            'Berlin',           '53381', 'Germany'),
('A010', 16416, '543 Cox Skyway',                       'Brighton',           'England',          '46575', 'UK'),
('A011', 16810, '7652 Prince Gateway',                  'Hamilton',           'Ontario',          '79434', 'Canada'),
('A012', 16975, '2668 Austin Courts Apt. 215',          'San Francisco',      'Maine',            '20812', 'USA'),
('A013', 17565, '214 Lloyd Ranch',                      'Newcastle upon Tyne','England',          '6026',  'UK'),
('A014', 18734, '02492 Michael Circle Apt. 881',        'Darwin',             'New South Wales',  '63184', 'Australia'),
('A015', 18748, '32854 Jacqueline Vista Apt. 994',      'Belfast',            'England',          '26751', 'UK'),
('A016', 20423, '501 Banks Fords',                      'Boston',             'Georgia',          '12560', 'USA'),
('A017', 21406, '9328 Craig Flat Suite 793',            'London',             'Ontario',          '89071', 'Canada'),
('A018', 21621, '110 Kelsey Well Suite 899',            'Townsville',         'New South Wales',  '48100', 'Australia'),
('A019', 21826, '2631 Gregory Run',                     'Bremen',             'Berlin',           '82130', 'Germany'),
('A020', 22412, '741 Angel Place Apt. 394',             'Minneapolis',        'Massachusetts',    NULL,    'USA'),
('A021', 23316, '61311 Rivera Circle',                  'Long Beach',         'Alabama',          '35539', 'USA'),
('A022', 24134, '25785 Chambers Crest',                 'Wollongong',         'New South Wales',  '20876', 'Australia'),
('A023', 24749, '61521 Evans Expressway',               'Victoria',           'Ontario',          '75936', 'Canada'),
('A024', 25770, '6875 Dakota Drive',                    'Mackay',             'New South Wales',  '45440', 'Australia'),
('A025', 26174, '3639 Russell Streets',                 'Omaha',              'Connecticut',      '6168',  'USA'),
('A026', 26844, '7667 Jeffrey Mountain',                'Cairns',             'New South Wales',  '78185', 'Australia'),
('A027', 26963, '6870 Gallagher Walk Apt. 019',         'Calgary',            'Ontario',          '41424', 'Canada'),
('A028', 27020, '90623 Hart Unions',                    'Frankfurt',          'Berlin',           '85404', 'Germany'),
('A029', 28693, '4141 Scott Burgs',                     'Bendigo',            'New South Wales',  '76394', 'Australia'),
('A030', 31203, '4044 Katherine Wells',                 'Toowoomba',          'New South Wales',  '84782', 'Australia'),
('A031', 31255, '0591 Lori Junction',                   'Hamburg',            'Berlin',           '41427', 'Germany'),
('A032', 32299, '642 John Motorway Suite 015',          'Albury-Wodonga',     'New South Wales',  '96417', 'Australia'),
('A033', 34000, '3397 Katie Road Apt. 567',             'Portsmouth',         'England',          '79884', 'UK'),
('A034', 34011, '50266 Matthew Pine',                   'Chicago',            'Connecticut',      '36225', 'USA'),
('A035', 36360, '59599 Cook Avenue Apt. 122',           'San Francisco',      'Maine',            '62793', 'USA'),
('A036', 36493, '934 Marks Squares',                    'Perth',              'New South Wales',  '69826', 'Australia'),
('A037', 37006, '2854 Garcia Crossroad Apt. 527',       'Frankfurt',          'Berlin',           '77475', 'Germany'),
('A038', 37567, '324 Ashley Common',                    'Bristol',            'England',          '55888', 'UK'),
('A039', 37756, '32905 Palmer Alley Suite 735',         'Hamilton',           'Ontario',          '39996', 'Canada'),
('A040', 37816, '12209 Larry Turnpike Apt. 547',        'Plymouth',           'England',          '70012', 'UK'),
('A041', 38605, '1354 Robin Views',                     'Quebec City',        'Ontario',          '32297', 'Canada'),
('A042', 39305, '7894 Devon Crest',                     'Hobart',             'New South Wales',  '6989',  'Australia'),
('A043', 39899, '20334 Brown Mountain Apt. 957',        'Boston',             'Georgia',          '92884', 'USA'),
('A044', 40857, '66939 Julie Circle',                   'London',             'England',          '37912', 'UK'),
('A045', 44854, '048 Christopher Haven Apt. 763',       'Chicago',            'Connecticut',      '68714', 'USA'),
('A046', 44887, '2372 Melissa Cliffs Suite 184',        'Sydney',             'New South Wales',  NULL,    'Australia'),
('A047', 46272, '5629 Mcguire Ferry Apt. 321',          'Southampton',        'England',          '8544',  'UK'),
('A048', 47141, '1646 Carey Pike Apt. 345',             'Chicago',            'Connecticut',      NULL,    'USA'),
('A049', 49811, '654 Robinson Highway Apt. 294',        'Duisburg',           'Berlin',           '14029', 'Germany'),
('A050', 50885, '318 Miranda Extensions Suite 973',     'Columbus',           'Delaware',         '19820', 'USA'),
('A051', 51832, '27853 Joyce Creek Suite 913',          'Gold Coast',         'New South Wales',  '94524', 'Australia'),
('A052', 53421, '226 Jacqueline Flat',                  'Munich',             'Berlin',           '52467', 'Germany'),
('A053', 54271, '0792 Mathis Garden Apt. 028',          'Regina',             'Ontario',          '51681', 'Canada'),
('A054', 54476, '27369 Emily Road',                     'Leeds',              'England',          '10092', 'UK'),
('A055', 55034, '59182 Daniel Isle',                    'Chicago',            'Connecticut',      '64861', 'USA'),
('A056', 56595, '79331 Alyssa Extensions Apt. 787',     'Berlin',             'Berlin',           '18832', 'Germany'),
('A057', 56768, '3421 Crane Mountain',                  'Frankfurt',          'Berlin',           '91627', 'Germany'),
('A058', 57257, '9516 Natalie Avenue',                  'Wollongong',         'New South Wales',  '61038', 'Australia'),
('A059', 57326, '645 Scott Rest',                       'Hamburg',            'Berlin',           '88747', 'Germany'),
('A060', 59676, '4542 Michael Island',                  'Fort Worth',         'New Mexico',       '90041', 'USA'),
('A061', 60415, '994 Petersen Mews Apt. 685',           'Chicago',            'Connecticut',      '90106', 'USA'),
('A062', 60857, '760 Brittany Mountains',               'Halifax',            'Ontario',          '98022', 'Canada'),
('A063', 61410, '48738 Jack Center',                    'Oshawa',             'Ontario',          '26193', 'Canada'),
('A064', 61807, '4188 Phillip Inlet',                   'Louisville',         'New Mexico',       NULL,    'USA'),
('A065', 62219, '3978 Sabrina Squares Apt. 849',        'Washington',         'Washington',       '99070', 'USA'),
('A066', 62281, '93412 Anthony Village Suite 173',      'London',             'Ontario',          '75511', 'Canada'),
('A067', 64205, '718 Tamara Locks',                     'Portsmouth',         'England',          '34772', 'UK'),
('A068', 64547, '88767 Fowler Tunnel Suite 182',        'Mackay',             'New South Wales',  '47084', 'Australia'),
('A069', 65091, '41474 Hunter Square',                  'Bielefeld',          'Berlin',           NULL,    'Germany'),
('A070', 65955, '018 Donna Garden Apt. 195',            'Chicago',            'Connecticut',      '6026',  'USA'),
('A071', 67676, '82057 Thompson Lakes Apt. 177',        'Glasgow',            'England',          '9528',  'UK'),
('A072', 68013, '7010 Carr Station Suite 997',          'Chicago',            'Connecticut',      '48224', 'USA'),
('A073', 68086, '257 Bradley Villages Suite 220',       'Hamburg',            'Berlin',           '7757',  'Germany'),
('A074', 68375, '188 Matthew Rue',                      'London',             'England',          '40894', 'UK'),
('A075', 69736, '400 Roy Crest Suite 325',              'San Francisco',      'Maine',            '94672', 'USA'),
('A076', 70261, '02860 Don Lodge',                      'London',             'Ontario',          '98029', 'Canada'),
('A077', 71315, '84602 Thomas Spur Suite 203',          'Leeds',              'England',          '71342', 'UK'),
('A078', 72555, '025 Melody Pine Apt. 554',             'Brisbane',           'New South Wales',  '19840', 'Australia'),
('A079', 73021, '3351 Tanner Roads Apt. 040',           'Kelowna',            'Ontario',          '32652', 'Canada'),
('A080', 73651, '0977 Stevens Mill Suite 499',          'Boston',             'Georgia',          '99609', 'USA'),
('A081', 74172, '24540 Monica Fall Suite 750',          'Cairns',             'New South Wales',  '79222', 'Australia'),
('A082', 74578, '5107 Christine Turnpike',              'Toronto',            'Ontario',          '16233', 'Canada'),
('A083', 74839, '21800 Brittany Stravenue',             'Launceston',         'New South Wales',  '2843',  'Australia'),
('A084', 76316, '616 Adam Loop Suite 034',              'Chicago',            'Connecticut',      '25847', 'USA'),
('A085', 76429, '77955 West Well Suite 082',            'Seattle',            'Colorado',         '80879', 'USA'),
('A086', 77031, '891 Wu Court',                         'Frankfurt',          'Berlin',           '60858', 'Germany'),
('A087', 78306, '9606 Kaitlin Knoll Apt. 457',          'Milwaukee',          'Florida',          '32556', 'USA'),
('A088', 81403, '4280 Kent Drive',                      'Bochum',             'Berlin',           '74390', 'Germany'),
('A089', 83702, '3164 Jeffrey Row Suite 967',           'Frankfurt',          'Berlin',           '36413', 'Germany'),
('A090', 84190, '65530 Harrison Causeway Apt. 556',     'Portland',           'Rhode Island',     '2892',  'USA'),
('A091', 84433, '70795 Hannah Crescent Apt. 315',       'Raleigh',            'Minnesota',        '55716', 'USA'),
('A092', 86260, '314 Stewart Radial',                   'Portsmouth',         'England',          '81292', 'UK'),
('A093', 86301, '422 David Rapids Apt. 487',            'San Francisco',      'Maine',            '68324', 'USA'),
('A094', 86977, '38962 Woodward Underpass',             'Sacramento',         'Vermont',          '5120',  'USA'),
('A095', 88993, '461 Danielle Springs',                 'Portsmouth',         'England',          '85508', 'UK'),
('A096', 89260, '947 Megan Rapid',                      'Portsmouth',         'England',          '30351', 'UK'),
('A097', 89748, '2765 Ellis Plaza Apt. 018',            'Glasgow',            'England',          '90252', 'UK'),
('A098', 90854, '26603 Samantha Course Suite 836',      'Victoria',           'Ontario',          '1683',  'Canada'),
('A099', 94463, '128 Justin Camp Apt. 389',             'Frankfurt',          'Berlin',           '83693', 'Germany'),
('A100', 94787, '9422 Jacobs Causeway',                 'Munich',             'Berlin',           '39457', 'Germany'),
('A101', 94812, '146 Fisher Centers Suite 533',         'Essen',              'Berlin',           '12622', 'Germany'),
('A102', 95152, '0489 Tara Rapids Suite 890',           'Sheffield',          'England',          '37559', 'UK'),
('A103', 95413, '0641 Brittany Knoll',                  'Kelowna',            'Ontario',          '53603', 'Canada'),
('A104', 95778, '5502 Reyes Spring',                    'Chicago',            'Connecticut',      '99518', 'USA'),
('A105', 97224, '30330 Nathan Bypass Suite 325',        'Charlotte',          'Louisiana',        '70621', 'USA'),
('A106', 97864, '6021 Dawn Point Apt. 951',             'Chicago',            'Connecticut',      '57464', 'USA'),
('A107', 98280, '8423 Garcia Bridge',                   'Leeds',              'England',          '67550', 'UK'),
('A108', 99003, '4326 Kimberly Prairie Suite 897',      'Louisville',         'West Virginia',    '25646', 'USA'),
('A109', 99340, '82674 Erica Ridge',                    'New York',           'Florida',          NULL,    'USA'),
('A110', 99975, '653 Farrell Squares',                  'Cairns',             'New South Wales',  '98069', 'Australia');


-- ============================================================
-- DML — INSERT INTO PRODUCTS (96 rows)
-- FIX: 'Mitsubhisi' corrected to 'Mitsubishi' directly in INSERT
-- FIX: 'Whirepool' corrected to 'Whirlpool' directly in INSERT
-- ============================================================

INSERT INTO PRODUCTS VALUES
('P001', 'Running shoes',               'Clothing',    'Nike',              'Shoes'),
('P002', 'Notebook',                    'Electronics', 'Samsung',           'Laptop'),
('P003', 'T-shirt',                     'Clothing',    'Zara',              'Shirt'),
('P004', 'Dystopian',                   'Books',       'HarperCollins',     'Fiction'),
('P005', 'Samsung Galaxy',              'Electronics', 'Apple',             'Smartphone'),
('P006', 'Scoop neck tee',              'Clothing',    'Nike',              'T-shirt'),
('P007', 'Water bottle',                'Grocery',     'Nestle',            'Water'),
('P008', '4K TV',                       'Electronics', 'Samsung',           'Television'),
('P009', 'Iced tea',                    'Grocery',     'Pepsi',             'Soft Drink'),
('P010', 'Health',                      'Books',       'Random House',      'Non-Fiction'),
('P011', 'Athletic shorts',             'Clothing',    'Nike',              'Shorts'),
('P012', 'USB cable',                   'Electronics', 'Apple',             'Smartphone'),
('P013', 'Stove',                       'Home Decor',  'Bed Bath & Beyond', 'Kitchen'),
('P014', 'On-ear headphones',           'Electronics', 'Sony',              'Headphones'),
('P015', 'Business',                    'Books',       'Penguin Books',     'Non-Fiction'),
('P016', 'Earphones',                   'Electronics', 'Sony',              'Headphones'),
('P017', 'Bermuda shorts',              'Clothing',    'Nike',              'Shorts'),
('P018', 'Trail mix',                   'Grocery',     'Nestle',            'Snacks'),
('P019', 'Table lamps',                 'Home Decor',  'IKEA',              'Lighting'),
('P020', 'Books',                       'Books',       'Penguin Books',     'Children''s'),
('P021', 'Purified water',              'Grocery',     'Pepsi',             'Water'),
('P022', 'Bathtub',                     'Home Decor',  'Bed Bath & Beyond', 'Bathroom'),
('P023', 'Window AC',                   'Electronics', 'Mitsubisi',        'AC'), 
('P024', 'Pen set',                     'Home Decor',  'IKEA',              'Decorations'),
('P025', 'Raglan tee',                  'Clothing',    'Nike',              'T-shirt'),
('P026', 'Sneakers',                    'Clothing',    'Adidas',            'Shoes'),
('P027', 'Plasma TV',                   'Electronics', 'Sony',              'Television'),
('P028', 'Long-sleeve tee',             'Clothing',    'Adidas',            'T-shirt'),
('P029', 'Memoir',                      'Books',       'Random House',      'Non-Fiction'),
('P030', 'Saw',                         'Home Decor',  'Home Depot',        'Tools'),
('P031', 'Distilled water',             'Grocery',     'Pepsi',             'Water'),
('P032', 'Coffee table',                'Home Decor',  'Home Depot',        'Furniture'),
('P033', 'Dress shirt',                 'Clothing',    'Zara',              'Shirt'),
('P034', 'Milk chocolate',              'Grocery',     'Nestle',            'Chocolate'),
('P035', 'Legal thriller',              'Books',       'HarperCollins',     'Thriller'),
('P036', 'Charger',                     'Electronics', 'Apple',             'Smartphone'),
('P037', 'Bookshelf',                   'Home Decor',  'IKEA',              'Furniture'),
('P038', 'Gaming headphones',           'Electronics', 'Sony',              'Headphones'),
('P039', 'Wardrobe',                    'Home Decor',  'Home Depot',        'Furniture'),
('P040', 'Parka',                       'Clothing',    'Adidas',            'Jacket'),
('P041', 'Google Pixel Slate',          'Electronics', 'Samsung',           'Tablet'),
('P042', 'Sheath dress',                'Clothing',    'Zara',              'Dress'),
('P043', 'Oxfords',                     'Clothing',    'Adidas',            'Shoes'),
('P044', 'OLED TV',                     'Electronics', 'Sony',              'Television'),
('P045', 'Sink',                        'Home Decor',  'Bed Bath & Beyond', 'Bathroom'),
('P046', 'Mineral water',               'Grocery',     'Pepsi',             'Water'),
('P047', 'Biography',                   'Books',       'Penguin Books',     'Non-Fiction'),
('P048', 'Sparkling water',             'Grocery',     'Coca-Cola',         'Water'),
('P049', 'Ductless AC',                 'Electronics', 'Mitsubisi',        'AC'),
('P050', 'Blouse',                      'Clothing',    'Zara',              'Shirt'),
('P051', 'Adventure',                   'Books',       'HarperCollins',     'Thriller'),
('P052', 'Huawei MediaPad',             'Electronics', 'Apple',             'Tablet'),
('P053', 'Peacoat',                     'Clothing',    'Adidas',            'Jacket'),
('P054', 'Duvet cover',                 'Home Decor',  'Bed Bath & Beyond', 'Bedding'),
('P055', 'Cheese snacks',               'Grocery',     'Nestle',            'Snacks'),
('P056', 'Mini fridge',                 'Electronics', 'Whirelpool',         'Fridge'),
('P057', 'Chocolate bars',              'Grocery',     'Nestle',            'Chocolate'),
('P058', 'Trench coat',                 'Clothing',    'Adidas',            'Jacket'),
('P059', 'Anthologies',                 'Books',       'Random House',      'Literature'),
('P060', 'Oven',                        'Home Decor',  'Bed Bath & Beyond', 'Kitchen'),
('P061', 'Self-help',                   'Books',       'HarperCollins',     'Non-Fiction'),
('P062', 'Plush toys',                  'Grocery',     'IKEA',              'Children''s'),
('P063', 'Romance',                     'Books',       'HarperCollins',     'Fiction'),
('P064', 'Blazer',                      'Clothing',    'Adidas',            'Jacket'),
('P065', 'Desk',                        'Home Decor',  'IKEA',              'Furniture'),
('P066', 'Mouse pad',                   'Electronics', 'Samsung',           'Laptop'),
('P067', 'Wall sconces',                'Home Decor',  'IKEA',              'Lighting'),
('P068', 'Spring water',                'Grocery',     'Pepsi',             'Water'),
('P069', 'Xiaomi Mi',                   'Electronics', 'Sony',              'Smartphone'),
('P070', 'Huawei P',                    'Electronics', 'Sony',              'Smartphone'),
('P071', 'Flavored water',              'Grocery',     'Coca-Cola',         'Water'),
('P072', 'Skorts',                      'Clothing',    'Nike',              'Shorts'),
('P073', 'Dell XPS',                    'Electronics', 'Apple',             'Laptop'),
('P074', 'Mattress topper',             'Home Decor',  'Bed Bath & Beyond', 'Bedding'),
('P075', 'White chocolate',             'Grocery',     'Nestle',            'Chocolate'),
('P076', 'Cream soda',                  'Grocery',     'Coca-Cola',         'Soft Drink'),
('P077', 'High heels',                  'Clothing',    'Adidas',            'Shoes'),
('P078', 'Noise-cancelling headphones', 'Electronics', 'Sony',              'Headphones'),
('P079', 'Mirrors',                     'Home Decor',  'IKEA',              'Decorations'),
('P080', 'Curved TV',                   'Electronics', 'Samsung',           'Television'),
('P081', 'Grape soda',                  'Grocery',     'Coca-Cola',         'Soft Drink'),
('P082', 'Wrap dress',                  'Clothing',    'Zara',              'Dress'),
('P083', 'Throw pillow',                'Home Decor',  'Bed Bath & Beyond', 'Bedding'),
('P084', 'Phone case',                  'Home Decor',  'Bed Bath & Beyond', 'Bedding'),
('P085', 'Nokia',                       'Electronics', 'Apple',             'Smartphone'),
('P086', 'Inverter AC',                 'Electronics', 'Mitsubisi',        'AC'), 
('P087', 'Toilet paper holder',         'Home Decor',  'Bed Bath & Beyond', 'Bathroom'),
('P088', 'Hoodie',                      'Clothing',    'Zara',              'Shirt'),
('P089', 'Cargo shorts',                'Clothing',    'Nike',              'Shorts'),
('P090', 'Historical fiction',          'Books',       'HarperCollins',     'Fiction'),
('P091', 'Sports headphones',           'Electronics', 'Sony',              'Headphones'),
('P092', 'Psychological thriller',      'Books',       'HarperCollins',     'Thriller'),
('P093', 'Educational kits',            'Books',       'Penguin Books',     'Children''s'),
('P094', 'Sculptures',                  'Home Decor',  'IKEA',              'Decorations'),
('P095', 'Nuts',                        'Grocery',     'Nestle',            'Snacks'),
('P096', 'Artesian water',              'Grocery',     'Pepsi',             'Water');


-- ============================================================
-- DML — INSERT INTO TRANSACTION_HEADERS (110 rows)
-- FIX: '204-04-25' corrected to '2024-04-25' for Transaction 1287056
-- ============================================================

INSERT INTO TRANSACTION_HEADERS VALUES
(9426749, 16975, 'A012', '2023-05-01',  '04:59:28', 6,  41.06,  'Excellent', 5, 6,  'Item out of stock; backorder ETA 2 weeks'),
(2293358, 86260, 'A092', '2023-08-19',  '16:33:57', 10, 272.58, 'Average',   2, 10, 'Return requested; damaged item; refund pending'),
(9792281, 40857, 'A044', '2023-04-21',  '06:21:23', 4,  358.42, 'Average',   2, 4,  'Loyalty points redeemed; membership renewal due'),
(4298646, 59676, 'A060', '2023-09-26',  '05:44:30', 3,  386.78, 'Average',   2, 3,  'First-time buyer; promo code SAVE10 used'),
(7285855, 18748, 'A015', '2023-04-30',  '04:45:17', 2,  108.11, 'Bad',       1, 2,  'Return requested; damaged item; refund pending'),
(2041679, 56595, 'A056', '2023-06-11',  '02:05:23', 9,  18.29,  'Excellent', 4, 9,  'Address correction needed; apt number missing'),
(4009972, 99975, 'A110', '2023-04-19',  '11:11:14', 7,  299.76, 'Average',   2, 7,  NULL),
(9924926, 46272, 'A047', '2023-12-18',  '00:12:03', 8,  372.23, 'Average',   2, 8,  'Bulk order; B2B invoice required; net 30 payment'),
(7097034, 70261, 'A076', '2023-12-11',  '03:59:24', 5,  239.81, 'Good',      4, 5,  'Loyalty points redeemed; membership renewal due'),
(7535279, 60857, 'A062', '2023-09-12',  '07:33:55', 4,  163.14, 'Excellent', 5, 4,  'First-time buyer; promo code SAVE10 used'),
(5798048, 10371, 'A002', '2024-08-28',  '19:40:56', 2,  303.70, 'Average',   2, 2,  'Late delivery complaint; voucher issued'),
(6175268, 65955, 'A070', '2024-09-02',  '21:07:21', 8,  286.65, 'Average',   2, 8,  'Customer called twice; prefers express; gift wrap requested'),
(3569152, 22412, 'A020', '2023-05-05',  '17:56:01', 5,  65.68,  'Excellent', 5, 5,  'First-time buyer; promo code SAVE10 used'),
(4022174, 17565, 'A013', '2023-08-26',  '12:48:01', 7,  401.19, 'Average',   2, 7,  'Customer called twice; prefers express; gift wrap requested'),
(3900155, 53421, 'A052', '2023-06-13',  '00:59:45', 5,  172.33, 'Excellent', 5, 5,  'Late delivery complaint; voucher issued'),
(6444030, 88993, 'A095', '2023-09-09',  '07:02:24', 6,  88.13,  'Good',      4, 6,  NULL),
(9356006, 68375, 'A074', '2023-04-29',  '12:50:12', 5,  361.78, 'Excellent', 4, 5,  'Bulk order; B2B invoice required; net 30 payment'),
(3653283, 74578, 'A082', '2023-09-17',  '22:02:29', 3,  178.58, 'Excellent', 5, 3,  'VIP client - discount applied; referred by John D.'),
(7504007, 11029, 'A005', '2023-12-06',  '21:44:08', 3,  116.11, 'Good',      3, 3,  'First-time buyer; promo code SAVE10 used'),
(8342638, 98280, 'A107', '2023-06-08',  '13:23:31', 5,  290.45, 'Average',   2, 5,  'Item out of stock; backorder ETA 2 weeks'),
(1509272, 24134, 'A022', '2023-08-29',  '20:34:21', 1,  452.27, NULL,        3, 1,  'Late delivery complaint; voucher issued'),
(7375726, 39305, 'A042', '2023-05-21',  '00:26:44', 3,  152.71, 'Average',   2, 3,  'First-time buyer; promo code SAVE10 used'),
(9994993, 15477, 'A009', '2023-10-21',  '15:53:58', 7,  327.23, 'Excellent', 5, 7,  'Address correction needed; apt number missing'),
(1142595, 37006, 'A037', '2023-12-26',  '12:40:04', 9,  237.97, 'Good',      3, 9,  NULL),
(9681367, 21621, 'A018', '2023-11-18',  '11:17:45', 5,  69.34,  'Average',   2, 5,  'Address correction needed; apt number missing'),
(9298720, 54476, 'A054', '2024-01-01',  '03:22:13', 2,  427.73, 'Average',   2, 2,  'Return requested; damaged item; refund pending'),
(1945441, 16810, 'A011', '2023-04-26',  '06:13:04', 2,  308.06, NULL,        1, 2,  'Bulk order; B2B invoice required; net 30 payment'),
(9244518, 51832, 'A051', '2023-04-04',  '22:08:00', 10, 326.72, 'Bad',       1, 10, 'Return requested; damaged item; refund pending'),
(1298156, 95778, 'A104', '2023-03-16',  '01:51:28', 3,  408.19, 'Good',      3, 3,  'First-time buyer; promo code SAVE10 used'),
(8666637, 61807, 'A064', '2024-07-02',  '06:27:39', 5,  81.15,  'Excellent', 4, 5,  'Loyalty points redeemed; membership renewal due'),
(8431233, 28693, 'A029', '2023-06-29',  '23:42:41', 2,  427.35, 'Good',      3, 2,  'Loyalty points redeemed; membership renewal due'),
(6009830, 61410, 'A063', '2023-08-15',  '14:34:15', 4,  187.41, 'Average',   2, 4,  'Bulk order; B2B invoice required; net 30 payment'),
(4341461, 69736, 'A075', '2023-01-18',  '04:17:36', 10, 255.57, 'Average',   2, 10, 'Item out of stock; backorder ETA 2 weeks'),
(1678088, 95413, 'A103', '2023-04-08',  '21:35:03', 10, 337.78, 'Good',      4, 10, NULL),
(9980695, 21826, 'A019', '2023-12-08',  '17:42:04', 6,  407.95, 'Average',   2, 6,  'Item out of stock; backorder ETA 2 weeks'),
(9086634, 14372, 'A008', '2023-06-28',  '10:19:38', 9,  256.08, 'Excellent', 4, 9,  NULL),
(7506496, 97224, 'A105', '2023-12-07',  '09:40:39', 9,  250.20, 'Excellent', 5, 9,  'Late delivery complaint; voucher issued'),
(1717566, 71315, 'A077', '2023-05-16',  '13:31:42', 4,  340.50, 'Good',      4, 4,  'First-time buyer; promo code SAVE10 used'),
(8531792, 38605, 'A041', '2024-05-18',  '19:50:16', 4,  294.68, 'Excellent', 5, 4,  'Return requested; damaged item; refund pending'),
(1903005, 44854, 'A045', '2024-01-13',  '07:54:46', 7,  372.66, 'Good',      3, 6,  'Loyalty points redeemed; membership renewal due'),
(4132104, 64547, 'A068', '2023-04-04',  '15:24:29', 6,  103.82, 'Excellent', 5, 6,  'Address correction needed; apt number missing'),
(8970717, 86977, 'A094', '2023-11-07',  '15:13:55', 5,  134.32, 'Average',   2, 5,  'VIP client - discount applied; referred by John D.'),
(2955549, 31203, 'A030', '2023-12-08',  '08:11:28', 2,  33.86,  'Average',   2, 2,  'Customer called twice; prefers express; gift wrap requested'),
(3008435, 25770, 'A024', '2023-08-11',  '20:07:05', 3,  306.19, 'Average',   2, 3,  'VIP client - discount applied; referred by John D.'),
(8373433, 10041, 'A001', '2023-10-23',  '11:08:13', 10, 42.55,  'Good',      3, 10, 'Return requested; damaged item; refund pending'),
(8247732, 97864, 'A106', '2023-03-25',  '04:44:53', 4,  330.60, NULL,        4, 4,  'Return requested; damaged item; refund pending'),
(4918232, 21406, 'A017', '2023-03-09',  '04:38:39', 4,  334.51, NULL,        1, 4,  NULL),
(2952733, 89260, 'A096', '2023-11-27',  '21:16:55', 9,  439.70, NULL,        5, 9,  'Item out of stock; backorder ETA 2 weeks'),
(9674882, 65091, 'A069', '2023-01-07',  '21:06:24', 5,  41.52,  'Bad',       1, 5,  'VIP client - discount applied; referred by John D.'),
(4545130, 74172, 'A081', '2023-06-12',  '13:33:43', 2,  455.08, 'Excellent', 4, 2,  NULL),
(3696083, 95152, 'A102', '2024-01-04',  '21:50:26', 2,  437.80, 'Excellent', 5, 2,  NULL),
(9250392, 32299, 'A032', '2023-08-24',  '05:55:21', 6,  92.10,  'Excellent', 5, 6,  'Item out of stock; backorder ETA 2 weeks'),
(7828796, 39899, 'A043', '2023-02-12',  '09:42:07', 6,  118.50, 'Bad',       1, 6,  'Address correction needed; apt number missing'),
(4742675, 94463, 'A099', '2023-04-18',  '18:08:56', 3,  170.98, 'Excellent', 4, 3,  'Loyalty points redeemed; membership renewal due'),
(7884920, 10862, 'A004', '2023-02-06',  '13:37:55', 10, 352.33, 'Excellent', 4, 10, 'Bulk order; B2B invoice required; net 30 payment'),
(1923214, 73651, 'A080', '2023-11-11',  '19:32:57', 3,  214.28, 'Good',      3, 3,  'Loyalty points redeemed; membership renewal due'),
(2827210, 14018, 'A007', '2023-03-17',  '15:26:45', 7,  448.35, 'Bad',       1, 7,  'Customer called twice; prefers express; gift wrap requested'),
(8121656, 86301, 'A093', '2023-04-01',  '08:32:52', 4,  54.91,  'Bad',       1, 4,  'VIP client - discount applied; referred by John D.'),
(7830492, 44887, 'A046', '2023-12-16',  '15:09:14', 9,  420.31, 'Good',      3, 9,  'Loyalty points redeemed; membership renewal due'),
(5333553, 36360, 'A035', '2024-11-01',  '16:42:11', 7,  79.62,  'Good',      3, 7,  'Bulk order; B2B invoice required; net 30 payment'),
(9684453, 37816, 'A040', '2023-12-10',  '14:15:06', 2,  342.58, 'Average',   2, 2,  'Late delivery complaint; voucher issued'),
(6455222, 94787, 'A100', '2023-07-29',  '11:09:15', 7,  297.84, 'Bad',       1, 7,  'VIP client - discount applied; referred by John D.'),
(4207932, 26963, 'A027', '2024-07-01',  '05:15:30', 9,  40.37,  'Excellent', 4, 9,  'Bulk order; B2B invoice required; net 30 payment'),
(6707299, 68013, 'A072', '2023-09-27',  '17:20:59', 4,  31.76,  'Good',      4, 4,  NULL),
(3754115, 55034, 'A055', '2023-08-28',  '17:13:16', 7,  197.81, 'Excellent', 5, 7,  'Return requested; damaged item; refund pending'),
(2362939, 23316, 'A021', '2023-03-08',  '21:03:30', 1,  401.17, 'Average',   2, 1,  'Address correction needed; apt number missing'),
(4606544, 76429, 'A085', '2023-08-24',  '08:15:35', 2,  258.39, 'Excellent', 4, 2,  'Customer called twice; prefers express; gift wrap requested'),
(2535017, 31255, 'A031', '2023-08-17',  '01:04:56', 1,  443.23, 'Average',   2, 1,  'Bulk order; B2B invoice required; net 30 payment'),
(9516958, 27020, 'A028', '2023-06-10',  '22:08:59', 2,  156.65, 'Bad',       1, 2,  'Loyalty points redeemed; membership renewal due'),
(1603434, 20423, 'A016', '2024-03-02',  '18:19:30', 4,  192.27, 'Good',      4, 4,  'Return requested; damaged item; refund pending'),
(8438286, 24749, 'A023', '2023-12-12',  '11:20:46', 5,  114.71, 'Good',      3, 5,  'Loyalty points redeemed; membership renewal due'),
(7202698, 64205, 'A067', '2023-10-20',  '14:21:23', 8,  259.61, 'Average',   2, 8,  'VIP client - discount applied; referred by John D.'),
(6872598, 74839, 'A083', '2024-08-24',  '10:50:31', 6,  303.46, 'Excellent', 5, 6,  'Bulk order; B2B invoice required; net 30 payment'),
(4107623, 60415, 'A061', '2023-09-24',  '01:47:24', 8,  136.81, 'Good',      4, 8,  'Loyalty points redeemed; membership renewal due'),
(8112986, 99340, 'A109', '2023-06-04',  '15:20:48', 9,  253.67, 'Average',   2, 9,  'Item out of stock; backorder ETA 2 weeks'),
(7223783, 34011, 'A034', '2023-01-11',  '04:48:14', 7,  303.54, 'Good',      4, 7,  'First-time buyer; promo code SAVE10 used'),
(4499937, 62219, 'A065', '2023-07-25',  '11:50:36', 6,  79.58,  'Excellent', 4, 6,  'Return requested; damaged item; refund pending'),
(1230158, 62281, 'A066', '2023-04-17',  '06:15:09', 6,  189.94, 'Excellent', 4, 6,  'Late delivery complaint; voucher issued'),
(2039194, 57257, 'A058', '2023-04-12',  '00:18:43', 6,  67.71,  'Excellent', 4, 6,  'Return requested; damaged item; refund pending'),
(2057577, 83702, 'A089', '2023-11-22',  '04:24:45', 7,  305.92, 'Bad',       1, 7,  'Loyalty points redeemed; membership renewal due'),
(1614558, 78306, 'A087', '2023-10-23',  '10:50:34', 1,  88.48,  'Excellent', 5, 1,  'Loyalty points redeemed; membership renewal due'),
(6863700, 47141, 'A048', '2023-04-16',  '01:19:05', 10, 182.56, 'Bad',       1, 10, 'Customer called twice; prefers express; gift wrap requested'),
(9032786, 84190, 'A090', '2023-08-24',  '00:03:55', 9,  132.61, 'Average',   2, 9,  'Item out of stock; backorder ETA 2 weeks'),
(3430160, 26174, 'A025', '2023-06-04',  '22:23:20', 2,  182.79, 'Good',      3, 2,  'Late delivery complaint; voucher issued'),
(3929891, 72555, 'A078', '2023-07-21',  '22:40:26', 8,  21.00,  'Average',   2, 8,  'Address correction needed; apt number missing'),
(6846605, 81403, 'A088', '2023-05-22',  '21:13:36', 10, 20.42,  'Excellent', 4, 10, 'Customer called twice; prefers express; gift wrap requested'),
(9024575, 99003, 'A108', '2023-11-21',  '05:57:24', 3,  249.24, 'Excellent', 4, 3,  'VIP client - discount applied; referred by John D.'),
(7328646, 73021, 'A079', '2023-12-10',  '21:56:55', 9,  255.84, 'Good',      3, 9,  'Late delivery complaint; voucher issued'),
(8314094, 57326, 'A059', '2023-07-04',  '03:21:15', 10, 197.63, 'Average',   2, 10, 'Bulk order; B2B invoice required; net 30 payment'),
(8265432, 76316, 'A084', '2023-08-20',  '15:43:42', 3,  207.76, 'Good',      4, 3,  'First-time buyer; promo code SAVE10 used'),
(1645877, 37567, 'A038', '2023-05-26',  '01:44:27', 10, 210.55, 'Excellent', 5, 10, 'Customer called twice; prefers express; gift wrap requested'),
(5498743, 54271, 'A053', '2023-10-08',  '21:41:09', 5,  47.95,  'Average',   2, 5,  'First-time buyer; promo code SAVE10 used'),
(8410161, 34000, 'A033', '2023-12-31',  '09:17:42', 1,  374.38, 'Average',   2, 1,  'Item out of stock; backorder ETA 2 weeks'),
(4903472, 84433, 'A091', '2024-01-01',  '17:43:39', 5,  280.63, 'Excellent', 4, 5,  'VIP client - discount applied; referred by John D.'),
(9614856, 50885, 'A050', '2023-04-29',  '15:56:25', 3,  199.06, 'Good',      4, 3,  'VIP client - discount applied; referred by John D.'),
(1287056, 89748, 'A097', '2024-04-25',  '13:17:48', 1,  442.14, 'Bad',       1, 1,  'Address correction needed; apt number missing'),  
(7657901, 67676, 'A071', '2023-08-27',  '07:02:32', 3,  361.50, 'Excellent', 4, 3,  'VIP client - discount applied; referred by John D.'),
(3415573, 26844, 'A026', '2023-02-04',  '03:01:15', 7,  83.89,  'Excellent', 5, 7,  'Loyalty points redeemed; membership renewal due'),
(7038978, 10813, 'A003', '2024-01-21',  '10:05:35', 8,  57.73,  'Average',   2, 8,  'Return requested; damaged item; refund pending'),
(7132724, 90854, 'A098', '2023-09-23',  '00:47:21', 10, 417.03, 'Excellent', 4, 10, 'Return requested; damaged item; refund pending'),
(9091033, 56768, 'A057', '2024-12-01',  '02:35:58', 9,  219.88, 'Bad',       1, 9,  'Address correction needed; apt number missing'),
(1092202, 16416, 'A010', '2023-02-06',  '00:20:58', 7,  140.29, 'Bad',       1, 7,  'Loyalty points redeemed; membership renewal due'),
(2393321, 37756, 'A039', '2023-02-06',  '13:09:35', 10, 410.57, 'Average',   2, 10, 'Return requested; damaged item; refund pending'),
(2646819, 77031, 'A086', '2023-08-22',  '04:55:44', 1,  326.82, 'Excellent', 4, 1,  'Bulk order; B2B invoice required; net 30 payment'),
(3615959, 13236, 'A006', '2023-05-20',  '21:01:09', 9,  398.49, 'Average',   2, 9,  'Loyalty points redeemed; membership renewal due'),
(2127739, 36493, 'A036', '2023-05-24',  '11:12:43', 10, 88.82,  'Good',      3, 10, 'Item out of stock; backorder ETA 2 weeks'),
(7313248, 68086, 'A073', '2023-03-20',  '08:31:00', 2,  165.24, NULL,        4, 2,  NULL),
(7977418, 94812, 'A101', '2023-12-03',  '13:28:56', 8,  374.36, 'Excellent', 4, 8,  'First-time buyer; promo code SAVE10 used'),
(3771393, 49811, 'A049', '2023-07-08',  '18:48:57', 5,  441.99, 'Average',   2, 5,  'Loyalty points redeemed; membership renewal due'),
(1763497, 18734, 'A014', '2023-08-18',  '12:22:07', 5,  37.83,  'Average',   2, 5,  'First-time buyer; promo code SAVE10 used');


-- ============================================================
-- DML — INSERT INTO TRANSACTION_ITEMS (138 rows)
-- ============================================================

INSERT INTO TRANSACTION_ITEMS VALUES
('TP001', 9426749, 'P001'),
('TP002', 9426749, 'P002'),
('TP003', 2293358, 'P003'),
('TP004', 9792281, 'P004'),
('TP005', 4298646, 'P005'),
('TP006', 7285855, 'P006'),
('TP007', 7285855, 'P007'),
('TP008', 2041679, 'P008'),
('TP009', 4009972, 'P009'),
('TP010', 9924926, 'P010'),
('TP011', 7097034, 'P011'),
('TP012', 7097034, 'P012'),
('TP013', 7535279, 'P013'),
('TP014', 5798048, 'P010'),
('TP015', 6175268, 'P014'),
('TP016', 3569152, 'P015'),
('TP017', 3569152, 'P016'),
('TP018', 4022174, 'P017'),
('TP019', 3900155, 'P009'),
('TP020', 6444030, 'P018'),
('TP021', 9356006, 'P019'),
('TP022', 9356006, 'P016'),
('TP023', 3653283, 'P020'),
('TP024', 7504007, 'P021'),
('TP025', 8342638, 'P022'),
('TP026', 1509272, 'P023'),
('TP027', 1509272, 'P024'),
('TP028', 7375726, 'P025'),
('TP029', 9994993, 'P026'),
('TP030', 1142595, 'P027'),
('TP031', 9681367, 'P028'),
('TP032', 9681367, 'P002'),
('TP033', 9298720, 'P010'),
('TP034', 1945441, 'P029'),
('TP035', 9244518, 'P030'),
('TP036', 1298156, 'P031'),
('TP037', 1298156, 'P002'),
('TP038', 8666637, 'P032'),
('TP039', 8431233, 'P033'),
('TP040', 6009830, 'P034'),
('TP041', 4341461, 'P035'),
('TP042', 4341461, 'P036'),
('TP043', 1678088, 'P037'),
('TP044', 9980695, 'P038'),
('TP045', 9086634, 'P039'),
('TP046', 7506496, 'P040'),
('TP047', 7506496, 'P007'),
('TP048', 1717566, 'P041'),
('TP049', 8531792, 'P032'),
('TP050', 1903005, 'P015'),
('TP051', 4132104, 'P042'),
('TP052', 4132104, 'P007'),
('TP053', 8970717, 'P043'),
('TP054', 2955549, 'P044'),
('TP055', 3008435, 'P043'),
('TP056', 8373433, 'P045'),
('TP057', 8373433, 'P002'),
('TP058', 8247732, 'P046'),
('TP059', 4918232, 'P047'),
('TP060', 2952733, 'P048'),
('TP061', 9674882, 'P044'),
('TP062', 9674882, 'P016'),
('TP063', 4545130, 'P006'),
('TP064', 3696083, 'P049'),
('TP065', 9250392, 'P050'),
('TP066', 7828796, 'P051'),
('TP067', 7828796, 'P016'),
('TP068', 4742675, 'P052'),
('TP069', 7884920, 'P053'),
('TP070', 1923214, 'P054'),
('TP071', 2827210, 'P015'),
('TP072', 2827210, 'P007'),
('TP073', 8121656, 'P001'),
('TP074', 7830492, 'P055'),
('TP075', 5333553, 'P056'),
('TP076', 9684453, 'P057'),
('TP077', 9684453, 'P016'),
('TP078', 6455222, 'P058'),
('TP079', 4207932, 'P059'),
('TP080', 6707299, 'P031'),
('TP081', 3754115, 'P060'),
('TP082', 3754115, 'P036'),
('TP083', 2362939, 'P051'),
('TP084', 4606544, 'P061'),
('TP085', 2535017, 'P031'),
('TP086', 9516958, 'P062'),
('TP087', 9516958, 'P016'),
('TP088', 1603434, 'P063'),
('TP089', 8438286, 'P064'),
('TP090', 7202698, 'P065'),
('TP091', 6872598, 'P061'),
('TP092', 6872598, 'P066'),
('TP093', 4107623, 'P046'),
('TP094', 8112986, 'P067'),
('TP095', 7223783, 'P068'),
('TP096', 4499937, 'P069'),
('TP097', 4499937, 'P012'),
('TP098', 1230158, 'P070'),
('TP099', 2039194, 'P071'),
('TP100', 2057577, 'P072'),
('TP101', 1614558, 'P034'),
('TP102', 1614558, 'P007'),
('TP103', 6863700, 'P073'),
('TP104', 9032786, 'P074'),
('TP105', 3430160, 'P075'),
('TP106', 3929891, 'P076'),
('TP107', 3929891, 'P024'),
('TP108', 6846605, 'P077'),
('TP109', 9024575, 'P078'),
('TP110', 7328646, 'P038'),
('TP111', 8314094, 'P079'),
('TP112', 8314094, 'P036'),
('TP113', 8265432, 'P080'),
('TP114', 1645877, 'P081'),
('TP115', 5498743, 'P082'),
('TP116', 8410161, 'P083'),
('TP117', 8410161, 'P084'),
('TP118', 4903472, 'P085'),
('TP119', 9614856, 'P086'),
('TP120', 1287056, 'P087'),
('TP121', 7657901, 'P088'),
('TP122', 7657901, 'P012'),
('TP123', 3415573, 'P089'),
('TP124', 7038978, 'P019'),
('TP125', 7132724, 'P090'),
('TP126', 9091033, 'P091'),
('TP127', 9091033, 'P024'),
('TP128', 1092202, 'P051'),
('TP129', 2393321, 'P092'),
('TP130', 2646819, 'P093'),
('TP131', 3615959, 'P030'),
('TP132', 3615959, 'P016'),
('TP133', 2127739, 'P094'),
('TP134', 7313248, 'P095'),
('TP135', 7977418, 'P083'),
('TP136', 3771393, 'P048'),
('TP137', 3771393, 'P084'),
('TP138', 1763497, 'P096');


-- ============================================================
-- DML — INSERT INTO SHIPMENTS (110 rows)
-- ============================================================

INSERT INTO SHIPMENTS VALUES
('S1',   1092202, 'Express',  'Delivered'),
('S2',   1142595, 'Express',  'Delivered'),
('S3',   1230158, 'Express',  'Delivered'),
('S4',   1287056, 'Same-Day', 'Delivered'),
('S5',   1298156, 'Express',  'Delivered'),
('S6',   1509272, 'Same-Day', 'Pending'),
('S7',   1603434, 'Express',  'On Hold'),
('S8',   1614558, 'Same-Day', 'Delivered'),
('S9',   1645877, 'Same-Day', 'Delivered'),
('S10',  1678088, 'Same-Day', 'Processing'),
('S11',  1717566, 'Same-Day', 'Pending'),
('S12',  1763497, 'Standard', 'Shipped'),
('S13',  1903005, 'Same-Day', 'On Hold'),
('S14',  1923214, 'Express',  'Delivered'),
('S15',  1945441, 'Standard', 'Delivered'),
('S16',  2039194, 'Same-Day', 'Pending'),
('S17',  2041679, 'Standard', 'Pending'),
('S18',  2057577, 'Same-Day', 'Complete'),
('S19',  2127739, 'Standard', 'Shipped'),
('S20',  2293358, 'Express',  'Delivered'),
('S21',  2362939, 'Express',  'Processing'),
('S22',  2393321, 'Same-Day', 'Shipped'),
('S23',  2535017, 'Express',  'Shipped'),
('S24',  2646819, 'Same-Day', 'Delivered'),
('S25',  2827210, 'Standard', 'Shipped'),
('S26',  2952733, 'Standard', 'Shipped'),
('S27',  2955549, 'Standard', 'Processing'),
('S28',  3008435, 'Standard', 'Pending'),
('S29',  3415573, 'Express',  'Pending'),
('S30',  3430160, 'Same-Day', 'Processing'),
('S31',  3569152, 'Standard', 'Processing'),
('S32',  3615959, 'Express',  'Shipped'),
('S33',  3653283, 'Express',  'Shipped'),
('S34',  3696083, 'Same-Day', 'Delivered'),
('S35',  3754115, 'Express',  'Shipped'),
('S36',  3771393, 'Standard', 'Pending'),
('S37',  3900155, 'Same-Day', 'Complete'),
('S38',  3929891, 'Same-Day', 'Shipped'),
('S39',  4009972, 'Same-Day', 'Shipped'),
('S40',  4022174, 'Standard', 'Shipped'),
('S41',  4107623, 'Express',  'Shipped'),
('S42',  4132104, 'Express',  'Shipped'),
('S43',  4207932, 'Express',  'Processing'),
('S44',  4298646, 'Express',  'Delivered'),
('S45',  4341461, 'Standard', 'Delivered'),
('S46',  4499937, 'Standard', 'Delivered'),
('S47',  4545130, 'Same-Day', 'Shipped'),
('S48',  4606544, 'Same-Day', 'Delivered'),
('S49',  4742675, 'Express',  'Delivered'),
('S50',  4903472, 'Express',  'Processing'),
('S51',  4918232, 'Standard', 'Delivered'),
('S52',  5333553, 'Express',  'Complete'),
('S53',  5498743, 'Standard', 'Processing'),
('S54',  5798048, 'Same-Day', 'Delivered'),
('S55',  6009830, 'Same-Day', 'Pending'),
('S56',  6175268, 'Express',  'Pending'),
('S57',  6444030, 'Standard', 'Processing'),
('S58',  6455222, 'Same-Day', 'Shipped'),
('S59',  6707299, 'Same-Day', 'Processing'),
('S60',  6846605, NULL,       'Pending'),
('S61',  6863700, 'Express',  'Pending'),
('S62',  6872598, 'Same-Day', 'Shipped'),
('S63',  7038978, 'Express',  'Delivered'),
('S64',  7097034, 'Same-Day', 'Delivered'),
('S65',  7132724, 'Express',  'Processing'),
('S66',  7202698, 'Express',  'Delivered'),
('S67',  7223783, 'Express',  'Pending'),
('S68',  7285855, 'Standard', 'Processing'),
('S69',  7313248, 'Standard', 'Delivered'),
('S70',  7328646, NULL,       'Shipped'),
('S71',  7375726, 'Express',  'Pending'),
('S72',  7504007, 'Standard', 'Shipped'),
('S73',  7506496, 'Standard', 'Pending'),
('S74',  7535279, NULL,       'Complete'),
('S75',  7657901, 'Same-Day', 'Shipped'),
('S76',  7828796, 'Express',  'Pending'),
('S77',  7830492, 'Express',  'Pending'),
('S78',  7884920, 'Standard', 'Complete'),
('S79',  7977418, 'Standard', 'Pending'),
('S80',  8112986, 'Same-Day', 'Processing'),
('S81',  8121656, 'Express',  'Delivered'),
('S82',  8247732, 'Same-Day', 'Pending'),
('S83',  8265432, NULL,       'Processing'),
('S84',  8314094, 'Express',  'Delivered'),
('S85',  8342638, 'Standard', 'Processing'),
('S86',  8373433, 'Standard', 'Shipped'),
('S87',  8410161, 'Standard', 'Pending'),
('S88',  8431233, 'Express',  'Pending'),
('S89',  8438286, 'Standard', 'Delivered'),
('S90',  8531792, 'Same-Day', 'Processing'),
('S91',  8666637, 'Standard', 'Processing'),
('S92',  8970717, 'Express',  'Delivered'),
('S93',  9024575, 'Same-Day', 'Processing'),
('S94',  9032786, NULL,       'Delivered'),
('S95',  9086634, 'Same-Day', 'Pending'),
('S96',  9091033, 'Same-Day', 'Pending'),
('S97',  9244518, 'Express',  'Pending'),
('S98',  9250392, 'Express',  'Shipped'),
('S99',  9298720, 'Same-Day', 'Delivered'),
('S100', 9356006, 'Standard', 'Pending'),
('S101', 9426749, 'Same-Day', 'Delivered'),
('S102', 9516958, 'Express',  'Delivered'),
('S103', 9614856, 'Express',  'Complete'),
('S104', 9674882, 'Express',  'Shipped'),
('S105', 9681367, 'Express',  'Complete'),
('S106', 9684453, 'Standard', 'Delivered'),
('S107', 9792281, 'Express',  'Shipped'),
('S108', 9924926, 'Same-Day', 'Pending'),
('S109', 9980695, NULL,       'Processing'),
('S110', 9994993, 'Same-Day', 'Pending');


-- ============================================================
-- DML — INSERT INTO PAYMENTS (110 rows)
-- ============================================================

INSERT INTO PAYMENTS VALUES
('PAY001', 1092202, 'Credit Card'),
('PAY002', 1142595, 'PayPal'),
('PAY003', 1230158, 'Debit Card'),
('PAY004', 1287056, 'Debit Card'),
('PAY005', 1298156, 'Credit Card'),
('PAY006', 1509272, 'Cash'),
('PAY007', 1603434, 'Visa'),
('PAY008', 1614558, 'Credit Card'),
('PAY009', 1645877, 'PayPal'),
('PAY010', 1678088, 'Credit Card'),
('PAY011', 1717566, 'Credit Card'),
('PAY012', 1763497, 'Cash on Delivery'),
('PAY013', 1903005, 'PayPal'),
('PAY014', 1923214, 'Cash'),
('PAY015', 1945441, 'Debit Card'),
('PAY016', 2039194, 'Debit Card'),
('PAY017', 2041679, 'Debit Card'),
('PAY018', 2057577, 'Visa'),
('PAY019', 2127739, 'Credit Card'),
('PAY020', 2293358, 'PayPal'),
('PAY021', 2362939, 'Credit Card'),
('PAY022', 2393321, 'Credit Card'),
('PAY023', 2535017, 'Credit Card'),
('PAY024', 2646819, 'Debit Card'),
('PAY025', 2827210, 'Debit Card'),
('PAY026', 2952733, 'Cash'),
('PAY027', 2955549, 'PayPal'),
('PAY028', 3008435, 'PayPal'),
('PAY029', 3415573, 'Cash'),
('PAY030', 3430160, 'Debit Card'),
('PAY031', 3569152, 'Cash'),
('PAY032', 3615959, 'PayPal'),
('PAY033', 3653283, 'Credit Card'),
('PAY034', 3696083, 'Credit Card'),
('PAY035', 3754115, 'Visa'),
('PAY036', 3771393, 'PayPal'),
('PAY037', 3900155, 'Cash on Delivery'),
('PAY038', 3929891, 'Visa'),
('PAY039', 4009972, 'Debit Card'),
('PAY040', 4022174, 'Cash on Delivery'),
('PAY041', 4107623, 'Credit Card'),
('PAY042', 4132104, 'Debit Card'),
('PAY043', 4207932, 'Credit Card'),
('PAY044', 4298646, 'PayPal'),
('PAY045', 4341461, 'Credit Card'),
('PAY046', 4499937, 'Debit Card'),
('PAY047', 4545130, 'PayPal'),
('PAY048', 4606544, 'Credit Card'),
('PAY049', 4742675, 'PayPal'),
('PAY050', 4903472, 'Cash on Delivery'),
('PAY051', 4918232, 'Cash'),
('PAY052', 5333553, 'PayPal'),
('PAY053', 5498743, 'Cash'),
('PAY054', 5798048, 'Credit Card'),
('PAY055', 6009830, 'Cash'),
('PAY056', 6175268, 'PayPal'),
('PAY057', 6444030, 'Credit Card'),
('PAY058', 6455222, 'Credit Card'),
('PAY059', 6707299, 'PayPal'),
('PAY060', 6846605, 'PayPal'),
('PAY061', 6863700, 'Debit Card'),
('PAY062', 6872598, 'Debit Card'),
('PAY063', 7038978, 'Cash on Delivery'),
('PAY064', 7097034, 'Debit Card'),
('PAY065', 7132724, 'Debit Card'),
('PAY066', 7202698, 'PayPal'),
('PAY067', 7223783, 'PayPal'),
('PAY068', 7285855, 'Debit Card'),
('PAY069', 7313248, 'Debit Card'),
('PAY070', 7328646, 'Credit Card'),
('PAY071', 7375726, 'Debit Card'),
('PAY072', 7504007, 'PayPal'),
('PAY073', 7506496, 'PayPal'),
('PAY074', 7535279, 'Debit Card'),
('PAY075', 7657901, 'Debit Card'),
('PAY076', 7828796, 'PayPal'),
('PAY077', 7830492, 'Credit Card'),
('PAY078', 7884920, 'Visa'),
('PAY079', 7977418, 'Debit Card'),
('PAY080', 8112986, 'Visa'),
('PAY081', 8121656, 'Cash'),
('PAY082', 8247732, 'Debit Card'),
('PAY083', 8265432, 'Visa'),
('PAY084', 8314094, 'Credit Card'),
('PAY085', 8342638, 'PayPal'),
('PAY086', 8373433, 'Visa'),
('PAY087', 8410161, 'PayPal'),
('PAY088', 8431233, 'Cash'),
('PAY089', 8438286, 'Debit Card'),
('PAY090', 8531792, 'PayPal'),
('PAY091', 8666637, 'Cash on Delivery'),
('PAY092', 8970717, 'PayPal'),
('PAY093', 9024575, 'Cash'),
('PAY094', 9032786, 'PayPal'),
('PAY095', 9086634, 'Credit Card'),
('PAY096', 9091033, 'PayPal'),
('PAY097', 9244518, 'Credit Card'),
('PAY098', 9250392, 'Debit Card'),
('PAY099', 9298720, 'Debit Card'),
('PAY100', 9356006, 'Debit Card'),
('PAY101', 9426749, 'Credit Card'),
('PAY102', 9516958, 'Debit Card'),
('PAY103', 9614856, 'Visa'),
('PAY104', 9674882, 'Credit Card'),
('PAY105', 9681367, 'Debit Card'),
('PAY106', 9684453, 'Credit Card'),
('PAY107', 9792281, 'Debit Card'),
('PAY108', 9924926, 'Credit Card'),
('PAY109', 9980695, 'Debit Card'),
('PAY110', 9994993, 'Debit Card');


-- ============================================================
-- DML — UPDATE QUERIES
-- ============================================================

-- Update 1: Upgrade customer segment to Premium
UPDATE CUSTOMERS SET Customer_Segment = 'Premium' WHERE Customer_ID = 10041;

-- Update 2: Mark a shipment as Delivered
UPDATE SHIPMENTS SET Order_Status = 'Delivered' WHERE Shipping_ID = 'S101';

-- Update 3: Correct a zipcode
UPDATE ADDRESSES SET Zipcode = '75936' WHERE Address_ID = 'A012';

-- Update 4: Update a product type
UPDATE PRODUCTS SET Product_Type = 'Air Conditioner' WHERE Product_Category = 'Electronics' AND Product_Type = 'AC';

-- ============================================================
-- DML — DELETE QUERIES
-- Order: PAYMENTS → SHIPMENTS → TRANSACTION_ITEMS → TRANSACTION_HEADERS
-- ============================================================

-- Delete 1: Remove a specific payment record
DELETE FROM PAYMENTS WHERE Payment_ID = 'PAY110';

-- Delete 2: Remove shipment with NULL Shipping_Method
DELETE FROM SHIPMENTS WHERE Shipping_ID = 'S60' AND Order_Status = 'Pending';

-- Delete 3: Full cascade delete of transaction 9426749
DELETE FROM PAYMENTS           WHERE Transaction_ID = 9426749;
DELETE FROM SHIPMENTS          WHERE Transaction_ID = 9426749;
DELETE FROM TRANSACTION_ITEMS  WHERE Transaction_ID = 9426749;
DELETE FROM TRANSACTION_HEADERS WHERE Transaction_ID = 9426749;


-- ============================================================
-- DQL — VERIFICATION SELECTS
-- ============================================================

SELECT * FROM CUSTOMERS;
SELECT * FROM ADDRESSES;
SELECT * FROM PRODUCTS;
SELECT * FROM TRANSACTION_HEADERS;
SELECT * FROM TRANSACTION_ITEMS;
SELECT * FROM SHIPMENTS;
SELECT * FROM PAYMENTS;

SELECT Name, Customer_Segment FROM CUSTOMERS WHERE Customer_Segment = 'Premium';
SELECT Transaction_ID, Amount FROM TRANSACTION_HEADERS WHERE Amount > 300;
SELECT * FROM SHIPMENTS WHERE Order_Status = 'Delivered';
SELECT Name, Age FROM CUSTOMERS ORDER BY Age DESC;

SELECT COUNT(*) AS Total_Customers    FROM CUSTOMERS;
SELECT COUNT(*) AS Total_Addresses    FROM ADDRESSES;
SELECT COUNT(*) AS Total_Products     FROM PRODUCTS;
SELECT COUNT(*) AS Total_TX_Headers   FROM TRANSACTION_HEADERS;
SELECT COUNT(*) AS Total_TX_Items     FROM TRANSACTION_ITEMS;
SELECT COUNT(*) AS Total_Shipments    FROM SHIPMENTS;
SELECT COUNT(*) AS Total_Payments     FROM PAYMENTS;
-- Inner Join 'Retrieve the customer names and their corresponding transaction amounts for every successful sale.'
SELECT C.Name, T.Amount, T.Date
FROM CUSTOMERS C
INNER JOIN TRANSACTION_HEADERS T ON C.Customer_ID = T.Customer_ID;

-- Left Join 'List all customers and their addresses. 
-- This includes customers who might not have an address on file '
SELECT C.Name, A.City, A.Country
FROM CUSTOMERS C
LEFT JOIN ADDRESSES A ON C.Customer_ID = A.Customer_ID;

-- Right Join
-- Show all shipment statuses along with the transaction dates. 
-- This ensures every shipment record is shown even if the transaction header was somehow missing.
SELECT T.Transaction_ID, T.Date, S.Order_Status
FROM TRANSACTION_HEADERS T
RIGHT JOIN SHIPMENTS S ON T.Transaction_ID = S.Transaction_ID;

-- Self Join
-- Find pairs of customers who belong to the same Customer_Segment (excluding matching a customer with themselves).
SELECT A.Name AS Customer1, B.Name AS Customer2, A.Customer_Segment
FROM CUSTOMERS A
INNER JOIN CUSTOMERS B ON A.Customer_Segment = B.Customer_Segment
WHERE A.Customer_ID < B.Customer_ID;

-- Nested Subquery
-- Find the names of customers who purchased products in the 'Electronics' category.
SELECT Name 
FROM CUSTOMERS 
WHERE Customer_ID IN (
    SELECT Customer_ID 
    FROM TRANSACTION_HEADERS 
    WHERE Transaction_ID IN (
        SELECT Transaction_ID 
        FROM TRANSACTION_ITEMS 
        WHERE Product_ID IN (
            SELECT Product_ID 
            FROM PRODUCTS 
            WHERE Product_Category = 'Electronics'
        )
    )
);
-- "How can we categorize our customers into loyalty tiers (Platinum, Gold, Silver) 
-- based on their total spending, 
 -- while also standardizing their display names for a marketing report?"
 -- This query transforms raw transaction data into a formatted business report.

SELECT 
    CONCAT(UPPER(C.Name), ' - ', C.Customer_Segment) AS Customer_Label,
    SUM(TH.Amount) AS Total_Spent,
    CASE 
        WHEN SUM(TH.Amount) > 1000 THEN 'Platinum'
        WHEN SUM(TH.Amount) BETWEEN 500 AND 1000 THEN 'Gold'
        ELSE 'Silver'
    END AS Spending_Tier
FROM CUSTOMERS C
JOIN TRANSACTION_HEADERS TH ON C.Customer_ID = TH.Customer_ID
GROUP BY C.Name, C.Customer_Segment;
-- "Which top 5 products are most frequently purchased by customers who also bought 'Running shoes' (P001)?"
-- This is a recommendation engine query. 
-- It identifies which products are most frequently purchased by the same customers who bought 'Running shoes' (P001).
WITH P001_Buyers AS (
    SELECT DISTINCT Customer_ID 
    FROM TRANSACTION_HEADERS TH
    JOIN TRANSACTION_ITEMS TI ON TH.Transaction_ID = TI.Transaction_ID
    WHERE TI.Product_ID = 'P001'
)
SELECT 
    P.Product_Name, 
    COUNT(TI.Product_ID) AS Times_Bought_With_Shoes
FROM TRANSACTION_ITEMS TI
JOIN TRANSACTION_HEADERS TH ON TI.Transaction_ID = TH.Transaction_ID
JOIN PRODUCTS P ON TI.Product_ID = P.Product_ID
WHERE TH.Customer_ID IN (SELECT Customer_ID FROM P001_Buyers)
  AND TI.Product_ID <> 'P001'
GROUP BY P.Product_Name
ORDER BY Times_Bought_With_Shoes DESC
LIMIT 5;
-- Find customers whose orders are currently "Pending" or "On Hold," but only for those who paid using 'Credit Card' or 'Visa' and
-- have a total transaction amount higher than the average amount of all "Delivered" orders.
SELECT 
    C.Name, 
    C.Email, 
    TH.Amount, 
    S.Order_Status, 
    P.Payment_Method
FROM CUSTOMERS C
JOIN TRANSACTION_HEADERS TH ON C.Customer_ID = TH.Customer_ID
JOIN SHIPMENTS S ON TH.Transaction_ID = S.Transaction_ID
JOIN PAYMENTS P ON TH.Transaction_ID = P.Transaction_ID
WHERE S.Order_Status IN ('Pending', 'On Hold')
  AND P.Payment_Method IN ('Credit Card', 'Visa')
  AND TH.Amount > (
      SELECT AVG(Amount) 
      FROM TRANSACTION_HEADERS 
      WHERE Transaction_ID IN (
          SELECT Transaction_ID FROM SHIPMENTS WHERE Order_Status = 'Delivered'
      )
  );
 -- "What is the total revenue and product variety per country, 
-- and what is each country's percentage share of global sales?"
-- This query generates a complex report showing each Country's total revenue, 
-- the number of unique products sold there, and 
-- what percentage that country contributes to the global total.
WITH RegionalRevenue AS (
    SELECT 
        A.Country,
        SUM(TH.Amount) AS Country_Revenue,
        COUNT(DISTINCT TI.Product_ID) AS Unique_Products_Sold
    FROM ADDRESSES A
    JOIN TRANSACTION_HEADERS TH ON A.Address_ID = TH.Address_ID
    JOIN TRANSACTION_ITEMS TI ON TH.Transaction_ID = TI.Transaction_ID
    GROUP BY A.Country
),
GlobalRevenue AS (
    SELECT SUM(Country_Revenue) AS Total_Global_Sales FROM RegionalRevenue
)
SELECT 
    R.Country,
    R.Country_Revenue,
    R.Unique_Products_Sold,
    ROUND((R.Country_Revenue / G.Total_Global_Sales) * 100, 2) AS Percent_Of_Global_Sales
FROM RegionalRevenue R, GlobalRevenue G
ORDER BY Country_Revenue DESC;
-- "Show a detailed list of all products sold in high-value transactions, 
-- including customer names, payment methods, shipping destinations, and the product's global popularity."
-- This query returns a detailed line-item view of every product sold,
-- who bought it, how they paid, and where it's going. 
-- It uses a CTE to pre-calculate product popularity and a subquery to filter for high-value items.
WITH ProductPopularity AS (
    -- CTE: Pre-calculate how many times each product was sold globally
    SELECT Product_ID, COUNT(*) AS Total_Sold_Count
    FROM TRANSACTION_ITEMS
    GROUP BY Product_ID
)
SELECT 
    TI.Transaction_ID,
    C.Name AS Customer_Name,
    P.Product_Name,
    P.Product_Category,
    PP.Total_Sold_Count,
    TH.Amount AS Total_TX_Amount,
    S.Shipping_Method,
    S.Order_Status,
    PM.Payment_Method,
    A.City,
    A.Country
FROM TRANSACTION_ITEMS TI
INNER JOIN PRODUCTS P ON TI.Product_ID = P.Product_ID
INNER JOIN TRANSACTION_HEADERS TH ON TI.Transaction_ID = TH.Transaction_ID
INNER JOIN CUSTOMERS C ON TH.Customer_ID = C.Customer_ID
INNER JOIN ADDRESSES A ON TH.Address_ID = A.Address_ID
LEFT JOIN SHIPMENTS S ON TH.Transaction_ID = S.Transaction_ID
LEFT JOIN PAYMENTS PM ON TH.Transaction_ID = PM.Transaction_ID
INNER JOIN ProductPopularity PP ON P.Product_ID = PP.Product_ID
WHERE TH.Amount > (
    -- Subquery: Only show lines from transactions above the company average
    SELECT AVG(Amount) FROM TRANSACTION_HEADERS
)
ORDER BY TI.Transaction_ID ASC;
-- "Generate a loyalty profile for each customer showing their lifetime spending, 
-- total order count, and the product category from their most recent transaction."
-- This query creates a historical profile for every customer. 
-- It shows their total history alongside their most recent purchase details. 
-- It uses a CTE for total spending and a correlated subquery to fetch the "Last Product Category" they touched.
WITH LoyaltySummary AS (
    -- CTE: Summarize every customer's total financial impact
    SELECT 
        Customer_ID, 
        COUNT(Transaction_ID) AS Total_Orders,
        SUM(Amount) AS Lifetime_Value,
        MAX(Date) AS Most_Recent_Purchase
    FROM TRANSACTION_HEADERS
    GROUP BY Customer_ID
)
SELECT 
    C.Customer_ID,
    C.Name,
    C.Customer_Segment,
    LS.Total_Orders,
    LS.Lifetime_Value,
    TH.Transaction_ID AS Latest_TX_ID,
    TH.Date AS Latest_TX_Date,
    TH.Feedback,
    (
        -- Subquery: Get the category of the first item in their latest transaction
        SELECT P.Product_Category 
        FROM TRANSACTION_ITEMS TI 
        JOIN PRODUCTS P ON TI.Product_ID = P.Product_ID 
        WHERE TI.Transaction_ID = TH.Transaction_ID 
        LIMIT 1
    ) AS Recently_Purchased_Category,
    A.State,
    A.Zipcode
FROM CUSTOMERS C
INNER JOIN LoyaltySummary LS ON C.Customer_ID = LS.Customer_ID
INNER JOIN TRANSACTION_HEADERS TH ON C.Customer_ID = TH.Customer_ID 
    AND TH.Date = LS.Most_Recent_Purchase
INNER JOIN ADDRESSES A ON C.Customer_ID = A.Customer_ID
WHERE LS.Total_Orders >= (
    -- Multi-row subquery: Filter for customers who are at or above average order counts
    SELECT AVG(Total_Orders) FROM (
        SELECT COUNT(Transaction_ID) AS Total_Orders 
        FROM TRANSACTION_HEADERS GROUP BY Customer_ID
    ) AS AvgTable
)
ORDER BY LS.Lifetime_Value DESC;

-- "Which 'Clothing' products have an associated transaction
-- amount lower than the average price of all 'Home Decor' items?"
-- This query identifies products in the Clothing category 
-- that are selling for less than the average price of a Home Decor item.
-- It uses a LEFT JOIN to ensure we see the product details even if the transaction data is sparse.
WITH ProductSales AS (
    -- CTE: Get a list of all products and their associated transaction amounts
    SELECT 
        P.Product_Name, 
        P.Product_Category, 
        TH.Amount
    FROM PRODUCTS P
    LEFT JOIN TRANSACTION_ITEMS TI ON P.Product_ID = TI.Product_ID
    LEFT JOIN TRANSACTION_HEADERS TH ON TI.Transaction_ID = TH.Transaction_ID
)
SELECT Product_Name, Product_Category, Amount
FROM ProductSales
WHERE Product_Category = 'Clothing'
  AND Amount < (
      -- Subquery: The "Price Ceiling" (Average price of Home Decor)
      SELECT AVG(Amount) 
      FROM TRANSACTION_HEADERS 
      WHERE Transaction_ID IN (
          SELECT Transaction_ID 
          FROM TRANSACTION_ITEMS TI 
          JOIN PRODUCTS P2 ON TI.Product_ID = P2.Product_ID 
          WHERE P2.Product_Category = 'Home Decor'
      )
  );
-- "List the names, amounts, and shipping statuses of international customers 
-- whose spending exceeds the overall transaction average."
-- This query finds all customers living outside the USA who have spent more than the general average. 
-- It uses a RIGHT JOIN to focus on the shipment statuses linked back to those specific customers.
WITH InternationalCustomers AS (
    -- CTE: Filter for customers not in the USA
    SELECT Customer_ID, Name 
    FROM CUSTOMERS 
    WHERE Customer_ID IN (
        SELECT Customer_ID FROM ADDRESSES WHERE Country != 'USA'
    )
)
SELECT 
    IC.Name, 
    TH.Amount, 
    S.Order_Status, 
    S.Shipping_Method
FROM TRANSACTION_HEADERS TH
RIGHT JOIN InternationalCustomers IC ON TH.Customer_ID = IC.Customer_ID
LEFT JOIN SHIPMENTS S ON TH.Transaction_ID = S.Transaction_ID
WHERE TH.Amount > (
    -- Subquery: Show only those who spend more than the total average
    SELECT AVG(Amount) FROM TRANSACTION_HEADERS
)
ORDER BY TH.Amount DESC;
-- "Which products are selling below the 'success threshold' of 2 units, 
-- and how does this list compare to the total inventory variety available in their respective categories?" 
-- This query identifies products that are "slow movers." 
-- This gives you a list of items that aren't quite "ghosts" but are close to it. 
WITH CategorySummary AS (
    -- CTE: Calculate total variety of products per category
    SELECT Product_Category, COUNT(Product_ID) as Total_Category_Variety
    FROM PRODUCTS
    GROUP BY Product_Category
)
SELECT 
    P.Product_Name, 
    P.Product_Category, 
    P.Product_Brand,
    CS.Total_Category_Variety
FROM PRODUCTS P
JOIN CategorySummary CS ON P.Product_Category = CS.Product_Category
WHERE P.Product_ID IN (
    -- Subquery: Find products sold exactly 0 or 1 time
    -- This ensures you get an output even if every item has sold once
    SELECT P2.Product_ID
    FROM PRODUCTS P2
    LEFT JOIN TRANSACTION_ITEMS TI ON P2.Product_ID = TI.Product_ID
    GROUP BY P2.Product_ID
    HAVING COUNT(TI.Transaction_ID) < 2
)
ORDER BY CS.Total_Category_Variety DESC, P.Product_Name ASC;
-- "For each customer segment, calculate the total revenue generated and 
-- the average order value. 
-- Only include customers who live in a city that has hosted a transaction larger than the overall company average." 
-- This is a complex geographic-financial analysis. 
-- This is used by businesses to decide which cities are "hubs" for specific types of customers (like Premium vs. Regular). 
WITH SegmentRevenue AS (
    -- CTE: Calculate total spend and order frequency per segment
    SELECT 
        C.Customer_Segment,
        SUM(TH.Amount) AS Total_Segment_Revenue,
        AVG(TH.Amount) AS Avg_Order_Value,
        COUNT(TH.Transaction_ID) AS Total_TX_Count
    FROM CUSTOMERS C
    JOIN TRANSACTION_HEADERS TH ON C.Customer_ID = TH.Customer_ID
    GROUP BY C.Customer_Segment
)
SELECT 
    SR.Customer_Segment,
    SR.Total_Segment_Revenue,
    SR.Avg_Order_Value
FROM SegmentRevenue SR
WHERE SR.Customer_Segment IN (
    -- Subquery: Only select segments represented by customers in high-value cities
    SELECT DISTINCT C2.Customer_Segment
    FROM CUSTOMERS C2
    JOIN ADDRESSES A ON C2.Customer_ID = A.Customer_ID
    WHERE A.City IN (
        -- Nested Subquery: Cities where at least one order was > company average
        SELECT A2.City 
        FROM ADDRESSES A2
        JOIN TRANSACTION_HEADERS TH2 ON A2.Address_ID = TH2.Address_ID
        WHERE TH2.Amount > (SELECT AVG(Amount) FROM TRANSACTION_HEADERS)
    ));

-- "In categories that have generated more than $500 in total revenue, 
-- which specific transactions fell below the average amount for that category?"
WITH CategoryRevenue AS (
    -- CTE: Find high-performing categories
    SELECT P.Product_Category, SUM(TH.Amount) as Total_Rev
    FROM PRODUCTS P
    JOIN TRANSACTION_ITEMS TI ON P.Product_ID = TI.Product_ID
    JOIN TRANSACTION_HEADERS TH ON TI.Transaction_ID = TH.Transaction_ID
    GROUP BY P.Product_Category
    HAVING SUM(TH.Amount) > 500
)
SELECT 
    TH.Transaction_ID, 
    P.Product_Name, 
    P.Product_Category, 
    TH.Amount
FROM TRANSACTION_HEADERS TH
JOIN TRANSACTION_ITEMS TI ON TH.Transaction_ID = TI.Transaction_ID
JOIN PRODUCTS P ON TI.Product_ID = P.Product_ID
WHERE P.Product_Category IN (SELECT Product_Category FROM CategoryRevenue)
AND TH.Amount < (
    -- Subquery: Compare to the average of their own category
    SELECT AVG(TH2.Amount)
    FROM TRANSACTION_HEADERS TH2
    JOIN TRANSACTION_ITEMS TI2 ON TH2.Transaction_ID = TI2.Transaction_ID
    JOIN PRODUCTS P2 ON TI2.Product_ID = P2.Product_ID
    WHERE P2.Product_Category = P.Product_Category
);
-- "Which customers have only made a single purchase, 
-- but that purchase was worth more than twice the company average? 
-- Include their city and the payment method they used."
WITH SinglePurchaseCustomers AS (
    -- CTE: Find customers with exactly one transaction
    SELECT Customer_ID, COUNT(Transaction_ID) as Order_Count, SUM(Amount) as Total_Spent
    FROM TRANSACTION_HEADERS
    GROUP BY Customer_ID
    HAVING COUNT(Transaction_ID) = 1
)
SELECT 
    C.Name, 
    A.City, 
    SPC.Total_Spent, 
    P.Payment_Method
FROM CUSTOMERS C
JOIN SinglePurchaseCustomers SPC ON C.Customer_ID = SPC.Customer_ID
JOIN ADDRESSES A ON C.Customer_ID = A.Customer_ID
JOIN TRANSACTION_HEADERS TH ON C.Customer_ID = TH.Customer_ID
JOIN PAYMENTS P ON TH.Transaction_ID = P.Transaction_ID
WHERE SPC.Total_Spent > (
    -- Subquery: The "High Value" benchmark
    SELECT AVG(Amount) FROM TRANSACTION_HEADERS
)
ORDER BY SPC.Total_Spent DESC;

-- "Which customers gave a 'Bad' or 'Average' rating despite spending 
-- more than the average transaction amount, 
-- and what was the specific product that triggered this interaction?" 
-- This query identifies "at-risk" high-value customers by filtering 
-- for poor feedback on transactions that exceed the company's average revenue.
SELECT 
    C.Name AS Customer_Name,
    TH.Amount AS High_Spend_Amount,
    TH.Ratings,
    TH.Feedback,
    P.Product_Name,
    S.Order_Status
FROM CUSTOMERS C
JOIN TRANSACTION_HEADERS TH ON C.Customer_ID = TH.Customer_ID
JOIN TRANSACTION_ITEMS TI ON TH.Transaction_ID = TI.Transaction_ID
JOIN PRODUCTS P ON TI.Product_ID = P.Product_ID
JOIN SHIPMENTS S ON TH.Transaction_ID = S.Transaction_ID
WHERE TH.Ratings <= 3  -- Filtering for Average/Bad ratings
AND TH.Amount > (
    -- Subquery: The financial benchmark (Average of all transactions)
    SELECT AVG(Amount) FROM TRANSACTION_HEADERS
)
ORDER BY TH.Amount DESC;


