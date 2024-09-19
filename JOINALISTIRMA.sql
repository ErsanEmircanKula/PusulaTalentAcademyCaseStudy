--- �ehirlere G�re Verilen Sipari�leri Toplam Olarak Listeleme ---
SELECT C.CITY, SUM(O.TOTALPRICE) TOTALSALE
FROM ORDERS O
JOIN ADDRESS A ON A.ID=O.ADDRESSID
JOIN CITIES C ON C.ID=A.CITYID

GROUP BY C.CITY
ORDER BY 2 DESC

--- �r�n Kategorilerine G�re Sipari� Da��l�m� ---
SELECT I.CATEGORY1, SUM(OD.LINETOTAL) TOTALSALE
FROM ITEMS I
JOIN ORDERDETAILS OD ON OD.ITEMID=I.ID
GROUP BY I.CATEGORY1
ORDER BY I.CATEGORY1 ASC

--- M��terilere G�re Sipari� Da��l�m� ---
SELECT TOP 10
U.ID, U.NAMESURNAME, SUM(O.TOTALPRICE) TOTALSALE,
COUNT(O.ID) ORDERCOUNT
FROM ORDERS O
JOIN USERS U ON U.ID=O.USERID
GROUP BY U.ID, U.NAMESURNAME
ORDER BY TOTALSALE DESC

--- M��teri Cinsiyetine G�re Sipari� Da��l�m� ---
SELECT 
CASE
	WHEN U.GENDER='E' THEN 'Erkek'
	WHEN U.GENDER='K' THEN 'Kad�n'
END AS GENDER, SUM (O.TOTALPRICE) TOTALSALE
FROM ORDERS O
JOIN USERS U ON U.ID=O.USERID
GROUP BY U.GENDER

--- �deme T�r�ne G�re Sipari� Da��l�m� ---
SELECT 
CASE
	WHEN PAYMENTTYPE = 1 THEN 'Kredi Kart�'
	ELSE 'Banka Havalesi'
END AS PAYMENTTYPE,
SUM(PAYMENTTOTAL) PAYMENTTOTAL
FROM PAYMENTS
GROUP BY PAYMENTTYPE

--- �ehirlerin Haftan�n G�n�nne G�re Sipari� Da��l�m�
SELECT C.CITY,DATEPART(DW,O.DATE_) DAYNR,
DATENAME(DW, O.DATE_) DAYNAME_,
SUM(O.TOTALPRICE) TOTALPRICE
FROM ORDERS O
JOIN ADDRESS A ON A.ID = O.ADDRESSID
JOIN CITIES C ON C.ID = A.CITYID
GROUP BY
C.CITY, DATEPART(DW,O.DATE_),DATENAME(DW, O.DATE_)	
ORDER BY DATEPART(DW,O.DATE_)