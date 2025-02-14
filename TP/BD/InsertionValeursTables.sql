USE NespressoDB;
GO

INSERT INTO CapsuleNespresso.Collection (Nom, Description)
VALUES
    ('Légendes du Sud', 'Inspirée des vastes paysages du sud de la France, cette collection vous plonge dans un univers de saveurs solaires et méditerranéennes. Du café crémeux et fruité des Alpes du Sud, aux arômes terreux des cafés cultivés sous le soleil de Provence, chaque gorgée évoque une histoire du terroir.'),
    ('Célébration de l''Équateur', 'Une ode à la richesse des cafés cultivés à haute altitude dans les montagnes équatoriennes. Cette gamme offre des profils aromatiques complexes, alliant des notes de chocolat noir, de fruits exotiques et de fleurs fraîches, pour un café à la fois riche et délicat.'),
    ('Luxe du Jardin Botanique', 'Cette collection premium fusionne des cafés d''exception avec des infusions florales et herbacées, comme le jasmin, la lavande et la menthe. Chaque capsule est une exploration sensorielle des jardins botaniques du monde entier, un véritable voyage pour les amateurs de cafés fins et parfumés.'),
    ('Horizon de Minuit', 'La nuit tombe sur un café d''exception. Des saveurs intenses de café noir rôti et des touches boisées se mêlent à un subtil parfum de vanille et d''épices. Parfait pour une dégustation nocturne, cette collection évoque la tranquillité des nuits étoilées.'),
    ('Fables d''Asie', 'Cette collection tire son inspiration des rituels ancestraux du café en Asie. Combinant des arômes de noix de coco, de thé vert et de gingembre, elle vous invite à savourer des cafés doux et exotiques, tout en vous transportant dans les traditions de l''Orient.'),
    ('Essence du Népal', 'Au cœur de l''Himalaya, ces capsules évoquent l''authenticité des cafés de montagne. Une infusion unique de saveurs boisées et d''épices douces, mariées à des notes florales, pour une expérience mystique et apaisante.'),
    ('La Route des Épices', 'Un voyage sensoriel à travers les marchés d''épices du monde. Chaque capsule vous propose une rencontre avec des arômes d''épices rares, comme le safran, la cardamome et la cannelle, équilibrés par une base de café rond et crémeux. Une expérience chaude et envoûtante.'),
    ('Vagues du Pacifique', 'Un mélange marin et tropical, alliant les saveurs douces du café cultivé près des plages paradisiaques à des accents d''agrumes et de noix grillées. C’est un café d''été, rafraîchissant et léger, qui évoque les douces vagues du Pacifique.'),
    ('Café Royale', 'Une collection royale, au parfum riche et raffiné. Combinant un café profond et velouté avec une touche de caramel, de fruits rouges et de noisettes, cette série offre une expérience de dégustation digne des plus grandes cours européennes.'),
    ('Aventuriers de l''Amazonie', 'Cette collection audacieuse s''inspire des forêts tropicales luxuriantes. Des cafés robustes et intenses, mélangés avec des arômes de cacao et de fruits mûrs, vous plongent dans la beauté sauvage de l’Amazonie. Un voyage de saveurs terreuses et vibrantes.');


