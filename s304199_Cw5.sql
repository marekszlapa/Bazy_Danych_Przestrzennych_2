--Zad8a
SELECT OrderDate, COUNT(OrderDate) AS order_cnt from AdventureWorksDW2019.dbo.FactInternetSales GROUP BY OrderDate  HAVING COUNT(OrderDate) < 100 ORDER BY order_cnt DESC

--Zad8b
SELECT OrderDate, EnglishProductName FROM (SELECT MIN(FactInternetSales.ProductKey) as mn, OrderDate, DimProduct.EnglishProductName, COUNT(OrderDate) OVER(PARTITION BY OrderDate) AS order_cnt, ROW_NUMBER() OVER(PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS rn, UnitPrice FROM AdventureWorksDW2019.dbo.FactInternetSales JOIN DimProduct ON DimProduct.ProductKey=FactInternetSales.ProductKey GROUP BY OrderDate, DimProduct.EnglishProductName, UnitPrice) AS t WHERE rn <= 3 ORDER BY OrderDate