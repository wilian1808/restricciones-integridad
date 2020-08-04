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

INSERT INTO Estudiantes (Nombres, Apellidos, NumeroMatricula, Dni, Correo, Sexo) 
	VALUES ('mario', 'ccama ccama', 202020, 78487548, 'mario@gmail.com', 'masculino'),
    	   ('luz', 'apaza iquise', 202021, 75588455, 'luz@gmail.com', 'femenino'),
  		   ('wilber', 'choque condo', 202022, 74148475, 'wilber@gmail.com', 'masculino');

--
CREATE TABLE cursos (
    id_curso INT NOT NULL IDENTITY,
    nombre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_cursos PRIMARY KEY (id_curso),
    CONSTRAINT uk_cursos_nombre UNIQUE (nombre)
);

CREATE TABLE matriculas (
    id_matricula INT NOT NULL IDENTITY,
    id_estudiante INT NOT NULL,
    id_curso INT NOT NULL,
    CONSTRAINT pk_matriculas PRIMARY KEY (id_matricula),
    CONSTRAINT fk_matriculas_estudiantes FOREIGN KEY (id_estudiante) REFERENCES estudiantes (id_estudiante)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_matriculas_cursos FOREIGN KEY (id_curso) REFERENCES cursos (id_curso)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
