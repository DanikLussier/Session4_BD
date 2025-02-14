
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

