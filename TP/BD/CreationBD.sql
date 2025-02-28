USE master
GO

CREATE DATABASE NespressoDB
GO
USE NespressoDB;
GO

CREATE SCHEMA CapsuleNespresso;
GO
CREATE SCHEMA ProprieteCapsule;
GO
CREATE SCHEMA Archives;
GO

CREATE TABLE CapsuleNespresso.Collection(
	CollectionID int IDENTITY (1,1) NOT NULL,
	Nom nvarchar(50) NOT NULL,
	Description nvarchar(500) NOT NULL,
	CONSTRAINT PK_Collection_CollectionID PRIMARY KEY (CollectionID)
)

CREATE TABLE Archives.ArchiveCollection(
	ArchiveCollectionID int IDENTITY(1,1) NOT NULL,
	CollectionID int NOT NULL,
	Nom nvarchar(50) NOT NULL,
	Description nvarchar(500) NOT NULL,
	DateMAJ datetime NOT NULL
	CONSTRAINT PK_ArchiveCollection_ArchiveCollectionID PRIMARY KEY (ArchiveCollectionID)
)

CREATE TABLE CapsuleNespresso.Capsule(
	CapsuleID int IDENTITY (1,1) NOT NULL,
	Nom nvarchar(50) NOT NULL,
	DescriptionCourte nvarchar(300) NOT NULL,
	DescriptionLongue nvarchar(1500) NOT NULL,
	DescriptionGout nvarchar(1000) NOT NULL,
	DescriptionTorrefaction nvarchar(1000) NULL,
	Amertume int NULL,
	PrixUnite numeric(4, 2) NOT NULL,
	CollectionID int NOT NULL,
	CONSTRAINT PK_Capsule_CapsuleID PRIMARY KEY (CapsuleID)
)

CREATE TABLE Archives.ArchiveCapsule(
	ArchiveCapsuleID int IDENTITY (1,1) NOT NULL,
	CapsuleID int NOT NULL,
	Nom nvarchar(50) NOT NULL,
	DescriptionCourte nvarchar(300) NOT NULL,
	DescriptionLongue nvarchar(1500) NOT NULL,
	DescriptionGout nvarchar(1000) NOT NULL,
	DescriptionTorrefaction nvarchar(1000) NULL,
	Amertume int NULL,
	PrixUnite numeric(4, 2) NOT NULL,
	CollectionID int NOT NULL,
	DateMAJ datetime NOT NULL,
	CONSTRAINT PK_ArchiveCapsule_ArchiveCapsuleID PRIMARY KEY (ArchiveCapsuleID)
)

CREATE TABLE ProprieteCapsule.CapsuleTypeCafe(
	CapsuleTypeCafeID int IDENTITY (1,1) NOT NULL,
	CapsuleID int NOT NULL,
	TypeCafeID int NOT NULL,
	CONSTRAINT PK_CapsuleTypeCafe_CapsuleTypeCafeID PRIMARY KEY (CapsuleTypeCafeID)
)

CREATE TABLE Archives.ArchiveCapsuleTypeCafe(
	ArchiveCapsuleTypeCafeID int IDENTITY (1,1) NOT NULL,
	CapsuleTypeCafeID int NOT NULL,
	CapsuleID int NOT NULL,
	TypeCafeID int NOT NULL,
	DateMAJ datetime NOT NULL,
	CONSTRAINT PK_ArchiveCapsuleTypeCafe_ArchiveCapsuleTypeCafeID PRIMARY KEY (ArchiveCapsuleTypeCafeID)
)

CREATE TABLE ProprieteCapsule.TypeCafe(
	TypeCafeID int IDENTITY (1,1) NOT NULL,
	Nom nvarchar(50) NOT NULL,
	Description nvarchar(300) NOT NULL,
	QteML int NOT NULL,
	CONSTRAINT PK_TypeCafe_TypeCafeID PRIMARY KEY (TypeCafeID)
)

CREATE TABLE Archives.ArchiveTypeCafe(
	ArchiveTypeCafeID int IDENTITY (1,1) NOT NULL,
	TypeCafeID int NOT NULL,
	Nom nvarchar(50) NOT NULL,
	Description nvarchar(300) NOT NULL,
	QteML int NOT NULL,
	DateMAJ datetime NOT NULL,
	CONSTRAINT PK_ArchiveTypeCafe_ArchiveTypeCafeID PRIMARY KEY (ArchiveTypeCafeID)
)

