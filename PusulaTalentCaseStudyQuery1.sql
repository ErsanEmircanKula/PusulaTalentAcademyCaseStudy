--- ProducID kolonunu Sales tablosuna forign key olarak atama ---
ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_Product
FOREIGN KEY (ProductID) REFERENCES Products(ProductID);


--- Her ürünün satýþ sayýsý ve toplam satýþ tutarý ---
SELECT p.ProductName, 
COUNT(s.SaleID) AS TotalSalesCount, 
SUM(s.Quantity * p.Price) AS TotalSalesAmount
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID

GROUP BY p.ProductName;

--- En yüksek satýþ sayýsýna sahip ürünün belirlenmesi --- 

SELECT TOP 1 p.ProductName, 
SUM(s.Quantity * p.Price) AS TotalSalesAmount
FROM Sales s Products p ON s.ProductID = p.ProductID

GROUP BY p.ProductName
ORDER BY TotalSalesAmount DESC;
