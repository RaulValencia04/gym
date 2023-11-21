CREATE DATABASE IF NOT EXISTS gym;

USE gym;


CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(255) NOT NULL,
    img_url VARCHAR(255) NOT NULL
);

CREATE TABLE ejercicios (
    id_ejercicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    imagen_url VARCHAR(255) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
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


CREATE TABLE DetalleRutina (
    id_detalle_rutina INT AUTO_INCREMENT PRIMARY KEY,
    id_ejercicio INT NOT NULL,
    cantidad_reps INT NOT NULL,
    FOREIGN KEY (id_ejercicio) REFERENCES ejercicios (id_ejercicio)
);



CREATE TABLE Rutina (
    id_rutina INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    Dia VARCHAR(50) NOT NULL,
    id_detalle_rutina INT NOT NULL,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_detalle_rutina) REFERENCES DetalleRutina (id_detalle_rutina),
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id_usuario)
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

select * from DatosCuerpo

ALTER TABLE usuarios
ADD COLUMN roll INT NOT NULL;

