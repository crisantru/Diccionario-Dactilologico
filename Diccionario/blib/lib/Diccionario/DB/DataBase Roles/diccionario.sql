PRAGMA foreign_keys = ON;

CREATE TABLE usuario(
    nombre VARCHAR(40),
    apellidoPaterno VARCHAR(40),
    apellidoMaterno VARCHAR(40),
    correo VARCHAR(40) NOT NULL PRIMARY KEY,
    telefono INTEGER,
    fechaNacimiento DATE,
    username TEXT,
    password TEXT,
    active  INTEGER
);   

CREATE TABLE busqueda(
    idBusqueda  INT NOT NULL,
    palabra VARCHAR(40),
    fechaBusqueda DATE,
    correo VARCHAR REFERENCES usuario(correo) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idBusqueda)
);   

CREATE TABLE rol(
    idRol INTEGER PRIMARY KEY,
    rol     TEXT  
);

CREATE TABLE usuario_rol(
    usuarioCorreo VARCHAR REFERENCES usuario(correo) ON DELETE CASCADE ON UPDATE CASCADE,
    rolIdRol INTEGER REFERENCES rol(idRol) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (usuarioCorreo, rolIdRol)
);

---
--- Registros
---

INSERT INTO usuario VALUES ('Cristian Alberto', 'Sánchez', 'Trujillo', 'crisantru@gmail.com', 2281477025, '1992-02-28', 'crisantru', 'crisantru', 1);
INSERT INTO usuario VALUES ('Carlos Antonio', 'Bulnes', 'Dominguez', 'carlos0bulnes@gmail.com', 2281606001, '1992-11-24', 'carlos0bul', 'carlos0bul', 1);
INSERT INTO usuario VALUES ('Jose Luis', 'Tapia', 'Falfán', 'joseL@gmail.com', 2281222001, '1992-10-21', 'joseL', 'joseL', 1);
INSERT INTO rol VALUES (1, 'user');
INSERT INTO rol VALUES (2, 'admin');
INSERT INTO usuario_rol VALUES ('crisantru@gmail.com', 1);
INSERT INTO usuario_rol VALUES ('carlos0bulnes@gmail.com', 1);
INSERT INTO usuario_rol VALUES ('joseL@gmail.com', 2);





