

CREATE VIEW Spectacles.VW_SpectaclesRepresentationSpectateurs
AS
SELECT S.SpectacleID, Nom, Debut, Fin, COUNT(DISTINCT(R.RepresentationID)) AS NbRepresentations, SUM(NbBillet) AS NbBilletsVendus, Prix
FROM Spectacles.Spectacle S
INNER JOIN Spectacles.Representation R ON R.SpectacleID = S.SpectacleID
INNER JOIN Spectacles.Billet B ON B.RepresentationID = R.RepresentationID
GROUP BY S.SpectacleID, Nom, Debut, Fin, Prix
