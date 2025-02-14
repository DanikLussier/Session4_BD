USE NespressoDB;
GO

INSERT INTO CapsuleNespresso.Collection (Nom, Description)
VALUES
    ('L�gendes du Sud', 'Inspir�e des vastes paysages du sud de la France, cette collection vous plonge dans un univers de saveurs solaires et m�diterran�ennes. Du caf� cr�meux et fruit� des Alpes du Sud, aux ar�mes terreux des caf�s cultiv�s sous le soleil de Provence, chaque gorg�e �voque une histoire du terroir.'),
    ('C�l�bration de l''�quateur', 'Une ode � la richesse des caf�s cultiv�s � haute altitude dans les montagnes �quatoriennes. Cette gamme offre des profils aromatiques complexes, alliant des notes de chocolat noir, de fruits exotiques et de fleurs fra�ches, pour un caf� � la fois riche et d�licat.'),
    ('Luxe du Jardin Botanique', 'Cette collection premium fusionne des caf�s d''exception avec des infusions florales et herbac�es, comme le jasmin, la lavande et la menthe. Chaque capsule est une exploration sensorielle des jardins botaniques du monde entier, un v�ritable voyage pour les amateurs de caf�s fins et parfum�s.'),
    ('Horizon de Minuit', 'La nuit tombe sur un caf� d''exception. Des saveurs intenses de caf� noir r�ti et des touches bois�es se m�lent � un subtil parfum de vanille et d''�pices. Parfait pour une d�gustation nocturne, cette collection �voque la tranquillit� des nuits �toil�es.'),
    ('Fables d''Asie', 'Cette collection tire son inspiration des rituels ancestraux du caf� en Asie. Combinant des ar�mes de noix de coco, de th� vert et de gingembre, elle vous invite � savourer des caf�s doux et exotiques, tout en vous transportant dans les traditions de l''Orient.'),
    ('Essence du N�pal', 'Au c�ur de l''Himalaya, ces capsules �voquent l''authenticit� des caf�s de montagne. Une infusion unique de saveurs bois�es et d''�pices douces, mari�es � des notes florales, pour une exp�rience mystique et apaisante.'),
    ('La Route des �pices', 'Un voyage sensoriel � travers les march�s d''�pices du monde. Chaque capsule vous propose une rencontre avec des ar�mes d''�pices rares, comme le safran, la cardamome et la cannelle, �quilibr�s par une base de caf� rond et cr�meux. Une exp�rience chaude et envo�tante.'),
    ('Vagues du Pacifique', 'Un m�lange marin et tropical, alliant les saveurs douces du caf� cultiv� pr�s des plages paradisiaques � des accents d''agrumes et de noix grill�es. C�est un caf� d''�t�, rafra�chissant et l�ger, qui �voque les douces vagues du Pacifique.'),
    ('Caf� Royale', 'Une collection royale, au parfum riche et raffin�. Combinant un caf� profond et velout� avec une touche de caramel, de fruits rouges et de noisettes, cette s�rie offre une exp�rience de d�gustation digne des plus grandes cours europ�ennes.'),
    ('Aventuriers de l''Amazonie', 'Cette collection audacieuse s''inspire des for�ts tropicales luxuriantes. Des caf�s robustes et intenses, m�lang�s avec des ar�mes de cacao et de fruits m�rs, vous plongent dans la beaut� sauvage de l�Amazonie. Un voyage de saveurs terreuses et vibrantes.');


