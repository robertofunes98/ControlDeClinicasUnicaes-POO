drop database if exists sistema_clinica;

create database if not exists sistema_clinica;

use sistema_clinica;

create table Medico(
jvpm varchar(6) not null,
nombres varchar(50) not null,
apellidos varchar(50) not null,
telefono varchar(8) not null,
especialidad varchar(30) not null,
clave varchar(15) not null,
tipoUsuario varchar(20) not null comment "usuario, admin",
Primary Key(jvpm)
);

create table Paciente(
idPaciente int auto_increment not null,
nombres varchar(50) not null,
apellidos varchar(50) not null,
fechaNacimiento datetime not null,
sexo varchar(1) not null,
jvpm varchar(6) not null,
Primary Key(idPaciente),
CONSTRAINT fkPacienteXMedico Foreign key(jvpm) references Medico(jvpm)
);

create table Consulta(
idConsulta int auto_increment not null,
fecha datetime not null,
diagnostico varchar(500) not null,
altura double not null comment "M",
peso double not null comment "LB",
observaciones varchar(500) not null,
idPaciente int not null,
Primary Key(idConsulta),
CONSTRAINT fkConsultaXPaciente Foreign key(idPaciente) references Paciente(idPaciente)
);

create table Medicina(
idMedicamento int auto_increment not null,
nombre varchar(50) not null,
activo varchar(100) not null,
cantidad varchar(100) not null,	
jvpm varchar(6) not null,
Primary Key(idMedicamento),
CONSTRAINT fkMedicinaXMedico Foreign key(jvpm) references Medico(jvpm)
);

create table MedicinaXConsulta(
idMedicamentoXConsulta int auto_increment not null,
idConsulta int not null,
idPaciente int not null, 
idMedicamento int not null,
dosis varchar(50) not null,
Primary Key(idMedicamentoXConsulta),
CONSTRAINT fkConsultaXMedicinaXConsulta Foreign key(idConsulta) references Consulta(idConsulta)
);


/*Registros de prueba*/
INSERT INTO `sistema_clinica`.`Medico` (`jvpm`, `nombres`, `apellidos`, `telefono`, `especialidad`, `clave`) VALUES ('123456', 'Juan', 'Perez', '75048995', 'Cirujano', '1234');
