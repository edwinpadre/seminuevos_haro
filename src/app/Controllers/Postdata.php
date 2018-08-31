<?php
/**
 * Created by PhpStorm.
 * User: jorgerodriguez
 * Date: 8/21/18
 * Time: 7:14 PM
 */

namespace src\app\Controllers;
include ('Connecta.php');
use src\app\Model\MainModel;

class PostData {

    function createNewCar($params){
        $query = MainModel::createNew($params);
        return $query;
    }

    function searchQuery($param){
        $query = MainModel::search($param);
        echo $query;
    }

    function searchByTag($params){
       $query = MainModel::searchByTag($params);
       echo $query;
    }
}