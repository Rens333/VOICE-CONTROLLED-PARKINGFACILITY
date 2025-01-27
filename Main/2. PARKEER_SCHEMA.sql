USE [VOICE_CONTROLLED_PARKINGFACILITY]

DROP TABLE IF EXISTS[BESTUURDER]
DROP TABLE IF EXISTS[AUTO]
DROP TABLE IF EXISTS[PARKEERLOCATIE]
DROP TABLE IF EXISTS[TRANSACTIE_GESCHIEDENIS]

CREATE TABLE [BESTUURDER] (
	Naam VARCHAR(10) PRIMARY KEY
)

CREATE TABLE [AUTO] (
	Kenteken VARCHAR(10) PRIMARY KEY
,	FK_Naam VARCHAR(10) 
		FOREIGN KEY (FK_Naam) REFERENCES [BESTUURDER](Naam)
)

CREATE TABLE [PARKEERLOCATIE] (
	ParkeerSpot VARCHAR(10) PRIMARY KEY
,	Bezet BIT -- Is de parkeerspot bezet? (Y/N)
,	FK_Kenteken VARCHAR(10) 
		FOREIGN KEY (FK_Kenteken) REFERENCES [AUTO](Kenteken)
)

CREATE TABLE [TRANSACTIE_GESCHIEDENIS] (
	ID INT PRIMARY KEY
,	FK_Naam VARCHAR(10) 
		FOREIGN KEY (FK_Naam) REFERENCES [BESTUURDER](Naam)
,	FK_Kenteken VARCHAR(10) 
		FOREIGN KEY (FK_Kenteken) REFERENCES [AUTO](Kenteken)
,	CheckIn DATETIME
,	CheckOut DATETIME
,	Facturering DECIMAL(9,2)
)