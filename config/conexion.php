<?php

class conexion{

  public static function conectar(){
  try{

    $cn = new PDO("mysql:host=localhost;dbname=scripwebBD", "root", "");

    return $cn
  } catch (Exception $ex){
    die ($ex->getMessage());
  }

 }
}

 ?>
