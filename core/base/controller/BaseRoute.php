<?php
/**
 * Created by PhpStorm.
 * User: developer
 * Date: 08.09.2019
 * Time: 15:20
 */

namespace core\base\controller;


class BaseRoute
{

    use Singleton, BaseMethods;

    public static function routeDirection(){

        if(self::instance()->isAjax()){

            exit((new BaseAjax())->route());

        }

        RouteController::instance()->route();

    }

}