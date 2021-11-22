<?php
require 'autoload.php';

if(!isset($_GET['controller']))
{
  echo 'La pagina que buscas no existe 1';
  exit();
}

$controllerName ='Controllers\\'.$_GET['controller'].'Controller';

if(!class_exists($controllerName))
{
  echo 'La pagina que buscas no existe 2';
  exit();
}

$controller = new $controllerName;
if(!isset($_GET['action']) && !method_exists($controller, $_GET['action']))
{
  echo 'La pagina que buscas no existe 3';
  exit();
}

$action = $_GET['action'];
$controller->$action();