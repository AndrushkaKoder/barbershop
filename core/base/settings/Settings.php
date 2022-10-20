<?php
/**
 * Created by PhpStorm.
 * User: developer
 * Date: 31.01.2019
 * Time: 16:01
 */

namespace core\base\settings;


use core\base\controller\Singleton;

class Settings
{

    use Singleton;

    private $routes = [
        'admin' => [
            'alias' => 'admin',
            'path' => 'core/admin/controller/',
            'hrUrl' => false,
            'routes' => [

            ]
        ],
        'settings' => [
            'path' => 'core/base/settings/'
        ],
        'plugins' => [
            'path' => 'core/plugins/',
            'hrUrl' => false,
            'dir' => false
        ],
        'user' => [
            'path' => 'core/user/controller/',
            'hrUrl' => true,
            'routes' => [

            ]
        ],
        'default' => [
            'controller' => 'IndexController',
            'inputMethod' => 'inputData',
            'outputMethod' => 'outputData'
        ]
    ];

    private $expansion = 'core/admin/expansion/';

    private $messages = 'core/base/messages/';

    private $defaultTable = 'settings';

    private $formTemplates = PATH . 'core/admin/view/include/form_templates/';

    private $projectTables = [
        'catalog' => ['name' => 'Каталог'],
        'settings' => ['name' => 'Настройки системы'],
    ];

    private $templateArr = [
        'text' => ['name', 'phone', 'email', 'alias', 'external_alias', 'sub_title', 'number_of_years', 'discount', 'price'],
        'textarea' => ['keywords', 'content', 'address', 'description', 'address', 'short_content'],
        'radio' => ['visible', 'show_top_menu', 'hit', 'sale', 'new', 'hot'],
        'checkboxlist' => ['filters'],
        'select' => ['menu_position', 'parent_id'],
        'img' => ['img', 'main_img', 'img_years', 'promo_img'],
        'gallery_img' => ['gallery_img', 'new_gallery_img']
    ];

    private $fileTemplates = ['img', 'gallery_img'];

    private $translate = [
        'name' => ['Название', 'Не более 100 символов'],
        'keywords' => ['Ключевые слова', 'Не более 70 символов'],
        'content' => ['Описание'],
        'description' => ['SEO описание'],
        'phone' => ['Телефон'],
        'email' => ['Email'],
        'address' => ['Адрес'],
        'alias' => ['Ссылка ЧПУ'],
        'show_top_menu' => ['Показывать в верхнем меню'],
        'external_alias' => ['Внешняя ссылка'],
        'sub_title' => ['Подзаголовок'],
        'short_content' => ['Краткое описание'],
        'img_years' => ['Изображение количества лет на рынке'],
        'number_of_years' => ['Количество лет на рынке'],
        'hit' => ['Хит продаж'],
        'sale' => ['Акция'],
        'new' => ['Новинка'],
        'hot' => ['Горячее предложение'],
        'discount' => ['Скидка'],
        'price' => ['Цена'],
        'promo_img' => ['Изображение для главной страницы']
    ];

    private $radio = [
        'visible' => ['Нет', 'Да', 'default' => 'Да'],
        'show_top_menu' => ['Нет', 'Да', 'default' => 'Да'],
        'hit' => ['Нет', 'Да', 'default' => 'Нет'],
        'sale' => ['Нет', 'Да', 'default' => 'Нет'],
        'new' => ['Нет', 'Да', 'default' => 'Нет'],
        'hot' => ['Нет', 'Да', 'default' => 'Нет'],
    ];

    private $rootItems = [
        'name' => 'Корневая',
        'tables' => ['articles', 'filters', 'test', 'catalog']
    ];

    private $manyToMany = [
        'goods_filters' => ['goods', 'filters'] //'type' => 'child' || 'root'
    ];

    private $blockNeedle = [
        'vg-rows' => [],
        'vg-img' => ['img', 'main_img', 'img_years', 'number_of_years', 'promo_img'],
        'vg-content' => ['content']
    ];

    private $validation = [
        'name' => ['empty' => true, 'trim' => true],
        'price' => ['int' => true],
        'discount' => ['int' => true],
        'login' => ['empty' => true, 'trim' => true],
        'password' => ['crypt' => true, 'empty' => true],
        'keywords' => ['count' => 70, 'trim' => true],
        'description' => ['count' => 160, 'trim' => true],
    ];

    static public function get($property){
        return self::instance()->$property;
    }


    public function clueProperties($class){

        $baseProperties = [];

        foreach($this as $name => $item){
            $property = $class::get($name);

            if(is_array($property) && is_array($item)){

                $baseProperties[$name] = $this->arrayMergeRecursive($this->$name, $property);
                continue;
            }

            if(!$property) $baseProperties[$name] = $this->$name;
        }

        return $baseProperties;
    }

    public function arrayMergeRecursive(){

        $arrays = func_get_args();

        $base = array_shift($arrays);

        foreach($arrays as $array){
            foreach($array as $key => $value){
                if(is_array($value) && is_array($base[$key])){
                    $base[$key] = $this->arrayMergeRecursive($base[$key], $value);
                }else{
                    if(is_int($key)){
                        if(!in_array($value, $base)) array_push($base, $value);
                        continue;
                    }
                    $base[$key] = $value;
                }
            }
        }

        return $base;

    }

}