INSERT INTO CapsuleNespresso.Capsule (Nom, DescriptionCourte, DescriptionLongue, DescriptionGout, DescriptionTorrefaction, Amertume, PrixUnite, CollectionID)
VALUES
    ('Café Soleil', 'Un café léger aux arômes floraux et fruités.', 'Le Café Soleil offre une expérience douce et délicate, inspirée des champs ensoleillés de Provence. Il révèle des arômes subtils de fleurs blanches et de fruits frais, parfait pour une dégustation matinale.', 'Ce café est léger avec des notes de fleurs blanches et de fruits frais. Un goût raffiné et doux qui séduit dès la première gorgée.', 'Torrefaction légère, préservant la fraîcheur et la douceur des arômes. Les grains sont légèrement grillés pour une expérience équilibrée.', 3, 4.50, 1),
    ('Forêt Noire', 'Un café intense aux arômes boisés.', 'Forêt Noire propose un café riche et puissant, inspiré des forêts profondes et mystérieuses. Ses arômes boisés et terreux se marient à des touches d’épices, créant une expérience à la fois chaleureuse et envoûtante.', 'Des saveurs robustes de bois et de terre, légèrement épicées, avec une touche de chocolat noir en arrière-plan. Un goût corsé qui ravira les amateurs d’intensité.', 'Torrefaction forte qui accentue les saveurs boisées et épicées, créant une expérience profonde et audacieuse.', 8, 5.90, 2),
    ('Éclat Tropical', 'Un café rafraîchissant avec des notes d’agrumes et de noix.', 'Éclat Tropical est un café aux arômes fruités, inspiré des fruits tropicaux. Il offre une belle vivacité avec des notes d’agrumes, complétées par des touches de noix légèrement grillées.', 'Des saveurs d’agrumes éclatantes et une légère touche de noix grillées, apportant une sensation de fraîcheur. Un café qui évoque l’été.', 'Torrefaction légère à moyenne, permettant de préserver les arômes fruités et frais tout en conservant une douceur agréable.', 4, 3.80, 3),
    ('Chocolat Indien', 'Un café gourmand aux saveurs de chocolat et d’épices.', 'Chocolat Indien vous transporte en Inde avec ses arômes chaleureux et épicés. Ce café doux se distingue par ses notes de chocolat noir et d’épices douces, un délice pour les amateurs de cafés sucrés.', 'Un goût doux et velouté, où les notes de chocolat noir s’entrelacent avec des touches subtiles de cannelle et de cardamome. Un café équilibré et réconfortant.', 'Torrefaction moyenne, mettant en avant la douceur des arômes sans trop d’intensité, permettant aux saveurs de chocolat et d’épices de se révéler pleinement.', 5, 6.20, 4),
    ('Café Azur', 'Un café frais et léger aux notes marines.', 'Café Azur est un café frais qui évoque la mer avec ses arômes légers et marins. Sa douceur est complétée par des touches d’agrumes, offrant une expérience rafraîchissante idéale pour les moments de détente.', 'Des saveurs marines et salines, accompagnées de légères touches d’agrumes et d’une douce note florale. Un goût raffiné et apaisant.', 'Torrefaction légère pour préserver la fraîcheur et les arômes délicats, avec une légère grillade pour apporter une touche de rondeur.', 2, 4.00, 5),
    ('Tentation Caramel', 'Un café gourmand et sucré avec des notes de caramel.', 'Le café Tentation Caramel séduit les amateurs de douceurs. Avec ses arômes crémeux de caramel et de noisette, il offre une expérience onctueuse et sucrée, idéale pour un moment de réconfort.', 'Des saveurs sucrées de caramel et de noisette, apportant un goût crémeux et gourmand, avec une douce rondeur qui ravira les papilles.', 'Torrefaction moyenne pour un équilibre parfait entre douceur et richesse des arômes, avec une légère caramélisation des grains.', 4, 4.30, 6),
    ('Café Ristretto Noir', 'Un café intense aux saveurs torréfiées.', 'Café Ristretto Noir est un café à l’intensité marquée, avec des arômes torréfiés et une pointe d’amertume. Il offre une expérience robuste et concentrée pour les amateurs de café fort.', 'Un goût puissant, avec des notes de café torréfié et une pointe d’amertume. La richesse du café est bien présente, parfait pour un moment de pure intensité.', 'Torrefaction forte qui développe des arômes de grillé et de brûlé, créant un goût robuste et audacieux.', 9, 5.50, 7),
    ('Douceur Vanillée', 'Un café doux avec des notes sucrées de vanille.', 'Douceur Vanillée est un café délicat qui allie les arômes doux et sucrés de vanille à une base ronde et crémeuse. Ce café léger est parfait pour une dégustation apaisante à tout moment de la journée.', 'Un goût doux et sucré, où la vanille est la star. Des touches de caramel viennent adoucir l’ensemble pour un café velouté et agréable.', 'Torrefaction légère à moyenne pour une préservation optimale des arômes doux et sucrés, avec une légère caramélisation des grains.', 3, 4.20, 8),
    ('Espresso Royal', 'Un café intense et noble aux arômes puissants.', 'Espresso Royal est un café d’exception qui ravira les amateurs d’intensité. Il offre des arômes puissants et riches, avec des touches de chocolat noir et de fruits secs. Un espresso digne des grandes occasions.', 'Des saveurs profondes de chocolat noir et de fruits secs, avec une belle amertume et une finition longue et agréable.', 'Torrefaction forte, permettant d’accentuer la richesse des arômes tout en offrant une intensité parfaite pour un espresso classique.', 7, 6.00, 9),
    ('Mélange Oriental', 'Un café doux et parfumé avec des touches épicées.', 'Mélange Oriental vous plonge dans l’univers des épices et des arômes exotiques. Ce café est un véritable voyage sensoriel, avec des touches de cannelle et de cardamome qui le rendent unique.', 'Des saveurs délicates de cannelle et de cardamome, accompagnées d’une légère douceur. Un café rond et parfumé pour une expérience apaisante.', 'Torrefaction moyenne, mettant en valeur les arômes épicés tout en conservant une belle douceur.', 4, 5.20, 10),
    ('Café de la Montagne', 'Un café rond aux arômes boisés et légèrement fumés.', 'Inspiré des montagnes escarpées, ce café robuste allie des notes boisées et fumées à une intensité modérée. Il vous plonge dans un univers naturel et authentique.', 'Des saveurs boisées et légèrement fumées, équilibrées par des touches de fruits secs. Un café riche et réconfortant pour les amateurs d’intensité modérée.', 'Torrefaction moyenne à forte, qui développe des arômes boisés tout en préservant une certaine rondeur.', 6, 4.80, 1),
    ('Mystère Espresso', 'Un café mystérieux aux saveurs riches et complexes.', 'Mystère Espresso propose un café dense et riche, avec des arômes complexes qui évoluent à chaque gorgée. Il allie des saveurs de chocolat, de fruits noirs et d’épices, offrant une expérience mystérieuse et intrigante.', 'Un goût complexe, entre chocolat noir, fruits noirs mûrs et épices légères. La richesse de ce café ne cesse d’évoluer, un vrai mystère à chaque gorgée.', 'Torrefaction forte, développant une grande profondeur de saveurs et une belle intensité, créant un café dense et audacieux.', 8, 5.70, 2),
    ('Café Eden', 'Un café doux aux arômes floraux et fruités.', 'Café Eden vous transporte dans un jardin paradisiaque avec ses arômes floraux délicats et ses touches de fruits frais. Ce café léger et doux est une invitation à la sérénité.', 'Des saveurs douces de fleurs blanches et de fruits frais, accompagnées d’une agréable rondeur. Un goût léger et délicat qui apaise.', 'Torrefaction légère pour préserver la fraîcheur et les arômes floraux, créant un café équilibré et doux.', 3, 4.10, 3),
    ('Caramel Praliné', 'Un café doux et sucré avec des notes de caramel et de noisette.', 'Caramel Praliné combine les saveurs sucrées de caramel et de praliné avec une douceur de noisette, pour un café gourmand et réconfortant. Parfait pour les amateurs de cafés sucrés.', 'Un goût sucré de caramel et de praliné, avec une belle rondeur apportée par la noisette grillée. Un café doux et onctueux.', 'Torrefaction moyenne, équilibrant la douceur du caramel et de la noisette tout en développant des saveurs sucrées et gourmandes.', 4, 4.50, 4),
    ('Café Majestueux', 'Un café riche et puissant avec des notes d’épices.', 'Café Majestueux est un café qui se distingue par son intensité et ses arômes d’épices. Un café à la fois corsé et complexe, idéal pour les moments de dégustation solennels.', 'Des saveurs épicées, notamment de cannelle et de clou de girofle, avec une base puissante de café grillé. Un goût noble et intense.', 'Torrefaction forte qui met en valeur les arômes épicés et torréfiés, créant une expérience riche et mémorable.', 9, 7.30, 5),
    ('Mélange Italien', 'Un café espresso classique avec des notes profondes et intenses.', 'Le Mélange Italien est un hommage à l’authentique espresso italien, avec des arômes profonds et une intensité marquée. Il offre un goût riche et équilibré pour une expérience espresso parfaite.', 'Des saveurs profondes de café grillé et de chocolat, avec une légère amertume. Un goût rond et équilibré, idéal pour un espresso classique.', 'Torrefaction forte, avec un mélange équilibré de grains arabica et robusta, créant une expérience espresso traditionnelle.', 7, 5.40, 6),
    ('Café Équatorial', 'Un café doux avec des notes exotiques.', 'Café Équatorial vous transporte dans les jungles tropicales avec ses arômes d’exotiques fruits et de fleurs fraîches. Un café doux et fruité pour une expérience unique.', 'Des saveurs fruitées et florales, avec des touches de papaye et de fleurs tropicales. Un goût doux et sucré qui ravira les amateurs de cafés frais.', 'Torrefaction légère, préservant les arômes fruités et floraux pour une expérience douce et agréable.', 3, 3.90, 7),
    ('Espresso Vitalité', 'Un café intense avec des saveurs de chocolat et de fruits.', 'Espresso Vitalité est un café audacieux qui combine des arômes de chocolat et de fruits mûrs. Un mélange parfait pour un espresso plein de vitalité.', 'Des saveurs profondes de chocolat noir et de fruits rouges, avec une pointe d’acidité agréable. Un café énergisant et stimulant.', 'Torrefaction forte qui accentue l’intensité du chocolat et des fruits, créant un espresso riche et complexe.', 8, 5.10, 8),
	('Café Safari', 'Un café riche avec des arômes terreux et épicés.', 'Café Safari vous invite dans un voyage à travers les savanes africaines. Ce café offre une expérience sauvage et intense, avec des arômes terreux, épicés et une légère touche de fruits secs, parfait pour les amateurs d’aventure.', 'Des saveurs terreuses avec des notes épicées de clou de girofle et de poivre, complétées par une légère douceur de fruits secs. Un goût audacieux et sauvage.', 'Torrefaction forte qui développe les arômes terreux et épicés, créant une expérience robuste et puissante.', 8, 5.90, 9),
    ('Nuit d''Hiver', 'Un café chaleureux avec des notes de chocolat chaud et de vanille.', 'Nuit d’Hiver est un café réconfortant, parfait pour les soirées fraîches. Il combine des saveurs douces de chocolat chaud et de vanille, créant une atmosphère chaleureuse et apaisante.', 'Des saveurs sucrées de chocolat chaud et de vanille, équilibrées par une touche de noix grillées. Un goût doux et réconfortant qui évoque la chaleur d’un feu de cheminée.', 'Torrefaction moyenne, permettant de développer les saveurs sucrées et veloutées tout en créant une expérience douce et apaisante.', 3, 4.00, 10);



