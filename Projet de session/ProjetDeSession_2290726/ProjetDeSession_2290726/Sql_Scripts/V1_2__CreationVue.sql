
GO
CREATE VIEW CapsuleNespresso.vw_NBCapsulesParCollection
SELECT COL.Nom, CAP.CapsuleID AS [Nombre de capsules]
FROM CapsuleNespresso.Collection COL
INNER JOIN CapsuleNespresso.Capsule CAP
ON CAP.CollectionID = COL.CollectionID
GROUP BY COL.Nom