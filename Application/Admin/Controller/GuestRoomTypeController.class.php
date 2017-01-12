<?php
namespace Admin\Controller;

/**
 * 客房类型
 * @author qxn 
 *
 */
class GuestRoomTypeController extends AdminController{
	protected $Guest_room_type;
	
	public function _initialize(){
		parent::_initialize();
		$this->Guest_room_type = D('Guest_room_type');
		$this->assign('Guest_room_type_active','active open');
	}
	
	public function index(){
		$list = $this->Guest_room_type->select();
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->assign('Guest_room_type_index','active');
		$this->assign('_list', $list);
		$this->meta_title = '客房类型列表';
		$this->display();
	}
	
	public function edit(){
		$id = I('get.id','');
		if(empty($id)){
			$this->error('参数不能为空！');
		}
		$FindOne = $this->Guest_room_type->find($id);
		$this->assign('Guest_room_type_index','active');
		$this->assign('info', $FindOne);
		$this->meta_title = '客房类型编辑';
		$this->display();
	}	
	
    public function update(){
    	$res = $this->Guest_room_type->update();
    	if(!$res){
    		$this->error($this->Guest_room_type->getError());
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
    	$res = $this->Guest_room_type->where(array('id'=>array('in',$ids)))->delete();
    	if(!$res){
    		$this->error($this->Guest_room_type->getError());
    	}else{
    		$this->success('删除成功！');
    	}
    }	
	
    public function add(){
    	$this->assign('Guest_room_type_index','active');
    	$this->meta_title = '新增房型';
    	$this->display("edit");
    }	
	
	
	
	
	
	
	
}