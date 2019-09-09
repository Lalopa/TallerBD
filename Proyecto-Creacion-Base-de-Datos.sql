
use proyecto;
    CREATE TABLE usuario(
        cveUsuario  int auto_increment,
        nombre VARCHAR (60),
        apellidos VARCHAR (100),
        edad int,
        fechaNac VARCHAR (10),
        CONSTRAINT usuarioCk1 CHECK (nombre !='number'),
        CONSTRAINT usuarioCk2 CHECK (apellidos !='number'),
        CONSTRAINT usuarioPk PRIMARY KEY (cveUsuario)
    );

    CREATE TABLE sesion (
        correo VARCHAR (50) not null,
        tipo VARCHAR (60),
        contrseña VARCHAR (30),
        cveUsuario int,
        FOREIGN KEY (cveUsuario) REFERENCES usuario (cveUsuario),
        PRIMARY KEY (correo)
    );

    CREATE TABLE tallas (
        cveTallas VARCHAR (10) NOT NULL,
        prenda VARCHAR (10),
        descripcion VARCHAR (60),
        CONSTRAINT tallasPk PRIMARY KEY (cveTallas)
    );

    CREATE TABLE ofertas (
        cveOfertas VARCHAR (10) NOT NULL,
        descuento int,
        descripcion VARCHAR (60),
        PRIMARY KEY (cveOfertas)
    );
    CREATE TABLE sombrero(
        cveSombrero VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        estilo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT sombreroPk PRIMARY KEY (cveSombrero)
    );
    CREATE TABLE reloj(
        cveReloj VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT relojPk PRIMARY KEY (cveReloj)
    );
    
    CREATE TABLE zapatos(
        cveZapato VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        ocasion VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT zapatosPk PRIMARY KEY (cveZapato)
    );

    CREATE TABLE lentes(
        cveLentes VARCHAR (15) NOT NULL,
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT lentesjPk PRIMARY KEY (cveLentes)
    );
    CREATE TABLE corbata(
        cveCorbata VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT corbataPk PRIMARY KEY (cveCorbata)
    );
    CREATE TABLE playera(
        cvePlayera VARCHAR (15) NOT NULL,
        tipo VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT playeraPk PRIMARY KEY (cvePlayera)
    );
    CREATE TABLE pantalon(
        cvePantalon VARCHAR (15) NOT NULL,
        material VARCHAR (30),
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT pantalonPk PRIMARY KEY (cvePantalon)
    );
    CREATE TABLE cinturon(
        cveCinturon VARCHAR (15) NOT NULL,
        color VARCHAR (25),
        nombre VARCHAR (30),
        CONSTRAINT cinturonPk PRIMARY KEY (cveCinturon)
    );
    CREATE TABLE codigoDesc(
        cveDescuento VARCHAR (10) NOT NULL,
        descripcion VARCHAR (120),
        descuento int,
        CONSTRAINT codigoDescPk PRIMARY KEY (cveDescuento)
    );
    CREATE TABLE mide(
        cveUsuario int NOT null,
        cveTallas VARCHAR(10),
        CONSTRAINT mideFk1 FOREIGN KEY (cveUsuario) REFERENCES usuario(cveUsuario),
        CONSTRAINT mideFk2 FOREIGN KEY (cveTallas) REFERENCES tallas (cveTallas)
    );
    CREATE TABLE producto (
        cveProducto VARCHAR (10) NOT NULL,
        cantidad SMALLINT,
		precio float,
        CONSTRAINT productoPk PRIMARY KEY (cveProducto)
    );
    CREATE TABLE tall (
        cveProducto VARCHAR (10) NOT NULL,
        cveTallas VARCHAR (10) NOT NULL,
        CONSTRAINT tallFk1 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto),
        CONSTRAINT tallFk2 FOREIGN KEY (cveTallas) REFERENCES tallas (cveTallas)
    );
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
        CONSTRAINT prendasFk1 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto),
        CONSTRAINT prendasFk2 FOREIGN KEY (cveCinturon) REFERENCES cinturon (cveCinturon),
        CONSTRAINT prendasFk3 FOREIGN KEY (cveCorbata) REFERENCES corbata (cveCorbata),
        CONSTRAINT prendasFk4 FOREIGN KEY (cveLentes) REFERENCES lentes (cveLentes),
        CONSTRAINT prendasFk5 FOREIGN KEY (cvePantalon) REFERENCES pantalon (cvePantalon),
        CONSTRAINT prendasFK6 FOREIGN KEY (cvePlayera) REFERENCES playera (cvePlayera),
        CONSTRAINT prendasFk7 FOREIGN KEY (cveReloj) REFERENCES reloj (cveReloj),
        CONSTRAINT prendasFk8 FOREIGN KEY (cveSombrero) REFERENCES sombrero (cveSombrero),
        CONSTRAINT prendasFk9 FOREIGN KEY (cveZapato) REFERENCES zapatos (cveZapato)
    );
    CREATE TABLE carrito(
        cveCarrito int NOT NULL,
        subtotal int,
        CONSTRAINT carritoPk PRIMARY KEY (cveCarrito)
    );
    CREATE TABLE compro (
        cveCarrito int not NULL,
        cveProducto VARCHAR (10),
        CONSTRAINT comproFk1 FOREIGN KEY (cveCarrito) REFERENCES carrito (cveCarrito),
        CONSTRAINT comproFk2 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto)
    );
    CREATE TABLE subtotal (
        cveUsuario int NOT NULL,
        cveCarrito int,
        CONSTRAINT subtotalFk1 FOREIGN KEY (cveUsuario) REFERENCES usuario (cveUsuario),
        CONSTRAINT subtotalFk2 FOREIGN KEY (cveCarrito) REFERENCES carrito (cveCarrito)
    );
    CREATE TABLE ciudad(
        cveCiudad VARCHAR (10) NOT NULL,
        nombEstado VARCHAR (30),
        nombCiudad VARCHAR (30),
        CONSTRAINT ciudadPk PRIMARY KEY (cveCiudad)
    );
    CREATE TABLE direccion (
        cveDireccion VARCHAR (10) not NULL,
        destinatario VARCHAR (60),
        direccion VARCHAR (120),
        referencia VARCHAR (60),
        cveCiudad VARCHAR (10),
        cveUsuario int,
        CONSTRAINT direccionPk PRIMARY KEY (cveDireccion),
        CONSTRAINT direccionFk1 FOREIGN KEY (cveCiudad) REFERENCES ciudad (cveCiudad),
        CONSTRAINT direccionFk2 FOREIGN KEY (cveUsuario) REFERENCES usuario (cveUsuario)
    );
    CREATE TABLE cargo(
        cveCargo VARCHAR (10) not null,
        cargo int,
        cveCiudad VARCHAR (10),
		CONSTRAINT cveCargoPk PRIMARY KEY (cveCargo),
        CONSTRAINT cargoFk FOREIGN KEY (cveCiudad) REFERENCES ciudad (cveCiudad)
    );
    CREATE TABLE compra (
        cveCompra VARCHAR (10) NOT NULL,
        total int, 
        subtotal int,
        fechaEntrega VARCHAR (10),
        cveCargo VARCHAR (10),
        cveDescuento VARCHAR (10),
        CONSTRAINT compraPk PRIMARY KEY (cveCompra),
        CONSTRAINT compraFk1 FOREIGN KEY (cveCargo) REFERENCES cargo (cveCargo),
        CONSTRAINT compraFk2 FOREIGN KEY (cveDescuento)REFERENCES codigoDesc (cveDescuento)
    );
    CREATE TABLE comprara(
        cveCompra VARCHAR (10) not null,
        cveProducto VARCHAR (10),
        CONSTRAINT compraraFk1 FOREIGN KEY (cveCompra) REFERENCES compra (cveCompra),
        CONSTRAINT compraraFk2 FOREIGN KEY (cveProducto) REFERENCES producto (cveProducto)
    );

