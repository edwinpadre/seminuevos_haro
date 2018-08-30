<?php
namespace src\app\Controllers;

class Connecta {
    public $conexion;
    private $error;

    /**
     * @param $hostname
     * @param $usuario
     * @param $password
     * @param $base
     */

    public function __construct() {

        $this -> hostname = $_ENV["HOST"];
        $this -> usuario = "root";
        $this -> password = $_ENV["PASSWORD"];
        $this -> base = $_ENV["DB"];

        if(!$this-> _connect()) {
            $this-> error = mysqli_error();
        } else {
            return true;
        }
    }

    private function _connect() {
        $this -> conexion = mysqli_connect($this->hostname,$this->usuario,$this->password);
        if ($this->conexion) {
            mysqli_select_db($this->conexion,$this->base);
            return true;
        } else {
            $this->error = mysqli_connect_error();
            return false;
        }
    }
}