INSERT INTO CapsuleNespresso.Capsule (Nom, DescriptionCourte, DescriptionLongue, DescriptionGout, DescriptionTorrefaction, Amertume, PrixUnite, CollectionID)
VALUES
    ('Caf� Soleil', 'Un caf� l�ger aux ar�mes floraux et fruit�s.', 'Le Caf� Soleil offre une exp�rience douce et d�licate, inspir�e des champs ensoleill�s de Provence. Il r�v�le des ar�mes subtils de fleurs blanches et de fruits frais, parfait pour une d�gustation matinale.', 'Ce caf� est l�ger avec des notes de fleurs blanches et de fruits frais. Un go�t raffin� et doux qui s�duit d�s la premi�re gorg�e.', 'Torrefaction l�g�re, pr�servant la fra�cheur et la douceur des ar�mes. Les grains sont l�g�rement grill�s pour une exp�rience �quilibr�e.', 3, 4.50, 1),
    ('For�t Noire', 'Un caf� intense aux ar�mes bois�s.', 'For�t Noire propose un caf� riche et puissant, inspir� des for�ts profondes et myst�rieuses. Ses ar�mes bois�s et terreux se marient � des touches d��pices, cr�ant une exp�rience � la fois chaleureuse et envo�tante.', 'Des saveurs robustes de bois et de terre, l�g�rement �pic�es, avec une touche de chocolat noir en arri�re-plan. Un go�t cors� qui ravira les amateurs d�intensit�.', 'Torrefaction forte qui accentue les saveurs bois�es et �pic�es, cr�ant une exp�rience profonde et audacieuse.', 8, 5.90, 2),
    ('�clat Tropical', 'Un caf� rafra�chissant avec des notes d�agrumes et de noix.', '�clat Tropical est un caf� aux ar�mes fruit�s, inspir� des fruits tropicaux. Il offre une belle vivacit� avec des notes d�agrumes, compl�t�es par des touches de noix l�g�rement grill�es.', 'Des saveurs d�agrumes �clatantes et une l�g�re touche de noix grill�es, apportant une sensation de fra�cheur. Un caf� qui �voque l��t�.', 'Torrefaction l�g�re � moyenne, permettant de pr�server les ar�mes fruit�s et frais tout en conservant une douceur agr�able.', 4, 3.80, 3),
    ('Chocolat Indien', 'Un caf� gourmand aux saveurs de chocolat et d��pices.', 'Chocolat Indien vous transporte en Inde avec ses ar�mes chaleureux et �pic�s. Ce caf� doux se distingue par ses notes de chocolat noir et d��pices douces, un d�lice pour les amateurs de caf�s sucr�s.', 'Un go�t doux et velout�, o� les notes de chocolat noir s�entrelacent avec des touches subtiles de cannelle et de cardamome. Un caf� �quilibr� et r�confortant.', 'Torrefaction moyenne, mettant en avant la douceur des ar�mes sans trop d�intensit�, permettant aux saveurs de chocolat et d��pices de se r�v�ler pleinement.', 5, 6.20, 4),
    ('Caf� Azur', 'Un caf� frais et l�ger aux notes marines.', 'Caf� Azur est un caf� frais qui �voque la mer avec ses ar�mes l�gers et marins. Sa douceur est compl�t�e par des touches d�agrumes, offrant une exp�rience rafra�chissante id�ale pour les moments de d�tente.', 'Des saveurs marines et salines, accompagn�es de l�g�res touches d�agrumes et d�une douce note florale. Un go�t raffin� et apaisant.', 'Torrefaction l�g�re pour pr�server la fra�cheur et les ar�mes d�licats, avec une l�g�re grillade pour apporter une touche de rondeur.', 2, 4.00, 5),
    ('Tentation Caramel', 'Un caf� gourmand et sucr� avec des notes de caramel.', 'Le caf� Tentation Caramel s�duit les amateurs de douceurs. Avec ses ar�mes cr�meux de caramel et de noisette, il offre une exp�rience onctueuse et sucr�e, id�ale pour un moment de r�confort.', 'Des saveurs sucr�es de caramel et de noisette, apportant un go�t cr�meux et gourmand, avec une douce rondeur qui ravira les papilles.', 'Torrefaction moyenne pour un �quilibre parfait entre douceur et richesse des ar�mes, avec une l�g�re caram�lisation des grains.', 4, 4.30, 6),
    ('Caf� Ristretto Noir', 'Un caf� intense aux saveurs torr�fi�es.', 'Caf� Ristretto Noir est un caf� � l�intensit� marqu�e, avec des ar�mes torr�fi�s et une pointe d�amertume. Il offre une exp�rience robuste et concentr�e pour les amateurs de caf� fort.', 'Un go�t puissant, avec des notes de caf� torr�fi� et une pointe d�amertume. La richesse du caf� est bien pr�sente, parfait pour un moment de pure intensit�.', 'Torrefaction forte qui d�veloppe des ar�mes de grill� et de br�l�, cr�ant un go�t robuste et audacieux.', 9, 5.50, 7),
    ('Douceur Vanill�e', 'Un caf� doux avec des notes sucr�es de vanille.', 'Douceur Vanill�e est un caf� d�licat qui allie les ar�mes doux et sucr�s de vanille � une base ronde et cr�meuse. Ce caf� l�ger est parfait pour une d�gustation apaisante � tout moment de la journ�e.', 'Un go�t doux et sucr�, o� la vanille est la star. Des touches de caramel viennent adoucir l�ensemble pour un caf� velout� et agr�able.', 'Torrefaction l�g�re � moyenne pour une pr�servation optimale des ar�mes doux et sucr�s, avec une l�g�re caram�lisation des grains.', 3, 4.20, 8),
    ('Espresso Royal', 'Un caf� intense et noble aux ar�mes puissants.', 'Espresso Royal est un caf� d�exception qui ravira les amateurs d�intensit�. Il offre des ar�mes puissants et riches, avec des touches de chocolat noir et de fruits secs. Un espresso digne des grandes occasions.', 'Des saveurs profondes de chocolat noir et de fruits secs, avec une belle amertume et une finition longue et agr�able.', 'Torrefaction forte, permettant d�accentuer la richesse des ar�mes tout en offrant une intensit� parfaite pour un espresso classique.', 7, 6.00, 9),
    ('M�lange Oriental', 'Un caf� doux et parfum� avec des touches �pic�es.', 'M�lange Oriental vous plonge dans l�univers des �pices et des ar�mes exotiques. Ce caf� est un v�ritable voyage sensoriel, avec des touches de cannelle et de cardamome qui le rendent unique.', 'Des saveurs d�licates de cannelle et de cardamome, accompagn�es d�une l�g�re douceur. Un caf� rond et parfum� pour une exp�rience apaisante.', 'Torrefaction moyenne, mettant en valeur les ar�mes �pic�s tout en conservant une belle douceur.', 4, 5.20, 10),
    ('Caf� de la Montagne', 'Un caf� rond aux ar�mes bois�s et l�g�rement fum�s.', 'Inspir� des montagnes escarp�es, ce caf� robuste allie des notes bois�es et fum�es � une intensit� mod�r�e. Il vous plonge dans un univers naturel et authentique.', 'Des saveurs bois�es et l�g�rement fum�es, �quilibr�es par des touches de fruits secs. Un caf� riche et r�confortant pour les amateurs d�intensit� mod�r�e.', 'Torrefaction moyenne � forte, qui d�veloppe des ar�mes bois�s tout en pr�servant une certaine rondeur.', 6, 4.80, 1),
    ('Myst�re Espresso', 'Un caf� myst�rieux aux saveurs riches et complexes.', 'Myst�re Espresso propose un caf� dense et riche, avec des ar�mes complexes qui �voluent � chaque gorg�e. Il allie des saveurs de chocolat, de fruits noirs et d��pices, offrant une exp�rience myst�rieuse et intrigante.', 'Un go�t complexe, entre chocolat noir, fruits noirs m�rs et �pices l�g�res. La richesse de ce caf� ne cesse d��voluer, un vrai myst�re � chaque gorg�e.', 'Torrefaction forte, d�veloppant une grande profondeur de saveurs et une belle intensit�, cr�ant un caf� dense et audacieux.', 8, 5.70, 2),
    ('Caf� Eden', 'Un caf� doux aux ar�mes floraux et fruit�s.', 'Caf� Eden vous transporte dans un jardin paradisiaque avec ses ar�mes floraux d�licats et ses touches de fruits frais. Ce caf� l�ger et doux est une invitation � la s�r�nit�.', 'Des saveurs douces de fleurs blanches et de fruits frais, accompagn�es d�une agr�able rondeur. Un go�t l�ger et d�licat qui apaise.', 'Torrefaction l�g�re pour pr�server la fra�cheur et les ar�mes floraux, cr�ant un caf� �quilibr� et doux.', 3, 4.10, 3),
    ('Caramel Pralin�', 'Un caf� doux et sucr� avec des notes de caramel et de noisette.', 'Caramel Pralin� combine les saveurs sucr�es de caramel et de pralin� avec une douceur de noisette, pour un caf� gourmand et r�confortant. Parfait pour les amateurs de caf�s sucr�s.', 'Un go�t sucr� de caramel et de pralin�, avec une belle rondeur apport�e par la noisette grill�e. Un caf� doux et onctueux.', 'Torrefaction moyenne, �quilibrant la douceur du caramel et de la noisette tout en d�veloppant des saveurs sucr�es et gourmandes.', 4, 4.50, 4),
    ('Caf� Majestueux', 'Un caf� riche et puissant avec des notes d��pices.', 'Caf� Majestueux est un caf� qui se distingue par son intensit� et ses ar�mes d��pices. Un caf� � la fois cors� et complexe, id�al pour les moments de d�gustation solennels.', 'Des saveurs �pic�es, notamment de cannelle et de clou de girofle, avec une base puissante de caf� grill�. Un go�t noble et intense.', 'Torrefaction forte qui met en valeur les ar�mes �pic�s et torr�fi�s, cr�ant une exp�rience riche et m�morable.', 9, 7.30, 5),
    ('M�lange Italien', 'Un caf� espresso classique avec des notes profondes et intenses.', 'Le M�lange Italien est un hommage � l�authentique espresso italien, avec des ar�mes profonds et une intensit� marqu�e. Il offre un go�t riche et �quilibr� pour une exp�rience espresso parfaite.', 'Des saveurs profondes de caf� grill� et de chocolat, avec une l�g�re amertume. Un go�t rond et �quilibr�, id�al pour un espresso classique.', 'Torrefaction forte, avec un m�lange �quilibr� de grains arabica et robusta, cr�ant une exp�rience espresso traditionnelle.', 7, 5.40, 6),
    ('Caf� �quatorial', 'Un caf� doux avec des notes exotiques.', 'Caf� �quatorial vous transporte dans les jungles tropicales avec ses ar�mes d�exotiques fruits et de fleurs fra�ches. Un caf� doux et fruit� pour une exp�rience unique.', 'Des saveurs fruit�es et florales, avec des touches de papaye et de fleurs tropicales. Un go�t doux et sucr� qui ravira les amateurs de caf�s frais.', 'Torrefaction l�g�re, pr�servant les ar�mes fruit�s et floraux pour une exp�rience douce et agr�able.', 3, 3.90, 7),
    ('Espresso Vitalit�', 'Un caf� intense avec des saveurs de chocolat et de fruits.', 'Espresso Vitalit� est un caf� audacieux qui combine des ar�mes de chocolat et de fruits m�rs. Un m�lange parfait pour un espresso plein de vitalit�.', 'Des saveurs profondes de chocolat noir et de fruits rouges, avec une pointe d�acidit� agr�able. Un caf� �nergisant et stimulant.', 'Torrefaction forte qui accentue l�intensit� du chocolat et des fruits, cr�ant un espresso riche et complexe.', 8, 5.10, 8),
	('Caf� Safari', 'Un caf� riche avec des ar�mes terreux et �pic�s.', 'Caf� Safari vous invite dans un voyage � travers les savanes africaines. Ce caf� offre une exp�rience sauvage et intense, avec des ar�mes terreux, �pic�s et une l�g�re touche de fruits secs, parfait pour les amateurs d�aventure.', 'Des saveurs terreuses avec des notes �pic�es de clou de girofle et de poivre, compl�t�es par une l�g�re douceur de fruits secs. Un go�t audacieux et sauvage.', 'Torrefaction forte qui d�veloppe les ar�mes terreux et �pic�s, cr�ant une exp�rience robuste et puissante.', 8, 5.90, 9),
    ('Nuit d''Hiver', 'Un caf� chaleureux avec des notes de chocolat chaud et de vanille.', 'Nuit d�Hiver est un caf� r�confortant, parfait pour les soir�es fra�ches. Il combine des saveurs douces de chocolat chaud et de vanille, cr�ant une atmosph�re chaleureuse et apaisante.', 'Des saveurs sucr�es de chocolat chaud et de vanille, �quilibr�es par une touche de noix grill�es. Un go�t doux et r�confortant qui �voque la chaleur d�un feu de chemin�e.', 'Torrefaction moyenne, permettant de d�velopper les saveurs sucr�es et velout�es tout en cr�ant une exp�rience douce et apaisante.', 3, 4.00, 10);



