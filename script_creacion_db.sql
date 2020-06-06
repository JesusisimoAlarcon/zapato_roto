
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA DB `zapato_roto`  ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create database zapato_roto;
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ SELECCIONAMOS LA BASE DE DATOS zapato_roto ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
use zapato_roto;
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA categoria ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table categoria (
	idcategoria int auto_increment primary key,
    categoria varchar(20) not null
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA zapato ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table zapato (
	idzapato int auto_increment primary key,
    idcategoria int not null,
    zapato varchar(100) not null,
    foreign key(idcategoria) references categoria(idcategoria)
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA talla ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table talla (
	idtalla int auto_increment primary key,
    talla smallint not null
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA talla_zapato ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table talla_zapato (
	idtallazapato int auto_increment primary key,
    idzapato  int not null,
    idtalla  int not null,
    foreign key(idzapato) references zapato(idzapato),
    foreign key(idtalla) references talla(idtalla)
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA pais ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table pais (
	idpais int auto_increment primary key,
    pais varchar(100) not null
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA cliente ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table cliente (
	idcliente int auto_increment primary key,
    idpais int not null,
    cedula varchar(15) not null,
    nombre varchar(100) not null,
    foreign key(idpais) references pais(idpais)
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA ingreso ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table ingreso (
	idingreso int auto_increment primary key,
    fecha datetime not null
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA detalle_ingreso ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table detalle_ingreso (
	iddetalleingreso int auto_increment primary key,
    idingreso int not null,
    idtallazapato int not null,
    cantidad smallint not null,
    valor decimal(5,2) not null,
    foreign key(idingreso) references ingreso(idingreso),
    foreign key(idtallazapato) references talla_zapato(idtallazapato)
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA factura ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table factura (
	idfactura int auto_increment primary key,
    idcliente int not null,
    fecha datetime not null,
    foreign key(idcliente) references cliente(idcliente)
);
-- ▒▒▒▒▒▒▒▒▒▒▒▒▒ CREACION DE LA TABLA detalle_factura ▒▒▒▒▒▒▒▒▒▒▒▒▒ --
create table detalle_factura (
	iddetallefactura int auto_increment primary key,
    idfactura int not null,
    idtallazapato int not null,
    cantidad smallint,
    valor decimal(5,2) not null,
    impuesto decimal(5,2) as (valor * 0.16),
    descuento_porcentaje decimal(5,2) not null,
    subtotal decimal(6,2) as ((cantidad * (valor + impuesto)) * (1 - descuento_porcentaje/100)),
    foreign key(idfactura) references factura(idfactura),
    foreign key(idtallazapato) references talla_zapato(idtallazapato)
)
