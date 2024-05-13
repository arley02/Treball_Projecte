-- Inserción de datos en la tabla DIAGNOSTICO
INSERT INTO DIAGNOSTICO (codigo_diagnostico, nombre_diagnostico, descripcion, causa, tratamiento) 
VALUES 
    (1, 'Gripe', 'Infección viral común que afecta las vías respiratorias.', 'Virus de la gripe', 'Reposo y medicamentos para aliviar los síntomas.'),
    (2, 'Dolor de cabeza', 'Malestar en la cabeza que puede ser causado por diversas razones.', 'Estrés', 'Descanso y analgésicos');

-- Inserción de datos en la tabla PLANTA
INSERT INTO PLANTA (numero_planta) 
VALUES 
    (1),
    (2);

-- Inserción de datos en la tabla PACIENTE
INSERT INTO PACIENTE (dni_paciente, nombre, apellidos) 
VALUES 
    ('12345678A', 'Juan', 'García Pérez'),
    ('87654321B', 'María', 'López Martínez');

-- Inserción de datos en la tabla EQUIPA
INSERT INTO EQUIPA (id_equipamiento) 
VALUES 
    (1),
    (2);

-- Inserción de datos en la tabla HABITACION
INSERT INTO HABITACION (numero_habitacion, numero_planta, id_equipamiento) 
VALUES 
    (1, 1, 1),
    (2, 2, 2);

-- Inserción de datos en la tabla QUIROFANO
INSERT INTO QUIROFANO (id_quirofano, numero_planta, id_equipamiento) 
VALUES 
    ('Q1', 1, 1),
    ('Q2', 2, 2);

-- Inserción de datos en la tabla PERSONAL
INSERT INTO PERSONAL (id_personal, nombre, apellidos, dni) 
VALUES 
    (5, 'juan', 'Martínez López', '11111111X'),
    (6, 'Pedro', 'Sánchez García', '22222222Y'),
    (7, 'Ana', 'Martínez Rodriges', '11111111X'),
    (8, 'Maria', 'Escamosa Suarez', '11111111X');

-- Inserción de datos en la tabla MEDICO
INSERT INTO MEDICO (id_medico, id_personal, estudios, especialidad, curriculum) 
VALUES 
    (3, 5, 'Medicina', 'Pediatría', 'Especialización en pediatría'),
    (4, 6, 'Medicina', 'Cirugía', 'Especialización en cirugía general');

-- Inserción de datos en la tabla ENFERMERA
INSERT INTO ENFERMERA (id_enfermera, id_personal, anos_de_experiencia, numero_planta) 
VALUES 
    (1, 7, 5, 1),
    (2, 8, 8, 2);

-- Inserción de datos en la tabla RES_VIS
INSERT INTO RES_VIS (id_visita, id_personal, dni_paciente) 
VALUES 
    (3, 7, '12345678A'),
    (4, 8, '87654321B');

-- Inserción de datos en la tabla HISTORIAL_MEDICO
INSERT INTO HISTORIAL_MEDICO (id_historial, id_visita, id_personal_doctor, codigo_diagnostico, fecha, dni_paciente, medicamentos_recibidos) 
VALUES 
    (3, 3, 5, 1, '2024-05-04', '12345678A', 'Paracetamol'),
    (4, 4, 6, 1, '2024-05-04', '87654321B', 'Ibuprofeno');

-- Inserción de datos en la tabla HABITACION_VISITADA
INSERT INTO HABITACION_VISITADA (id_visita, id_habitacion) 
VALUES 
    (3, 1),
    (4, 2);

-- Inserción de datos en la tabla QUIROFANO_VISITADA
INSERT INTO QUIROFANO_VISITADA (id_visita, id_quirofano) 
VALUES 
    (3, 'Q1'),
    (4, 'Q2');
