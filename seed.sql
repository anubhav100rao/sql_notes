DROP TABLE IF EXISTS `Employee`;
CREATE TABLE `Employee` (
    `id` mediumint(8) unsigned NOT NULL auto_increment,
    `name` varchar(255) default NULL,
    `company` varchar(255),
    `department` TEXT default NULL,
    `email` varchar(255) default NULL,
    `salary` mediumint default NULL,
    PRIMARY KEY (`id`)
) AUTO_INCREMENT = 1;
INSERT INTO `Employee` (
        `name`,
        `company`,
        `department`,
        `email`,
        `numberrange`
    )
VALUES (
        "Jana Mcclain",
        "Mauris Eu LLC",
        "CSE",
        "tortor.nibh@yahoo.com",
        42204
    ),
    (
        "Edward Calderon",
        "Massa Corporation",
        "MNC",
        "tellus.aenean.egestas@aol.edu",
        19080
    ),
    (
        "Norman Burris",
        "Tristique Aliquet Foundation",
        "ME",
        "hendrerit.consectetuer.cursus@icloud.edu",
        59242
    ),
    (
        "Rose Christensen",
        "Eu Sem Pellentesque Foundation",
        "CE",
        "malesuada@protonmail.couk",
        52840
    ),
    (
        "Karleigh Daniel",
        "Convallis Ante Limited",
        "ME",
        "pharetra@hotmail.org",
        79250
    ),
    (
        "Danielle Briggs",
        "Magna Inc.",
        "CHEM",
        "lobortis.quam@outlook.org",
        27426
    ),
    (
        "Mercedes Davis",
        "Vitae Sodales At Associates",
        "CE",
        "a.odio.semper@icloud.ca",
        77783
    ),
    (
        "Hayes Boone",
        "Senectus Et PC",
        "CHEM",
        "luctus.et.ultrices@google.couk",
        77570
    ),
    (
        "Jerry Finley",
        "Mauris Eu Consulting",
        "EE",
        "dui.cras@icloud.couk",
        54206
    ),
    (
        "Talon Blanchard",
        "Pellentesque Corporation",
        "CHEM",
        "neque@google.ca",
        71473
    ),
    (
        "Hayes James",
        "Luctus Sit Institute",
        "CHEM",
        "non.luctus@yahoo.com",
        42560
    ),
    (
        "Lev Mathews",
        "Dolor Quam Elementum Corporation",
        "ECE",
        "aenean@yahoo.couk",
        36115
    ),
    (
        "Minerva Bray",
        "Pretium Aliquet Associates",
        "PHY",
        "tincidunt.neque.vitae@icloud.org",
        59488
    ),
    (
        "Charde Hanson",
        "Sit Amet Consectetuer Company",
        "MNC",
        "tristique.neque.venenatis@protonmail.edu",
        47479
    ),
    (
        "Simone Hatfield",
        "Arcu Sed Eu Corp.",
        "EE",
        "dolor.fusce.mi@hotmail.com",
        25363
    ),
    (
        "Molly Stafford",
        "Est Vitae LLC",
        "ME",
        "egestas.a@aol.com",
        30298
    ),
    (
        "Karen Lindsey",
        "Nunc Institute",
        "MNC",
        "lacus.pede@aol.org",
        79234
    ),
    (
        "Kasper Rodriguez",
        "Gravida Incorporated",
        "MNC",
        "pellentesque.a.facilisis@google.ca",
        46330
    ),
    (
        "Tyrone Acosta",
        "Quisque Libero Foundation",
        "CHEM",
        "ligula.elit.pretium@google.net",
        55494
    ),
    (
        "Sydney Roman",
        "Cras Lorem Lorem PC",
        "MNC",
        "dictum@icloud.com",
        72779
    ),
    (
        "Medge Faulkner",
        "Fringilla Mi Industries",
        "ECE",
        "nascetur.ridiculus@hotmail.ca",
        51959
    ),
    (
        "Colt Larsen",
        "Enim Foundation",
        "EE",
        "aliquam.enim@aol.net",
        58451
    ),
    (
        "Allegra Hubbard",
        "Feugiat Placerat Velit Associates",
        "CE",
        "est.nunc@hotmail.ca",
        53192
    ),
    (
        "Sonya Farley",
        "Donec Tincidunt Donec LLC",
        "EE",
        "elementum.purus@aol.com",
        53299
    ),
    (
        "Kelsie Davenport",
        "Massa Company",
        "CHEM",
        "quam.elementum.at@icloud.org",
        50768
    ),
    (
        "Marvin Simmons",
        "Vitae Velit Egestas Inc.",
        "MNC",
        "venenatis.vel@hotmail.com",
        10893
    ),
    (
        "Rose Phillips",
        "Cursus Diam Foundation",
        "CHEM",
        "nulla.eu.neque@protonmail.edu",
        18207
    ),
    (
        "Cyrus Kline",
        "Nunc Laoreet Lectus LLC",
        "CHEM",
        "malesuada.id@protonmail.com",
        14020
    ),
    (
        "Hadassah Zimmerman",
        "Mauris Aliquam Eu LLC",
        "EE",
        "tempus@hotmail.edu",
        74680
    ),
    (
        "Joelle Moon",
        "Malesuada Vel Convallis Institute",
        "ECE",
        "vestibulum.neque@google.edu",
        16463
    ),
    (
        "Nasim Velez",
        "Magna A Tortor Limited",
        "PHY",
        "eu.euismod@google.edu",
        30415
    ),
    (
        "Ramona Bruce",
        "Pede Blandit Corporation",
        "MNC",
        "massa.lobortis.ultrices@protonmail.com",
        41030
    ),
    (
        "Oleg Mcintosh",
        "Dapibus Gravida Inc.",
        "PHY",
        "porta@yahoo.couk",
        28616
    ),
    (
        "Ila Erickson",
        "Dictum Sapien Aenean Inc.",
        "PHY",
        "nec@yahoo.couk",
        65140
    ),
    (
        "Risa Kelley",
        "Elit Etiam Limited",
        "ME",
        "felis.purus.ac@aol.ca",
        17838
    ),
    (
        "Arsenio Bell",
        "Aliquam Ultrices Consulting",
        "PHY",
        "donec.luctus@protonmail.org",
        72160
    ),
    (
        "Freya Burns",
        "Elit Ltd",
        "ECE",
        "posuere.vulputate@outlook.ca",
        27917
    ),
    (
        "Cameron Riddle",
        "Vivamus Sit Amet Inc.",
        "BT",
        "proin.sed@outlook.net",
        15632
    ),
    (
        "Faith Ross",
        "Magna A Neque Limited",
        "MNC",
        "velit.eget@hotmail.ca",
        75300
    ),
    (
        "Kennedy Jensen",
        "Egestas Ltd",
        "EE",
        "ridiculus.mus@outlook.org",
        79022
    ),
    (
        "Rama Gilmore",
        "Mauris Incorporated",
        "CE",
        "enim.nisl@hotmail.edu",
        53590
    ),
    (
        "Cally Harding",
        "Curabitur Massa Vestibulum Incorporated",
        "EE",
        "pellentesque.a.facilisis@protonmail.edu",
        48394
    ),
    (
        "Caldwell Weiss",
        "Curabitur Sed Associates",
        "ECE",
        "metus.eu@google.com",
        13015
    ),
    (
        "Martha Melendez",
        "Commodo Hendrerit Donec Incorporated",
        "PHY",
        "vitae.aliquam.eros@outlook.com",
        13834
    ),
    (
        "Yvonne Joseph",
        "Per Associates",
        "ME",
        "eu.accumsan@google.ca",
        59853
    ),
    (
        "Dorian Delgado",
        "Nisl Quisque Inc.",
        "ECE",
        "cras@protonmail.ca",
        60606
    ),
    (
        "William Carver",
        "Semper Tellus LLC",
        "ECE",
        "pellentesque.habitant.morbi@icloud.couk",
        61829
    ),
    (
        "Lionel Stokes",
        "Magnis Dis Parturient PC",
        "MNC",
        "vulputate.lacus@google.net",
        14580
    ),
    (
        "Nell Singleton",
        "Sociosqu Ad Litora Ltd",
        "ECE",
        "facilisis.magna.tellus@hotmail.couk",
        20316
    ),
    (
        "Hayes Leach",
        "Ut Odio Institute",
        "MNC",
        "sit.amet@hotmail.net",
        70595
    );
