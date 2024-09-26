
USE FastFoodDB;


/*Eficiencia de los mensajeros: ¿Cuál es el tiempo promedio desde el despacho hasta la entrega de los pedidos gestionados por todo el equipo de mensajería?*/


SELECT AVG( DATEDIFF(MINUTE, FechaDespacho, FechaEntrega) ) 'PromedioTiempoEntrega(Min)'
FROM Ordenes
WHERE MensajeroID IS NOT NULL;

-- Análisis de Ventas por Origen de Orden: ¿Qué canal de ventas genera más ingresos? --

SELECT TOP 1 OO.Descripcion Canal, SUM(TotalCompra) Ingresos
FROM Ordenes O
INNER JOIN OrigenesOrden OO ON (O.OrigenID = OO.OrigenID)
GROUP BY OO.Descripcion
ORDER BY Ingresos DESC;

--Productividad de los Empleados: ¿Cuál es el nivel de ingreso generado por Empleado?--

SELECT E.Nombre Empleado, SUM(TotalCompra) Ingresos
FROM Ordenes O
INNER JOIN Empleados E ON (O.EmpleadoID = E.EmpleadoID)
GROUP BY E.Nombre
ORDER  BY Ingresos DESC;

-- Análisis de Demanda por Horario y Día: ¿Cómo varía la demanda de productos a lo largo del día? --

SELECT	O.HorarioVenta, P.Nombre Producto, SUM(DO.Cantidad) Demanda 
FROM Ordenes O
LEFT JOIN DetallesOrdenes DO ON (O.OrdenID = DO.OrdenID)
LEFT JOIN Productos P ON (DO.ProductoID = P.ProductoID)
GROUP BY O.HorarioVenta, P.Nombre;


-- Comparación de Ventas Mensuales: ¿Cual es la tendencia de los ingresos generados en cada periodo mensual?--


SELECT MONTH(FechaEntrega) Mes, SUM(TotalCompra) Ingresos
FROM Ordenes
GROUP BY FechaEntrega;


-- Análisis de Fidelidad del Cliente: ¿Qué porcentaje de clientes son recurrentes versus nuevos clientes cada mes? NOTA: La consulta se enfocaría en la frecuencia de órdenes por cliente para inferir la fidelidad.--

SELECT C.Nombre Cliente, MONTH (FechaEntrega) Mes, COUNT(O.ClienteID) Frecuencia
FROM Ordenes O
INNER JOIN Clientes C ON (O.ClienteID = C.ClienteID)
GROUP BY C.Nombre, FechaEntrega
ORDER BY Frecuencia DESC;









