# TAREA RESTRICCIONES DE INTEGRIDAD.

Para poder realizar el ejercicio se creo una base de datos llamado `WorkExampleDB` se renombro a esta para evitar que tenga conflictos con alguna base de datos ya existente.

```sql
DROP DATABASE IF EXISTS WorkExampleDB;

CREATE DATABASE WorkExampleDB;

USE WorkExampleDB;
```

> Borramos la base de datos *WorkExampleDB* si es que ya existe luego creamos la base de datos *WorkExampleDB* y la usamos para ejecutar los siguientes codigos *sql*.

### 1. Primero.

Crear una tabla `estudiantes`, los campos debe de incluir un id entero autoincrementable, número de matricula y dni con restricciones de formato y únicos, cuenta de correo electronico con la restriccion de formato correspondiente, debe de incluirse campos para sexo, fecha de nacimiento, apellidos y nombres. Inserte datos.

> creamos la tabla *estudiante* con sus respectivos atributos.

```sql
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
```

> Insertamos valores en la tabla *Estudiantes*.

```sql
INSERT INTO Estudiantes (Nombres, Apellidos, NumeroMatricula, Dni, Correo, Sexo) VALUES 
    ('wilber', 'choque condo', 202022, 74148475, 'wilber@gmail.com', 'masculino'),
    ('mario', 'ccama ccama', 202020, 78487548, 'mario@gmail.com', 'masculino'),
    ('luz', 'apaza iquise', 202021, 75588455, 'luz@gmail.com', 'femenino');
```

### 2. Segundo

Crear una tabla para matrícula y otra para curso, debe considerarse las restricciones de integridad referencial.

> Creamos la tabla *Cursos* con sus respectivos atributos.

```sql
CREATE TABLE Cursos (
    CursoID INTEGER NOT NULL IDENTITY(1, 1),
    Nombre VARCHAR(100) NOT NULL,
    CONSTRAINT pk_cursos PRIMARY KEY (CursoID),
    CONSTRAINT uk_nombre_cursos UNIQUE (Nombre)
);
```

> Creamos la tabla *Matriculas* con sus respectivos atributos y las relaciones correspondientes.

```sql
CREATE TABLE Matriculas (
    MatriculaID INTEGER NOT NULL IDENTITY(1, 1),
    EstudianteID INTEGER,
    CursoID INTEGER,
    CONSTRAINT pk_matriculas PRIMARY KEY (MatriculaID),
    CONSTRAINT fk_estudiantes FOREIGN KEY (EstudianteID) REFERENCES Estudiantes (EstudianteID)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT fk_cursos FOREIGN KEY (CursoID) REFERENCES Cursos (CursoID)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
```

### 3. tercero.

Indagar como acceder remotamente a una base de datos. Probar con alguno de sus compañeros de clase. Adjuntar capturas de pantalla.

> Podemos acceder a la mayoria de gestores de bases de datos de manera remota, cada gestor cuenta con la opcion de habilitar o inhabilitar esta caracteristica por lo que para poder conectarnos de forma remota a una base de datos debemos seguir los siguientes pasos.

- Debemos habilitar la opcion de permitir conexiones remotas.
- Tendremos que crear un usuario y definir los permisos para que pueda ejecutar acciones dentro de nuestra base de datos.
- Tenemos que definir el puerto y anotar el host de la maquina donde estara la base de datos a conectarse.

> Para mostrar un ejemplo nos conectaremos a una base de datos remota, el gestor de esta base de datos es *MySql*.

A continuacion se muestran el enlace del servicio que nos proporciona una base de datos para conectarnos.

- [remotemysql](https://remotemysql.com/)

> para lograr la conexion anotamos los siguientes datos.

- Nombre de usuario
- Nombre de la base de datos
- Contraseña de la base de datos
- Servidor
- Puerto


> Para conectarnos a una base de datos remota mediante la consola de *Mysql* usamos la siguiente linea de comando,  reemplaze cada <> con los valores de su base de datos remota al momento de ejecutar nos pedira que insertemos la contraseña de la base de datos.

```sh
mysql -h <host> -P <port> -u <username> -D <database_name> -p
```

> explicaremos cada uno de los parametros:

- **-p** indica la contraseña de la base de datos
- **-D** indica el nombre de la base de datos
- **-h** indica el host de la base de datos
- **-P** indica el port de la base de datos
- **-u** indica el usuario

> imagen de como nos conectamos a la base de datos.

![conexion](https://user-images.githubusercontent.com/48990642/89370797-3678f280-d6a7-11ea-8453-586668802be8.png)

> En la imagen adjunta vemos como abrimos una terminal y escribimos el comando pasandole los datos correspondientes para poder conectarnos a nuestra base de datos remota, luego de eso nos pedira la contraseña la escribimos y listo estamos dentro de una base de datos remota.
Una ves dentro de la base de datos creamos una consulta que describe la tabla *users* para comprobar que todo funciona correctamente.