INSERT INTO ProprieteCapsule.TypeCafe (Nom, Description, QteML)
VALUES
	('Espresso', 'Un caf� court et intense, pr�par� en utilisant une petite quantit� d''eau chaude pour extraire les ar�mes concentr�s des grains.', 40),
    ('Lungo', 'Un caf� allong�, plus doux que l''espresso, pr�par� avec une quantit� d''eau plus importante pour une extraction plus longue.', 110),
    ('Ristretto', 'Un espresso plus court et plus concentr�, avec une extraction plus rapide et une intensit� plus �lev�e.', 25),
    ('Cappuccino', 'Un caf� espresso avec une mousse de lait chaude et cr�meuse, offrant un �quilibre parfait entre l''amertume du caf� et la douceur du lait.', 150),
    ('Latte', 'Un caf� espresso allong� avec une grande quantit� de lait chaud, cr�ant une boisson douce et cr�meuse.', 200);


INSERT INTO ProprieteCapsule.Pays (Nom, AnneeIntroductionCafe, HistoireCafe)
VALUES
	('Br�sil', 1727, 'Le Br�sil est le plus grand producteur de caf� au monde, et la culture du caf� est profond�ment enracin�e dans son histoire. Le caf� a �t� introduit au Br�sil au XVIIIe si�cle et est devenu un pilier de son �conomie. Aujourd''hui, le Br�sil produit principalement des caf�s arabica et robusta, r�put�s pour leur douceur et leur �quilibre.'),
    ('Colombie', 1730, 'Le caf� a �t� introduit en Colombie au d�but du XVIIIe si�cle et est devenu un symbole de l''identit� nationale. Le pays est connu pour ses caf�s de haute qualit�, particuli�rement les arabicas cultiv�s dans les montagnes. Le caf� repr�sente une part essentielle de l''�conomie colombienne, avec des millions de producteurs impliqu�s dans sa culture.'),
    ('�thiopie', 800, 'L''�thiopie est le berceau du caf�, o� la l�gende de sa d�couverte remonte � l''antiquit�. Le caf� y est cultiv� depuis des si�cles, et les vari�t�s �thiopiennes sont particuli�rement pris�es pour leurs ar�mes complexes et floraux. Le caf� est un �l�ment central de la culture �thiopienne, o� il occupe une place de choix lors des c�r�monies traditionnelles.'),
    ('Vietnam', 1857, 'Le Vietnam est l''un des plus grands producteurs mondiaux de caf�, principalement de robusta. Le caf� a �t� introduit par les colons fran�ais au milieu du XIXe si�cle et est rapidement devenu une culture cl� dans le pays. Aujourd''hui, le Vietnam est le deuxi�me plus grand producteur de caf� au monde.'),
    ('Costa Rica', 1779, 'Le Costa Rica est r�put� pour la qualit� de son caf� arabica, cultiv� principalement dans les montagnes de la vall�e centrale. Le caf� y a �t� introduit � la fin du XVIIIe si�cle et est devenu une exportation majeure d�s le XIXe si�cle. Le caf� est une part essentielle de la culture et de l''�conomie du pays.'),
    ('Guatemala', 1750, 'Le caf� a �t� introduit au Guatemala au milieu du XVIIIe si�cle et est devenu un produit d''exportation majeur au XIXe si�cle. Le pays est connu pour la qualit� de ses caf�s arabica, cultiv�s � des altitudes �lev�es. Le caf� guat�malt�que est souvent appr�ci� pour ses saveurs riches et sa complexit�.'),
    ('Mexique', 1790, 'Le caf� a �t� introduit au Mexique � la fin du XVIIIe si�cle et est rapidement devenu une culture importante dans les r�gions du Chiapas et de Veracruz. Le pays est un producteur majeur de caf� arabica et est connu pour ses caf�s bio et �quitables. Le caf� mexicain est une partie essentielle de son �conomie et de sa culture.'),
    ('Inde', 1670, 'Le caf� a �t� introduit en Inde au XVIIe si�cle par un commer�ant arabe. Aujourd''hui, l''Inde est l''un des principaux producteurs de caf� au monde, avec une forte production de robusta. Le pays est r�put� pour ses caf�s cultiv�s dans les r�gions de Karnataka, Kerala et Tamil Nadu.'),
    ('Honduras', 1790, 'Le caf� a �t� introduit au Honduras � la fin du XVIIIe si�cle, et le pays est aujourd''hui l''un des plus grands producteurs de caf� d''Am�rique centrale. Le caf� est une culture essentielle pour l''�conomie du pays, et les caf�s honduriens sont souvent appr�ci�s pour leur douceur et leurs saveurs fruit�es.'),
    ('Perou', 1750, 'Le caf� a �t� cultiv� pour la premi�re fois au P�rou au XVIIIe si�cle, et il est devenu un produit d''exportation majeur au XIXe si�cle. Aujourd''hui, le P�rou est l''un des plus grands producteurs de caf� bio et �quitable, appr�ci� pour ses saveurs douces et ses ar�mes floraux.'),
    ('Cuba', 1748, 'Le caf� a �t� introduit � Cuba au milieu du XVIIIe si�cle par des colons fran�ais. La culture du caf� a prosp�r� gr�ce � un climat id�al et � des terres fertiles. Le caf� cubain est reconnu pour sa richesse et son caract�re, avec des notes de chocolat et de fruits.'),
    ('Jama�que', 1728, 'La Jama�que est c�l�bre pour son caf� Blue Mountain, l''un des caf�s les plus recherch�s et les plus chers au monde. Introduit au d�but du XVIIIe si�cle, le caf� a rapidement prosp�r� sur les pentes montagneuses de l''�le, offrant un go�t doux et �quilibr�.'),
    ('Tanzanie', 1840, 'Le caf� a �t� introduit en Tanzanie au XIXe si�cle par les colons allemands. Aujourd''hui, la Tanzanie est un important producteur de caf� arabica, particuli�rement appr�ci� pour ses saveurs fruit�es et acidul�es. Le caf� est cultiv� dans les montagnes du Kilimandjaro et de l''Arusha.'),
    ('Rwanda', 1900, 'Le caf� a �t� cultiv� pour la premi�re fois au Rwanda au d�but du XXe si�cle, et il est aujourd''hui l''un des principaux produits d''exportation du pays. Les caf�s rwandais sont r�put�s pour leur douceur et leurs notes florales, cultiv�s dans les montagnes volcaniques.'),
    ('Kenya', 1893, 'Le caf� a �t� introduit au Kenya � la fin du XIXe si�cle et est devenu une culture majeure d�s le XXe si�cle. Le pays est r�put� pour ses caf�s arabica de haute qualit�, particuli�rement appr�ci�s pour leurs ar�mes complexes et leur acidit� vibrante.'),
    ('�quateur', 1700, 'Le caf� a �t� introduit en �quateur au XVIIIe si�cle, et la culture du caf� est rapidement devenue une partie essentielle de l''�conomie du pays. Aujourd''hui, l''�quateur produit des caf�s arabica de haute qualit�, souvent appr�ci�s pour leur douceur et leurs notes florales.'),
    ('Nicaragua', 1790, 'Le caf� a �t� introduit au Nicaragua � la fin du XVIIIe si�cle et est devenu une culture cl� du pays au XIXe si�cle. Le Nicaragua est connu pour ses caf�s doux, avec des notes de chocolat et de fruits, cultiv�s dans les montagnes du pays.'),
    ('Burundi', 1900, 'Le caf� a �t� cultiv� au Burundi au d�but du XXe si�cle et est devenu une culture essentielle pour l''�conomie. Le pays produit principalement de l''arabica, avec des saveurs douces et des notes florales. Le caf� est un pilier de l''exportation burundaise.'),
    ('Papouasie-Nouvelle-Guin�e', 1850, 'Le caf� a �t� introduit en Papouasie-Nouvelle-Guin�e au milieu du XIXe si�cle et est devenu une culture majeure au XXe si�cle. Le pays produit principalement de l''arabica, appr�ci� pour ses saveurs fruit�es et �pic�es.'),
    ('Philippines', 1740, 'Les Philippines sont l''un des plus anciens producteurs de caf� en Asie, avec une histoire qui remonte au XVIIIe si�cle. Le pays produit principalement du robusta, et le caf� est un �l�ment central de la culture et de l''�conomie locales.');


