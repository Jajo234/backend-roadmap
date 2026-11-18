-- Sample schema and data
CREATE TABLE terminales (
    id SERIAL PRIMARY KEY,
    serial VARCHAR(50) NOT NULL UNIQUE,
    modelo VARCHAR(50) NOT NULL,
    ciudad VARCHAR(20) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

INSERT INTO terminales (serial, modelo, ciudad, estado) VALUES
    ('A1001', 'Move 5000', 'Ocaña',  'activa'),
    ('A1002', 'Move 5000', 'Cúcuta', 'en reparación'),
    ('B2001', 'Desk 3500', 'Ocaña',  'activa'),
    ('B2002', 'Desk 3500', 'Bogotá', 'retirada'),
    ('A1003', 'Move 5000', 'Ocaña',  'en reparación');

-- List the serial and model of all terminals
SELECT serial, modelo FROM terminales;

-- List all terminals that are currently under repair
SELECT * FROM terminales WHERE estado = 'en reparación';

-- List the serial of all terminals that are of model 'Move 5000' and located in the city of 'Ocaña'
SELECT serial FROM terminales WHERE modelo = 'Move 5000' AND ciudad = 'Ocaña';

-- List the serial and status of all terminals that are not retired, ordered by serial in ascending order
SELECT serial, estado FROM terminales WHERE estado <> 'retirada' ORDER BY serial ASC;

-- List all terminals that are located in either 'Ocaña' or 'Cúcuta'
SELECT * FROM terminales WHERE ciudad IN ('Ocaña', 'Cúcuta');

-- List the first 2 terminals of model 'Desk 3500', ordered by 'id'
SELECT * FROM terminales WHERE modelo = 'Desk 3500' ORDER BY id LIMIT 2;

-- List all terminals that are located in 'Ocaña' and are either 'activa' or 'en reparación'
SELECT * FROM terminales WHERE ciudad = 'Ocaña' AND estado IN ('activa', 'en reparación');
SELECT * FROM terminales WHERE ciudad = 'Ocaña' AND (estado = 'activa' OR estado = 'en reparación');

-- List the count of terminals grouped by their status
SELECT estado, COUNT(*) AS total FROM terminales GROUP BY estado;

-- List the count of terminals grouped by their model, ordered by the total count in descending order
SELECT modelo, COUNT(*) AS total FROM terminales GROUP BY modelo ORDER BY total DESC;

-- List the count of terminals that are 'activa' and located in 'Ocaña'
SELECT COUNT(*) FROM terminales WHERE estado = 'activa' AND ciudad = 'Ocaña';