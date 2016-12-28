<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;

/**
 * 模型管理控制器
 * @author qxn
 */
class GoodController extends AdminController {
	public function _initialize(){
		parent::_initialize();
		$this->assign('Model_active','active open');
	}
    /**
     * 模型管理首页
     * @author qxn
     */
    public function index(){
        //$list = $this->lists('Good');
    	$fix    = C("DB_PREFIX");
    	$Good = "Good";
    	$Good_type = "Good_type";
        $list = M($Good)->join("INNER JOIN {$fix}{$Good_type} ON {$fix}{$Good}.type = {$fix}{$Good_type}.id")->field("{$fix}{$Good}.*, {$fix}{$Good_type}.type")->select();
		//print_r($list);
        //int_to_string($list);
        // 记录当前列表页的cookie
        Cookie('__forward__',$_SERVER['REQUEST_URI']);
        $this->assign('Model_index','active');
        $this->assign('_list', $list);
        //print_r($list);
        $this->meta_title = '物品登记';
        $this->display();
    }
    
    /**
     * 商品类别
     * @author qxn
     */
    public function type(){
    	$list = $this->lists('Good_type');
    	int_to_string($list);
    	// 记录当前列表页的cookie
    	Cookie('__forward__',$_SERVER['REQUEST_URI']);
    	$this->assign('Good_type','active');
    	$this->assign('_list', $list);
    	//print_r($list);
    	$this->meta_title = '物品登记';
    	$this->display();
    }

    /**
     * 新增页面初始化
     * @author qxn
     */
    public function add(){
        //获取所有的模型
        $type_list = $this->lists('Good_type','' ,'' ,'id, type');
        $this->assign('type_list', $type_list);
        $this->assign('Model_index','active');
        $this->meta_title = '新增商品';
        $this->display("edit");
    }

    public function add_type(){
        //获取所有的模型
        $typelist = $this->lists('Good','' ,'' ,'type');
        foreach ($typelist as $k => $v){
        	$type_list[] = $v['type'];
        }
        $this->assign('type_list', array_unique($type_list));
        $this->assign('Good_type','active');
        $this->meta_title = '新增商品类别';
        $this->display("edit_type");
    }
    /**
     * 编辑页面初始化
     * @author qxn
     */
    public function edit(){
        $id = I('get.id','');
        if(empty($id)){
            $this->error('参数不能为空！');
        }
        /*获取一条记录的详细数据*/
        $Model = M('Good');
        $Good_type = M('Good_type')->field('id, type')->select();
        $data = $Model->field(true)->find($id);
        
        $type_list = $this->lists('Good_type','' ,'' ,'id, type');
        if(!$data){
            $this->error($Model->getError());
        }
        $this->assign('Model_index','active');
        $this->assign('info', $data);
        $this->assign('Good_type', $Good_type);
        $this->assign('type_list', $type_list);
        $this->meta_title = '物品编辑';
        $this->display();
    }
    
    /**
     * 删除一条数据
     * @author huajie <banhuajie@163.com>
     */
    public function del(){
        if(IS_GET){
        	$ids = I('get.ids');
        	$ids = explode(',', $ids);
        }
        if(IS_POST){
        	$ids = I('post.ids');
        }
        //print_r(array('in',$ids));die();
        empty($ids) && $this->error('参数不能为空！');
        $res = M('Good')->where(array('id'=>array('in',$ids)))->delete();
        if(!$res){
            $this->error(M('Good')->getError());
        }else{
            $this->success('删除成功！');
        }
    }

    /**
     * 更新一条数据
     * @author qxn
     */
    public function update(){
        $res = D('Good')->update();
        if(!$res){
            $this->error(D('Good')->getError());
        }else{
            $this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
        }
    }
    
    public function update_type(){
    	$res = D('Good_type')->update();
    	if(!$res){
    		$this->error(D('Good_type')->getError());
    	}else{
    		$this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
    	}
    }

    /**
     * 生成一个模型
     * @author huajie <banhuajie@163.com>
     */
    public function generate(){
        if(!IS_POST){
            //获取所有的数据表
            $tables = D('Model')->getTables();
			//print_r($tables);
            $this->assign('Model_index','active');
            $this->assign('tables', $tables);
            $this->meta_title = '生成频道';
            $this->display();
        }else{
            $table = I('post.table');
            empty($table) && $this->error('请选择要生成的数据表！');
            $res = D('Model')->generate($table,I('post.name'),I('post.title'));
            if($res){
                $this->success('生成频道成功！', U('index'));
            }else{
                $this->error(D('Model')->getError());
            }
        }
    }
}
