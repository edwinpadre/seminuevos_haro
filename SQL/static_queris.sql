INSERT INTO `seminuevos_haro`.`marca` (Marca) VALUES ("Ford"), ("Chevrolet"), ("Mazda"),("BMW"), ("Audi"), ("Nissan"), ("Volkswagen"),("Toyota"),("Honda"), ("Renault"), ("Peugeot"), ("Mercedez Benz"),("Hyundai"), ("Seat"),("Suzuki"), ("Kia"), ("Mini"), ("Lincoln"), ("Infiniti"), ("Acura"), ("Volvo"), ("Porsche"), ("Subaru"), ("Isuzu"), ("Land Rover"), ("Smart"), ("Jaguar");
INSERT INTO `seminuevos_haro`.`year` (Year) VALUES (2019),(2018),(2017),(2016),(2015),(2014),(2013),(2012),(2011),(2010),(2009),(2008),(2007),(2006),(2005),(2004),(2003),(2002),(2001),(2000),(1999),(1998),(1997),(1996);
INSERT INTO `seminuevos_haro`.`color` (Color) VALUES ("Rojo"),("Verde"),("Azul"),("Amarillo"),("Negro"),("Blanco"),("Plata"),("Oro"),("Gris"),("Perla"),("Marron"),("Cafe"),("Morado"),("Rosa"),("Salmon"),("Naranja"),("Tinto"),("Violeta");

INSERT INTO `seminuevos_haro`.`frenos` (Frenos) VALUES ("Mecanicos"),("Hidraulicos"),("Neumaticos");
INSERT INTO `seminuevos_haro`.`traccion` (Traccion) VALUES ("FWD"),("4×4"),("4WD"),("RWD"),("AWD");
INSERT INTO `seminuevos_haro`.`transmision` (Transmision) VALUES ("Automatica"),("Manual");
INSERT INTO `seminuevos_haro`.`quemacocos` (Quemacocos) VALUES ("Si"),("No");
INSERT INTO `seminuevos_haro`.`electrico` (Electrico) VALUES ("Si"),("No");

INSERT INTO `seminuevos_haro`.`interiores` (Interiores) VALUES ("Piel"),("Sintetico");
INSERT INTO `seminuevos_haro`.`quemacocos` (Quemacocos) VALUES ("si"),("no");


SELECT * FROM `seminuevos_haro`.`marca`;

SELECT COUNT(*) FROM `seminuevos_haro`.`Auto`;

INSERT INTO `seminuevos_haro`.`Imagenes` (Imagenes,Auto_idAuto) VALUES ('test_image2.jpg',1);

INSERT INTO `seminuevos_haro`.`auto`(
    marca_idMarca,
    frenos_idFrenos,
    interiores_idInteriores,
    year_idYear,
    color_idColor,
    electrico_idElectrico,
    transmision_idTransmision,
    traccion_idTraccion,
    precio,
    Modelo,
    cilindraje,
    Kilometraje,
    Motor_desc,
    description,
    Quemacocos_idQuemacocos
)
VALUES(
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    10000,
    'nissan',
    '6',
    '5',
    'test',
    'Desc',
    1
);
 
 
INSERT INTO `seminuevos_haro`.`Auto` (precio,Modelo,cilindraje,Kilometraje,Motor_desc,description,disponible,Marca_idMarca ) VALUES (10000,'nissan','6','5','test','Desc',1,1);

SELECT auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,auto.marca_idMarca FROM auto 
INNER JOIN marca ON idMarca = auto.marca_idMarca;

SELECT * FROM `seminuevos_haro`.`marca`;







