
	-- Table d'utilisateurs
	
	CREATE TABLE Utilisateurs.Utilisateur(
		UtilisateurID int IDENTITY(1,1),
		Pseudo nvarchar(50) NOT NULL,
		MotDePasseHache varbinary(32) NOT NULL,
		Sel varbinary(16) NOT NULL,
		CouleurPrefere varbinary(max) NOT NULL,
		CONSTRAINT PK_Utilisateur_UtilisateurID PRIMARY KEY (UtilisateurID)
	);
	GO
	
	-- Contraintes
	
	ALTER TABLE Utilisateurs.Utilisateur ADD CONSTRAINT
	UC_Utilisateur_Pseudo UNIQUE (Pseudo);
	GO
	
	-- Créer une clé maîtresse avec un mot de passe
	CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Passw0rd!Passw0rd!'
	GO

	SELECT * FROM sys.symmetric_keys;
	GO

	-- Créer un certificat auto-signé
	CREATE CERTIFICATE CertificatCouleur WITH SUBJECT = 'ChiffrementCouleur';
	GO

	SELECT * FROM sys.certificates
	GO

	-- Créer une clé symétrique
	CREATE SYMMETRIC KEY CleChiffrementCouleur WITH ALGORITHM = AES_256 ENCRYPTION BY CERTIFICATE CertificatCouleur;
	GO

	SELECT * FROM sys.symmetric_keys; 
	GO

	-- Procédure inscription (Création d'un utilisateur) À MODIFIER / COMPLÉTÉ
	CREATE PROCEDURE Utilisateurs.USP_CreerUtilisateur
		@Pseudo nvarchar(50),
		@MotDePasse nvarchar(50),
		@Couleur nvarchar(30)
	AS
	BEGIN
	
		DECLARE @Sel varbinary(16) = CRYPT_GEN_RANDOM(16);

		DECLARE @MdpEtSel nvarchar(116) = CONCAT(@MotDePasse, @Sel);

		DECLARE @MdpHachage varbinary(32) = HASHBYTES('SHA2_256', @MdpEtSel);

		-- Chiffrement Couleur
		OPEN SYMMETRIC KEY CleChiffrementCouleur
		DECRYPTION BY CERTIFICATE CertificatCouleur;

		DECLARE @CouleurChiffree varbinary(max) = EncryptByKey(KEY_GUID('CleChiffrementCouleur'), @Couleur);

		CLOSE SYMMETRIC KEY CleChiffrementCouleur;
		
		INSERT INTO Utilisateurs.Utilisateur (Pseudo, MotDePasseHache, Sel, CouleurPrefere)
		VALUES
		(@Pseudo, @MdpHachage, @Sel, @CouleurChiffree);
	
	END
	GO
	
	-- Procédure authentification À MODIFIER / COMPLÉTÉ
	
	CREATE PROCEDURE Utilisateurs.USP_AuthUtilisateur
		@Pseudo nvarchar(50),
		@MotDePasse nvarchar(50)
	AS
	BEGIN

		DECLARE @Sel varbinary(16);
		DECLARE @MdpHache varbinary(32);

		SELECT @MdpHache = MotDePasseHache, @Sel = Sel
		FROM Utilisateurs.Utilisateur
		WHERE Pseudo = @Pseudo;

		IF HASHBYTES('SHA2_256', CONCAT(@MotDePasse, @Sel)) = @MdpHache
		BEGIN
			OPEN SYMMETRIC KEY CleChiffrementCouleur DECRYPTION BY CERTIFICATE CertificatCouleur;

			-- Select déchiffre la Couleur
			SELECT
			CONVERT(nvarchar(30), DecryptByKey(CouleurPrefere))
			AS [Couleur Préférée]
			FROM Utilisateurs.Utilisateur
			WHERE Pseudo = @Pseudo;

			CLOSE SYMMETRIC KEY CleChiffrementCouleur;
		END
		ELSE
		BEGIN
			SELECT TOP 0 * FROM Utilisateurs.Utilisateur
		END
		

	
	
	END
	GO
	
	-- Insertions de quelques utilisateurs (si jamais inscription ne marche pas, testez au moins la connexion / déconnexion)
	
	EXEC Utilisateurs.USP_CreerUtilisateur @Pseudo = 'max', @MotDePasse = 'Salut1!', @Couleur = 'indigo';
	GO
	
	EXEC Utilisateurs.USP_CreerUtilisateur @Pseudo = 'chantal', @MotDePasse = 'Allo2!', @Couleur = 'bourgogne';
	GO
	
	EXEC Utilisateurs.USP_CreerUtilisateur @Pseudo = 'kamalPro', @MotDePasse = 'Bonjour3!', @Couleur = 'cramoisi';
	GO
	
	
	
	
	
	