
USE [4D5_R09_Labo];


-- █▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
-- █  Création de vues  █
-- █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█

		-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
		-- Vue #1 : On veut voir le TOP 10 des articles (nom, prix, quantité en stock) en ordre décroissant du nombre 
		--          de copies de l’article vendues dans le dernier mois puis en ordre décroissant de PrixRegulier.
		--
		--          Aussi, on ne veut voir ni les articles avec une quantité en stock supérieure à 
		--          100, ni les articles vendus 0 fois dans le dernier mois.
		-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

--VOTRE RÉPONSE:

GO
CREATE OR ALTER FUNCTION Articles.vw_NbArticlesVenduParArticleID
(@ArticleID int)
RETURNS int
AS
BEGIN
	RETURN (
	SELECT ISNULL(SUM(Qte), 0)
	FROM Commandes.ArticleCommande AC
	INNER JOIN Commandes.Commande C
	ON AC.CommandeID = C.CommandeID
	WHERE ArticleID = @ArticleID AND DATEDIFF(DAY, C.DatePassee, GETDATE()) <= 31
	)

END
GO


GO
CREATE OR ALTER VIEW Articles.vw_Top10 AS

SELECT TOP(10) Nom, PrixRegulier, QteStock, Articles.vw_NbArticlesVenduParArticleID(ArticleID) AS [NbCopiesVendues]
FROM Articles.Article
WHERE QteStock <= 100 AND Articles.vw_NbArticlesVenduParArticleID(ArticleID) > 0
ORDER BY Articles.vw_NbArticlesVenduParArticleID(ArticleID) DESC, PrixRegulier DESC

GO











		-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
		-- Faites un SELECT pour tester votre vue #1
		-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
		--Résultat attendu
		--Nom                                                PrixRegulier                            QteStock    NbCopiesVendues
		---------------------------------------------------- --------------------------------------- ----------- ---------------
		--iPad Super MacBook Pro Apple                       2999.99                                 42          88
		--Porte-bananes                                      9.99                                    8           37
		--Clé USB 32 GO USB USB 3.0 USB                      7.19                                    48          20
		--Tide Pods Super Wash Plus                          20.49                                   92          4
		--T-Shirt blanc Balenciaga                           549.29                                  37          3
		--Spirit Island boardgame                            109.99                                  3           1
		--Rick Astley album Whenever You Need Somebody       7.99                                    31          1

		--(7 lignes affectées)

--VOTRE RÉPONSE:

SELECT Nom, PrixRegulier, QteStock, NbCopiesVendues
FROM Articles.vw_Top10



		-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
		-- Vue #2 : Le top 10 des commandes non traitées en ordre croissant de date.
		--          On veut la date et l'id de la commande.
		--          On veut toutes les données de l'adresse de livraison.
		--          On veut l'ID, le prénom, le nom, le courriel et le numéro de téléphone de l'utilisateur.
		--          On veut également le nombre de produits différents de la commande.
		--
		--          Pas besoin de la liste des articles, une procédure stockée s'en occupera.
		-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

--VOTRE RÉPONSE:

GO
CREATE OR ALTER FUNCTION Commandes.ufn_NombreProduitsDifférentsParCommande
(@CommandeID int)
RETURNS int
AS
BEGIN
	RETURN (
		SELECT COUNT(ArticleCommandeID)
		FROM Commandes.ArticleCommande
		WHERE CommandeID = @CommandeID
	)
END
GO

GO
CREATE OR ALTER VIEW Commandes.vw_Top10CommandesNonTraites AS
	
	SELECT TOP(10) C.DatePassee AS [Date Commande], C.CommandeID, A.*, U.UtilisateurID AS [UtilisateurClientID], U.Prenom, U.Nom, U.Courriel, U.NoTel, 
		Commandes.ufn_NombreProduitsDifférentsParCommande(CommandeID) AS [Nombre d'articles]
	FROM Commandes.Commande C
	INNER JOIN Utilisateurs.Adresse A
	ON C.AdresseID = A.AdresseID
	INNER JOIN Utilisateurs.Utilisateur U
	ON C.UtilisateurID = U.UtilisateurID
	WHERE EstTraitee = 0
	ORDER BY C.DatePassee



GO








		-- ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
		-- Faites un SELECT pour tester votre vue #2
		-- ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀

		--Résultat attendu:
		--DateCommande            CommandeID  UtilisateurID Prenom    Nom      Courriel        NoCivique   NoAPT  Rue       Ville     Region Pays     CodePostal       NbArticlesDiff
		------------------------- ----------- ------------- --------- -------- --------------- ----------- ------ --------- --------- ------ -------- ---------------- --------------
		--2024-02-11 13:08:11.000 10          6             Omar      Ayad     oaoa@gmail.com  12          NULL   Gabonne   Lorraine  QC     Canada   J7G5F4           2
		--2024-02-17 11:11:11.000 11          6             Omar      Ayad     oaoa@gmail.com  12          NULL   Gabonne   Lorraine  QC     Canada   J7G5F4           1
		--2024-02-18 07:01:52.000 12          6             Omar      Ayad     oaoa@gmail.com  12          NULL   Gabonne   Lorraine  QC     Canada   J7G5F4           1

		--(3 lignes affectées)

--VOTRE RÉPONSE:

SELECT *
FROM Commandes.vw_Top10CommandesNonTraites

