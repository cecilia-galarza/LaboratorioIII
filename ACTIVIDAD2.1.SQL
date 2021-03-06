-- 1 Listado de todos los clientes.
SELECT * FROM CLIENTES
-- 2
-- Listado de todos los proyectos.
SELECT * FROM PROYECTOS
-- 3
-- Listado con nombre, descripción, costo, fecha de inicio y de fin de todos los proyectos.
SELECT Nombre, Descripcion, Costo, FechaInicio, FechaFin FROM PROYECTOS

 -- 4
-- Listado con nombre, descripción, costo y fecha de inicio de todos los proyectos con costo mayor a cien mil pesos.
SELECT Nombre, Descripcion, Costo, FechaInicio  FROM PROYECTOS WHERE Costo > 100000

-- 5
-- Listado con nombre, descripción, costo y fecha de inicio de todos los proyectos con costo menor a cincuenta mil pesos .
SELECT Nombre, Descripcion, Costo, FechaInicio  FROM PROYECTOS WHERE Costo <100000

-- 6
-- Listado con todos los datos de todos los proyectos que comiencen en el año 2020.
SELECT * FROM PROYECTOS WHERE  YEAR( FechaInicio) =2020

-- 7
-- Listado con nombre, descripción y costo de los proyectos que comiencen en el año 2020 y cuesten más de cien mil pesos.
SELECT Nombre, Descripcion, Costo, FechaInicio FROM PROYECTOS WHERE  YEAR( FechaInicio) =2020 AND Costo > 100000

-- 8
-- Listado con nombre del proyecto, costo y año de inicio del proyecto.
SELECT Nombre, Costo, YEAR (FechaInicio) AS 'AÑO DE INICIO' FROM PROYECTOS

-- 9
-- Listado con nombre del proyecto, costo, fecha de inicio, fecha de fin y días de duración de los proyectos.
SELECT Nombre, Costo, FechaInicio, FechaFin, DATEDIFF(day, FechaInicio, FechaFin) as 'duracion dias'  FROM PROYECTOS 

-- 10
-- Listado con razón social, cuit y teléfono de todos los clientes cuyo IDTipo sea 1, 3, 5 o 6
SELECT RazonSocial, Cuit, TelefonoMovil FROM CLIENTES WHERE  IDTipoCliente IN (1, 3, 5, 6)

 -- 11
-- Listado con nombre del proyecto, costo, fecha de inicio y fin de todos los proyectos que no pertenezcan a los clientes 1, 5 ni 10.

SELECT Nombre, Costo, FechaInicio, FechaFin FROM PROYECTOS WHERE IDCliente NOT IN (1, 5, 10)


-- 12
-- Listado con nombre del proyecto, costo y descripción de aquellos proyectos que hayan comenzado entre el 1/1/2018 y el 24/6/2018.
SELECT Nombre, Descripcion, Costo FROM PROYECTOS WHERE FechaInicio BETWEEN '2018-01-01' AND '2018-06-24'

-- 13
-- Listado con nombre del proyecto, costo y descripción de aquellos proyectos que hayan finalizado entre el 1/1/2019 y el 12/12/2019.
SELECT Nombre, Descripcion, Costo FROM PROYECTOS WHERE FechaFin BETWEEN '2019-01-01' AND '2019-12-12'
-- 14
-- Listado con nombre de proyecto y descripción de aquellos proyectos que aún no hayan finalizado.
SELECT Nombre, Descripcion FROM PROYECTOS WHERE FechaFin IS NULL

-- 15
-- Listado con nombre de proyecto y descripción de aquellos proyectos que aún no hayan comenzado.
SELECT Nombre, Descripcion FROM PROYECTOS WHERE FechaInicio IS NULL
-- 16
-- Listado de clientes cuya razón social comience con letra vocal.
SELECT * FROM CLIENTES WHERE RazonSocial LIKE '[A,E,I,O,U]%'

-- 17
-- Listado de clientes cuya razón social finalice con vocal.
SELECT * FROM CLIENTES WHERE RazonSocial LIKE '%[A,E,I,O,U]'
-- 18
-- Listado de clientes cuya razón social finalice con la palabra 'Inc'
SELECT * FROM CLIENTES WHERE RazonSocial LIKE '%Inc'

-- 19
-- Listado de clientes cuya razón social no finalice con vocal.
SELECT * FROM CLIENTES WHERE RazonSocial NOT LIKE '%[A,E,I,O,U]'
-- 20
-- Listado de clientes cuya razón social no contenga espacios.
SELECT * FROM CLIENTES WHERE RazonSocial NOT LIKE '% %'
-- 21
-- Listado de clientes cuya razón social contenga más de un espacio.
SELECT * FROM CLIENTES WHERE RazonSocial LIKE '% % %'
-- 22
-- Listado de razón social, cuit, email y celular de aquellos clientes que tengan mail pero no teléfono.
SELECT RazonSocial, Cuit, Email, TelefonoMovil FROM CLIENTES WHERE Email IS NOT NULL AND TelefonoFijo IS NULL

-- 23
-- Listado de razón social, cuit, email y celular de aquellos clientes que no tengan mail pero sí teléfono.
SELECT RazonSocial, Cuit, Email, TelefonoMovil FROM CLIENTES WHERE Email IS NULL AND TelefonoFijo IS NOT NULL

-- 24
-- Listado de razón social, cuit, email, teléfono o celular de aquellos clientes que tengan mail o teléfono o celular .
SELECT RazonSocial, Cuit, Email, TelefonoMovil, TelefonoFijo  FROM CLIENTES WHERE Email IS NOT NULL OR TelefonoFijo IS NOT NULL OR TelefonoMovil IS NOT NULL
-- 25
-- Listado de razón social, cuit y mail. Si no dispone de mail debe aparecer el texto "Sin mail".
SELECT RazonSocial, Cuit, CASE WHEN Email IS NULL THEN 'Sin mail'ELSE Email END AS 'E MAIL' FROM CLIENTES
-- 26
-- Listado de razón social, cuit y una columna llamada Contacto con el mail, si no posee mail, con el número de celular y si no posee número de celular con un texto que diga "Incontactable".
SELECT RazonSocial, Cuit, CASE WHEN Email IS NOT NULL THEN Email  WHEN TelefonoMovil IS NOT NULL THEN TelefonoMovil ELSE 'INCONTACTABLE' END AS 'Contacto' FROM CLIENTES 