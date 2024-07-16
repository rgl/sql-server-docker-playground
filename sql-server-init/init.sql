CREATE DATABASE example;
GO

USE example;
GO

-- NB The password must be at least 8 characters long and contain characters
--    from three of the following four sets: Uppercase letters, Lowercase
--    letters, Base 10 digits, and Symbols.
CREATE LOGIN example WITH PASSWORD = 'HeyH0Password';
CREATE USER example FOR LOGIN example;
GRANT SELECT ON SCHEMA::dbo TO example;
GO

CREATE TABLE Quotes (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Text] NVARCHAR(255) NOT NULL,
    [Author] NVARCHAR(100) NOT NULL
);
GO

INSERT INTO Quotes ([Text], [Author])
VALUES
    ('The only limit to our realization of tomorrow is our doubts of today.', 'Franklin D. Roosevelt'),
    ('In the end, we will remember not the words of our enemies, but the silence of our friends.', 'Martin Luther King Jr.'),
    ('To alcohol! The cause of... and solution to... all of life''s problems.', 'Homer Simpson'),
    ('You got to help me. I don''t know what to do. I can''t make decisions. I''m a president!', 'President Skroob, Spaceballs'),
    ('Beware of he who would deny you access to information, for in his heart he dreams himself your master.', 'Pravin Lal'),
    ('About the use of language: it is impossible to sharpen a pencil with a blunt axe. It is equally vain to try to do it with ten blunt axes instead.', 'Edsger W. Dijkstra'),
    ('Those hours of practice, and failure, are a necessary part of the learning process.', 'Gina Sipley'),
    ('Engineering is achieving function while avoiding failure.', 'Henry Petroski'),
    ('Leadership is defined by what you do, not what you''re called.', 'Jen Heemstra'),
    ('Don''t only practice your art, but force your way into its secrets; art deserves that, for it and knowledge can raise man to the Divine.', 'Ludwig van Beethoven');
GO
