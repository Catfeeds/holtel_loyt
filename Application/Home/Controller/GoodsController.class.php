<?php
namespace Home\Controller;
use Common\Api\Category;
class GoodsController extends HomeController {
	/* 文档模型频道页 */
	public function index(){
		/* 分类信息 */
		$category = $this->category();
	
		//频道页只显示模板，默认不读取任何内容
		//内容可以通过模板标签自行定制
	
		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->display($category['template_index']);
	}
	
	/* 文档模型列表页 */
	public function lists($p = 1, $id = 0){
		$active = I('category');
		/* 分类信息 */
		$category = $this->category();
		/* 获取当前分类列表 */
		$Document = D('Document');
		$list = $Document->page($p, $category['list_row'])->lists($category['id'], '`id` ASC');
		$listnew = D('Category')->where(array('pid'=>$category['id'], 'status'=>array('gt', 0), 'allow_publish'=>2))->order('`sort` ASC')->select();//获取所有子分类
		if((false == $list) && !$listnew){
			$this->assign('maxinfo', '');
			$this->assign('list_new_no_document', '0');
			$this->assign('category', $category);
			$this->assign('Documentlist', $list);
			$this->assign('active', $active);
			$this->display($category['template_lists']);
			return;
		}
		if($id && is_numeric($id)){
			$info = $Document->detail($id);
			if(!$info){
				$this->error($Document->getError());
			}
			$this->assign('id', I('id'));
			$this->assign('info', $info);
		}else{
			$maxid = $Document->where(array('category_id'=>$category['id'], 'status'=>array('gt', 0), 'allow_publish'=>2))->field('id')->find();
			$info = $Document->detail($maxid['id']);
	
			if(!$info && !$listnew){
				$this->error($Document->getError());
			}
			$this->assign('maxid', $maxid['id']);
			$this->assign('maxinfo', $info);
		}
		if($category['id']){
			$listnew = D('Category')->where(array('pid'=>$category['id'], 'status'=>array('gt', 0), 'allow_publish'=>2))->order('`sort` ASC')->select();//获取所有子分类
			$this->assign('listnew', $listnew);
			if($listnew){
				if(!I('category_id')){
					$AllChildsId = Category::getChildsId(D('Category')->where(array('status'=>array('gt', 0), 'allow_publish'=>2))->select(), $category['id']);
					$list_new_no_document = $Document->page($p, $category['list_row'])->lists(implode(',', $AllChildsId), '`id` ASC');
					$this->assign('list_new_no_document', $list_new_no_document);
					$this->assign('AllChildsId', implode(',', $AllChildsId));
				}
			}
		}
		if(I('category_id')){
			$nowcategory = D('Category')->where(array('id'=>I('category_id'), 'status'=>array('gt', 0), 'allow_publish'=>2))->field('id, title, list_row')->order('`sort` ASC')->find();
			$this->assign('nowcategory', $nowcategory);//获取当前分类
			$list_new_document = $Document->page($p, $nowcategory['list_row'])->lists(I('category_id'), '`id` ASC');
			$this->assign('category_id', I('category_id'));
			$this->assign('list_new_document', $list_new_document);
		}
		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('Documentlist', $list);
		$this->assign('active', $active);
		$this->display($category['template_lists']);
	}

	/* 文档模型详情页 */
	public function detail($id = 0, $p = 1){
		/* 标识正确性检测 */
		if(!($id && is_numeric($id))){
			$this->error('文档ID错误！');
		}
	
		/* 页码检测 */
		$p = intval($p);
		$p = empty($p) ? 1 : $p;
	
		/* 获取详细信息 */
		$Document = D('Document');
		$info = $Document->detail($id);
		if(!$info){
			$this->error($Document->getError());
		}
	
		/* 分类信息 */
		$category = $this->category($info['category_id']);
	
		/*获取顶级分类,限二级*/
		$catesuper = D('category')->where(array('id' => $category['pid'], 'pid'=>0))->select();
		$listnew =  D('Category')->where(array('pid'=>$catesuper[0]['id'], 'status'=>array('gt', 0)))->select();
	
		/* 获取模板 */
		if(!empty($info['template'])){//已定制模板
			$tmpl = $info['template'];
		} elseif (!empty($category['template_detail'])){ //分类已定制模板
			$tmpl = $category['template_detail'];
		} else { //使用默认模板
			$tmpl = 'Article/'. get_document_model($info['model_id'],'name') .'/detail';
		}
		/* 更新浏览数 */
		$map = array('id' => $id);
		$Document->where($map)->setInc('view');//默认view + 1
	
		/* 模板赋值并渲染模板 */
		$this->assign('category', $category);
		$this->assign('info', $info);
		$this->assign('page', $p); //页码
		$this->assign('listnew', $listnew);
		$this->assign('catesuper', $catesuper);
		$this->assign('detail_active', $catesuper[0]['name']);
		$this->assign('active',1);
		$this->display($tmpl);
	}
	
	/* 文档分类检测 */
	private function category($id = 0){
		/* 标识正确性检测 */
		$id = $id ? $id : I('get.category', 0);
		//echo $id;die();
		if(empty($id)){
			$this->error('没有指定文档分类！');
		}
	
		/* 获取分类信息 */
		$category = D('Category')->info($id);
		//$listnew = D('Category')->where(array('pid'=>$id, 'status'=>array('gt', 0)))->select();//获取所有子分类
		if($category && 1 == $category['status']){
			switch ($category['display']) {
				case 0:
					$this->error('该分类禁止显示！');
					break;
					//TODO: 更多分类显示状态判断
				default:
					return $category;
			}
		} else {
			$this->error('分类不存在或被禁用！');
		}
	}
}