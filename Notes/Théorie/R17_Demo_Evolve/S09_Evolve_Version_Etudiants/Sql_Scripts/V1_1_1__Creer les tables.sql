USE S09_Theorie
GO

CREATE TABLE Clients.Client(
	ClientID int IDENTITY NOT NULL,
	Prenom nvarchar(30) NOT NULL,
	Nom nvarchar(30) NOT NULL,
	CONSTRAINT PK_Client_ClientID PRIMARY KEY (ClientID)
)
GO
CREATE TABLE Comptes.Compte(
	CompteID int IDENTITY NOT NULL,
	NoCompte nvarchar(30) NOT NULL,
	Type nvarchar(30) NOT NULL,
	Solde money NOT NULL,
	ClientID int NOT NULL,
	CONSTRAINT PK_Compte_CompteID PRIMARY KEY (CompteID)
)
GO
ALTER TABLE Comptes.Compte
ADD CONSTRAINT FK_Compte_ClientID FOREIGN KEY (ClientID)
REFERENCES Clients.Client(ClientID)
GO
