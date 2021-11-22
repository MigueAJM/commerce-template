<?php

namespace conf\Database;

use Exception;
use PDO;

class Database
{
  private $connectionParams;
  private $connection;

  public function __construct()
  {
    $this->connectionParams = [
      'dbname' => '',
      'user' => '',
      'password' => '',
      'host' => '',
    ];
    try{
      $this->connection = new PDO(
        "mysql:host=$this->connectionParams['host'];
        dbname=$this->$this->connectionParams['dbname']",
        $this->connectionParams['user'],
        $this->connectionParams['password']);
      $this->connection->query("SET NAMES 'utf8'");
    }catch(Exception $e){
      $message = "Error: $e->getMessage()";
      die($message);
    }
  }

  public function getConnection()
  {
    return $this->connection;
  } 
}