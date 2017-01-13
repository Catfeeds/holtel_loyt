<?php
namespace Admin\Controller;

/**
 * 客房类型
 * @author qxn 
 *
 */
class StateColourController extends AdminController{
	protected $State_colour;
	
	public function _initialize(){
		parent::_initialize();
		$this->State_colour = D('State_colour');
		$this->assign('Guest_room_type_active','active open');
	}
	
	public function index(){
		$list = $this->State_colour->select();
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->assign('State_colour_index','active');
		$this->assign('_list', $list);
		$this->meta_title = '状态颜色列表';
		$this->display();
	}
	
	public function edit(){
		$id = I('get.id','');
		if(empty($id)){
			$this->error('参数不能为空！');
		}
		$FindOne = $this->State_colour->find($id);
		$this->assign('State_colour_index','active');
		$this->assign('info', $FindOne);
		$this->meta_title = '客房类型编辑';
		$this->display();
	}	
	
    public function update(){
    	//print_r(I(''));die();
    	$res = $this->State_colour->update();
    	if(!$res){
    		$this->error($this->State_colour->getError());
    	}else{
    		$this->success($res['id']?'更新成功':'新增成功', Cookie('__forward__'));
    	}
    }
	
    public function del(){
    	if(IS_GET){
    		$ids = I('get.ids');
    		$ids = explode(',', $ids);
    	}
    	if(IS_POST){
    		$ids = I('post.ids');
    	}
    	empty($ids) && $this->error('参数不能为空！');
    	$res = $this->State_colour->where(array('id'=>array('in',$ids)))->delete();
    	if(!$res){
    		$this->error($this->State_colour->getError());
    	}else{
    		$this->success('删除成功！');
    	}
    }	
	
    public function add(){
    	$this->assign('State_colour_index','active');
    	$this->meta_title = '新增房态类型';
    	$this->display("edit");
    }	
	
	
	
	
	
	
	
}