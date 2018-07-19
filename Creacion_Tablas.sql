CREATE TABLE Usuarios (
	id_usuario INT NOT NULL PRIMARY KEY,
	nombre varchar(100),
	apellido varchar(100) ,
	genero varchar(100) ,
	direccion varchar(100),
	correo varchar(100) ,
	celular INT
);

CREATE TABLE Estado (
	id_estado INT PRIMARY KEY,
	nombre varchar(100)
);

CREATE TABLE Localidad (
	id_localidad INT IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(100)
);

CREATE TABLE Cai (
	id_cai INT IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(100),
	direccion varchar(100),
	telefono INT,
	longitud decimal(4,1),
	latitud decimal(4,1),
	id_localidad INT FOREIGN KEY REFERENCES Localidad(id_localidad)
);

CREATE TABLE Policia (
	id_placa INT IDENTITY(1,1) PRIMARY KEY,
	nombre varchar(100),
	apellido varchar(100),
	telefono INT,
	id_cai INT FOREIGN KEY REFERENCES Cai(id_cai)
);


CREATE TABLE Alerta (
	id_alerta INT IDENTITY(1,1) PRIMARY KEY,
	id_usuario INT FOREIGN KEY REFERENCES Usuarios(id_usuario),
	id_estado INT FOREIGN KEY REFERENCES Estado(id_estado),
	id_placa INT FOREIGN KEY REFERENCES Policia(id_placa),
	longitud decimal(4,1),
	latitud decimal(4,1)
);


CREATE TABLE Servicio (
	id_servicio INT IDENTITY(1,1) PRIMARY KEY,
	id_usuario INT FOREIGN KEY REFERENCES Usuarios(id_usuario),
	id_placa INT FOREIGN KEY REFERENCES Policia(id_placa),
	fecha date,
	hora time
);