CREATE TABLE ProprieteCapsule.CapsulePays(
	CapsulePaysID int IDENTITY (1,1) NOT NULL,
	CapsuleID int NOT NULL,
	PaysID int NOT NULL,
	CONSTRAINT PK_CapsulePays_CapsulePaysID PRIMARY KEY (CapsulePaysID)
)

CREATE TABLE Archives.ArchiveCapsulePays(
	ArchiveCapsulePaysID int IDENTITY (1,1) NOT NULL,
	CapsulePaysID int NOT NULL,
	CapsuleID int NOT NULL,
	PaysID int NOT NULL,
	DateMAJ datetime NOT NULL,
	CONSTRAINT PK_ArchiveCapsulePays_ArchiveCapsulePaysID PRIMARY KEY (ArchiveCapsulePaysID)
)

CREATE TABLE ProprieteCapsule.Pays(
	PaysID int IDENTITY (1,1) NOT NULL,
	Nom nvarchar(50) NOT NULL,
	AnneeIntroductionCafe int NOT NULL,
	HistoireCafe nvarchar(1000) NOT NULL,
	CONSTRAINT PK_Pays_PaysID PRIMARY KEY (PaysID)
)

CREATE TABLE Archives.ArchivePays(
	ArchivePaysID int IDENTITY (1,1) NOT NULL,
	PaysID int NOT NULL,
	Nom nvarchar(50) NOT NULL,
	AnneeIntroductionCafe int NOT NULL,
	HistoireCafe nvarchar(1000) NOT NULL,
	DateMAJ datetime NOT NULL,
	CONSTRAINT PK_ArchivePays_ArchivePaysID PRIMARY KEY (ArchivePaysID)
)

CREATE TABLE ProprieteCapsule.CafeNoir(
	CafeNoirID int IDENTITY (1,1) NOT NULL,
	CapsuleID int NOT NULL,
	Intensite int NOT NULL,
	Torrefaction int NOT NULL,
	Acidite int NOT NULL,
	Corps int NOT NULL,
	CONSTRAINT PK_CafeNoir_CafeNoirID PRIMARY KEY (CafeNoirID)
)

CREATE TABLE Archives.ArchiveCafeNoir(
	ArchiveCafeNoirID int IDENTITY (1,1) NOT NULL,
	CafeNoirID int NOT NULL,
	CapsuleID int NOT NULL,
	Intensite int NOT NULL,
	Torrefaction int NOT NULL,
	Acidite int NOT NULL,
	Corps int NOT NULL,
	DateMAJ datetime NOT NULL,
	CONSTRAINT PK_ArchiveCafeNoir_ArchiveCafeNoirID PRIMARY KEY (ArchiveCafeNoirID)
)

CREATE TABLE ProprieteCapsule.CafeLait(
	CafeLaitID int IDENTITY (1,1) NOT NULL,
	CapsuleID int NOT NULL,
	GoutLait int NOT NULL,
	TextureCremeuse int NOT NULL,
	CONSTRAINT PK_CafeLait_CafeLaitID PRIMARY KEY (CafeLaitID)
)

CREATE TABLE Archives.ArchiveCafeLait(
	ArchiveCafeLaitID int IDENTITY (1,1) NOT NULL,
	CafeLaitID int NOT NULL,
	CapsuleID int NOT NULL,
	GoutLait int NOT NULL,
	TextureCremeuse int NOT NULL,
	DateMAJ datetime NOT NULL,
	CONSTRAINT PK_ArchiveCafeLait_ArchiveCafeLaitID PRIMARY KEY (ArchiveCafeLaitID)
)

GO


ALTER TABLE CapsuleNespresso.Capsule ADD CONSTRAINT FK_Capsule_CollectionID
FOREIGN KEY (CollectionID)
REFERENCES CapsuleNespresso.Collection (CollectionID)
ON DELETE CASCADE

ALTER TABLE ProprieteCapsule.CapsuleTypeCafe ADD CONSTRAINT FK_CapsuleTypeCafe_CapsuleID
FOREIGN KEY (CapsuleID)
REFERENCES CapsuleNespresso.Capsule (CapsuleID)
ON DELETE CASCADE

