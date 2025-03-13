CREATE DATABASE IF NOT EXISTS biblioteca_campus;

USE biblioteca_campus;

CREATE TABLE IF NOT EXISTS genero (
  idGenero INT AUTO_INCREMENT PRIMARY KEY,
  nombreGenero VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS editorial (
  idEditorial INT AUTO_INCREMENT PRIMARY KEY,
  nombreEditorial VARCHAR(40) NOT NULL UNIQUE,
  direccion VARCHAR(40),
  contacto VARCHAR(15)
);

CREATE TABLE IF NOT EXISTS libro (
  idLibro INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(40) NOT NULL,
  idGenero INT NOT NULL,
  CONSTRAINT fk_libro_genero FOREIGN KEY (idGenero) REFERENCES genero(idGenero)
);

CREATE TABLE IF NOT EXISTS autor (
  idAutor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS libro_autor (
  idLibro INT NOT NULL,
  idAutor INT NOT NULL,
  PRIMARY KEY (idLibro, idAutor),
  CONSTRAINT fk_libro FOREIGN KEY (idLibro) REFERENCES libro(idLibro),
  CONSTRAINT fk_autor FOREIGN KEY (idAutor) REFERENCES autor(idAutor)
);

CREATE TABLE IF NOT EXISTS edicion (
  idEdicion INT AUTO_INCREMENT PRIMARY KEY,
  idLibro INT NOT NULL,
  ISBN VARCHAR(20) NOT NULL UNIQUE,
  fecha_publicacion DATETIME NOT NULL,
  idEditorial INT NOT NULL,
  disponibilidad TINYINT(1) NOT NULL DEFAULT 1,
  CONSTRAINT fk_edicion_libro FOREIGN KEY (idLibro) REFERENCES libro(idLibro),
  CONSTRAINT fk_edicion_editorial FOREIGN KEY (idEditorial) REFERENCES editorial(idEditorial)
);

CREATE TABLE IF NOT EXISTS miembro (
  idMiembro INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS transaccion (
  idTransaccion INT AUTO_INCREMENT PRIMARY KEY,
  idMiembro INT NOT NULL,
  idEdicion INT NOT NULL,
  fecha_prestamo DATETIME NOT NULL,
  fecha_devolucion DATETIME,
  CONSTRAINT fk_transaccion_miembro FOREIGN KEY (idMiembro) REFERENCES miembro(idMiembro),
  CONSTRAINT fk_transaccion_edicion FOREIGN KEY (idEdicion) REFERENCES edicion(idEdicion)
);
