
GO
CREATE VIEW CapsuleNespresso.vw_NbCapsulesDuBresilParCollection AS
SELECT COL.CollectionID, COL.Nom, COUNT(CAP.CapsuleID) AS [Nombre de capsules du Brésil]
FROM CapsuleNespresso.Capsule CAP
INNER JOIN CapsuleNespresso.Collection COL
ON COL.CollectionID = CAP.CollectionID
INNER JOIN ProprieteCapsule.CapsulePays CP
ON CAP.CapsuleID = CP.CapsuleID
INNER JOIN ProprieteCapsule.Pays P
ON CP.PaysID = P.PaysID
WHERE P.Nom = 'Brésil'
GROUP BY COL.CollectionID, Col.Nom
GO