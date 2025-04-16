
GO
CREATE VIEW Courses.vw_toutesLesParticipations AS
SELECT U.UtilisateurID, U.Pseudo, C.CourseID, C.Nom, PC.NbJoueurs, PC.Position, PC.Chrono, PC.DateParticipation
FROM Courses.ParticipationCourse PC
INNER JOIN Utilisateurs.Utilisateur U
ON PC.UtilisateurID = U.UtilisateurID
INNER JOIN Courses.Course C
ON PC.CourseID = C.CourseID

GO