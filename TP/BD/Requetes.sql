
-- Question 1 --

-- La requ�te doit montrer le nom de toutes les capsules appartenant aux collections ayant l'id 2 ou 5, tri�es en ordre alphab�tique --

SELECT Nom AS [Noms des capsules appartenant � la collection #2 ou la collection #5]
FROM CapsuleNespresso.Capsule
WHERE CollectionID = 2 OR CollectionID = 5
ORDER BY Nom



-- Question 2 --

-- La requ�te doit montrer le nombre de pays appartenant � chaque capsule. On doit y voir le nom de la capsule et son nombre de pays associ�s. --

SELECT C.Nom, COUNT(CP.PaysID) AS [Nombre de pays]
FROM ProprieteCapsule.CapsulePays CP
INNER JOIN CapsuleNespresso.Capsule C
ON CP.CapsuleID = C.CapsuleID
GROUP BY C.Nom



-- Question 3 --

-- La requ�te doit montrer le nombre de pays appartenant � chaque capsule ayant moins de 4 pays. On doit y voir le nom de la capsule et son nombre de pays associ�s. --

SELECT C.Nom, COUNT(CP.PaysID) AS [Nombre de pays]
FROM ProprieteCapsule.CapsulePays CP
INNER JOIN CapsuleNespresso.Capsule C
ON CP.CapsuleID = C.CapsuleID
GROUP BY C.Nom
HAVING COUNT(CP.PaysID) < 4




-- Question 4 --

-- La requ�te doit retourner le nom des caf�s noirs ayant le Br�sil comme pays --

SELECT C.Nom
FROM ProprieteCapsule.CafeNoir CN
INNER JOIN CapsuleNespresso.Capsule C
ON CN.CapsuleID = C.CapsuleID
INNER JOIN ProprieteCapsule.CapsulePays CP
ON CP.CapsuleID = C.CapsuleID
INNER JOIN ProprieteCapsule.Pays P
ON P.PaysID = CP.PaysID
WHERE P.Nom = 'Br�sil'
GROUP BY C.Nom



-- Question 5 --

-- La requ�te doit retourner le nom et l'ann�e d'introduction du caf� des pays dont l'ann�e d'introduction du caf� est inf�rieure � la moyenne des ann�es d'introduction du caf� --

SELECT P.Nom [Pays dont l'ann�e d'introduction du caf� est inf�rieure � la moyenne de tous les pays], P.AnneeIntroductionCafe AS [Ann�e d'introduction du caf�]
FROM ProprieteCapsule.Pays P
WHERE AnneeIntroductionCafe < ( SELECT AVG(AnneeIntroductionCafe)
								FROM ProprieteCapsule.Pays)

