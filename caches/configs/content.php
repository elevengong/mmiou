<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-07-08
 * Time: 下午 02:59
 */
return array(
    'statics_path'  =>  '/statics/huhangnet/',
    //手机站配置
    'mobile_tpl_suffix'=>'_m', //手机站模板目录
    'mobile_domain_prefix'=>'m',   //手机站域名前缀
    'mobile_dir'=>'m',   //手机站所在目录，动态和静态通用
    'mobile_html'=>'',   // todo 手机站是否生成静态
    'mobile_liks_type'=>2,    //0动态 1静态 2伪静态
    //hh_catpos设置
    'crumbs'=>array(
        //需要修改的栏目链接，其中键为指定的栏目id，值，如果为__one__链接到此栏目下第一下链接，如果为数组，链接到指定数字的栏目id,如果为链接，则直接显示链接
        'catlinks'=>array(
            '1'=>'__one__'
        ),
        //noshow为不显示的栏目id集合
        'noshow'=>array(0),
    ),

);