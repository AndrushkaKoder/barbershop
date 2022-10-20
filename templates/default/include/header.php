<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?=$this->set['name']?></title>
    <?php $this->getStyles()?>

</head>

<body>
<header class="header">
    <div class="wrapper">
        <div class="header_menu">


            <ul>
                <?php if(!empty($this->menu['catalog'])):?>
                    <li><a href="#info_yakor">ИНФОРМАЦИЯ</a></li>
                    <li><a href="#news_yakor">НОВОСТИ</a></li>
                    <li><a href="/price">ПРАЙС-ЛИСТ</a></li>
                    <li><a href="/catalog">КАТАЛОГ</a></li>
                    <li><a href="#contact_yakor">КОНТАКТЫ</a></li>
                <?php endif;?>
            </ul>
            <button type="button" class="login">
                <img src="<?=PATH.TEMPLATE?>assets/img/login.png" alt="#" width="15px" height="15px">
                ВХОД</button>
        </div>
    </div>

</header>