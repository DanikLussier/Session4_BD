

-- Création de la table des moyens de paiments (des cartes de crédit)
CREATE TABLE Clients.CarteBancaire(
	CarteBancaireID INT IDENTITY(1,1) NOT NULL,
	Numero VARBINARY(MAX) NOT NULL,
	Echeance VARBINARY(MAX) NOT NULL,
	ClientID INT NOT NULL,
	CONSTRAINT PK_CarteBancaire_CarteBancaireID PRIMARY KEY (CarteBancaireID)
)
GO

-- Création d'une table pour exécuter la procédure de récupération des infos de paiement
CREATE TABLE Clients.CarteBancaireEnClair(
	Numero nvarchar(16) NOT NULL,
	Echeance nvarchar(5) NOT NULl
)

-- Contrainte de clé étrangère
ALTER TABLE Clients.CarteBancaire
ADD CONSTRAINT FK_CarteBancaire_ClientID FOREIGN KEY (ClientID) REFERENCES Clients.Client(ClientID)
ON DELETE CASCADE
GO

-- On définit une procédure pour ajouter un nouvelle carte bancaire dans la table
CREATE PROCEDURE Clients.USP_AjouterCarteBancaire(@Courriel nvarchar(256), @Numero nvarchar(16), @Echeance nchar(5))
AS
BEGIN
	-- On déclare qques variables
	DECLARE @ClientID int
	
	-- On récupère le ClientID
	SELECT @ClientID = ClientID FROM Clients.Client WHERE Courriel = @Courriel

	-- On chiffre les données
	OPEN SYMMETRIC KEY R22_Cle DECRYPTION BY CERTIFICATE R22_Certificat
		DECLARE @NumeroChiffre varbinary(max) = EncryptByKey(KEY_GUID('R22_Cle'), @Numero)
		DECLARE @EcheanceChiffre varbinary(max) = EncryptByKey(KEY_GUID('R22_Cle'), @Echeance)
	CLOSE SYMMETRIC KEY R22_Cle

	-- On insert
	INSERT INTO Clients.CarteBancaire(Numero, Echeance, ClientID)
	VALUES(@NumeroChiffre, @EcheanceChiffre, @ClientID)
END
GO

-- On définit une procédure pour récupérer les données de la carte bancaire
CREATE PROCEDURE Clients.USP_RecupererCarteBancaire(@ClientID int) 
AS
BEGIN
	OPEN SYMMETRIC KEY R22_Cle DECRYPTION BY CERTIFICATE R22_Certificat

		SELECT CONVERT(nvarchar(16), DECRYPTBYKEY(Numero)) AS Numero, CONVERT(nchar(5), DECRYPTBYKEY(Echeance)) AS Echeance 
		FROM Clients.CarteBancaire WHERE ClientID = @ClientID
	
	CLOSE SYMMETRIC KEY R22_Cle
END
GO

EXEC Clients.USP_AjouterCarteBancaire @Courriel='chantal.vallieres@montpetit.ca', @Numero='1234123412341234', @Echeance='09/25'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='chantal.vallieres@montpetit.ca', @Numero='1234123412341235', @Echeance='10/25'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='olivier.adam-larocque@montpetit.ca', @Numero='1234123412341236', @Echeance='03/26'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='laurence.bournival@montpetit.ca', @Numero='1234123412341239', @Echeance='02/29'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='david.chalifour@montpetit.ca', @Numero='1234123412341234', @Echeance='09/25'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='ameni.gagne@montpetit.ca', @Numero='1234643412341234', @Echeance='06/21'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='graham.milon@montpetit.ca', @Numero='1234123423341234', @Echeance='01/22'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='graham.milon@montpetit.ca', @Numero='1935743412341234', @Echeance='12/23'
EXEC Clients.USP_AjouterCarteBancaire @Courriel='bruno.proulx@montpetit.ca', @Numero='4321123412341234', @Echeance='11/27'