INSERT INTO ProprieteCapsule.TypeCafe (Nom, Description, QteML)
VALUES
	('Espresso', 'Un café court et intense, préparé en utilisant une petite quantité d''eau chaude pour extraire les arômes concentrés des grains.', 40),
    ('Lungo', 'Un café allongé, plus doux que l''espresso, préparé avec une quantité d''eau plus importante pour une extraction plus longue.', 110),
    ('Ristretto', 'Un espresso plus court et plus concentré, avec une extraction plus rapide et une intensité plus élevée.', 25),
    ('Cappuccino', 'Un café espresso avec une mousse de lait chaude et crémeuse, offrant un équilibre parfait entre l''amertume du café et la douceur du lait.', 150),
    ('Latte', 'Un café espresso allongé avec une grande quantité de lait chaud, créant une boisson douce et crémeuse.', 200);


INSERT INTO ProprieteCapsule.Pays (Nom, AnneeIntroductionCafe, HistoireCafe)
VALUES
	('Brésil', 1727, 'Le Brésil est le plus grand producteur de café au monde, et la culture du café est profondément enracinée dans son histoire. Le café a été introduit au Brésil au XVIIIe siècle et est devenu un pilier de son économie. Aujourd''hui, le Brésil produit principalement des cafés arabica et robusta, réputés pour leur douceur et leur équilibre.'),
    ('Colombie', 1730, 'Le café a été introduit en Colombie au début du XVIIIe siècle et est devenu un symbole de l''identité nationale. Le pays est connu pour ses cafés de haute qualité, particulièrement les arabicas cultivés dans les montagnes. Le café représente une part essentielle de l''économie colombienne, avec des millions de producteurs impliqués dans sa culture.'),
    ('Éthiopie', 800, 'L''Éthiopie est le berceau du café, où la légende de sa découverte remonte à l''antiquité. Le café y est cultivé depuis des siècles, et les variétés éthiopiennes sont particulièrement prisées pour leurs arômes complexes et floraux. Le café est un élément central de la culture éthiopienne, où il occupe une place de choix lors des cérémonies traditionnelles.'),
    ('Vietnam', 1857, 'Le Vietnam est l''un des plus grands producteurs mondiaux de café, principalement de robusta. Le café a été introduit par les colons français au milieu du XIXe siècle et est rapidement devenu une culture clé dans le pays. Aujourd''hui, le Vietnam est le deuxième plus grand producteur de café au monde.'),
    ('Costa Rica', 1779, 'Le Costa Rica est réputé pour la qualité de son café arabica, cultivé principalement dans les montagnes de la vallée centrale. Le café y a été introduit à la fin du XVIIIe siècle et est devenu une exportation majeure dès le XIXe siècle. Le café est une part essentielle de la culture et de l''économie du pays.'),
    ('Guatemala', 1750, 'Le café a été introduit au Guatemala au milieu du XVIIIe siècle et est devenu un produit d''exportation majeur au XIXe siècle. Le pays est connu pour la qualité de ses cafés arabica, cultivés à des altitudes élevées. Le café guatémaltèque est souvent apprécié pour ses saveurs riches et sa complexité.'),
    ('Mexique', 1790, 'Le café a été introduit au Mexique à la fin du XVIIIe siècle et est rapidement devenu une culture importante dans les régions du Chiapas et de Veracruz. Le pays est un producteur majeur de café arabica et est connu pour ses cafés bio et équitables. Le café mexicain est une partie essentielle de son économie et de sa culture.'),
    ('Inde', 1670, 'Le café a été introduit en Inde au XVIIe siècle par un commerçant arabe. Aujourd''hui, l''Inde est l''un des principaux producteurs de café au monde, avec une forte production de robusta. Le pays est réputé pour ses cafés cultivés dans les régions de Karnataka, Kerala et Tamil Nadu.'),
    ('Honduras', 1790, 'Le café a été introduit au Honduras à la fin du XVIIIe siècle, et le pays est aujourd''hui l''un des plus grands producteurs de café d''Amérique centrale. Le café est une culture essentielle pour l''économie du pays, et les cafés honduriens sont souvent appréciés pour leur douceur et leurs saveurs fruitées.'),
    ('Perou', 1750, 'Le café a été cultivé pour la première fois au Pérou au XVIIIe siècle, et il est devenu un produit d''exportation majeur au XIXe siècle. Aujourd''hui, le Pérou est l''un des plus grands producteurs de café bio et équitable, apprécié pour ses saveurs douces et ses arômes floraux.'),
    ('Cuba', 1748, 'Le café a été introduit à Cuba au milieu du XVIIIe siècle par des colons français. La culture du café a prospéré grâce à un climat idéal et à des terres fertiles. Le café cubain est reconnu pour sa richesse et son caractère, avec des notes de chocolat et de fruits.'),
    ('Jamaïque', 1728, 'La Jamaïque est célèbre pour son café Blue Mountain, l''un des cafés les plus recherchés et les plus chers au monde. Introduit au début du XVIIIe siècle, le café a rapidement prospéré sur les pentes montagneuses de l''île, offrant un goût doux et équilibré.'),
    ('Tanzanie', 1840, 'Le café a été introduit en Tanzanie au XIXe siècle par les colons allemands. Aujourd''hui, la Tanzanie est un important producteur de café arabica, particulièrement apprécié pour ses saveurs fruitées et acidulées. Le café est cultivé dans les montagnes du Kilimandjaro et de l''Arusha.'),
    ('Rwanda', 1900, 'Le café a été cultivé pour la première fois au Rwanda au début du XXe siècle, et il est aujourd''hui l''un des principaux produits d''exportation du pays. Les cafés rwandais sont réputés pour leur douceur et leurs notes florales, cultivés dans les montagnes volcaniques.'),
    ('Kenya', 1893, 'Le café a été introduit au Kenya à la fin du XIXe siècle et est devenu une culture majeure dès le XXe siècle. Le pays est réputé pour ses cafés arabica de haute qualité, particulièrement appréciés pour leurs arômes complexes et leur acidité vibrante.'),
    ('Équateur', 1700, 'Le café a été introduit en Équateur au XVIIIe siècle, et la culture du café est rapidement devenue une partie essentielle de l''économie du pays. Aujourd''hui, l''Équateur produit des cafés arabica de haute qualité, souvent appréciés pour leur douceur et leurs notes florales.'),
    ('Nicaragua', 1790, 'Le café a été introduit au Nicaragua à la fin du XVIIIe siècle et est devenu une culture clé du pays au XIXe siècle. Le Nicaragua est connu pour ses cafés doux, avec des notes de chocolat et de fruits, cultivés dans les montagnes du pays.'),
    ('Burundi', 1900, 'Le café a été cultivé au Burundi au début du XXe siècle et est devenu une culture essentielle pour l''économie. Le pays produit principalement de l''arabica, avec des saveurs douces et des notes florales. Le café est un pilier de l''exportation burundaise.'),
    ('Papouasie-Nouvelle-Guinée', 1850, 'Le café a été introduit en Papouasie-Nouvelle-Guinée au milieu du XIXe siècle et est devenu une culture majeure au XXe siècle. Le pays produit principalement de l''arabica, apprécié pour ses saveurs fruitées et épicées.'),
    ('Philippines', 1740, 'Les Philippines sont l''un des plus anciens producteurs de café en Asie, avec une histoire qui remonte au XVIIIe siècle. Le pays produit principalement du robusta, et le café est un élément central de la culture et de l''économie locales.');


