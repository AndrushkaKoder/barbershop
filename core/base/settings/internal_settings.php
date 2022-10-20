<?php

defined('VG_ACCESS') or die('Access denied');

const MS_MODE = false;

const TEMPLATE = 'templates/default/';
const ADMIN_TEMPLATE = 'core/admin/view/';
const UPLOAD_DIR = 'userfiles/';
const DEFAULT_IMGAGE_DIRECTORY = 'default_images';

const COOKIE_VERSION = '1.0.0';
const CRYPT_KEY = '-JaNdRgUkXp2s5v8-JaNdRgUkXp2s5v8-JaNdRgUkXp2s5v8-JaNdRgUkXp2s5v8-JaNdRgUkXp2s5v8-JaNdRgUkXp2s5v8-JaNdRgUkXp2s5v8-JaNdRgUkXp2s5v8';
const COOKIE_TIME = 6000;
const BLOCK_TIME = 3;

const END_SLASH = '/';
const QTY = 8;
const QTY_LINKS = 3;

const CART = 'cookie';

const ADMIN_CSS_JS = [
    'styles' => ['css/main.css'],
    'scripts' => [
        'js/frameworkfunctions.js', 'js/scripts.js', 'js/tinymce/tinymce.min.js',
        'js/tinymce/tinymce_init.js'
    ]
];

const USER_CSS_JS = [
    'styles' => [
        'assets/css/style.css',
        'assets/css/price.css',
        'assets/css/shop.css'
    ],
    'scripts' => [

    ]
];

use core\base\exceptions\RouteException;

function autoloadMainClasses($class_name){

    $class_name = str_replace('\\', '/', $class_name);

    if(!@include_once $class_name . '.php'){
        throw new RouteException('Не верное имя файла для подключения - '.$class_name);
    }

}

spl_autoload_register('autoloadMainClasses');