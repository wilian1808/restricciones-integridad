DROP DATABASE IF EXISTS WorkExampleDB;

CREATE DATABASE WorkExampleDB;

USE WorkExampleDB;

CREATE TABLE Estudiantes (
    EstudianteID INTEGER NOT NULL IDENTITY(1, 1),
    Nombres VARCHAR(100) NOT NULL,
    Apellidos VARCHAR(100) NOT NULL,
    NumeroMatricula INTEGER NOT NULL,
    Dni INTEGER NOT NULL,
    Correo VARCHAR (100) NOT NULL,
    Sexo VARCHAR (20) NOT NULL ,
    FechaNacimiento DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_estudiantes PRIMARY KEY (EstudianteID),
    CONSTRAINT uk_numero_matricula_estudiantes UNIQUE (NumeroMatricula),
    CONSTRAINT ck_numero_matricula_estudiantes CHECK (NumeroMatricula > 0),
    CONSTRAINT uk_dni_estudiantes UNIQUE (Dni),
    CONSTRAINT ck_dni_estudiantes CHECK (Dni > 0),
    CONSTRAINT uk_correo_estudiantes UNIQUE (Correo)
);

INSERT INTO Estudiantes (Nombres, Apellidos, NumeroMatricula, Dni, Correo, Sexo) VALUES 
    ('wilber', 'choque condo', 202022, 74148475, 'wilber@gmail.com', 'masculino'),
    ('mario', 'ccama ccama', 202020, 78487548, 'mario@gmail.com', 'masculino'),
    ('luz', 'apaza iquise', 202021, 75588455, 'luz@gmail.com', 'femenino');

CREATE TABLE Cursos (
    CursoID INTEGER NOT NULL IDENTITY(1, 1),
    Nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_cursos PRIMARY KEY (CursoID),
    CONSTRAINT uk_nombre_cursos UNIQUE (Nombre)
);

CREATE TABLE Matriculas (
    MatriculaID INTEGER NOT NULL IDENTITY(1, 1),
    EstudianteID INTEGER,
    CursoID INTEGER,
    CONSTRAINT pk_matriculas PRIMARY KEY (MatriculaID),
    CONSTRAINT fk_matriculas_estudiantes FOREIGN KEY (EstudianteID) REFERENCES Estudiantes (EstudianteID)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_matriculas_cursos FOREIGN KEY (CursoID) REFERENCES Cursos (CursoID)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
