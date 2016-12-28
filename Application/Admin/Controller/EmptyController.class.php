<?php
namespace Admin\Controller;
use Admin\Controller\AdminController;
class EmptyController extends AdminController{
	public function _initialize(){
		parent::_initialize();
	}
    public function _empty(){
    	$this->error('['.CONTROLLER_NAME.']'.'控制器不存在');
    }
}