<?php

namespace src\app\Controllers;
use src\app\Model\MainModel;

class GetData {

    function getAll(){
        $query = MainModel::getAll();
        echo json_encode($query);
    }

}
