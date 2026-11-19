-- Requires tables from lessons-01-03-basics.sql and lessons-04-joins.sql (run those first)

-- List the serial numbers of the terminals that were visited on the earliest date in the visitas table.
SELECT serial
FROM terminales
WHERE id IN (
    SELECT terminal_id 
    FROM visitas 
    WHERE fecha = (
        SELECT MIN(fecha) FROM visitas
    )
);

-- List the names of the technicians who have visited terminals in the city of Ocaña.
SELECT nombre
FROM tecnicos
WHERE id IN (
    SELECT tecnico_id
    FROM visitas
    WHERE terminal_id IN (
        SELECT id FROM terminales WHERE ciudad = 'Ocaña'
    )
);

-- List the serial numbers of the terminals that have not been visited.

-- With LEFT JOIN
SELECT t.serial
FROM terminales t
LEFT JOIN visitas v ON v.terminal_id = t.id
WHERE v.id IS NULL;

-- With NOT IN
SELECT serial
FROM terminales
WHERE id NOT IN (SELECT terminal_id FROM visitas);