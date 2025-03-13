# MySQL_Examen

Listar todos los libros disponibles
```sql
# Introduce aquí las consultas.
SELECT * 
FROM libro;
```
Buscar libros por género
```sql
# Introduce aquí las consultas.
SELECT l.idLibro, l.titulo, g.nombreGenero
FROM libro l
JOIN genero g ON l.idGenero = g.idGenero
WHERE g.nombreGenero = 'Romance';
```
Obtener información de un libro por ISBN
```sql
# Introduce aquí las consultas.
SELECT l.idLibro, l.titulo, g.nombreGenero, e.ISBN, e.fecha_publicacion, ed.nombreEditorial, e.disponibilidad
FROM libro l
JOIN genero g ON l.idGenero = g.idGenero
JOIN edicion e ON l.idLibro = e.idLibro
JOIN editorial ed ON e.idEditorial = ed.idEditorial
WHERE e.ISBN = '978843760-47';
```
Contar el número de libros en la biblioteca
```sql
# Introduce aquí las consultas.
SELECT COUNT(*)
AS total_libros
FROM libro;
```
Listar todos los autores
```sql
# Introduce aquí las consultas.
SELECT * 
FROM autor;
```
Buscar autores por nombre
```sql
# Introduce aquí las consultas.
SELECT * 
FROM autor 
WHERE nombre
LIKE 'Gabriel García Márquez';
```
Obtener todos los libros de un autor específico
```sql
# Introduce aquí las consultas.
SELECT l.idlibro, l.titulo, g.nombreGenero
FROM libro l
JOIN libro_autor la ON l.idlibro = la.idlibro
JOIN autor a ON la.idautor = a.idautor
JOIN genero g ON l.idGenero = g.idGenero
WHERE a.nombre = 'Gabriel García Márquez';
```
Listar todas las ediciones de un libro
```sql
# Introduce aquí las consultas.
SELECT e.*, ed.nombreEditorial
FROM edicion e
JOIN editorial ed ON e.idEditorial = ed.idEditorial
WHERE e.idlibro = 1;
```
Obtener la última edición de un libro
```sql
# Introduce aquí las consultas.
SELECT e.*, ed.nombreEditorial
FROM edicion e
JOIN editorial ed ON e.idEditorial = ed.idEditorial
WHERE e.idlibro = 1
ORDER BY e.fecha_publicacion DESC
LIMIT 1;
```
Contar cuántas ediciones hay de un libro específico
```sql
# Introduce aquí las consultas.
SELECT COUNT(*) AS total_ediciones
FROM edicion
WHERE idlibro = 2;
```
Listar todas las transacciones de préstamo
```sql
# Introduce aquí las consultas.
SELECT * 
FROM transaccion;
```
Obtener los libros prestados actualmente
```sql
# Introduce aquí las consultas.
SELECT t.idTransaccion, m.nombre AS miembro, l.titulo, e.ISBN, t.fecha_prestamo
FROM transaccion t
JOIN miembro m ON t.idMiembro = m.idMiembro
JOIN edicion e ON t.idEdicion = e.idEdicion
JOIN libro l ON e.idLibro = l.idLibro
WHERE t.fecha_devolucion IS NULL;
```
Contar el número de transacciones de un miembro específico
```sql
# Introduce aquí las consultas.
SELECT COUNT(*) AS total_transacciones
FROM transaccion
WHERE idMiembro = 1;
```
Listar todos los miembros de la biblioteca
```sql
# Introduce aquí las consultas.
SELECT * 
FROM miembro;
```
Buscar un miembro por nombre:
```sql
# Introduce aquí las consultas.
SELECT * 
FROM miembro
WHERE nombre 
LIKE 'Karen Celis';
```
Obtener las transacciones de un miembro específico
```sql
# Introduce aquí las consultas.
SELECT *
FROM transaccion
WHERE idMiembro = 1;
```
Listar todos los libros y sus autores
```sql
# Introduce aquí las consultas.
SELECT l.titulo, a.nombre AS autor
FROM libro l
JOIN libro_autor la ON l.idLibro = la.idLibro
JOIN autor a ON la.idAutor = a.idAutor
ORDER BY l.titulo;
```
Obtener el historial de préstamos de un libro específico
```sql
# Introduce aquí las consultas.
SELECT t.*
FROM transaccion t
JOIN edicion e ON t.idEdicion = e.idEdicion
WHERE e.idLibro = 1;
```
Contar cuántos libros han sido prestados en total
```sql
# Introduce aquí las consultas.
SELECT COUNT(*) 
AS total_prestamos 
FROM transaccion;
```
Listar todos los libros junto con su última edición y estado de disponibilidad
```sql
# Introduce aquí las consultas.
