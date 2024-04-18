-- Удаление таблиц, если они существуют
DROP TABLE IF EXISTS RES_VIS CASCADE;
DROP TABLE IF EXISTS DIAGNOSTICO CASCADE;
DROP TABLE IF EXISTS HISTORIAL_MEDICO CASCADE;
DROP TABLE IF EXISTS PACIENTE CASCADE;
DROP TABLE IF EXISTS EQUIPA CASCADE;
DROP TABLE IF EXISTS HABITACION CASCADE;
DROP TABLE IF EXISTS PLANTA CASCADE;
DROP TABLE IF EXISTS ASIGNADO CASCADE;
DROP TABLE IF EXISTS EQUIPAMIENTO CASCADE;
DROP TABLE IF EXISTS QUIROFANO CASCADE;
DROP TABLE IF EXISTS ENFERMERIA CASCADE;
DROP TABLE IF EXISTS MEDICO CASCADE;
DROP TABLE IF EXISTS PERSONAL CASCADE;

-- Создание таблицы PLANTA
CREATE TABLE PLANTA (
    numero_planta INT PRIMARY KEY
);

-- Создание таблицы PERSONAL
CREATE TABLE PERSONAL (
    id_personal SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    dni VARCHAR(20) UNIQUE,
    especialidad VARCHAR(50)
);

-- Создание таблицы ENFERMERIA
CREATE TABLE ENFERMERA (
    id_personal INT PRIMARY KEY,
    años_de_experiencia INT,
    numero_planta INT,
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal),
    FOREIGN KEY (numero_planta) REFERENCES PLANTA(numero_planta)
);

-- Создание таблицы MEDICO
CREATE TABLE MEDICO (
    id_personal INT PRIMARY KEY,
    estudios VARCHAR(100),
    curriculums VARCHAR(100),
	id_enfermera INT,
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal),
	FOREIGN KEY (id_enfermera) REFERENCES ENFERMERA(id_personal)
);

-- tabla VARIO
CREATE TABLE VARIO (
    id_personal INT PRIMARY KEY,
    tipo_de_trabajo VARCHAR(100),
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
);


-- Создание таблицы QUIROFANO
CREATE TABLE QUIROFANO (
    id_quirofano SERIAL PRIMARY KEY
);

-- Создание таблицы EQUIPAMIENTO
CREATE TABLE EQUIPAMIENTO (
    id_dispositivo SERIAL PRIMARY KEY,
    nombre_dispositivo VARCHAR(100)
);

-- Создание таблицы ASIGNADO
CREATE TABLE ASIGNADO (
    id_quirofano INT,
    id_dispositivo INT,
    FOREIGN KEY (id_quirofano) REFERENCES QUIROFANO(id_quirofano),
    FOREIGN KEY (id_dispositivo) REFERENCES EQUIPAMIENTO(id_dispositivo)
);

-- Создание таблицы HABITACION
CREATE TABLE HABITACION (
    numero_habitacion INT PRIMARY KEY,
    fecha_de_salida_prevista DATE,
    fecha_de_entrada_prevista DATE,
    nombre_paciente VARCHAR(100),
    numero_planta INT,
    FOREIGN KEY (numero_planta) REFERENCES PLANTA(numero_planta)
);

-- Создание таблицы HISTORIAL_MEDICO
CREATE TABLE HISTORIAL_MEDICO (
    id_historial SERIAL PRIMARY KEY,
    dni_paciente VARCHAR(20),
    id_personal INT,
    historial_familiar VARCHAR(500),
    historial_de_vacunacion VARCHAR(500),
    historial_de_alergias VARCHAR(500),
    FOREIGN KEY (dni_paciente) REFERENCES PACIENTE(dni_paciente),
    FOREIGN KEY (id_personal) REFERENCES PERSONAL(id_personal)
);

-- Создание таблицы PACIENTE
CREATE TABLE PACIENTE (
    dni_paciente VARCHAR(20) PRIMARY KEY,
    nombre VARCHAR(50),
    apellidos VARCHAR(50),
    medicamentos_recibidos VARCHAR(500),
    id_medico INT,
	id_historial INT,
    FOREIGN KEY (id_medico) REFERENCES MEDICO(id_personal),
	FOREIGN KEY (id_historial) REFERENCES HISTORIAL_MEDICO(id_historial)
);

-- Создание таблицы DIAGNOSTICO
CREATE TABLE DIAGNOSTICO (
    codigo_diagnostico SERIAL PRIMARY KEY,
    nombre_diagnostico VARCHAR(100),
    descripcion VARCHAR(500),
    causa VARCHAR(500),
    tratamiento VARCHAR(500),
    id_historial INT,
    FOREIGN KEY (id_historial) REFERENCES HISTORIAL_MEDICO(id_historial)
);

-- Создание таблицы RES_VIS
CREATE TABLE RES_VIS (
    id_medico INT,
    fecha DATE,
    hora TIME,
    codigo_visita VARCHAR(20),
    numero_habitacion INT,
    id_quirofano INT,
    FOREIGN KEY (id_medico) REFERENCES MEDICO(id_personal),
    FOREIGN KEY (numero_habitacion) REFERENCES HABITACION(numero_habitacion),
    FOREIGN KEY (id_quirofano) REFERENCES QUIROFANO(id_quirofano)
);
