<?php
namespace Admin\Controller;

/**
 * 客房设置
 * @author qxn 
 *
 */
class GuestRoomSetController extends AdminController{
	protected $Guest_Room_Set;
	
	public function _initialize(){
		parent::_initialize();
		$this->Guest_Room_Set = D('Guest_room_set');
		$this->assign('Guest_Room_Set_active','active open');
	}
	
	public function index(){
		$list = $this->lists($this->Guest_Room_Set);
		Cookie('__forward__',$_SERVER['REQUEST_URI']);
		$this->assign('Guest_Room_Set_index','active');
		$this->assign('_list', $list);
		$this->meta_title = '客房登记列表';
		$this->display();
	}
	
	public function edit(){
		$id = I('get.id','');
		if(empty($id)){
			$this->error('参数不能为空！');
		}
		$fix    = C("DB_PREFIX");
		$Guest_room_set = "Guest_room_set";
		$Guest_room_type = "Guest_room_type";
		//$list = M("$Guest_room_set")->join("INNER JOIN {$fix}{$Guest_room_type} ON  {$fix}{$Guest_room_set}.type_name = {$fix}{$Guest_room_type}.id")
		//						  ->field("{$fix}{$Guest_room_set}.*")->select();
		$FindOne = $this->Guest_Room_Set->find($id);
		$this->assign('Guest_Room_Set_index','active');
		$this->assign('info', $FindOne);
		$this->meta_title = '客房类型编辑';
		$this->display();
	}	
	
    public function update(){
    	$res = $this->Guest_Room_Set->update();
    	if(!$res){
    		$this->error($this->Guest_Room_Set->getError());
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
    	$res = $this->Guest_Room_Set->where(array('id'=>array('in',$ids)))->delete();
    	if(!$res){
    		$this->error($this->Guest_Room_Set->getError());
    	}else{
    		$this->success('删除成功！');
    	}
    }	
	
    public function add(){
    	$this->assign('Guest_Room_Set_index','active');
    	$this->meta_title = '新增房态类型';
    	$this->display("edit");
    }	
	
	
	
	
	
	
	
}