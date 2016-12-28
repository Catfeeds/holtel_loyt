<?php
namespace Admin\Controller;
class LoginController extends AdminController{
	public function _initialize(){
		$this->assign('login_active','active open');
	}
	
	public function login(){
		$this->display();
	}
}