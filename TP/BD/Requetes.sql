USE NespressoDB
GO
-- Question 1 --

-- La requête doit montrer le nom de toutes les capsules appartenant aux collections ayant l'id 2 ou 5, triées en ordre alphabétique --

SELECT Nom AS [Noms des capsules appartenant à la collection #2 ou la collection #5]
FROM CapsuleNespresso.Capsule
WHERE CollectionID = 2 OR CollectionID = 5
ORDER BY Nom



-- Question 2 --

-- La requête doit montrer le nombre de pays appartenant à chaque capsule. On doit y voir le nom de la capsule et son nombre de pays associés. --

SELECT C.Nom, COUNT(CP.PaysID) AS [Nombre de pays]
FROM ProprieteCapsule.CapsulePays CP
INNER JOIN CapsuleNespresso.Capsule C
ON CP.CapsuleID = C.CapsuleID
GROUP BY C.Nom



-- Question 3 --

-- La requête doit montrer le nombre de pays appartenant à chaque capsule ayant moins de 4 pays. On doit y voir le nom de la capsule et son nombre de pays associés. --

SELECT C.Nom, COUNT(CP.PaysID) AS [Nombre de pays]
FROM ProprieteCapsule.CapsulePays CP
INNER JOIN CapsuleNespresso.Capsule C
ON CP.CapsuleID = C.CapsuleID
GROUP BY C.Nom
HAVING COUNT(CP.PaysID) < 4




-- Question 4 --

-- La requête doit retourner le nom des cafés noirs ayant le Brésil comme pays --

SELECT C.Nom
FROM ProprieteCapsule.CafeNoir CN
INNER JOIN CapsuleNespresso.Capsule C
ON CN.CapsuleID = C.CapsuleID
INNER JOIN ProprieteCapsule.CapsulePays CP
ON CP.CapsuleID = C.CapsuleID
INNER JOIN ProprieteCapsule.Pays P
ON P.PaysID = CP.PaysID
WHERE P.Nom = 'Brésil'
GROUP BY C.Nom



-- Question 5 --

-- La requête doit retourner le nom et l'année d'introduction du café des pays dont l'année d'introduction du café est inférieure à la moyenne des années d'introduction du café --

SELECT P.Nom [Pays dont l'année d'introduction du café est inférieure à la moyenne de tous les pays], P.AnneeIntroductionCafe AS [Année d'introduction du café]
FROM ProprieteCapsule.Pays P
WHERE AnneeIntroductionCafe < ( SELECT AVG(AnneeIntroductionCafe)
								FROM ProprieteCapsule.Pays)



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TP PARTIE 7-8 ------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------



GO
CREATE OR ALTER FUNCTION ProprieteCapsule.ufn_nombrePaysParCapsule
( @CapsuleID int)
RETURNS int
AS
BEGIN
	RETURN(
		SELECT COUNT(CP.CapsuleID)
		FROM ProprieteCapsule.CapsulePays CP
		WHERE CP.CapsuleID = @CapsuleID
	)

END
GO

GO
CREATE OR ALTER FUNCTION ProprieteCapsule.ufn_nombreTypeCafeParCapsule
( @CapsuleID int)
RETURNS int
AS
BEGIN
	RETURN(
		SELECT COUNT(CTC.CapsuleID)
		FROM ProprieteCapsule.CapsuleTypeCafe CTC
		WHERE CTC.CapsuleID = @CapsuleID
	)

END
GO


GO
CREATE VIEW CapsuleNespresso.vw_capsuleCollection AS

SELECT CA.CapsuleID, CO.CollectionID, CA.Nom AS [Capsule], CO.Nom AS [Collection], 
	ProprieteCapsule.ufn_nombrePaysParCapsule(CA.CapsuleID) AS [Nombre de Pays],
	ProprieteCapsule.ufn_nombreTypeCafeParCapsule(CA.CapsuleID) AS [Nombre de types de café]
FROM CapsuleNespresso.Capsule CA
INNER JOIN CapsuleNespresso.Collection CO
ON CA.CollectionID = CO.CollectionID

GO

------- Devrait Afficher 4 pays pour la capsule 3
SELECT ProprieteCapsule.ufn_nombrePaysParCapsule(3) AS [Nombre de pays]

------- Devrait Afficher 2 types de cafés pour la capsule 2
SELECT ProprieteCapsule.ufn_nombreTypeCafeParCapsule(2) AS [Nombre de types de capsule]

------- Utiliser la vue pour afficher les pays qui sont associés à 3 pays ou moins et a 2 types de café ou plus
SELECT Capsule, Collection, [Nombre de Pays], [Nombre de types de café]
FROM CapsuleNespresso.vw_capsuleCollection
WHERE [Nombre de Pays] <= 3 AND [Nombre de types de café] >= 2




-------- Procédure stockée qui permet d'ajouter une Collection
GO
CREATE OR ALTER PROCEDURE CapsuleNespresso.usp_AjoutNouvelleCollection
(
	@Nom nvarchar(50),
	@Description nvarchar(500)
)
AS
BEGIN
	INSERT INTO CapsuleNespresso.Collection
	(Nom, Description)
	VALUES
	(@Nom, @Description)

	SELECT *
	FROM CapsuleNespresso.Collection
	WHERE CollectionID = SCOPE_IDENTITY()
END
GO

-------- Ajouter une nouvelle Collection
EXEC CapsuleNespresso.usp_AjoutNouvelleCollection @Nom='Nouvelle Collection', @Description='Nouvelle collection pour tester la procédure stockée'



------- Création d'une procédure stockée qui prends un nom de pays en paramètre et retourne le nom des capsules associés et leur coût
GO
CREATE OR ALTER PROCEDURE CapsuleNespresso.usp_NomsEtCoutDesCapsulesAvecUnPays
(@NomPays nvarchar(50))
AS
BEGIN
	SELECT C.Nom, C.PrixUnite
	FROM ProprieteCapsule.Pays P
	INNER JOIN ProprieteCapsule.CapsulePays CP
	ON P.PaysID = CP.PaysID
	INNER JOIN CapsuleNespresso.Capsule C
	ON CP.CapsuleID = C.CapsuleID
	WHERE P.Nom = @NomPays

END
GO


------- Utilisation de la procédure pour voir toutes les capsules avec du café de Costa Rica
EXEC CapsuleNespresso.usp_NomsEtCoutDesCapsulesAvecUnPays @NomPays='Costa Rica'

------- Utilisation de la procédure pour voir toutes les capsules avec du café du Brésil
EXEC CapsuleNespresso.usp_NomsEtCoutDesCapsulesAvecUnPays @NomPays='Brésil'


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TP PARTIE 9 --------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

GO
CREATE TRIGGER CapsuleNespresso.Collection_dtrgSupprimerCollection
ON CapsuleNespresso.Collection
AFTER DELETE
AS
BEGIN
	DECLARE @CollectionID int;
	DECLARE @Nom nvarchar(50);
	DECLARE @Description nvarchar(500);

	SELECT @CollectionID=CollectionID, @Nom=Nom, @Description=Description
	FROM deleted

	INSERT INTO Archives.ArchiveCollection (CollectionID, Nom, Description, DateMAJ)
	VALUES (@CollectionID, @Nom, @Description, GETDATE())
END
GO

GO
CREATE TRIGGER CapsuleNespresso.Capsule_dtrgSupprimerCapsule
ON CapsuleNespresso.Capsule
AFTER DELETE
AS
BEGIN
	DECLARE @CapsuleID int;
	DECLARE @Nom nvarchar(50);
	DECLARE @DescriptionCourte nvarchar(300);
	DECLARE @DescriptionLongue nvarchar(1500);
	DECLARE @DescriptionGout nvarchar(1000);
	DECLARE @DescriptionTorrefaction nvarchar(1000);
	DECLARE @Amertume int;
	DECLARE @PrixUnite numeric(4,2);
	DECLARE @CollectionID int;

	SELECT 
		@CapsuleID = CapsuleID,
		@Nom = Nom,
		@DescriptionCourte = DescriptionCourte,
		@DescriptionLongue = DescriptionLongue,
		@DescriptionGout = DescriptionGout,
		@DescriptionTorrefaction = DescriptionTorrefaction,
		@Amertume = Amertume,
		@PrixUnite = PrixUnite,
		@CollectionID = CollectionID
	FROM deleted

	INSERT INTO Archives.ArchiveCapsule (CapsuleID, Nom, DescriptionCourte, DescriptionLongue, DescriptionGout, DescriptionTorrefaction, Amertume, PrixUnite, CollectionID, DateMAJ)
	VALUES (@CapsuleID, @Nom, @DescriptionCourte, @DescriptionLongue, @DescriptionGout, @DescriptionTorrefaction, @Amertume, @PrixUnite, @CollectionID, GETDATE())
END
GO


GO
CREATE TRIGGER ProprieteCapsule.CafeLait_dtrgSupprimerCafeLait
ON ProprieteCapsule.CafeLait
AFTER DELETE
AS
BEGIN
	DECLARE @CafeLaitID int;
	DECLARE @CapsuleID int;
	DECLARE @GoutLait int;
	DECLARE @TextureCremeuse int;

	SELECT 
		@CafeLaitID = CafeLaitID,
		@CapsuleID = CapsuleID,
		@GoutLait = GoutLait,
		@TextureCremeuse = TextureCremeuse
	FROM deleted

	INSERT INTO Archives.ArchiveCafeLait (CafeLaitID, CapsuleID, GoutLait, TextureCremeuse, DateMAJ)
	VALUES (@CafeLaitID, @CapsuleID, @GoutLait, @TextureCremeuse, GETDATE())
END
GO


GO
CREATE TRIGGER ProprieteCapsule.CafeNoir_dtrgSupprimerCafeLait
ON ProprieteCapsule.CafeNoir
AFTER DELETE
AS
BEGIN
	DECLARE @CafeNoirID int;
	DECLARE @CapsuleID int;
	DECLARE @Intensite int;
	DECLARE @Torrefaction int;
	DECLARE @Acidite int;
	DECLARE @Corps int;

	SELECT
		@CafeNoirID = CafeNoirID,
		@CapsuleID = CapsuleID,
		@Intensite = Intensite,
		@Torrefaction = Torrefaction,
		@Acidite = Acidite,
		@Corps = Corps
	FROM deleted

	INSERT INTO Archives.ArchiveCafeNoir (CafeNoirID, CapsuleID, Intensite, Torrefaction, Acidite, Corps, DateMAJ)
	VALUES (@CafeNoirID, @CapsuleID, @Intensite, @Torrefaction, @Acidite, @Corps, GETDATE())
END
GO


GO
CREATE TRIGGER ProprieteCapsule.CapsuleTypeCafe_dtrgSupprimerCapsuleTypeCafe
ON ProprieteCapsule.CapsuleTypeCafe
AFTER DELETE
AS
BEGIN
	DECLARE @CapsuleTypeCafeID int;
	DECLARE	@CapsuleID int;
	DECLARE @TypeCafeID int;

	SELECT 
		@CapsuleTypeCafeID = CapsuleTypeCafeID,
		@CapsuleID = CapsuleID,
		@TypeCafeID = TypeCafeID
	FROM deleted

	INSERT INTO Archives.ArchiveCapsuleTypeCafe (CapsuleTypeCafeID, CapsuleID, TypeCafeID, DateMAJ)
	VALUES (@CapsuleTypeCafeID, @CapsuleID, @TypeCafeID, GETDATE())
END
GO

GO
CREATE TRIGGER ProprieteCapsule.TypeCafe_dtrgSupprimerTypeCafe
ON ProprieteCapsule.TypeCafe
AFTER DELETE
AS
BEGIN
	DECLARE @TypeCafeID int;
	DECLARE	@Nom nvarchar(50);
	DECLARE @Description nvarchar(300);
	DECLARE @QteML int;

	SELECT 
		@TypeCafeID = TypeCafeID,
		@Nom = Nom,
		@Description = Description,
		@QteML = QteML
	FROM deleted

	INSERT INTO Archives.ArchiveTypeCafe (TypeCafeID, Nom, Description, QteML, DateMAJ)
	VALUES (@TypeCafeID, @Nom, @Description, @QteML, GETDATE())
END
GO


GO
CREATE TRIGGER ProprieteCapsule.CapsulePays_dtrgSupprimerCapsulePays
ON ProprieteCapsule.CapsulePays
AFTER DELETE
AS
BEGIN
	DECLARE @CapsulePaysID int;
	DECLARE	@CapsuleID int;
	DECLARE @PaysID int;

	SELECT 
		@CapsulePaysID = CapsulePaysID,
		@CapsuleID = CapsuleID,
		@PaysID = PaysID
	FROM deleted

	INSERT INTO Archives.ArchiveCapsulePays (CapsulePaysID, CapsuleID, PaysID, DateMAJ)
	VALUES (@CapsulePaysID, @CapsuleID, @PaysID, GETDATE())
END
GO

GO
CREATE TRIGGER ProprieteCapsule.Pays_dtrgSupprimerPays
ON ProprieteCapsule.Pays
AFTER DELETE
AS
BEGIN
	DECLARE @PaysID int;
	DECLARE @Nom nvarchar(50);
	DECLARE @AnneeIntroductionCafe int;
	DECLARE @HistoireCafe nvarchar(1000);

	SELECT 
		@PaysID = PaysID,
		@Nom = Nom,
		@AnneeIntroductionCafe = AnneeIntroductionCafe,
		@HistoireCafe = HistoireCafe
	FROM deleted

	INSERT INTO Archives.ArchivePays (PaysID, Nom, AnneeIntroductionCafe, HistoireCafe, DateMAJ)
	VALUES (@PaysID, @Nom, @AnneeIntroductionCafe, @HistoireCafe, GETDATE())
END
GO



-----------------------------------------------------------------------------------------------------------------------------------------------------
------ On test les "trigger" et les "on cascade delete" ---------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
GO
CREATE OR ALTER PROCEDURE Archives.usp_TestTriggerDelete
AS
BEGIN

	-- Ajout Collection
	INSERT INTO CapsuleNespresso.Collection
	(Nom, Description)
	VALUES
	('Collection Test', 'Petite description...')

	DECLARE @CollectionID int; 
	SELECT @CollectionID = SCOPE_IDENTITY()

	-- Ajout Capsule
	INSERT INTO CapsuleNespresso.Capsule
	(Nom, DescriptionCourte, DescriptionLongue, DescriptionGout, DescriptionTorrefaction, Amertume, PrixUnite, CollectionID)
	VALUES
	('Capsule Test', 'Courte Description...', 'Longue Description...', 'Description du Goût...', 'Description de la torréfaction...', 6, 0.97, @CollectionID)

	DECLARE @CapsuleID int;
	SELECT @CapsuleID = SCOPE_IDENTITY()

	-- Ajout Pays
	INSERT INTO ProprieteCapsule.Pays
	(Nom, AnneeIntroductionCafe, HistoireCafe)
	VALUES
	('Canada Test', 1734, 'Le café fût emmené sur les terres de la Nouvelle-France par une embarcation Française')

	DECLARE @PaysID int;
	SELECT @PaysID = SCOPE_IDENTITY()

	-- Ajout TypeCafe
	INSERT INTO ProprieteCapsule.TypeCafe
	(Nom, Description, QteML)
	VALUES
	('Mocha Test', 'Le parfait mélange entre l''amertume du café et la douceur du chocolat', 240)

	DECLARE @TypeCafeID int;
	SELECT @TypeCafeID = SCOPE_IDENTITY()

	-- Ajout CapsulePays
	INSERT INTO ProprieteCapsule.CapsulePays
	(CapsuleID, PaysID)
	VALUES
	(@CapsuleID, @PaysID)

	-- Ajout CapsuleTypeCafe
	INSERT INTO ProprieteCapsule.CapsuleTypeCafe
	(CapsuleID, TypeCafeID)
	VALUES
	(@CapsuleID, @TypeCafeID)

	-- Ajout CafeLait
	INSERT INTO ProprieteCapsule.CafeLait
	(CapsuleID, GoutLait, TextureCremeuse)
	VALUES
	(@CapsuleID, 9, 9)

	-- Ajout CafeNoir
	INSERT INTO ProprieteCapsule.CafeNoir
	(CapsuleID, Intensite, Torrefaction, Acidite, Corps)
	VALUES
	(@CapsuleID, 9, 9, 9, 9)



	-------------- Supprimer Les tables ----------------
	DELETE FROM ProprieteCapsule.Pays
	WHERE PaysID = @PaysID
	
	DELETE FROM ProprieteCapsule.TypeCafe
	WHERE TypeCafeID = @TypeCafeID

	DELETE FROM CapsuleNespresso.Collection
	WHERE CollectionID = @CollectionID

END
GO


------ Exécution du test -------
EXEC Archives.usp_TestTriggerDelete

SELECT * FROM Archives.ArchiveCollection
SELECT * FROM Archives.ArchiveCapsule
SELECT * FROM Archives.ArchivePays
SELECT * FROM Archives.ArchiveCapsulePays
SELECT * FROM Archives.ArchiveTypeCafe
SELECT * FROM Archives.ArchiveCapsuleTypeCafe
SELECT * FROM Archives.ArchiveCafeLait
SELECT * FROM Archives.ArchiveCafeNoir