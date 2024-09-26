-- pregunta �Cual es el total de ventas (TotalCompra) a nivel global?

SELECT SUM(TotalCompra) Total_ventas
FROM Ordenes;

-- Pregunta �Cual es el precio promedio de los productos dentro de cada categor�a?

SELECT CategoriaID,
    AVG(Precio) 'Precio promedio'
FROM Productos
GROUP BY CategoriaID
ORDER BY 'Precio Promedio' DESC;

-- Pregunta �Cual es el valor de la orden m�nima y m�xima por cada sucursal?

SELECT SucursalID,
      MIN(TotalCompra) 'M�nimo',
	  MAX(TotalCompra) 'M�ximo'
From Ordenes
GROUP BY SucursalID;


-- Pregunta �Cual es el mayor n�mero de kil�metros recorridos para una entrega?--

SELECT TOP 1 OrdenID, SucursalID, MAX(KilometrosRecorrer) M�ximo
FROM Ordenes
GROUP BY OrdenID, SucursalID
ORDER BY M�ximo DESC;

-- Promedio de cantidad productos por ordenes--

SELECT OrdenID,
  AVG(Cantidad) Promedio_productos
  FROM DetallesOrdenes
  GROUP BY OrdenID;

-- Pregunta: �Como se distribuye la facturaci�n total del negocio de acuerdo a los m�todos de pago? --

SELECT TipoPagoId,
SUM(TotalCompra) Total_Facturaci�n
FROM Ordenes
GROUP BY TipoPagoID
ORDER BY Total_Facturaci�n DESC;

-- Pregunta: �Cual  sucursal tiene el ingreso promedio m�s alto?
SELECT TOP 3 SucursalID,
	CAST(AVG(TotalCompra) AS DECIMAL(10,2)) Promedio_venta
FROM Ordenes
GROUP BY SucursalID;

-- Pregunta: �Cuales son las sucursales que han generado ventas totales por encima de $1000?

SELECT SucursalID,
 SUM(TotalCompra) Total_venta 
 FROM Ordenes
 GROUP BY SucursalID
 HAVING SUM(TotalCompra) > 1000
 ORDER BY SUM(TotalCompra) DESC;

 -- Pregunta: �C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023? --
 
 SELECT CAST(AVG(TotalCompra) AS DECIMAL(10,2)) Venta_promedio
 FROM Ordenes
 WHERE FechaEntrega > '2023-07-01';

 -- Pregunta: �Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas, cu�l es el ingreso promedio de estas ventas, y cu�l ha sido el importe m�ximo alcanzado por una orden en dicha jornada?
 --

 SELECT HorarioVenta,
 COUNT (*) Cantidad_ventas,
 CAST(AVG(TotalCompra) AS DECIMAL(10,2)) Venta_promedio,
 MAX(TotalCompra) Venta_m�xima
 FROM Ordenes
 GROUP BY HorarioVenta
 ORDER BY Venta_m�xima;



