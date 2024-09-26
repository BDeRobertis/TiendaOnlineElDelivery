-- pregunta ¿Cual es el total de ventas (TotalCompra) a nivel global?

SELECT SUM(TotalCompra) Total_ventas
FROM Ordenes;

-- Pregunta ¿Cual es el precio promedio de los productos dentro de cada categoría?

SELECT CategoriaID,
    AVG(Precio) 'Precio promedio'
FROM Productos
GROUP BY CategoriaID
ORDER BY 'Precio Promedio' DESC;

-- Pregunta ¿Cual es el valor de la orden mínima y máxima por cada sucursal?

SELECT SucursalID,
      MIN(TotalCompra) 'Mínimo',
	  MAX(TotalCompra) 'Máximo'
From Ordenes
GROUP BY SucursalID;


-- Pregunta ¿Cual es el mayor número de kilómetros recorridos para una entrega?--

SELECT TOP 1 OrdenID, SucursalID, MAX(KilometrosRecorrer) Máximo
FROM Ordenes
GROUP BY OrdenID, SucursalID
ORDER BY Máximo DESC;

-- Promedio de cantidad productos por ordenes--

SELECT OrdenID,
  AVG(Cantidad) Promedio_productos
  FROM DetallesOrdenes
  GROUP BY OrdenID;

-- Pregunta: ¿Como se distribuye la facturación total del negocio de acuerdo a los métodos de pago? --

SELECT TipoPagoId,
SUM(TotalCompra) Total_Facturación
FROM Ordenes
GROUP BY TipoPagoID
ORDER BY Total_Facturación DESC;

-- Pregunta: ¿Cual  sucursal tiene el ingreso promedio más alto?
SELECT TOP 3 SucursalID,
	CAST(AVG(TotalCompra) AS DECIMAL(10,2)) Promedio_venta
FROM Ordenes
GROUP BY SucursalID;

-- Pregunta: ¿Cuales son las sucursales que han generado ventas totales por encima de $1000?

SELECT SucursalID,
 SUM(TotalCompra) Total_venta 
 FROM Ordenes
 GROUP BY SucursalID
 HAVING SUM(TotalCompra) > 1000
 ORDER BY SUM(TotalCompra) DESC;

 -- Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023? --
 
 SELECT CAST(AVG(TotalCompra) AS DECIMAL(10,2)) Venta_promedio
 FROM Ordenes
 WHERE FechaEntrega > '2023-07-01';

 -- Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?
 --

 SELECT HorarioVenta,
 COUNT (*) Cantidad_ventas,
 CAST(AVG(TotalCompra) AS DECIMAL(10,2)) Venta_promedio,
 MAX(TotalCompra) Venta_máxima
 FROM Ordenes
 GROUP BY HorarioVenta
 ORDER BY Venta_máxima;



