DROP TABLE IF EXISTS QUIROFANO_VISITADA CASCADE;
DROP TABLE IF EXISTS HABITACION_VISITADA CASCADE;
DROP TABLE IF EXISTS HISTORIAL_MEDICO CASCADE;
DROP TABLE IF EXISTS RES_VIS CASCADE;
DROP TABLE IF EXISTS ENFERMERA CASCADE;
DROP TABLE IF EXISTS VARIO CASCADE;
DROP TABLE IF EXISTS MEDICO CASCADE;
DROP TABLE IF EXISTS PERSONAL CASCADE;
DROP TABLE IF EXISTS QUIROFANO CASCADE;
DROP TABLE IF EXISTS HABITACION CASCADE;
DROP TABLE IF EXISTS EQUIPA CASCADE;
DROP TABLE IF EXISTS PACIENTE CASCADE;
DROP TABLE IF EXISTS PLANTA CASCADE;
DROP TABLE IF EXISTS DIAGNOSTICO CASCADE;

CREATE TABLE DIAGNOSTICO (
    codigo_diagnostico SERIAL PRIMARY KEY,
    nombre_diagnostico VARCHAR(100) NOT NULL,
    descripcion TEXT,
    causa TEXT,
    tratamiento TEXT
);

CREATE TABLE PLANTA (
    numero_planta SERIAL PRIMARY KEY
);

CREATE TABLE PACIENTE (
    dni_paciente VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL
);

CREATE TABLE EQUIPA (
    id_equipamiento SERIAL PRIMARY KEY
);

CREATE TABLE HABITACION (
    numero_habitacion SERIAL PRIMARY KEY,
    numero_planta INT NOT NULL,
    id_equipamiento INT NOT NULL,
    FOREIGN KEY (numero_planta) REFERENCES PLANTA(numero_planta),
    FOREIGN KEY (id_equipamiento) REFERENCES EQUIPA(id_equipamiento)
);

CREATE TABLE QUIROFANO (
    id_quirofano VARCHAR(10) PRIMARY KEY,
    numero_planta INT NOT NULL,
    id_equipamiento INT NOT NULL,
    FOREIGN KEY (numero_planta) REFERENCES PLANTA(numero_planta),
    FOREIGN KEY (id_equipamiento) REFERENCES EQUIPA(id_equipamiento)
);

CREATE TABLE PERSONAL (
    id_personal SERIAL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    dni VARCHAR(30) NOT NULL
);

CREATE TABLE MEDICO (
    id_medico SERIAL PRIMARY KEY,
    id_personal INT UNIQUE NOT NULL,
    estudios VARCHAR(50) NOT NULL,
    especialidad VARCHAR(60),
    curriculum VARCHAR(60),
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
);

CREATE TABLE VARIO (
    id_vario SERIAL PRIMARY KEY,
    id_personal INT UNIQUE NOT NULL,
    tipo VARCHAR(30),
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
);

CREATE TABLE ENFERMERA (
    id_enfermera SERIAL PRIMARY KEY,
    id_personal INT UNIQUE NOT NULL,
    id_medico INT UNIQUE,
    anos_de_experiencia INT CHECK (anos_de_experiencia >= 0),
    numero_planta INT,
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal),
    FOREIGN KEY (id_medico) REFERENCES MEDICO(id_medico),
    FOREIGN KEY (numero_planta) REFERENCES PLANTA(numero_planta)
);

CREATE TABLE RES_VIS (
    id_visita SERIAL PRIMARY KEY,
    id_personal INT UNIQUE NOT NULL,
    dni_paciente VARCHAR(20) UNIQUE NOT NULL,
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal),
    FOREIGN KEY (dni_paciente) REFERENCES PACIENTE(dni_paciente)
);

CREATE TABLE HISTORIAL_MEDICO (
    id_historial SERIAL PRIMARY KEY,
    id_visita INT NOT NULL,
    id_personal_doctor INT NOT NULL,
    codigo_diagnostico INT,
    fecha VARCHAR(20) NOT NULL,
    dni_paciente VARCHAR(20) NOT NULL,
    medicamentos_recibidos TEXT,
    FOREIGN KEY (id_personal_doctor) REFERENCES PERSONAL(id_personal),
    FOREIGN KEY (codigo_diagnostico) REFERENCES DIAGNOSTICO(codigo_diagnostico),
    FOREIGN KEY (dni_paciente) REFERENCES PACIENTE(dni_paciente),
    FOREIGN KEY (id_visita) REFERENCES RES_VIS(id_visita)
);

CREATE TABLE HABITACION_VISITADA (
    id_visita INT NOT NULL,
    id_habitacion INT NOT NULL,
    PRIMARY KEY (id_visita, id_habitacion),
    FOREIGN KEY (id_visita) REFERENCES RES_VIS(id_visita),
    FOREIGN KEY (id_habitacion) REFERENCES HABITACION(numero_habitacion)
);

CREATE TABLE QUIROFANO_VISITADA (
    id_visita INT NOT NULL,
    id_quirofano VARCHAR(10) NOT NULL,
    PRIMARY KEY (id_visita, id_quirofano),
    FOREIGN KEY (id_visita) REFERENCES RES_VIS(id_visita),
    FOREIGN KEY (id_quirofano) REFERENCES QUIROFANO(id_quirofano)
);
