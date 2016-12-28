<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Controller;
use OT\DataDictionary;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends HomeController {
	public function _initialize(){
		parent::_initialize();
	}
	//系统首页
    public function index(){
        $lists    = D('Document')->lists(null);
        $position_id = D('Document')->where(array('position'=>4, 'model_id'=>2,'status'=>array('gt', 0)))->order('`id` DESC')->field('id')->find();//首页推荐
        $position_list = D('Document')->detail($position_id['id']);
        $position_list['content'] = mb_substr($position_list['content'], 0, 200, 'utf-8');
        
        $category_name = M('category')->where(array('id'=>$position_list['category_id'], 'status'=>array('gt', 0)))->field('name')->find();
        $position_news_id = D('Document')->where(array('position'=>1, 'model_id'=>2,'status'=>array('gt', 0)))->order('`id` DESC')->field('id')->limit(0,2)->select();
        //首页新闻列表推荐
        foreach ($position_news_id as $k=>$v){
        	$arr_news_list[] = D('Document')->detail($v['id']);
        }
        
        //产品滚动
        $position_products_id = D('Document')->where(array('model_id'=>4,'status'=>array('gt', 0)))->order('`id` DESC')->limit(0,4)->field('id')->select();
        foreach ($position_products_id as $k=>$v){
        	$arr_products_list[] = D('Document')->detail($v['id']);;
        }
        //print_r($arr_products_list);      
        $this->assign('lists',$lists);//列表
        $this->assign('arr_news_list',$arr_news_list);
        $this->assign('arr_products_list',$arr_products_list);
        $this->assign('position_list', $position_list);
        $this->assign('category_name', $category_name);
        $this->assign('page',D('Document')->page);//分页
        $this->display();
    }

}