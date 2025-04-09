CREATE NONCLUSTERED INDEX IX_Etudiant_Prenom_Nom ON Etudiants.Etudiant(Prenom, Nom);
GO

CREATE NONCLUSTERED INDEX IX_EtudiantFruit_EtudiantID_FruitID ON Fruits.EtudiantFruit(EtudiantID, FruitID);
GO
