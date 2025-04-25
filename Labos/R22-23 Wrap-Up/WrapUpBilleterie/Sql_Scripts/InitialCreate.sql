USE master 
GO

-- CREATION ou RECREATION de la BD R22_Billeterie
-- le petit de création ou de recréation de la BD

CREATE DATABASE R22_Billeterie
GO
USE R22_Billeterie
GO

-- Configuration de FILESTREAM
-- nous avons vu ça lors de la rencontre 19
EXEC sp_configure filestream_access_level, 2 
GO
RECONFIGURE
GO

ALTER DATABASE R22_Billeterie ADD FILEGROUP FG_Images CONTAINS FILESTREAM;
GO
ALTER DATABASE R22_Billeterie ADD FILE (NAME = FG_Images, FILENAME = 'C:\EspaceLabo\FG_Images') TO FILEGROUP FG_Images
GO

-- Configuration des clés symétriques
-- il s'agit de créer la clé master, le certificat et enfin la clé symmétrique
USE R22_Billeterie
GO

-- Créer clée master
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Passw0rd!Passw0rd!';
GO
-- Vérifier clée master
SELECT * FROM sys.symmetric_keys;

-- Créer le certificat pour le chiffrement des cartes bancaire
CREATE CERTIFICATE CertificatCarteBancaire WITH SUBJECT = 'ChiffrementCarteBancaire'
GO
-- Vérifier l'existance du certificat
SELECT * FROM sys.certificates;

-- Créer les clés symmetriques
CREATE SYMMETRIC KEY CleChiffrementCarteBancaire WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE CertificatCarteBancaire;
GO

-- Vérifier l'existance des clés symmetriques
SELECT * FROM sys.symmetric_keys