INSERT INTO ProprieteCapsule.CapsuleTypeCafe (CapsuleID, TypeCafeID)
VALUES
    (1, 1), -- Capsule 'Café D'exception' -> Espresso
	(1, 4), -- Capsule 'Café D'exception' -> Cappuccino
    (2, 1), -- Capsule 'Rituels Nocturnes' -> Espresso
	(2, 5), -- Capsule 'Rituels Nocturnes' -> Latte
    (3, 2), -- Capsule 'Caramel Fumée' -> Lungo
    (4, 1), -- Capsule 'Café Safari' -> Espresso
    (5, 3), -- Capsule 'Aurore Boréale' -> Ristretto
    (6, 2), -- Capsule 'Pleine Lune' -> Lungo
	(6, 4), -- Capsule 'Pleine Lune' -> Cappuccino
    (7, 2), -- Capsule 'Mélange d'Or' -> Lungo
	(7, 5), -- Capsule 'Mélange d'Or' -> Latte
    (8, 4), -- Capsule 'Nuit d'Hiver' -> Cappuccino
    (9, 5), -- Capsule 'Mocha Surprise' -> Latte
	(9, 3), -- Capsule 'Mocha Surprise' -> Ristretto
    (10, 1), -- Capsule 'Rêve Sauvage' -> Espresso
    (11, 1), -- Capsule 'Explorateur Créole' -> Espresso
    (12, 3), -- Capsule 'Café Blanc' -> Ristretto
    (13, 4), -- Capsule 'Mélange Intense' -> Cappuccino
    (14, 1), -- Capsule 'Douceur d'Amande' -> Espresso
    (15, 2), -- Capsule 'Café Ensoleillé' -> Lungo
    (16, 1), -- Capsule 'Jardin Exotique' -> Espresso
    (17, 3), -- Capsule 'Café Indien' -> Ristretto
    (18, 4), -- Capsule 'Café Royal' -> Cappuccino
    (19, 2), -- Capsule 'Étoile d'Orient' -> Lungo
    (20, 5); -- Capsule 'Nuit d'Hiver' -> Latte


