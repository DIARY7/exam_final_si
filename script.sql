CREATE DATABASE garage;
use garage;

CREATE TABLE garage_slot(
	id int auto_increment,
	designation varchar(5),
	PRIMARY KEY(id)
);

CREATE TABLE garage_type_service(
	id int,
	designation varchar(100),
	duree time,
	montant decimal(10,2),
	PRIMARY KEY(id)
);

CREATE TABLE garage_type_vehicule(
	id int auto_increment,
	designation varchar(50),
	PRIMARY KEY(id)
);

CREATE TABLE garage_vehicule(
	numero int,
	id_type int,
	PRIMARY KEY(numero),
	FOREIGN KEY (id_type) references garage_type_vehicule(id)
);
CREATE TABLE garage_rdv(
	id int auto_increment,
	date_rdv datetime,
	id_type_service int,
	id_vehicule int,
	id_slot int,
	date_fin date,
	PRIMARY KEY(id),
	FOREIGN KEY (id_type_service) references garage_type_service(id),
	FOREIGN KEY (id_vehicule) references garage_vehicule(numero),
	FOREIGN KEY (id_slot) references garage_slot(id)
);

CREATE OR REPLACE VIEW garage_vehicule_view AS
SELECT l.*,t.designation AS designation FROM garage_vehicule l JOIN garage_type_vehicule t on l.id_type = t.designation;

CREATE OR REPLACE VIEW garage_rdv_view AS
SELECT r.*, ts.designation,ts.duree,ts.montant,s.designation as slot FROM garage_rdv r JOIN garage_type_service ts ON r.id_type_service = ts.id
JOIN garage_vehicule_view l ON r.id_vehicule = l.numero
JOIN garage_slot s ON r.id_slot = s.id;  


INSERT INTO garage_slot (designation) VALUES ('A');
INSERT INTO garage_slot (designation) VALUES ('B');
INSERT INTO garage_slot (designation) VALUES ('C');

INSERT INTO garage_type_service (id, designation, duree, montant) VALUES 
(1, 'Réparation simple', '01:00:00', 150000.00),
(2, 'Réparation standard', '02:00:00', 250000.00),
(3, 'Réparation complexe', '08:00:00', 800000.00),
(4, 'Entretien', '02:30:00', 300000.00);
