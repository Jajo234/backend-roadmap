-- Requires tables from lessons-01-03-basics.sql and lessons-04-joins.sql (run those first)

-- List terminals with at least 2 visits and their visit count
SELECT t.serial, COUNT(v.id) AS total
FROM terminales t
JOIN visitas v ON v.terminal_id = t.id
GROUP BY t.serial
HAVING COUNT(v.id) >= 2;

-- List the cities that have more than 1 terminal
SELECT ciudad, COUNT(*) AS total
FROM terminales
GROUP BY ciudad
HAVING COUNT(*) > 1;

-- List the name of the technician and the total number of visits they have made since '2026-11-10', 
-- only including technicians with at least 1 visit in that period
SELECT te.nombre, COUNT(v.id) AS total
FROM tecnicos te
JOIN visitas v ON v.tecnico_id = te.id
WHERE v.fecha >= '2026-11-10'
GROUP BY te.nombre;