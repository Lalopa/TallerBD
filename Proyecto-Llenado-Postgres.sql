

insert into sombrero (cveSombrero, Material, Estilo, Color, Nombre)
values ('SOM_1','Tela','Formal','Azul','Sombrero Negro de Tela'),
		('SOM_2','Gamusa','De Campo','Negro','Sombrero Tejano de Gamusa');


insert into reloj (cveReloj, Material, Tipo, Color, Nombre)
values ('REL_1','Cuero','Analogico','Negro','Reloj Analogico Negro Casual'),
		('REL_2','Caucho','Digital','Negro','Reloj Digital Negro Deportivo');

insert into zapatos (cveZapato, Material, Ocasion,  Color,Nombre)
values ('ZAP_1', 'Piel', 'Casual', 'Cafe', 'Zapatos Casuales Cafez duro'),
		('ZAP_2', 'Piel', 'Formal', 'Blanco', 'Zapatos Blancos de Tacon');

insert into lentes (cveLentes,Tipo, Color, Nombre)
values ('LEN_1', 'De vista', 'Negro', 'Lentes oftanmologicos redondos'),
		('LEN_2', 'De sol', 'Negro', 'Lenses de sol mica Roja');

insert into corbata (cveCorbata, Material, Tipo, Color, Nombre)
values ('COR_!', 'Poliester', 'Corbata', 'Rojo', 'Corbata Lisa Roja de Poliester'),
		('COR_2', 'Poliester', 'Mono', 'Azul', 'Mono Azul con Lineas');

insert into playera (cvePlayera, Tipo, Color, Nombre)
values ('PLA_1', 'Playera', 'Rojo', 'Playera estampada Roja oscura'),
		('PLA_2', 'Polo', 'Rojo', 'Polo Roja Lisa Brillante');

insert into pantalon (cvePantalon,Material,Color,Nombre)
values ('PAN_1', 'Mezclilla', 'Azul', 'Pantalon de Mezclilla Claro'),
		('PAN_2', 'Tela', 'Negro', 'Pantalon Casual Negro');

insert into cinturon (CveCinturon,Color,Nombre)
values ('CIN_1', 'Azul','Cinturon Trenzado Azul y Cafe'),
	('CIN_2', 'Cafe', 'Cinturon Cafe Formal');

		
insert into producto (CveProducto,Cantidad, Precio)
values ('SOM_1',10, 180.3),
		('SOM_2', 5, 299.9),
		('REL_1', 4,5000.0),
		('REL_2', 8,823.3),
		('ZAP_1', 7,1000.0),
		('ZAP_2', 4,2300.5),
		('LEN_1', 9,350.0),
		('LEN_2', 3, 899.9),
		('COR_1', 4, 799.3),
		('COR_2', 7, 755.4),
		('PLA_1', 7, 769.4),
		('PLA_2', 9, 350.5),
		('PAN_1', 3,499.9),
		('PAN_2', 4,245.3),
		('CIN_1', 7, 300.0),
		('CIN_2', 3,299.2);


insert into ofertas (CveOfertas, Descuento, Descripcion)
values ('PROMO100', 33, 'Promosion de 30% en tu primera compra'),
	   ('OFERTONBD', 95, 'Oferta valida solo para el profe de BD');