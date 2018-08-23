<?php

include 'conexion.php';
include '../models/User.php';

class UserDao extends conexion

{
  protected static $cnx;

  private static function getConexion()
  {
    self::$cnx = conexion::conectar();
  }

  private static function desconectar()
  {
    self::$cnx = null;
  }


  public static function login ($user)
  {

     $query = ("SELECT id_user, name_user, email_user, pass_user, created_user
                FROM users
                WHERE email_user = :email_user");

          self:: getConexion();

          $email_user = $user->getEmail_user();
          $resultado = self::$cnx->prepare($query);
          $resultado->bindparam(":email_user, $email_user");
          $resultado->execute();
          $row = $resultado->fetch(PDO::FETCH_ASSOC);

          if(password_verify('erickm', $row['pass_user'])){
            return true;
          } else{
            echo "password o email invalido";
          }
  }
}
 ?>
