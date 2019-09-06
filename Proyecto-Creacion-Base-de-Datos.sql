use master;
CREATE DATABASE proyecto;
use proyecto;
    --Creacion de tabla usuarios
    CREATE TABLE usuario(
        cveUsuario  int IDENTITY (1, 1) NOT NULL,
        nombre VARCHAR (60),
        apellidos VARCHAR (100),
        edad int,
        fechaNac VARCHAR (10),
        --Hace chequeo del atributo nombre para que no existan numeros
        CONSTRAINT usuarioCk1 CHECK (nombre !='number'),
        -- Hace chequeo del atributo apellidos para que no existan numeros
        CONSTRAINT usuarioCk2 CHECK (apellidos !='number'),
        --Creacion de llave principal para la tablas usuarios
        CONSTRAINT usuarioPk PRIMARY KEY (cveUsuario)
    )

    --Creacion de la tablas sesion
    CREATE TABLE sesion (
        correo VARCHAR (50) not null,
        tipo VARCHAR (60),
        contrseña VARCHAR (30),
        cveUsuario int
        --Llave foranea sobre el atributo cveUsuario sobre la tabla usuarios a la llave principal cveUsuarios
        CONSTRAINT sesionFk FOREIGN KEY (cveUsuario) REFERENCES usuario (cveUsuario),
        --Creacion de llave principal para tabla sesion
        CONSTRAINT sesionPk PRIMARY KEY (correo)
    )

    --Crea tabla tallas
    CREATE TABLE tallas (
        cveTallas VARCHAR (10) NOT NULL,
        prenda VARCHAR (10),
        descripcion VARCHAR (60),
        --Creacion de llave principal para la tabla tallas
        CONSTRAINT tallasPk PRIMARY KEY (cveTallas)
    )

    --Crea tabla ofertas
    CREATE TABLE ofertas (
        cveOfertas VARCHAR (10) NOT NULL,
        descuento int,
        descripcion VARCHAR (60),
        --Creacion de llave principal para la tabla ofertas
        CONSTRAINT ofertasPk PRIMARY KEY (cveOfertas)
    )

    --Crea tabla sombrero
    CREATE TABLE sombrero(
        cveSombrero VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        estilo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla sombrero
        CONSTRAINT sombreroPk PRIMARY KEY (cveSombrero)
    )
    
    --Crea tabla reloj 
    CREATE TABLE reloj(
        cveReloj VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla sombrero
        CONSTRAINT relojPk PRIMARY KEY (cveReloj)
    )
    
    --Crea tabla zapatos 
    CREATE TABLE zapatos(
        cveZapato VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        ocasion VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla zapato
        CONSTRAINT zapatosPk PRIMARY KEY (cveZapato)
    )

    --Crea tabla lentes  
    CREATE TABLE lentes(
        cveLentes VARCHAR (15) NOT NULL,
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla lentes
        CONSTRAINT lentesjPk PRIMARY KEY (cveLentes)
    )

    --Crea tabla corbata 
    CREATE TABLE corbata(
        cveCorbata VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla corbata
        CONSTRAINT corbataPk PRIMARY KEY (cveCorbata)
    )

    --Crea tabla playera
    CREATE TABLE playera(
        cvePlayera VARCHAR (15) NOT NULL,
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla playera
        CONSTRAINT playeraPk PRIMARY KEY (cvePlayera)
    )

    --Crea tabla pantalon 
    CREATE TABLE pantalon(
        cvePantalon VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla pantalon
        CONSTRAINT pantalonPk PRIMARY KEY (cvePantalon)
    )

    --Crea tabla cinturon. 
    CREATE TABLE cinturon(
        cveCinturon VARCHAR (15) NOT NULL,
        color VARCHAR (25),
        nombre VARCHAR (30),
        --Creacion de llave principal para la tabla sombrero
        CONSTRAINT cinturonPk PRIMARY KEY (cveCinturon)
    )

    --Crea tabla codigos de descuento
    CREATE TABLE codigoDesc(
        cveDescuento VARCHAR (10) NOT NULL,
        descripcion VARCHAR (120),
        descuento int,
        --Crea llave principal de Codigo de descuento
        CONSTRAINT codigoDescPk PRIMARY KEY (cveDescuento)
    )


    --Creacion de tabla mide rlacion muchos a muchos de las tablas usuarios y tallas
    CREATE TABLE mide(
        cveUsuario int NOT null,
        cveTallas VARCHAR(10),
        --Llaves foraneas
        CONSTRAINT mideFk1 FOREIGN KEY (cveUsuario) REFERENCES usuario(cveUsuario),
        CONSTRAINT mideFk2 FOREIGN KEY (cveTallas) REFERENCES tallas (cveTallas)
    )

    --Creacion de tabla producto
    CREATE TABLE producto (
        cveProducto VARCHAR (10) NOT NULL,
        cantidad SMALLINT,
		precio float,
        --llave principal
        CONSTRAINT productoPk PRIMARY KEY (cveProducto)
    )

    --Creacion de tabla prenda relacion entre las tablas de las descripciones de las prendas y los prodcutos
    CREATE TABLE tall (
        cveProducto VARCHAR (10) NOT NULL,
        cveTallas VARCHAR (10) NOT NULL,
        --llaves foraneas
        CONSTRAINT tallFk1 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto),
        CONSTRAINT tallFk2 FOREIGN KEY (cveTallas) REFERENCES tallas (cveTallas)
    )

    --Creacion de tabla tall relacion muchos a muchos de las tablas tallas y producto
    CREATE TABLE prendas (
        cveProducto VARCHAR (10) NOT NULL,
        cveCinturon VARCHAR (15),
        cveCorbata VARCHAR (15),
        cveLentes VARCHAR (15),
        cvePantalon VARCHAR (15),
        cvePlayera VARCHAR (15),
        cveReloj VARCHAR (15),
        cveSombrero VARCHAR (15),
        cveZapato VARCHAR (15),
       -- precio int,
        --llaves foraneas
        CONSTRAINT prendasFk1 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto),
        CONSTRAINT prendasFk2 FOREIGN KEY (cveCinturon) REFERENCES cinturon (cveCinturon),
        CONSTRAINT prendasFk3 FOREIGN KEY (cveCorbata) REFERENCES corbata (cveCorbata),
        CONSTRAINT prendasFk4 FOREIGN KEY (cveLentes) REFERENCES lentes (cveLentes),
        CONSTRAINT prendasFk5 FOREIGN KEY (cvePantalon) REFERENCES pantalon (cvePantalon),
        CONSTRAINT prendasFK6 FOREIGN KEY (cvePlayera) REFERENCES playera (cvePlayera),
        CONSTRAINT prendasFk7 FOREIGN KEY (cveReloj) REFERENCES reloj (cveReloj),
        CONSTRAINT prendasFk8 FOREIGN KEY (cveSombrero) REFERENCES sombrero (cveSombrero),
        CONSTRAINT prendasFk9 FOREIGN KEY (cveZapato) REFERENCES zapatos (cveZapato)
    )

    --Crea tabla carrito
    CREATE TABLE carrito(
        cveCarrito int NOT NULL,
        subtotal int,
        --creacion de llave principal
        CONSTRAINT carritoPk PRIMARY KEY (cveCarrito)
    )

    --Creacion de tabla compro relacion n a n de Productos con carrito
    CREATE TABLE compro (
        cveCarrito int not NULL,
        cveProducto VARCHAR (10),
        --creacion de llaves foraneas
        CONSTRAINT comproFk1 FOREIGN KEY (cveCarrito) REFERENCES carrito (cveCarrito),
        CONSTRAINT comproFk2 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto)
    )

    --creacion de tabla subtotal tabla n a n de usuarios y carrito
    CREATE TABLE subtotal (
        cveUsuario int NOT NULL,
        cveCarrito int,
        --Llaves foraneas
        CONSTRAINT subtotalFk1 FOREIGN KEY (cveUsuario) REFERENCES usuario (cveUsuario),
        CONSTRAINT subtotalFk2 FOREIGN KEY (cveCarrito) REFERENCES carrito (cveCarrito)
    )

    --creacion de tabla ciudad
    CREATE TABLE ciudad(
        cveCiudad VARCHAR (10) NOT NULL,
        nombEstado VARCHAR (30),
        nombCiudad VARCHAR (30),
        --creacion de llave principal
        CONSTRAINT ciudadPk PRIMARY KEY (cveCiudad)
    )

    --Creacion de tabla Direcion
    CREATE TABLE direccion (
        cveDireccion VARCHAR (10) not NULL,
        destinatario VARCHAR (60),
        direccion VARCHAR (120),
        referencia VARCHAR (60),
        cveCiudad VARCHAR (10),
        cveUsuario int,
        --Creacion de llave principal
        CONSTRAINT direccionPk PRIMARY KEY (cveDireccion),
        --Creacion de llaves foraneas
        CONSTRAINT direccionFk1 FOREIGN KEY (cveCiudad) REFERENCES ciudad (cveCiudad),
        CONSTRAINT direccionFk2 FOREIGN KEY (cveUsuario) REFERENCES usuario (cveUsuario)
    )

    --creacion de tabla cargo
    CREATE TABLE cargo(
        cveCargo VARCHAR (10) not null,
        cargo int,
        cveCiudad VARCHAR (10),
		--creacion llave primaria
		CONSTRAINT cveCargoPk PRIMARY KEY (cveCargo),
        --Creacion de llaves foraneas
        CONSTRAINT cargoFk FOREIGN KEY (cveCiudad) REFERENCES ciudad (cveCiudad)
    )

    --Creacion de tabla compra
    CREATE TABLE compra (
        cveCompra VARCHAR (10) NOT NULL,
        total int, 
        subtotal int,
        fechaEntrega VARCHAR (10),
        cveCargo VARCHAR (10),
        cveDescuento VARCHAR (10),
        --creacion de llave principal
        CONSTRAINT compraPk PRIMARY KEY (cveCompra),
        --Creacion de llaves foraneas
        CONSTRAINT compraFk1 FOREIGN KEY (cveCargo) REFERENCES cargo (cveCargo),
        CONSTRAINT compraFk2 FOREIGN KEY (cveDescuento)REFERENCES codigoDesc (cveDescuento)
    )

    --creacion de tabla comprara 
    CREATE TABLE comprara(
        cveCompra VARCHAR (10) not null,
        cveProducto VARCHAR (10),
        --creacion de llaves foraneas
        CONSTRAINT compraraFk1 FOREIGN KEY (cveCompra) REFERENCES compra (cveCompra),
        CONSTRAINT compraraFk2 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto)
    )

