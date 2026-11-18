-- Sample schema and data
CREATE TABLE tecnicos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Requires the "terminales" table from lecciones-01-03.sql (run that file first)
CREATE TABLE visitas (
    id SERIAL PRIMARY KEY,
    terminal_id INT NOT NULL REFERENCES terminales(id),
    tecnico_id INT NOT NULL REFERENCES tecnicos(id),
    fecha DATE NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

INSERT INTO tecnicos (nombre) VALUES ('Carlos'), ('Andrea'), ('Luis');

INSERT INTO visitas (terminal_id, tecnico_id, fecha, tipo) VALUES
    (1, 1, '2026-11-03', 'instalación'),
    (2, 2, '2026-11-05', 'reparación'),
    (2, 1, '2026-11-10', 'reparación'),
    (3, 2, '2026-11-12', 'mantenimiento'),
    (5, 1, '2026-11-15', 'reparación');

-- List the date and type of every visit with its terminal serial
SELECT t.serial, v.fecha, v.tipo FROM visitas v JOIN terminales t ON v.terminal_id = t.id;

-- List the name of the technician, terminal serial, and type of visit for all visits
SELECT te.nombre, t.serial, v.tipo
FROM visitas v
JOIN terminales t ON v.terminal_id = t.id
JOIN tecnicos te  ON v.tecnico_id  = te.id;

-- List the name of the technician and the total number of visits they have made, including technicians with zero visits 
SELECT te.nombre, COUNT(v.id) AS total FROM tecnicos te LEFT JOIN visitas v ON v.tecnico_id = te.id GROUP BY te.nombre;

-- List the serial of all terminals that have not had any visits
SELECT t.serial FROM terminales t LEFT JOIN visitas v ON v.terminal_id = t.id WHERE v.id IS NULL;