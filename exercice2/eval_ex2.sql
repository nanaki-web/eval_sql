1 - Liste des contacts français :

SELECT CompanyName AS Société ,ContactName AS Contact , ContactTitle AS Fonction ,Phone AS Téléphone
FROM customers 
WHERE country LIKE 'France'


2 - Produits vendus par le fournisseur « Exotic Liquids » :

SELECT ProductName AS Produit , UnitPrice AS Prix
FROM products 
JOIN suppliers
ON products.SupplierID=suppliers.SupplierID
WHERE CompanyName LIKE 'Exotic Liquids'


3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :

SELECT companyName AS Fournisseur , count(Products.SupplierID) AS Nbre_commandes
FROM suppliers
JOIN products
ON suppliers.SupplierID = products.SupplierID
WHERE country LIKE 'france'
GROUP BY companyName
ORDER BY Nbre_commandes DESC 


4 - Liste des clients Français ayant plus de 10 commandes :

SELECT Customers.CompanyName AS CLIENT ,COUNT( orders.CustomerID) AS Nbre_commandes
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
WHERE Country LIKE 'france' 
GROUP BY Customers.CompanyName
HAVING Nbre_commandes > 10


5 - Liste des clients ayant un chiffre d’affaires > 30.000 :

SELECT customers.CompanyName AS CLIENT , sum(unitPrice*Quantity) AS CA , Country AS Pays
FROM customers
JOIN orders
ON customers.CustomerID=orders.CustomerID
JOIN  `order details`          
ON orders.OrderID=`order details`.OrderID
GROUP BY CLIENT, Country
HAVING ca > 30000
ORDER BY  ca DESC 


6 – Liste des pays dont les clients ont passé commande de produits fournis par « Exotic
Liquids » :

SELECT DISTINCT customers.Country AS Pays
FROM customers
JOIN orders
ON customers.CustomerID = orders.CustomerID
JOIN `order details`
ON orders.OrderID = `order details`.OrderID
JOIN products
ON `order details`.ProductID = products.ProductID
JOIN suppliers
ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.CompanyName LIKE 'Exotic Liquids'
ORDER BY Pays


7 – Montant des ventes de 1997 :

SELECT SUM(UnitPrice * Quantity) AS 'Montant des ventes de 1997'
FROM `order details`
JOIN Orders
ON `order details`.OrderID = orders.OrderID
WHERE OrderDate LIKE '1997%'

(affiche un message d'erreur)


8 – Montant des ventes de 1997 mois par mois :

SELECT MONTH(OrderDate)AS 'Mois 97 ',SUM(UnitPrice * Quantity) AS 'Montant des ventes de 1997'
FROM `order details`
JOIN Orders
ON `order details`.OrderID = orders.OrderID
WHERE OrderDate LIKE '1997%'
GROUP BY  MONTH(OrderDate)

(affiche un message d'erreur)


9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?

SELECT MAX(orderDate) AS 'Date de dernière commande'
FROM orders
JOIN customers
ON orders.CustomerID = customers.CustomerID
WHERE customers.CompanyName LIKE 'Du monde entier'


10 – Quel est le délai moyen de livraison en jours ?

SELECT round(avg(DATEDIFF(shippedDate,orderDate ))) AS 'Délai moyen de livraison en jours'
FROM orders 








