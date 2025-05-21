
CREATE TABLE CapsuleNespresso.Compagnie(
	CompagnieID int IDENTITY NOT NULL,
	Nom nvarchar(100) NOT NULL,
	Identifiant uniqueidentifier NOT NULL ROWGUIDCOL,
	CONSTRAINT PK_Compagnie_CompagnieID PRIMARY KEY (CompagnieID)
)

ALTER TABLE CapsuleNespresso.Compagnie ADD CONSTRAINT UC_Compagnie_Identifiant
UNIQUE (Identifiant);
GO

ALTER TABLE CapsuleNespresso.Compagnie ADD CONSTRAINT DF_Compagnie_Identifiant
DEFAULT newid() FOR Identifiant;
GO

ALTER TABLE CapsuleNespresso.Compagnie ADD
Photo varbinary(max) FILESTREAM NULL;
