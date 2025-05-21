

CREATE PROCEDURE CapsuleNespresso.USP_FiltreCapsule
	@AmertumeMax int,
	@AmertumeMin int,
	@PrixUniteMax numeric(4, 2),
	@Nom nvarchar(50)
AS
BEGIN

	IF @Nom = ''
	BEGIN
		SELECT *
	FROM CapsuleNespresso.Capsule
	WHERE Amertume > @AmertumeMin AND 
		Amertume < @AmertumeMax AND 
		PrixUnite < @PrixUniteMax
	END
	ELSE
	BEGIN
		SELECT *
	FROM CapsuleNespresso.Capsule
	WHERE Amertume > @AmertumeMin AND 
		Amertume < @AmertumeMax AND 
		PrixUnite < @PrixUniteMax AND
		CHARINDEX(@Nom, Nom, 0) > 0
	END
END
GO