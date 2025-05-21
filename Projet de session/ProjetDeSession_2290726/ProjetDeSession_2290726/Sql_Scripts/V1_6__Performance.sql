-- On crée un Index clustered sur le champ Amertume car on fait souvent la recherche de Capsules selon leur Nom
CREATE NONCLUSTERED INDEX IX_Capsule_Nom ON CapsuleNespresso.Capsule(Nom)

-- On crée un index NON-CLUTERED sur le champ Pseudo de Utilisateur car lors de la Connexion, 
-- on recherche l'Utilisateur par son Pseudo
CREATE NONCLUSTERED INDEX IX_Utilisateur_Pseudo ON Utilisateurs.Utilisateur(Pseudo)