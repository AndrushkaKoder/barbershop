<?php
/**
 * Created by PhpStorm.
 * User: developer
 * Date: 04.02.2019
 * Time: 18:10
 */

namespace core\base\controller;


use core\base\exceptions\RouteException;
use core\base\model\UserModel;
use core\base\settings\Settings;


abstract class BaseController
{

    use \core\base\controller\BaseMethods;

    protected $header;
    protected $content;
    protected $footer;
    protected $page;

    protected $errors;

    protected $controller;
    protected $inputMethod;
    protected $outputMethod;
    protected $parameters;

    protected $template;
    protected $styles;
    protected $scripts;

    protected $userId;
    protected $data;
    protected $ajaxData;

    public function route(){

        $controller = str_replace('/', '\\', $this->controller);

        try{

            $object = new \ReflectionMethod($controller, 'request');

            $args = [
                'parameters' => $this->parameters,
                'inputMethod' => $this->inputMethod,
                'outputMethod' => $this->outputMethod
            ];

            $object->invoke(new $controller, $args);
        }
        catch (\ReflectionException $e){
            throw new RouteException($e->getMessage());
        }

    }

    public function request($args){

        $this->parameters = $args['parameters'];

        $inputData = $args['inputMethod'];
        $outputData = $args['outputMethod'];

        $data = $this->$inputData();

        if(method_exists($this, $outputData)){

            $page = $this->$outputData($data);
            if($page) $this->page = $page;

        }elseif($data){
            $this->page = $data;
        }


        if($this->errors){
            $this->writeLog($this->errors);
        }

        $this->getPage();
    }

    protected function render($path = '', $parameters = []){

       extract($parameters);

       if(!$path){

           $class = new \ReflectionClass($this);

           $space = str_replace('\\', '/', $class->getNamespaceName() . '\\');
           $routes = Settings::get('routes');

           if($space === $routes['user']['path']) $template = TEMPLATE;
                else $template = ADMIN_TEMPLATE;

           $path = $template . $this->getController();
       }

       ob_start();

       if(!include $path . '.php') throw new RouteException('Отсутствует шаблон - '.$path);

       return ob_get_clean();

    }

    protected function getPage(){

        if(is_array($this->page)){
            foreach ($this->page as $block) echo $block;
        }else{
            echo $this->page;
        }
        exit;

    }

    protected function init($admin = false){

        if(!$admin){
            if(USER_CSS_JS['styles']){
                foreach(USER_CSS_JS['styles'] as $item)
                    $this->styles[] = (!preg_match('/^\s*https?:\/\//i', $item) ? PATH . TEMPLATE : '') . trim($item, '/');
            }

            if(USER_CSS_JS['scripts']){
                foreach(USER_CSS_JS['scripts'] as $item)
                    $this->scripts[] = (!preg_match('/^\s*https?:\/\//i', $item) ? PATH . TEMPLATE : '') . trim($item, '/');
            }
        }else{
            if(ADMIN_CSS_JS['styles']){
                foreach(ADMIN_CSS_JS['styles'] as $item)
                    $this->styles[] = (!preg_match('/^\s*https?:\/\//i', $item) ? PATH . ADMIN_TEMPLATE : '') . trim($item, '/');
            }

            if(ADMIN_CSS_JS['scripts']){
                foreach(ADMIN_CSS_JS['scripts'] as $item)
                    $this->scripts[] = (!preg_match('/^\s*https?:\/\//i', $item) ? PATH . ADMIN_TEMPLATE : '') . trim($item, '/');
            }
        }

    }

    protected function checkAuth($type = false){

        if(!($this->userId = UserModel::instance()->checkUser(false, $type))){

            $type && $this->redirect(PATH);

        }

        if(property_exists($this, 'userModel'))
            $this->userModel = UserModel::instance();

    }

}