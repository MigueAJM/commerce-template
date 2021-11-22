<?php

function autoload($classname)
{
  include $classname.'.php';
}

spl_autoload_register('autoload');