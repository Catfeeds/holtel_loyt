<?php

namespace Addons\Example;
use Common\Controller\Addon;

/**
 * 示列插件
 * @author 无名
 */

    class ExampleAddon extends Addon{

        public $info = array(
            'name'=>'Example',
            'title'=>'示列',
            'description'=>'这是一个临时描述',
            'status'=>1,
            'author'=>'无名',
            'version'=>'0.1'
        );

        public $admin_list = array(
            'model'=>'Example',		//要查的表
																'fields'=>'*',			//要查的字段
																'map'=>'',				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
																'order'=>'id desc',		//排序,
																'list_grid'=>array( 		//这里定义的是除了id序号外的表格里字段显示的表头名和模型一样支持函数和链接
													                'cover_id|preview_pic:封面',
													                'title:书名',
													                'description:描述',
													                'link_id|get_link:外链',
													                'update_time|time_format:更新时间',
													                'id:操作:[EDIT]|编辑,[DELETE]|删除'
													            ),
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }


    }