INSERT INTO ProprieteCapsule.CapsulePays (CapsuleID, PaysID)
VALUES
	(1, 1),  -- Café Soleil - Brésil
    (1, 2),  -- Café Soleil - France
    (1, 3),  -- Café Soleil - Colombie
    (1, 4),  -- Café Soleil - Costa Rica
    (2, 5),  -- Forêt Noire - Mexique
    (2, 6),  -- Forêt Noire - Guatemala
    (2, 7),  -- Forêt Noire - Pérou
    (3, 8),  -- Éclat Tropical - États-Unis
    (3, 9),  -- Éclat Tropical - Japon
    (3, 10), -- Éclat Tropical - Italie
    (3, 11), -- Éclat Tropical - Afrique du Sud
    (4, 12), -- Chocolat Indien - Argentine
    (4, 13), -- Chocolat Indien - Kenya
    (4, 14), -- Chocolat Indien - Papouasie-Nouvelle-Guinée
    (5, 15), -- Café Azur - Colombie
    (5, 16), -- Café Azur - Chine
    (5, 17), -- Café Azur - Sénégal
    (6, 18), -- Tentation Caramel - Costa Rica
    (6, 19), -- Tentation Caramel - Rwanda
    (6, 20), -- Tentation Caramel - Honduras
    (7, 1),  -- Café Ristretto Noir - Brésil
    (7, 2),  -- Café Ristretto Noir - France
    (7, 3),  -- Café Ristretto Noir - Colombie
    (8, 4),  -- Douceur Vanillée - Costa Rica
    (8, 5),  -- Douceur Vanillée - Mexique
    (8, 6),  -- Douceur Vanillée - Guatemala
    (9, 7),  -- Espresso Royal - Pérou
    (9, 8),  -- Espresso Royal - États-Unis
    (9, 9),  -- Espresso Royal - Italie
    (10, 10), -- Mélange Oriental - Japon
    (10, 11), -- Mélange Oriental - Afrique du Sud
    (10, 12), -- Mélange Oriental - Argentine
    (11, 13), -- Café de la Montagne - Kenya
    (11, 14), -- Café de la Montagne - Papouasie-Nouvelle-Guinée
    (11, 15), -- Café de la Montagne - Pérou
    (12, 16), -- Mystère Espresso - Chine
    (12, 17), -- Mystère Espresso - Sénégal
    (12, 18), -- Mystère Espresso - Costa Rica
    (13, 19), -- Café Eden - Rwanda
    (13, 20), -- Café Eden - Honduras
    (13, 1),  -- Café Eden - Brésil
    (14, 2),  -- Caramel Praliné - France
    (14, 3),  -- Caramel Praliné - Colombie
    (14, 4),  -- Caramel Praliné - Costa Rica
    (15, 5),  -- Café Majestueux - Mexique
    (15, 6),  -- Café Majestueux - Guatemala
    (15, 7),  -- Café Majestueux - Pérou
    (16, 8),  -- Mélange Italien - États-Unis
    (16, 9),  -- Mélange Italien - Japon
    (16, 10), -- Mélange Italien - Italie
    (17, 11), -- Café Safari - Afrique du Sud
    (17, 12), -- Café Safari - Argentine
    (17, 13), -- Café Safari - Kenya
    (18, 14), -- Nuit d'Hiver - Papouasie-Nouvelle-Guinée
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