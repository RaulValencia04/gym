CREATE DATABASE IF NOT EXISTS gym;

USE gym;


CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    img_url VARCHAR(255) NOT NULL
);

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    roll INT not null,
    nombre_usuario VARCHAR(255) NOT NULL,
    apellido_usuario VARCHAR(255) NOT NULL,
    correo VARCHAR(255) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    passwords VARCHAR(255) NOT NULL
);

CREATE TABLE ejercicios (
    id_ejercicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    imagen_url VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

CREATE TABLE Rutina (
    id_rutina INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    Dia VARCHAR(50) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

CREATE TABLE DetalleRutina (
    id_detalle_rutina INT AUTO_INCREMENT PRIMARY KEY,
    id_rutina INT NOT NULL,
    id_ejercicio INT NOT NULL,
    cantidad_reps INT NOT NULL,
    FOREIGN KEY (id_rutina) REFERENCES Rutina (id_rutina),
    FOREIGN KEY (id_ejercicio) REFERENCES ejercicios (id_ejercicio)
);


CREATE TABLE DatosCuerpo (
    id_datos INT AUTO_INCREMENT PRIMARY KEY,
    sexo VARCHAR(10) NOT NULL,
    edad INT NOT NULL,
    peso DECIMAL(5,2) NOT NULL,
    altura DECIMAL(5,2) NOT NULL,
    fecha DATE NOT NULL,
    imc DECIMAL(5,2) NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
);

select * from usuarios
SELECT * FROM ejercicios

-- Insertar 10 categorías
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 1', 'https://i1.wp.com/www.gainingtactics.com/wp-content/uploads/2016/10/Pull-ups.jpg?ssl=1');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 2', 'https://ejemplo.com/img2.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 3', 'https://ejemplo.com/img3.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 4', 'https://ejemplo.com/img4.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 5', 'https://ejemplo.com/img5.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 6', 'https://ejemplo.com/img6.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 7', 'https://ejemplo.com/img7.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 8', 'https://ejemplo.com/img8.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 9', 'https://ejemplo.com/img9.jpg');
INSERT INTO categoria (descripcion, img_url) VALUES ('Categoría 10', 'https://ejemplo.com/img10.jpg');

-- Insertar 15 ejercicios asociados a las categorías
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 1', 'https://i1.wp.com/www.gainingtactics.com/wp-content/uploads/2016/10/Pull-ups.jpg?ssl=1', 'Descripción 1', 1);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 2', 'https://ejemplo.com/imagen2.jpg', 'Descripción 2', 1);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 3', 'https://ejemplo.com/imagen3.jpg', 'Descripción 3', 2);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 4', 'https://ejemplo.com/imagen4.jpg', 'Descripción 4', 2);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 5', 'https://ejemplo.com/imagen5.jpg', 'Descripción 5', 3);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 6', 'https://ejemplo.com/imagen6.jpg', 'Descripción 6', 3);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 7', 'https://ejemplo.com/imagen7.jpg', 'Descripción 7', 4);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 8', 'https://ejemplo.com/imagen8.jpg', 'Descripción 8', 4);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 9', 'https://ejemplo.com/imagen9.jpg', 'Descripción 9', 5);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 10', 'https://ejemplo.com/imagen10.jpg', 'Descripción 10', 5);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 11', 'https://ejemplo.com/imagen11.jpg', 'Descripción 11', 6);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 12', 'https://ejemplo.com/imagen12.jpg', 'Descripción 12', 6);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 13', 'https://ejemplo.com/imagen13.jpg', 'Descripción 13', 7);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 14', 'https://ejemplo.com/imagen14.jpg', 'Descripción 14', 7);
INSERT INTO ejercicios (nombre, imagen_url, descripcion, id_categoria) VALUES ('Ejercicio 15', 'https://ejemplo.com/imagen15.jpg', 'Descripción 15', 8);
