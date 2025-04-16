CREATE NONCLUSTERED INDEX IX_Utilisateur_Pseudo ON Utilisateurs.Utilisateur(Pseudo);
GO

CREATE NONCLUSTERED INDEX IX_ParticipationCourse_DateParticipation_Chrono ON Courses.ParticipationCourse(DateParticipation, Chrono);
GO

CREATE NONCLUSTERED INDEX IX_Course_Nom ON Courses.Course(Nom);
GO