INSERT INTO ProprieteCapsule.CapsuleTypeCafe (CapsuleID, TypeCafeID)
VALUES
    (1, 1), -- Capsule 'Caf� D'exception' -> Espresso
	(1, 4), -- Capsule 'Caf� D'exception' -> Cappuccino
    (2, 1), -- Capsule 'Rituels Nocturnes' -> Espresso
	(2, 5), -- Capsule 'Rituels Nocturnes' -> Latte
    (3, 2), -- Capsule 'Caramel Fum�e' -> Lungo
    (4, 1), -- Capsule 'Caf� Safari' -> Espresso
    (5, 3), -- Capsule 'Aurore Bor�ale' -> Ristretto
    (6, 2), -- Capsule 'Pleine Lune' -> Lungo
	(6, 4), -- Capsule 'Pleine Lune' -> Cappuccino
    (7, 2), -- Capsule 'M�lange d'Or' -> Lungo
	(7, 5), -- Capsule 'M�lange d'Or' -> Latte
    (8, 4), -- Capsule 'Nuit d'Hiver' -> Cappuccino
    (9, 5), -- Capsule 'Mocha Surprise' -> Latte
	(9, 3), -- Capsule 'Mocha Surprise' -> Ristretto
    (10, 1), -- Capsule 'R�ve Sauvage' -> Espresso
    (11, 1), -- Capsule 'Explorateur Cr�ole' -> Espresso
    (12, 3), -- Capsule 'Caf� Blanc' -> Ristretto
    (13, 4), -- Capsule 'M�lange Intense' -> Cappuccino
    (14, 1), -- Capsule 'Douceur d'Amande' -> Espresso
    (15, 2), -- Capsule 'Caf� Ensoleill�' -> Lungo
    (16, 1), -- Capsule 'Jardin Exotique' -> Espresso
    (17, 3), -- Capsule 'Caf� Indien' -> Ristretto
    (18, 4), -- Capsule 'Caf� Royal' -> Cappuccino
    (19, 2), -- Capsule '�toile d'Orient' -> Lungo
    (20, 5); -- Capsule 'Nuit d'Hiver' -> Latte


