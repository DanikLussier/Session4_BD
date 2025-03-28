
-- modifier la table Clients.Client pour ajouter une colonne SoldeTotal de type money



GO
-- Création de la fonction Clients.CalculerSoldeTotal 
--         qui prendra en paramètre l'id d'un Client
--         et qui retournera une donnée de type money qui sera la somme des soldes des comptes de ce client là




GO
-- Mettre à jour le SoldeTotal de chaque client en utilisant la fonction que vous venez de créer


-- Ajouter un trigger pour que dorénavant, à chaque fois qu'il y a un update sur le solde d'une Client
-- son SoldeTotal est recalculé en utilisant la fonction