ALTER TABLE ProprieteCapsule.CapsuleTypeCafe ADD CONSTRAINT FK_CapsuleTypeCafe_TypeCafeID
FOREIGN KEY (TypeCafeID)
REFERENCES ProprieteCapsule.TypeCafe (TypeCafeID)
ON DELETE CASCADE

ALTER TABLE ProprieteCapsule.CapsulePays ADD CONSTRAINT FK_CapsulePays_CapsuleID
FOREIGN KEY (CapsuleID)
REFERENCES CapsuleNespresso.Capsule (CapsuleID)
ON DELETE CASCADE

ALTER TABLE ProprieteCapsule.CapsulePays ADD CONSTRAINT FK_CapsulePays_PaysID
FOREIGN KEY (PaysID)
REFERENCES ProprieteCapsule.Pays (PaysID)
ON DELETE CASCADE

ALTER TABLE ProprieteCapsule.CafeNoir ADD CONSTRAINT FK_CafeNoir_CapsuleID
FOREIGN KEY (CapsuleID)
REFERENCES CapsuleNespresso.Capsule (CapsuleID)
ON DELETE CASCADE

ALTER TABLE ProprieteCapsule.CafeLait ADD CONSTRAINT FK_CafeLait_CapsuleID
FOREIGN KEY (CapsuleID)
REFERENCES CapsuleNespresso.Capsule (CapsuleID)
ON DELETE CASCADE


GO


ALTER TABLE CapsuleNespresso.Collection ADD CONSTRAINT UC_Collection_Nom UNIQUE (Nom)

ALTER TABLE CapsuleNespresso.Capsule ADD CONSTRAINT UC_Capsule_Nom UNIQUE (Nom)

ALTER TABLE ProprieteCapsule.TypeCafe ADD CONSTRAINT UC_TypeCafe_Nom UNIQUE (Nom)

ALTER TABLE ProprieteCapsule.Pays ADD CONSTRAINT UC_Pays_Nom UNIQUE (Nom)

ALTER TABLE ProprieteCapsule.CafeNoir ADD CONSTRAINT UC_CafeNoir_CapsuleID UNIQUE (CapsuleID)

ALTER TABLE ProprieteCapsule.CafeLait ADD CONSTRAINT UC_CafeLait_CapsuleID UNIQUE (CapsuleID)

ALTER TABLE CapsuleNespresso.Capsule ADD CONSTRAINT CK_Capsule_Amertume CHECK (Amertume >= 0 AND Amertume <= 10)

ALTER TABLE CapsuleNespresso.Capsule ADD CONSTRAINT CK_Capsule_PrixUnite CHECK (PrixUnite > 0)

ALTER TABLE ProprieteCapsule.TypeCafe ADD CONSTRAINT CK_TypeCafe_QteML CHECK (QteML > 0)

ALTER TABLE ProprieteCapsule.Pays ADD CONSTRAINT CK_Pays_AnneeIntroductionCafe CHECK (AnneeIntroductionCafe > -1000 AND AnneeIntroductionCafe < 2100)

ALTER TABLE ProprieteCapsule.CafeNoir ADD CONSTRAINT CK_CafeNoir_Intensite CHECK (Intensite >= 0 AND Intensite <= 10)

ALTER TABLE ProprieteCapsule.CafeNoir ADD CONSTRAINT CK_CafeNoir_Torrefaction CHECK (Torrefaction >= 0 AND Torrefaction <= 10)

ALTER TABLE ProprieteCapsule.CafeNoir ADD CONSTRAINT CK_CafeNoir_Acidite CHECK (Acidite >= 0 AND Acidite <= 10)

ALTER TABLE ProprieteCapsule.CafeNoir ADD CONSTRAINT CK_CafeNoir_Corps CHECK (Corps >= 0 AND Corps <= 10)

ALTER TABLE ProprieteCapsule.CafeLait ADD CONSTRAINT CK_CafeLait_GoutLait CHECK (GoutLait >= 0 AND GoutLait <= 10)

ALTER TABLE ProprieteCapsule.CafeLait ADD CONSTRAINT CK_CafeLait_TextureCremeuse CHECK (TextureCremeuse >= 0 AND TextureCremeuse <= 10)

ALTER TABLE CapsuleNespresso.Capsule ADD CONSTRAINT DF_Capsule_PrixUnite DEFAULT 00.97 FOR PrixUnite