INSERT INTO ProprieteCapsule.CapsulePays (CapsuleID, PaysID)
VALUES
	(1, 1),  -- Caf� Soleil - Br�sil
    (1, 2),  -- Caf� Soleil - France
    (1, 3),  -- Caf� Soleil - Colombie
    (1, 4),  -- Caf� Soleil - Costa Rica
    (2, 5),  -- For�t Noire - Mexique
    (2, 6),  -- For�t Noire - Guatemala
    (2, 7),  -- For�t Noire - P�rou
    (3, 8),  -- �clat Tropical - �tats-Unis
    (3, 9),  -- �clat Tropical - Japon
    (3, 10), -- �clat Tropical - Italie
    (3, 11), -- �clat Tropical - Afrique du Sud
    (4, 12), -- Chocolat Indien - Argentine
    (4, 13), -- Chocolat Indien - Kenya
    (4, 14), -- Chocolat Indien - Papouasie-Nouvelle-Guin�e
    (5, 15), -- Caf� Azur - Colombie
    (5, 16), -- Caf� Azur - Chine
    (5, 17), -- Caf� Azur - S�n�gal
    (6, 18), -- Tentation Caramel - Costa Rica
    (6, 19), -- Tentation Caramel - Rwanda
    (6, 20), -- Tentation Caramel - Honduras
    (7, 1),  -- Caf� Ristretto Noir - Br�sil
    (7, 2),  -- Caf� Ristretto Noir - France
    (7, 3),  -- Caf� Ristretto Noir - Colombie
    (8, 4),  -- Douceur Vanill�e - Costa Rica
    (8, 5),  -- Douceur Vanill�e - Mexique
    (8, 6),  -- Douceur Vanill�e - Guatemala
    (9, 7),  -- Espresso Royal - P�rou
    (9, 8),  -- Espresso Royal - �tats-Unis
    (9, 9),  -- Espresso Royal - Italie
    (10, 10), -- M�lange Oriental - Japon
    (10, 11), -- M�lange Oriental - Afrique du Sud
    (10, 12), -- M�lange Oriental - Argentine
    (11, 13), -- Caf� de la Montagne - Kenya
    (11, 14), -- Caf� de la Montagne - Papouasie-Nouvelle-Guin�e
    (11, 15), -- Caf� de la Montagne - P�rou
    (12, 16), -- Myst�re Espresso - Chine
    (12, 17), -- Myst�re Espresso - S�n�gal
    (12, 18), -- Myst�re Espresso - Costa Rica
    (13, 19), -- Caf� Eden - Rwanda
    (13, 20), -- Caf� Eden - Honduras
    (13, 1),  -- Caf� Eden - Br�sil
    (14, 2),  -- Caramel Pralin� - France
    (14, 3),  -- Caramel Pralin� - Colombie
    (14, 4),  -- Caramel Pralin� - Costa Rica
    (15, 5),  -- Caf� Majestueux - Mexique
    (15, 6),  -- Caf� Majestueux - Guatemala
    (15, 7),  -- Caf� Majestueux - P�rou
    (16, 8),  -- M�lange Italien - �tats-Unis
    (16, 9),  -- M�lange Italien - Japon
    (16, 10), -- M�lange Italien - Italie
    (17, 11), -- Caf� Safari - Afrique du Sud
    (17, 12), -- Caf� Safari - Argentine
    (17, 13), -- Caf� Safari - Kenya
    (18, 14), -- Nuit d'Hiver - Papouasie-Nouvelle-Guin�e
	(19, 15),
	(20, 16);


INSERT INTO ProprieteCapsule.CafeNoir (CapsuleID, Intensite, Torrefaction, Acidite, Corps)
VALUES
	(1, 7, 6, 5, 8),
	(2, 4, 8, 3, 6),
	(3, 9, 7, 6, 7),
	(4, 5, 9, 4, 9),
	(5, 3, 6, 8, 7),
	(7, 8, 5, 7, 6),
	(10, 6, 4, 9, 5),
	(11, 7, 3, 6, 4),
	(12, 5, 8, 7, 6),
	(14, 4, 9, 5, 9),
	(17, 9, 6, 6, 8),
	(18, 3, 7, 9, 7);




INSERT INTO ProprieteCapsule.CafeLait (CapsuleID, GoutLait, TextureCremeuse)
VALUES
	(6, 7, 6),
	(8, 4, 8),
	(9, 9, 7),
	(13, 5, 9),
	(15, 3, 6),
	(16, 8, 5),
	(19, 6, 4),
	(20, 7, 3);