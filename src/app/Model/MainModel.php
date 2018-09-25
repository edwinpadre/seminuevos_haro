<?php

namespace src\app\Model;
use src\app\Controllers\Connecta;

class MainModel extends Connecta {

   function getAll(){

       $connect = new Connecta();
       $sql = "SELECT auto.idAuto,auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,marca.marca,frenos.frenos,auto.interiores,quemacocos.quemacocos,year.year,auto.color,electrico.electrico,transmision.transmision,traccion.traccion,imagenes.imagenes FROM auto 
            JOIN marca 
               ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
               ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN quemacocos
               ON quemacocos.idQuemacocos = auto.quemacocos_idQuemacocos
            JOIN year 
               ON year.idYear = auto.year_idYear
            JOIN electrico
               ON electrico.idElectrico = auto.electrico_idElectrico
            JOIN transmision
               ON transmision.idTransmision = auto.transmision_idTransmision 
            JOIN traccion
               ON traccion.idTraccion = auto.traccion_idTraccion
            JOIN imagenes
               ON imagenes.auto_idAuto = auto.idAuto                    
        ";

       $result = mysqli_query($connect->conexion,$sql);
       while ($row = mysqli_fetch_array($result)) {
           $id = $row['idAuto'];
           $precio = $row['precio'];
           $modelo = $row['Modelo'];
           $description = $row['description'];
           $cilindraje = $row['cilindraje'];
           $Kilometraje = $row['Kilometraje'];
           $Motor_desc = $row['Motor_desc'];
           $marca = $row['marca'];
           $frenos = $row['frenos'];
           $interiores = $row['interiores'];
           $quemacocos = $row['quemacocos'];
           $year = $row['year'];
           $color = $row['color'];
           $electrico = $row['electrico'];
           $transmision = $row['transmision'];
           $traccion = $row['traccion'];
           $imagenes = json_decode($row['imagenes']);

           $data [] = array(
               "id" => $id,
               "precio" => $precio,
               "modelo" => $modelo,
               "description" => $description,
               "cilindraje" => $cilindraje,
               "Kilometraje" => $Kilometraje,
               "Motor_desc" => $Motor_desc,
               "Marca" => $marca,
               "Frenos" => $frenos,
               "interiores" => $interiores,
               "quemacocos" => $quemacocos,
               "year" => $year,
               "color" => $color,
               "electrico" => $electrico,
               "transmision" => $transmision,
               "traccion" => $traccion,
               "imagenes" => $imagenes
           );
       }
       mysqli_close($connect->conexion);
       return $data;
   }

    function createNew($params) {

        $_Marca = $params['Marca'];
        $_Modelo = $params['modelo'];
        $_Year = $params['year'];
        $_Color = $params['color'];
        $_Interiores = $params['interiores'];
        $_Frenos = $params['Frenos'];
        $_Precio = $params['precio'];
        $_KM = $params['kilometraje'];
        $_Cilindraje = $params['cilindraje'];
        $_Motor = $params['motor'];
        $_Tracccion = $params['traccion'];
        $_Transmision = $params['transmision'];
        $_Electrico = $params['Electrico'];
        $_Descripcion = $params['descripcion'];


        $sql = "INSERT INTO `seminuevos_haro`.`auto`(
                marca_idMarca,
                frenos_idFrenos,
                interiores,
                year_idYear,
                color,
                electrico_idElectrico,
                transmision_idTransmision,
                traccion_idTraccion,
                precio,
                Modelo,
                cilindraje,
                Kilometraje,
                Motor_desc,
                description,
                Quemacocos_idQuemacocos,
                disponible
                )
                VALUES(
                $_Marca,
                $_Frenos,
                '$_Interiores',
                $_Year,
                '$_Color',
                $_Electrico,
                $_Transmision,
                $_Tracccion,
                $_Precio,
                '$_Modelo',
                '$_Cilindraje',
                '$_KM',
                '$_Motor',
                '$_Descripcion',
                1,
                1
        )";

