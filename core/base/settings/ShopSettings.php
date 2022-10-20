<?php
/**
 * Created by PhpStorm.
 * User: developer
 * Date: 31.01.2019
 * Time: 16:34
 */

namespace core\base\settings;


class ShopSettings
{

    use BaseSettings;

    private $routes = [
        'plugins' => [
            'dir' => 'dir',
            'routes' => [
                'route1' => ['1', '2']
            ]
        ]
    ];

    private $templateArr = [
        'text' => ['price', 'short', 'name'],
        'textarea' => ['goods_content', [5]]
    ];




}