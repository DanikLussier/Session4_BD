
-- Création de la BD Lab10

IF EXISTS(SELECT * FROM sys.databases WHERE name='S09_Labo')
BEGIN
    DROP DATABASE S09_Labo
END
CREATE DATABASE S09_Labo

