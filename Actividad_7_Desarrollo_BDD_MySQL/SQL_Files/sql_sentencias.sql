/************************************************************************************************
						          ASSIGMENT QUERIES 
/************************************************************************************************/
/*Favoritos del Cliente*/
SELECT fv.ID AS Cliente_ID,
       cl.nombre AS Nombre_Del_Cliente,
       cl.email AS Email_Del_Cliente,
       cl.telefono AS Telefono_Del_Cliente,
       lc.id AS Restaurante_ID,
       lc.nombre AS Restaurante,
       lc.sucursal AS Sucursal,
       lc.telefono AS Telefono,
       lc.responsable AS Responsable
FROM restaurante.Favoritos fv
JOIN restaurante.clientes cl ON fv.clientes_id=cl.Id
JOIN restaurante.locales lc ON fv.locales_id=lc.id
WHERE cl.nombre='Mario Bezares';

/*Mesas Ocupadas*/
/*Criteria: Mesas Ocupadas para un Restaurante (Local) en Concreto)
Adicione la Sucursal por que creo que eso permite una estructura como una Cadena que tiene multiple sucursales relacionadas o indeperndientes.. Ejemplo McDonads
*/
SELECT lc.ID AS Restaurante_ID,
       lc.nombre AS Restaurante,
       lc.sucursal AS Sucursal,
       ms.ID AS Mesa_ID,
       ms.numero_mesa AS Numero_De_Mesa,
       ms.fecha_ocupacion AS Fecha_De_Ocupacion,
       ms.ocupada AS Mesa_Ocupada,
       CASE
       WHEN ms.fecha_ocupacion IS NOT NULL THEN 1
       ELSE 0
       END AS Mesa_Ocupada_Valor_Dinamico,
       cl.id AS Cliente_ID,
       cl.nombre AS Nombre_Del_Cliente,
       cl.email AS Email_Del_Cliente,
       cl.telefono AS Telefono
FROM restaurante.locales lc
LEFT JOIN restaurante.mesas ms ON lc.id=ms.locales_id
LEFT JOIN restaurante.cliente_mesas cm ON cm.mesas_id=ms.id
LEFT JOIN restaurante.clientes cl ON cm.clientes_id=cl.id
WHERE lc.nombre='Earls' AND ms.fecha_ocupacion IS NOT NULL
ORDER BY lc.sucursal, fecha_ocupacion ASC;

/*Testing Multiple Restaurants*/
/* With Records*/
CALL getRestaurantOccupiedTable('Earls');
CALL getRestaurantOccupiedTable('Sombreros');
CALL getRestaurantOccupiedTable('Papayas');
CALL getRestaurantOccupiedTable('Milestones');
CALL getRestaurantOccupiedTable('Tim Horton');
CALL getRestaurantOccupiedTable('Irish Pub');
CALL getRestaurantOccupiedTable('Las Ranas');
CALL getRestaurantOccupiedTable('Sal y Limon');

/*No Records*/  
CALL getRestaurantOccupiedTable('Bananas');
CALL getRestaurantOccupiedTable('Backpackers');

/************************************************************************************************
						          BONUS SECTION - DATA ANALYSIS 
/************************************************************************************************/
/* ALL Records View */
SELECT * FROM Restaurant_Analisis_Data;

/*Mesas Descocupadas*/
SELECT ID,
       Restaurante,
       Sucursal,
       Mesa_ID,
       Numero_De_Mesa,
       Fecha_De_Ocupacion,
       ocupada,
       Cliente_ID,
       Nombre_Del_Cliente,
       Email_Del_Cliente,
       Telefono
FROM Restaurant_Analisis_Data
WHERE Fecha_De_Ocupacion IS NULL;

/*Occupancy of Tables by Restaurant/Branch*/
SELECT Restaurante,
       Sucursal,
       Count(ID) AS Numero_Mesas_Ocupadas
FROM Restaurant_Analisis_Data
WHERE Fecha_De_Ocupacion IS NOT NULL
GROUP BY Restaurante, Sucursal
ORDER BY Numero_Mesas_Ocupadas DESC;

/*Not Occupied Tables by Restaurant/Branch*/
SELECT Restaurante,
       Sucursal,
       Count(ID) AS Numero_Mesas_Desocupadas
FROM Restaurant_Analisis_Data
WHERE Fecha_De_Ocupacion IS NULL
GROUP BY Restaurante, Sucursal
ORDER BY Numero_Mesas_Desocupadas DESC;

/*Customer with more than one reservation per Restaurant/Same Branch*/
SELECT Nombre_Del_Cliente,
	   Restaurante,
       Sucursal,
       count(ID) AS Number_Of_Reservaciones
FROM Restaurant_Analisis_Data       
WHERE Fecha_De_Ocupacion IS NOT NULL
GROUP BY Nombre_Del_Cliente, Restaurante, Sucursal
HAVING count(ID)>1
ORDER BY Number_Of_Reservaciones DESC;











