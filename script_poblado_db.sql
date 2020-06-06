 -- ▒▒▒▒▒▒▒▒▒▒▒▒▒ SELECCIONAMOS LA BASE DE DATOS zapato_roto ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
use zapato_roto;
 -- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA PAIS ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.pais(`pais`) values
('Bolivia'),
('Peru'),
('Colombia');
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA CLIENTE ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.cliente(`idpais`,`cedula`,`nombre`) values
(1,'10810988017','Jesus Alarcon Cusi'),
(1,'14528596014','Shadria Ballivian'),
(2,'25634585','Mario Avila'),
(2,'74856896','Indiana Seoane'),
(3,'78458965','Rodolfo Suarez'),
(3,'45859654','Harrizon Guzman'),
(1,'12457858','Gabriela Cuellar'),
(1,'84846954','Arbin Hano'),
(1,'84846954','Jorge Suntura'),
(1,'84846954','Ariel Aquino'),
(1,'123645711','Gabriela Cuellar');
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA CATEGORIA ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.categoria(`categoria`) values
('Sport'),
('Paseo'),
('Casual'),
('Sandalias'),
('Bota');
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA ZAPATO ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.zapato(`idcategoria`,`zapato`) values
(1,'DERBY'),
(2,'DERBY'),
(3,'DERBY'),
(1,'TX SPORT DF'),
(5,'MT ROG FR'),
(2,'DOON WINOTIP'),
(2,'YORDAN');
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA TALLA ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.talla(`talla`) values
(42),
(40),
(38),
(36),
(29);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA TALLA_ZAPATO ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.talla_zapato(`idzapato`,`idtalla`) values
(1,1),
(1,2),
(2,1),
(2,2),
(3,5),
(4,1),
(4,2),
(4,3),
(5,1),
(5,2),
(5,4);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA INGRESO ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.ingreso(`fecha`) values
('2020-06-01 18:10:00'),
('2020-06-06 12:00:20');
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA DETALLE_INGRESO ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.detalle_ingreso(`idingreso`,`idtallazapato`,`cantidad`,`valor`) values
(1,1,20,50.25),
(1,2,50,100.50),
(1,3,50,80.50),
(1,4,100,150.50),
(1,5,75,180.50),
(1,6,150,170);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA FACTURA ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.factura(`idcliente`,`fecha`) values
(1,'2020-06-06 18:30:20'),
(1,'2020-06-10 14:25:00'),
(1,'2020-06-20 08:23:10'),
(1,'2020-07-01 18:30:20'),
(2,'2020-06-06 17:23:23'),
(2,'2020-06-10 08:30:54'),
(2,'2020-06-23 14:50:22'),
(3,'2020-06-06 08:50:34'),
(3,'2020-07-01 07:45:43'),
(3,'2020-07-06 18:30:16'),
(4,'2020-06-01 12:20:23'),
(4,'2020-06-06 14:10:43'),
(5,'2020-06-12 18:50:32'),
(5,'2020-06-30 14:40:21'),
(6,'2020-06-06 20:33:23'),
(6,'2020-07-01 11:12:40'),
(6,'2020-07-06 19:35:50'),
(7,'2020-07-01 12:15:20'),
(8,'2020-07-02 11:25:10');
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ POBLADO DE LA TABLA DETALLE_FACTURA ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
insert into zapato_roto.detalle_factura(`idfactura`,`idtallazapato`,`cantidad`,`valor`,`descuento_porcentaje`) values
(1,2,2,100.50,10),
(1,6,3,170.00,0),
(1,4,1,150.50,5),
(2,2,1,100.50,0),
(2,3,1,80.50,15),
(3,5,2,180.5,10),
(4,1,1,50.25,10),
(4,3,2,80.5,0),
(4,6,3,170.00,5),
(5,5,1,180.50,10),
(5,6,1,170.00,0),
(5,1,1,50.25,5),
(6,4,1,150.50,0),
(6,5,1,180.50,15),
(7,1,2,50.25,10),
(8,2,2,100.50,10),
(8,1,1,50.25,0),
(8,6,2,170.00,5),
(9,1,1,50.25,10),
(9,5,1,180.50,0),
(9,4,1,150.50,5),
(10,2,2,100.50,0),
(10,5,1,180.50,15),
(11,5,1,180.50,10),
(12,2,2,100.50,10),
(12,3,1,80.5,0),
(12,6,3,170.00,5),
(13,2,3,100.50,10),
(13,4,1,150.50,0),
(13,5,2,180.50,5),
(14,5,2,180.50,0),
(14,3,2,80.50,15),
(15,5,1,180.5,10),
(16,2,2,100.50,10),
(16,1,2,50.25,0),
(16,4,1,150.50,5),
(17,6,1,170,10),
(17,3,1,80.5,0),
(17,6,1,170,10),
(18,3,1,80.5,0),
(19,1,1,50.25,5);