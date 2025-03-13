INSERT INTO genero (nombreGenero) VALUES
  ('Ciencia Ficción'),
  ('Romance'),
  ('Misterio')
;

INSERT INTO editorial (nombreEditorial, direccion, contacto) VALUES
  ('Editorial Campuslands', 'Anillo Vial KM4, Zona Franca', '(601)6506-21'),
  ('Editorial Oveja Negra', 'Calle 20 #32A - 10', '(601)9865-34')
;

INSERT INTO libro (titulo, idGenero) VALUES
  ('Cien Años de Soledad', 1),
  ('El Amor en los Tiempos del Cólera', 2)
  ('La Sombra del Viento', 3);
;

INSERT INTO autor (nombre) VALUES
  ('Gabriel García Márquez'),
  ('Jorge Luis Borges')
;

INSERT INTO libro_autor (idLibro, idAutor) VALUES
  (1, 1), 
  (2, 1),
;

INSERT INTO edicion (idLibro, ISBN, fecha_publicacion, idEditorial, disponibilidad) VALUES
  (1, '978843760-47', '1967-06-05', 1, 1),
  (1, '978849757-08', '1970-05-10', 2, 0),
  (2, '978842043-89', '1985-03-15', 2, 1)
;

INSERT INTO miembro (nombre) VALUES
  ('Johlver Pardo'),
  ('Karen Celis')
;

INSERT INTO transaccion (idMiembro, idEdicion, fecha_prestamo, fecha_devolucion) VALUES
  (1, 2, '2025-02-20', NULL),
  (2, 3, '2025-02-22', '2025-03-01')
; 
