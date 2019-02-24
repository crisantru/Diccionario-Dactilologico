PRAGMA foreign_keys = ON;

CREATE TABLE usuario(
    nombre VARCHAR(40),
    apellidoPaterno VARCHAR(40),
    apellidoMaterno VARCHAR(40),
    correo VARCHAR(40) NOT NULL,
    telefono INTEGER,
    fechaNacimiento DATE,
    PRIMARY KEY(correo)
);   


CREATE TABLE busqueda(
    idBusqueda  INT NOT NULL,
    palabra VARCHAR(40),
    fechaBusqueda DATE,
    correo VARCHAR REFERENCES usuario(correo) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(idBusqueda)
);   


---
--- Registros
---

INSERT INTO usuario VALUES ('Cristian Alberto', 'Sánchez', 'Trujillo', 'crisantru@gmail.com', 2281477025, '1992-02-28');
INSERT INTO usuario VALUES ('Carlos Antonio', 'Bulnes', 'Dominguez', 'carlos0bulnes@gmail.com', 2281606001, '1992-11-24');
INSERT INTO usuario VALUES ('Jose Luis', 'Tapia', 'Falfán', 'tapia@gmail.com', 2281222001, '1992-10-21');





