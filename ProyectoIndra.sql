-- Crear secuencias para auto-incremento
CREATE SEQUENCE usuarios_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE organizadores_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE categorias_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE ubicaciones_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE eventos_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE inscripciones_seq START WITH 1 INCREMENT BY 1;

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id_usuario NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    contrasena VARCHAR2(255) NOT NULL
);

-- Trigger para auto-incremento en Usuarios
CREATE OR REPLACE TRIGGER trg_usuarios_ai
BEFORE INSERT ON Usuarios
FOR EACH ROW
BEGIN
    SELECT usuarios_seq.NEXTVAL INTO :NEW.id_usuario FROM dual;
END;
/

-- Tabla de Organizadores
CREATE TABLE Organizadores (
    id_organizador NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    telefono VARCHAR2(20)
);

CREATE OR REPLACE TRIGGER trg_organizadores_ai
BEFORE INSERT ON Organizadores
FOR EACH ROW
BEGIN
    SELECT organizadores_seq.NEXTVAL INTO :NEW.id_organizador FROM dual;
END;
/

-- Tabla de Categorías
CREATE TABLE Categorias (
    id_categoria NUMBER PRIMARY KEY,
    nombre VARCHAR2(50) NOT NULL
);

CREATE OR REPLACE TRIGGER trg_categorias_ai
BEFORE INSERT ON Categorias
FOR EACH ROW
BEGIN
    SELECT categorias_seq.NEXTVAL INTO :NEW.id_categoria FROM dual;
END;
/

-- Tabla de Ubicaciones
CREATE TABLE Ubicaciones (
    id_ubicacion NUMBER PRIMARY KEY,
    tipo CHAR(10) CHECK (tipo IN ('Online', 'Presencial')) NOT NULL,
    direccion VARCHAR2(255)
);

CREATE OR REPLACE TRIGGER trg_ubicaciones_ai
BEFORE INSERT ON Ubicaciones
FOR EACH ROW
BEGIN
    SELECT ubicaciones_seq.NEXTVAL INTO :NEW.id_ubicacion FROM dual;
END;
/

-- Tabla de Eventos
CREATE TABLE Eventos (
    id_evento NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    descripcion CLOB,
    fecha DATE NOT NULL,
    duracion NUMBER NOT NULL,
    id_ubicacion NUMBER,
    id_categoria NUMBER,
    id_organizador NUMBER,
    FOREIGN KEY (id_ubicacion) REFERENCES Ubicaciones(id_ubicacion),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria),
    FOREIGN KEY (id_organizador) REFERENCES Organizadores(id_organizador)
);

CREATE OR REPLACE TRIGGER trg_eventos_ai
BEFORE INSERT ON Eventos
FOR EACH ROW
BEGIN
    SELECT eventos_seq.NEXTVAL INTO :NEW.id_evento FROM dual;
END;
/

-- Tabla de Inscripciones
CREATE TABLE Inscripciones (
    id_inscripcion NUMBER PRIMARY KEY,
    id_usuario NUMBER,
    id_evento NUMBER,
    fecha_inscripcion DATE DEFAULT SYSDATE,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_evento) REFERENCES Eventos(id_evento)
);

CREATE OR REPLACE TRIGGER trg_inscripciones_ai
BEFORE INSERT ON Inscripciones
FOR EACH ROW
BEGIN
    SELECT inscripciones_seq.NEXTVAL INTO :NEW.id_inscripcion FROM dual;
END;
/


--Prueba con datos aleatorios
-- Insertar Usuarios
INSERT INTO Usuarios (id_usuario, nombre, email, contrasena) VALUES (usuarios_seq.NEXTVAL, 'Juan Pérez', 'juan@example.com', 'pass123');
INSERT INTO Usuarios (id_usuario, nombre, email, contrasena) VALUES (usuarios_seq.NEXTVAL, 'María López', 'maria@example.com', 'secure456');
INSERT INTO Usuarios (id_usuario, nombre, email, contrasena) VALUES (usuarios_seq.NEXTVAL, 'Carlos Sánchez', 'carlos@example.com', 'clave789');

-- Insertar Organizadores
INSERT INTO Organizadores (id_organizador, nombre, email, telefono) VALUES (organizadores_seq.NEXTVAL, 'TechCorp', 'contacto@techcorp.com', '600123456');
INSERT INTO Organizadores (id_organizador, nombre, email, telefono) VALUES (organizadores_seq.NEXTVAL, 'GreenLife', 'info@greenlife.com', '650987654');

-- Insertar Categorías
INSERT INTO Categorias (id_categoria, nombre) VALUES (categorias_seq.NEXTVAL, 'Tecnología');
INSERT INTO Categorias (id_categoria, nombre) VALUES (categorias_seq.NEXTVAL, 'Sostenibilidad');
INSERT INTO Categorias (id_categoria, nombre) VALUES (categorias_seq.NEXTVAL, 'Innovación');

-- Insertar Ubicaciones
INSERT INTO Ubicaciones (id_ubicacion, tipo, direccion) VALUES (ubicaciones_seq.NEXTVAL, 'Presencial', 'Centro de Convenciones, Madrid');
INSERT INTO Ubicaciones (id_ubicacion, tipo, direccion) VALUES (ubicaciones_seq.NEXTVAL, 'Online', NULL);
INSERT INTO Ubicaciones (id_ubicacion, tipo, direccion) VALUES (ubicaciones_seq.NEXTVAL, 'Presencial', 'Parque Ecológico, Barcelona');

-- Insertar Eventos
INSERT INTO Eventos (id_evento, nombre, descripcion, fecha, duracion, id_ubicacion, id_categoria, id_organizador)
VALUES (eventos_seq.NEXTVAL, 'Conferencia IA 2025', 'Evento sobre inteligencia artificial y aprendizaje automático', TO_DATE('2025-05-20', 'YYYY-MM-DD'), 120, 1, 1, 1);

INSERT INTO Eventos (id_evento, nombre, descripcion, fecha, duracion, id_ubicacion, id_categoria, id_organizador)
VALUES (eventos_seq.NEXTVAL, 'Taller de Energía Renovable', 'Aprende sobre energías limpias y su aplicación práctica', TO_DATE('2025-06-15', 'YYYY-MM-DD'), 90, 2, 2, 2);

INSERT INTO Eventos (id_evento, nombre, descripcion, fecha, duracion, id_ubicacion, id_categoria, id_organizador)
VALUES (eventos_seq.NEXTVAL, 'Feria de Startups', 'Exhibición de nuevas startups en tecnología', TO_DATE('2025-07-10', 'YYYY-MM-DD'), 180, 3, 3, 1);

-- Insertar Inscripciones
INSERT INTO Inscripciones (id_inscripcion, id_usuario, id_evento, fecha_inscripcion)
VALUES (inscripciones_seq.NEXTVAL, 1, 1, SYSDATE);

INSERT INTO Inscripciones (id_inscripcion, id_usuario, id_evento, fecha_inscripcion)
VALUES (inscripciones_seq.NEXTVAL, 2, 2, SYSDATE);

INSERT INTO Inscripciones (id_inscripcion, id_usuario, id_evento, fecha_inscripcion)
VALUES (inscripciones_seq.NEXTVAL, 3, 3, SYSDATE);

--Ver datos de las tablas
SELECT * FROM Usuarios;
SELECT * FROM Organizadores;
SELECT * FROM Categorias;
SELECT * FROM Ubicaciones;
SELECT * FROM Eventos;
SELECT * FROM Inscripciones;