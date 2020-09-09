DROP DATABASE if EXISTS eval1;

CREATE DATABASE eval1;

USE eval1;

CREATE TABLE CLIENT (
	cli_num INT AUTO_INCREMENT NOT NULL PRIMARY key,            
	cli_nom VARCHAR(50),
	cli_adresse VARCHAR(50),
	cli_tel VARCHAR (50)
);
	
CREATE TABLE commande (
	com_num INT AUTO_INCREMENT NOT NULL,
	cli_num INT,
	com_date DATETIME,
	com_obs VARCHAR(50),
FOREIGN KEY (cli_num )REFERENCES CLIENT (cli_num),
PRIMARY KEY (com_num)
);

CREATE TABLE produit(
	pro_num INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
	pro_libelle VARCHAR(50),
	pro_description VARCHAR(50) 
);

CREATE TABLE est_compose(
	com_num INT NOT NULL,
	pro_num	INT ,
	est_qte INT ,
FOREIGN KEY (com_num)REFERENCES commande (com_num),
FOREIGN KEY (pro_num)REFERENCES produit (pro_num),
PRIMARY KEY (com_num, pro_num)	
);