INSERT INTO usuarios VALUES (DEFAULT,'Juan','Pacheco Gonzalez',937234581,'1980-06-05','c/palomares n 45 2º 4ª',
    '79322012J','juanpacheco@hotmail.com','juanete','81dc9bdb52d04dc20036dbd8313ed055','Sabadell','España');
INSERT INTO usuarios VALUES (DEFAULT,'Rafa','Sanchez Jimenez',937654367,'1986-07-01','c/delafe n 32 1º 1ª',
    '32323045G','rafapela@hotmail.com','Rafio','81dc9bdb52d04dc20036dbd8313ed055','Barcelona','España');
INSERT INTO usuarios VALUES (DEFAULT,'Maria','Dolmen piriz',934671209,'1992-10-23','c/gran via n 289 6º 1ª',
    '39100438T','mariaDB@hotmail.com','mariela','81dc9bdb52d04dc20036dbd8313ed055','Vilafranca','España');

INSERT INTO tipo_producto VALUES (DEFAULT,'Kites');
INSERT INTO tipo_producto VALUES (DEFAULT,'Tablas');
INSERT INTO tipo_producto VALUES (DEFAULT,'Accesorios');
INSERT INTO tipo_producto VALUES (DEFAULT,'Neoprenos');
INSERT INTO tipo_producto VALUES (DEFAULT,'Cursos');

Alter Table pedidos ADD (info_transporte varchar(64));

INSERT INTO producto VALUES (DEFAULT,'1','1','F-One Bandit IX 2016','Cometa todo terreno excelente para todas las disciplinas del kite y adaptada a cualquier nivel.
 Mas de 8 años de mejoría año tras año la colocan como la cometa mas desarrollada del mercado.',
    'verde',769,420,10);
INSERT INTO producto VALUES (DEFAULT,'1','2','North Dice','Estamos ante la tercera generación de la, cada vez más popular, Dice, 
    que redefine el concepto de versatilidad y rendimiento.',
     'rojo',674,200,7);



INSERT INTO pedidos VALUES (DEFAULT,'1','tarjeta','2016-02-10','2016-02-11','2016-02-16',1,'DHL-32456-4345');

INSERT INTO detalles_pedido VALUES (1,1,1,DEFAULT);
INSERT INTO detalles_pedido VALUES (5,1,1,DEFAULT);
INSERT INTO detalles_pedido VALUES (9,1,1,DEFAULT);


/*NO BORRAR XD*/
select u.nombre,u.apellidos,p.fecha_compra,p.info_transporte,d.cantidad,p1.nombre,p1.precio
from usuarios u 
inner join pedidos p on u.id = p.id_user
inner join detalles_pedido d on p.codigo = d.codigo_pedido
inner join producto p1 on d.id_producto = p1.id
where u.user='Juanete'
;



Update producto set nombre='North Dice 2015' where nombre='North Dice';