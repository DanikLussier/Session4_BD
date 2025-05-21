-- CREATION DE LA TABLE AFFICHE
CREATE TABLE Spectacles.Affiche(
	AfficheID int IDENTITY(1,1) NOT NULL,
	Identifiant uniqueidentifier NOT NULL ROWGUIDCOL,
	SpectacleID int NOT NULL,
	CONSTRAINT PK_Affiche_AfficheID PRIMARY KEY (AfficheID)
)
GO

ALTER TABLE Spectacles.Affiche ADD CONSTRAINT UC_Affiche_Identifiant UNIQUE(Identifiant)
GO

ALTER TABLE Spectacles.Affiche ADD CONSTRAINT DF_Affiche_Identifiant DEFAULT newid() FOR Identifiant
GO

ALTER TABLE Spectacles.Affiche ADD AfficheContent varbinary(max) FILESTREAM NULL
GO

-- Insertion des images
INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 1, BulkColumn FROM OPENROWSET(
	BULK 'D:\Cegep\FC BD5\20240923 au 20241220 Gr6404\R12 Wrap-Up\Prof\SOLUTION\WrapUpBilleterie\Affiches\LaMelodieDuBonheur.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 2, BulkColumn FROM OPENROWSET(
	BULK 'D:\Cegep\FC BD5\20240923 au 20241220 Gr6404\R12 Wrap-Up\Prof\SOLUTION\WrapUpBilleterie\Affiches\Verdict.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 3, BulkColumn FROM OPENROWSET(
	BULK 'D:\Cegep\FC BD5\20240923 au 20241220 Gr6404\R12 Wrap-Up\Prof\SOLUTION\WrapUpBilleterie\Affiches\AndreEtDorine.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 4, BulkColumn FROM OPENROWSET(
	BULK 'D:\Cegep\FC BD5\20240923 au 20241220 Gr6404\R12 Wrap-Up\Prof\SOLUTION\WrapUpBilleterie\Affiches\LesDixCommandementsDeDorothéeDix.jfif', SINGLE_BLOB) AS myfile

INSERT INTO Spectacles.Affiche(SpectacleID,AfficheContent)
SELECT 5, BulkColumn FROM OPENROWSET(
	BULK 'D:\Cegep\FC BD5\20240923 au 20241220 Gr6404\R12 Wrap-Up\Prof\SOLUTION\WrapUpBilleterie\Affiches\LaMachineDeTuring.jfif', SINGLE_BLOB) AS myfile