INSERT INTO `Employee` (
        `name`,
        `company`,
        `department`,
        `email`,
        `numberrange`
    )
VALUES (
        "Brady Steele",
        "Nonummy Ac LLC",
        "CE",
        "volutpat.nulla.facilisis@protonmail.edu",
        66110
    ),
    (
        "Lysandra Gonzalez",
        "Arcu LLC",
        "EE",
        "turpis@hotmail.edu",
        57757
    ),
    (
        "Thor Maldonado",
        "Vulputate Posuere Institute",
        "ECE",
        "vel.lectus@icloud.couk",
        41639
    ),
    (
        "Lara Fischer",
        "Nullam Velit Incorporated",
        "PHY",
        "ipsum.leo@google.net",
        55680
    ),
    (
        "Nicole Phelps",
        "Mi Felis Industries",
        "CHEM",
        "nostra@yahoo.edu",
        27219
    ),
    (
        "Yoshi Casey",
        "Bibendum Ullamcorper LLP",
        "EE",
        "neque.in.ornare@yahoo.com",
        17908
    ),
    (
        "Timothy White",
        "Non Egestas Associates",
        "CHEM",
        "donec.nibh@google.com",
        24320
    ),
    (
        "Elaine Bird",
        "Metus Facilisis Inc.",
        "PHY",
        "a.facilisis.non@outlook.net",
        78211
    ),
    (
        "Abra Kline",
        "Non Lobortis Quis Inc.",
        "CE",
        "in.ornare@icloud.org",
        72031
    ),
    (
        "Kay Beard",
        "Consectetuer Limited",
        "CE",
        "ornare@google.couk",
        75717
    ),
    (
        "Jillian Meyers",
        "Vulputate Dui Nec Industries",
        "MNC",
        "velit.aliquam.nisl@icloud.edu",
        21716
    ),
    (
        "Dominic Levy",
        "Viverra Corporation",
        "ME",
        "faucibus.orci.luctus@outlook.net",
        79708
    ),
    (
        "Sybill Yang",
        "Volutpat Associates",
        "ECE",
        "morbi.accumsan@yahoo.net",
        40782
    ),
    (
        "Hayley Gilliam",
        "Non Arcu Industries",
        "ME",
        "risus@protonmail.couk",
        12054
    ),
    (
        "Murphy Puckett",
        "Malesuada Fames Foundation",
        "ECE",
        "fusce.mollis@protonmail.ca",
        15904
    ),
    (
        "Stuart Spencer",
        "Ac Arcu Nunc Incorporated",
        "CHEM",
        "cursus.et@protonmail.couk",
        74501
    ),
    (
        "Carolyn Stevenson",
        "Ipsum Donec LLP",
        "MNC",
        "fermentum.metus.aenean@icloud.ca",
        13189
    ),
    (
        "Drew Hahn",
        "Est Congue Ltd",
        "MNC",
        "ipsum.porta@hotmail.couk",
        17479
    ),
    (
        "Ethan Lynch",
        "Donec Limited",
        "ME",
        "ornare.libero@icloud.com",
        67514
    ),
    (
        "Eugenia Langley",
        "Nunc Ullamcorper Eu Ltd",
        "PHY",
        "fames@icloud.ca",
        67462
    ),
    (
        "Paul William",
        "Tempor Ltd",
        "CE",
        "tincidunt@aol.com",
        16914
    ),
    (
        "Rhiannon Tyler",
        "Laoreet Corporation",
        "BT",
        "magna@google.edu",
        65367
    ),
    (
        "Galena Vang",
        "Morbi Non Sapien Associates",
        "ECE",
        "pharetra.nibh@aol.org",
        28861
    ),
    (
        "Aphrodite Blevins",
        "Erat Eget Corp.",
        "EE",
        "lorem.ut.aliquam@outlook.net",
        8149
    ),
    (
        "Kaseem Rutledge",
        "Augue Porttitor Corp.",
        "PHY",
        "volutpat.nulla@aol.edu",
        39025
    ),
    (
        "Acton Roth",
        "Commodo PC",
        "PHY",
        "dolor.tempus.non@icloud.com",
        78645
    ),
    (
        "Kaitlin Castaneda",
        "Non Enim Mauris LLC",
        "ECE",
        "ultrices.iaculis@protonmail.net",
        26417
    ),
    (
        "Paul Mathews",
        "Penatibus Et Magnis Industries",
        "ECE",
        "curabitur.sed.tortor@hotmail.net",
        16352
    ),
    (
        "Raphael Henry",
        "Elit Curabitur Corp.",
        "ECE",
        "amet@aol.net",
        59399
    ),
    (
        "Karleigh Stevens",
        "Lacus Varius Et Corp.",
        "CE",
        "quisque.libero@yahoo.com",
        36744
    ),
    (
        "Zia Chambers",
        "Pede Nonummy LLP",
        "CHEM",
        "amet@protonmail.edu",
        10643
    ),
    (
        "Tanner Valenzuela",
        "Sed Corporation",
        "ME",
        "elit.sed.consequat@outlook.net",
        28578
    ),
    (
        "Faith Griffin",
        "Nunc Sollicitudin Corp.",
        "CE",
        "sem.ut@icloud.ca",
        10868
    ),
    (
        "Theodore Nixon",
        "Congue Elit Ltd",
        "CE",
        "interdum.libero@aol.couk",
        14478
    ),
    (
        "Kyra Carney",
        "Feugiat Lorem LLP",
        "EE",
        "laoreet@aol.org",
        60663
    ),
    (
        "Blythe Glass",
        "Non Nisi Aenean Consulting",
        "ME",
        "sed@hotmail.ca",
        45976
    ),
    (
        "Minerva Bates",
        "Ac LLC",
        "EE",
        "proin.sed@aol.edu",
        38484
    ),
    (
        "Harper Nieves",
        "Quam Dignissim LLP",
        "ECE",
        "egestas.duis.ac@outlook.couk",
        31057
    ),
    (
        "Arsenio Drake",
        "Malesuada Malesuada Inc.",
        "MNC",
        "luctus.sit.amet@icloud.edu",
        73011
    ),
    (
        "Regina Cline",
        "Ligula Consectetuer Associates",
        "PHY",
        "porta.elit@aol.couk",
        32271
    ),
    (
        "Conan Hamilton",
        "Vestibulum Lorem Sit LLC",
        "ME",
        "cursus@protonmail.net",
        11609
    ),
    (
        "Mia Bass",
        "Velit Aliquam Associates",
        "CHEM",
        "eu@aol.ca",
        30331
    ),
    (
        "Charity Hodge",
        "Tellus Justo Sit Institute",
        "PHY",
        "phasellus.elit@aol.org",
        39818
    ),
    (
        "TaShya Bryan",
        "Convallis Limited",
        "ME",
        "aenean@icloud.net",
        49190
    ),
    (
        "Martina Price",
        "Dui Fusce Diam LLP",
        "ME",
        "posuere.vulputate@hotmail.com",
        48806
    ),
    (
        "Quynn Hess",
        "Risus Donec Nibh Institute",
        "MNC",
        "vulputate.velit@hotmail.ca",
        74339
    ),
    (
        "Maxine Wyatt",
        "Lacus Varius Consulting",
        "CE",
        "non.bibendum@hotmail.edu",
        39833
    ),
    (
        "Dylan Battle",
        "Ornare Corp.",
        "CE",
        "tortor@google.net",
        30027
    ),
    (
        "Hamish Berger",
        "Gravida Mauris Institute",
        "CSE",
        "non.feugiat@google.ca",
        37553
    ),
    (
        "Rafael Johnson",
        "Nulla Consulting",
        "BT",
        "eu@yahoo.edu",
        25447
    );
drop table department;
create table department (
    department_id int PRIMARY KEY NOT NULL auto_increment,
    department VARCHAR(4),
    location VARCHAR(15)
) AUTO_INCREMENT = 1;
insert into department (department, location)
VALUES ('CSE', 'Bangalore'),
    ('ECE', 'Chandigarh'),
    ('ME', 'Hyderabad'),
    ('EE', 'Delhi'),
    ('BT', 'Mumbai'),
    ('PHY', 'Chennai'),
    ('CHEM', 'Ahemadabad'),
    ('MNC', 'Pune'),
    ('META', 'Lucknow');