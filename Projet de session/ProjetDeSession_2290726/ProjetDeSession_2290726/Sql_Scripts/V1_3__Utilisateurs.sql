
CREATE TABLE Utilisateurs.Utilisateur(
	UtilisateurID int IDENTITY(1,1) NOT NULL,
	Pseudo nvarchar(50) NOT NULL,
	MdpHache varbinary(32) NOT NULL,
	MdpSel varbinary(16) NOT NULL,
	Pensee nvarchar(200) NOT NULL
	CONSTRAINT PK_Utilisateur_UtilisateurID PRIMARY KEY (UtilisateurID)
);
GO


CREATE PROCEDURE Utilisateurs.USP_CreerUtilisateur
	@Pseudo nvarchar(50),
	@Mdp nvarchar(100),
	@Pensee nvarchar(200)
AS
BEGIN

	DECLARE @MdpSel varbinary(16) = CRYPT_GEN_RANDOM(16);

	DECLARE @MdpEtSel nvarchar(116) = CONCAT(@Mdp, @MdpSel);

	DECLARE @MdpHachage varbinary(32) = HASHBYTES('SHA2_256', @MdpEtSel);

	INSERT INTO Utilisateurs.Utilisateur (Pseudo, MdpHache, MdpSel, Pensee)
	VALUES (@Pseudo, @MdpHachage, @MdpSel, @Pensee);
END
GO


CREATE PROCEDURE Utilisateurs.USP_ConnecterUtilisateur
	@Pseudo nvarchar(50),
	@MotDePasse nvarchar(50)
AS
BEGIN

	DECLARE @Sel varbinary(16);
	DECLARE @MdpHache varbinary(32);
	SELECT @Sel = MdpSel, @MdpHache = MdpHache
	FROM Utilisateurs.Utilisateur
	WHERE Pseudo = @Pseudo;

	IF HASHBYTES('SHA2_256', CONCAT(@MotDePasse, @Sel)) = @MdpHache
	BEGIN
		SELECT * FROM Utilisateurs.Utilisateur WHERE Pseudo = @Pseudo;
	END
	ELSE
	BEGIN
		SELECT TOP 0 * FROM Utilisateurs.Utilisateur;
	END
END
GO