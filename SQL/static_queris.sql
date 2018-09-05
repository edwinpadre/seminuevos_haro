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

SELECT auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,auto.marca_idMarca,marca.marca,auto.frenos_idFrenos,frenos.frenos,interiores.interiores FROM auto 
            JOIN marca 
                ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
                ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN interiores 
                ON interiores.idinteriores = auto.interiores_idInteriores; 

SELECT * FROM `seminuevos_haro`.`frenos`;

SELECT auto.idAuto,auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,marca.marca,frenos.frenos,interiores.interiores,
year.year,color.color,electrico.electrico,transmision.transmision,traccion.traccion,imagenes.imagenes FROM auto 
            JOIN marca 
               ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
               ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN interiores 
               ON interiores.idinteriores = auto.interiores_idInteriores
            JOIN year 
               ON year.idYear = auto.year_idYear
            JOIN color
               ON color.idColor = auto.color_idColor 
            JOIN electrico
               ON electrico.idElectrico = auto.electrico_idElectrico
            JOIN transmision
               ON transmision.idTransmision = auto.transmision_idTransmision 
            JOIN traccion
               ON traccion.idTraccion = auto.traccion_idTraccion
			JOIN imagenes
               ON imagenes.idImagenes = auto.idAuto
 WHERE auto.precio LIKE 10000 
				OR  'ford' LIKE CONCAT('%', marca.marca, '%')				
                OR  'ford 2018' LIKE CONCAT('%', marca.marca, '%') 
                OR  'ford 2018' LIKE CONCAT('%', frenos.frenos, '%') 
                OR  'ford 2018' LIKE CONCAT('%', interiores.interiores, '%') 
                OR  'ford 2018' LIKE CONCAT('%', year.year, '%') 
                OR  'ford 2018' LIKE CONCAT('%', color.color, '%') 
                OR  'ford 2018' LIKE CONCAT('%', electrico.electrico, '%') 
                OR  'ford 2018' LIKE CONCAT('%', transmision.transmision, '%') 
                OR  'ford 2018' LIKE CONCAT('%', traccion.traccion, '%') 
			
 ; 


SELECT auto.idAuto,auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,marca.marca,frenos.frenos,interiores.interiores,year.year,color.color,electrico.electrico,transmision.transmision,traccion.traccion,imagenes.imagenes FROM auto 
            JOIN marca 
               ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
               ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN interiores 
               ON interiores.idinteriores = auto.interiores_idInteriores
            JOIN year 
               ON year.idYear = auto.year_idYear
            JOIN color
               ON color.idColor = auto.color_idColor 
            JOIN electrico
               ON electrico.idElectrico = auto.electrico_idElectrico
            JOIN transmision
               ON transmision.idTransmision = auto.transmision_idTransmision 
            JOIN traccion
               ON traccion.idTraccion = auto.traccion_idTraccion
            JOIN imagenes
               ON imagenes.idImagenes = auto.idAuto     
            WHERE auto.Modelo LIKE 'nissan' 
                OR  'ford' LIKE CONCAT('%', marca.marca, '%') 
                OR  '2018' LIKE CONCAT('%', year.year, '%') ;






SELECT * FROM imagenes;
select * from auto;


SELECT auto.idAuto,auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,marca.marca,frenos.frenos,interiores.interiores,quemacocos.quemacocos,year.year,color.color,electrico.electrico,transmision.transmision,traccion.traccion,imagenes.imagenes 
FROM auto
            JOIN marca 
               ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
               ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN interiores 
               ON interiores.idinteriores = auto.interiores_idInteriores
            JOIN quemacocos
               ON quemacocos.idQuemacocos = auto.quemacocos_idQuemacocos
            JOIN year 
               ON year.idYear = auto.year_idYear
            JOIN color
               ON color.idColor = auto.color_idColor 
            JOIN electrico
               ON electrico.idElectrico = auto.electrico_idElectrico
            JOIN transmision
               ON transmision.idTransmision = auto.transmision_idTransmision 
            JOIN traccion
               ON traccion.idTraccion = auto.traccion_idTraccion
            JOIN imagenes
               ON imagenes.auto_idAuto = auto.idAuto
            