        $connect = new Connecta();
        if ($connect->conexion->query($sql) === TRUE ) {

            $total = count($_FILES['upload']['name']);
            $total_int = count($_FILES['uploadInterior']['name']);
            $img_arr = array();
            $img_arr_int = array();

            $sql_max_id = "SELECT MAX(idAuto) FROM `seminuevos_haro`.`auto`";
            $result=mysqli_query($connect->conexion,$sql_max_id);
            $rows = mysqli_fetch_array($result);

            for( $i=0 ; $i < $total ; $i++ ) {
                $tmpFilePath = $_FILES['upload']['tmp_name'][$i];
                if ($tmpFilePath != ""){
                    $newFilePath = "./images/" . $_FILES['upload']['name'][$i];
                    if(move_uploaded_file($tmpFilePath, $newFilePath)) {
                       array_push($img_arr,  $newFilePath);
                    }
                }
            }

            for( $i=0 ; $i < $total_int ; $i++ ) {
                $tmpFilePath = $_FILES['uploadInterior']['tmp_name'][$i];
                if ($tmpFilePath != ""){
                    $newFilePath = "./images/" . $_FILES['uploadInterior']['name'][$i];
                    if(move_uploaded_file($tmpFilePath, $newFilePath)) {
                        array_push($img_arr_int, $newFilePath);
                    }
                }
            }

            $array1    = array("exterior" => $img_arr);
            $array2    = array("interior" => $img_arr_int);
            $resultado = array_merge($array1, $array2);

            $array_data = json_encode($resultado);
            print_r($array_data);
            $sql_images = "INSERT INTO `seminuevos_haro`.`imagenes` (imagenes,auto_idAuto) VALUES ('$array_data',$rows[0])";

            if ($connect->conexion->query($sql_images) === TRUE ) {
                return true;
            } else {
                echo "Could not upload the images".$sql_images.$connect->conexion->error;
            }
            mysqli_close($connect->conexion);

        } else {
            echo "Something went wrong".$sql.$connect->conexion->error;
            mysqli_close($connect->conexion);
        }
    }

    function search($val){
        if ($val !== "") {
            $param =  $val[search];
            $sql = "SELECT auto.idAuto,auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,marca.marca,frenos.frenos,auto.interiores,year.year,auto.color,electrico.electrico,transmision.transmision,traccion.traccion,imagenes.imagenes FROM auto 
            JOIN marca 
               ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
               ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN year 
               ON year.idYear = auto.year_idYear 
            JOIN electrico
               ON electrico.idElectrico = auto.electrico_idElectrico
            JOIN transmision
               ON transmision.idTransmision = auto.transmision_idTransmision 
            JOIN traccion
               ON traccion.idTraccion = auto.traccion_idTraccion
            JOIN imagenes
               ON imagenes.auto_idAuto = auto.idAuto     
            WHERE auto.Modelo LIKE '$param' 
                OR  '$param' LIKE CONCAT('%', marca.marca, '%') 
                OR  '$param' LIKE CONCAT('%', frenos.frenos, '%') 
                OR  '$param' LIKE CONCAT('%', auto.interiores, '%') 
                OR  '$param' LIKE CONCAT('%', year.year, '%') 
                OR  '$param' LIKE CONCAT('%', auto.color, '%') 
                OR  '$param' LIKE CONCAT('%', transmision.transmision, '%') 
                OR  '$param' LIKE CONCAT('%', traccion.traccion, '%')  
                ";

            $connect = new Connecta();
            $result = mysqli_query($connect->conexion,$sql);
            while ($row = mysqli_fetch_array($result)) {
                $id = $row['idAuto'];
                $precio = $row['precio'];
                $modelo = $row['Modelo'];
                $description = $row['description'];
                $cilindraje = $row['cilindraje'];
                $Kilometraje = $row['Kilometraje'];
                $Motor_desc = $row['Motor_desc'];
                $marca = $row['marca'];
                $frenos = $row['frenos'];
                $interiores = $row['interiores'];
                $quemacocos = $row['quemacocos'];
                $year = $row['year'];
                $color = $row['color'];
                $electrico = $row['electrico'];
                $transmision = $row['transmision'];
                $traccion = $row['traccion'];
                $imagenes = json_decode($row['imagenes']);

                $data [] = array(
                    "id" => $id,
                    "precio" => $precio,
                    "modelo" => $modelo,
                    "description" => $description,
                    "cilindraje" => $cilindraje,
                    "Kilometraje" => $Kilometraje,
                    "Motor_desc" => $Motor_desc,
                    "Marca" => $marca,
                    "Frenos" => $frenos,
                    "interiores" => $interiores,
                    "quemacocos" => $quemacocos,
                    "year" => $year,
                    "color" => $color,
                    "electrico" => $electrico,
                    "transmision" => $transmision,
                    "traccion" => $traccion,
                    "imagenes" => $imagenes
                );
            }
            mysqli_close($connect->conexion);
            return json_encode($data);
        }

    }

    function searchByTag($params){

            $modelo = $params['modelo'];
            $marca = $params['marca'];
            $year = $params['year'];

            $sql = "SELECT auto.idAuto,auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,marca.marca,frenos.frenos,auto.interiores,year.year,auto.color,electrico.electrico,transmision.transmision,traccion.traccion,imagenes.imagenes FROM auto 
            JOIN marca 
               ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
               ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN year 
               ON year.idYear = auto.year_idYear
            JOIN electrico
               ON electrico.idElectrico = auto.electrico_idElectrico
            JOIN transmision
               ON transmision.idTransmision = auto.transmision_idTransmision 
            JOIN traccion
               ON traccion.idTraccion = auto.traccion_idTraccion
            JOIN imagenes
               ON imagenes.auto_idAuto = auto.idAuto     
            WHERE auto.Modelo LIKE '$modelo' 
                OR  '$marca' LIKE CONCAT('%', marca.marca, '%') 
                OR  '$year' LIKE CONCAT('%', year.year, '%') 
                ";

            $connect = new Connecta();
            $result = mysqli_query($connect->conexion,$sql);
            while ($row = mysqli_fetch_array($result)) {
                $id = $row['idAuto'];
                $precio = $row['precio'];
                $modelo = $row['Modelo'];
                $description = $row['description'];
                $cilindraje = $row['cilindraje'];
                $Kilometraje = $row['Kilometraje'];
                $Motor_desc = $row['Motor_desc'];
                $marca = $row['marca'];
                $frenos = $row['frenos'];
                $interiores = $row['interiores'];
                $quemacocos = $row['quemacocos'];
                $year = $row['year'];
                $color = $row['color'];
                $electrico = $row['electrico'];
                $transmision = $row['transmision'];
                $traccion = $row['traccion'];
                $imagenes = json_decode($row['imagenes']);

                $data [] = array(
                    "id" => $id,
                    "precio" => $precio,
                    "modelo" => $modelo,
                    "description" => $description,
                    "cilindraje" => $cilindraje,
                    "Kilometraje" => $Kilometraje,
                    "Motor_desc" => $Motor_desc,
                    "Marca" => $marca,
                    "Frenos" => $frenos,
                    "interiores" => $interiores,
                    "quemacocos" => $quemacocos,
                    "year" => $year,
                    "color" => $color,
                    "electrico" => $electrico,
                    "transmision" => $transmision,
                    "traccion" => $traccion,
                    "imagenes" => $imagenes
                );
            }
            mysqli_close($connect->conexion);
            return json_encode($data);
        }

    function searchById($params){

        $idSearch = $params['id'];

        $sql = "SELECT auto.idAuto,auto.precio,auto.Modelo,auto.description,auto.cilindraje,auto.Kilometraje,auto.Motor_desc,auto.disponible,marca.marca,frenos.frenos,auto.interiores,year.year,auto.color,electrico.electrico,transmision.transmision,traccion.traccion,imagenes.imagenes FROM auto 
            JOIN marca 
               ON marca.idMarca = auto.marca_idMarca
            JOIN frenos 
               ON frenos.idFrenos = auto.frenos_idFrenos
            JOIN year 
               ON year.idYear = auto.year_idYear
            JOIN electrico
               ON electrico.idElectrico = auto.electrico_idElectrico
            JOIN transmision
               ON transmision.idTransmision = auto.transmision_idTransmision 
            JOIN traccion
               ON traccion.idTraccion = auto.traccion_idTraccion
            JOIN imagenes
               ON imagenes.auto_idAuto = auto.idAuto  
            WHERE auto.idAuto = $idSearch
                ";

        $connect = new Connecta();
        $result = mysqli_query($connect->conexion,$sql);
        while ($row = mysqli_fetch_array($result)) {
            $id = $row['idAuto'];
            $precio = $row['precio'];
            $modelo = $row['Modelo'];
            $description = $row['description'];
            $cilindraje = $row['cilindraje'];
            $Kilometraje = $row['Kilometraje'];
            $Motor_desc = $row['Motor_desc'];
            $marca = $row['marca'];
            $frenos = $row['frenos'];
            $interiores = $row['interiores'];
            $quemacocos = $row['quemacocos'];
            $year = $row['year'];
            $color = $row['color'];
            $electrico = $row['electrico'];
            $transmision = $row['transmision'];
            $traccion = $row['traccion'];
            $imagenes = json_decode($row['imagenes']);

            $data [] = array(
                "id" => $id,
                "precio" => $precio,
                "modelo" => $modelo,
                "description" => $description,
                "cilindraje" => $cilindraje,
                "Kilometraje" => $Kilometraje,
                "Motor_desc" => $Motor_desc,
                "Marca" => $marca,
                "Frenos" => $frenos,
                "interiores" => $interiores,
                "quemacocos" => $quemacocos,
                "year" => $year,
                "color" => $color,
                "electrico" => $electrico,
                "transmision" => $transmision,
                "traccion" => $traccion,
                "imagenes" => $imagenes
            );
        }
        mysqli_close($connect->conexion);
        return json_encode($data);
    }

}