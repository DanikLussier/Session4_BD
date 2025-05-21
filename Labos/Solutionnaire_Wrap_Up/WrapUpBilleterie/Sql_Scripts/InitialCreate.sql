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

EXEC sp_configure filestream_access_level, 2 RECONFIGURE

ALTER DATABASE R22_Billeterie
ADD FILEGROUP FG_Images CONTAINS FILESTREAM;
GO
ALTER DATABASE R22_Billeterie
ADD FILE (
	NAME = FG_Images,
	FILENAME = 'C:\EspaceLabo\FG_Images'
)
TO FILEGROUP FG_Images
GO

-- Configuration des clés symétriques
-- il s'agit de créer la clé master, le certificat et enfin la clé symmétrique


CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'CeciEst1GrosMotDePasse!'
GO
CREATE CERTIFICATE R22_Certificat WITH SUBJECT = 'ChiffrementDonneeCarteBancaire'
GO
CREATE SYMMETRIC KEY R22_Cle WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE R22_Certificat
GO

