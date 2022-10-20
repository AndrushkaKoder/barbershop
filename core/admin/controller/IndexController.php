<?php

namespace core\admin\controller;


use core\base\controller\BaseController;
use core\admin\model\Model;
use core\base\model\Crypt;
use core\base\settings\Settings;

class IndexController extends BaseController
{

    protected function inputData(){

        $model = Model::instance();

        $redirect = PATH. Settings::get('routes')['admin']['alias'] . '/show';
        $this->redirect($redirect);

    }

}