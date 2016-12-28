<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Home\Model;
use Think\Model;

/**
 * 文件模型
 * 负责文件的下载和上传
 */

class FileModel extends Model{
	/**
	 * 文件模型自动完成
	 * @var array
	 */
	protected $_auto = array(
		array('create_time', NOW_TIME, self::MODEL_INSERT),
	);

	/**
	 * 文件模型字段映射
	 * @var array
	 */
	protected $_map = array(
		'type' => 'mime',
	);

	/**
	 * 文件上传
	 * @param  array  $files   要上传的文件列表（通常是$_FILES数组）
	 * @param  array  $setting 文件上传配置
	 * @param  string $driver  上传驱动名称
	 * @param  array  $config  上传驱动配置
	 * @return array           文件上传成功后的信息
	 */
	public function upload($files, $setting, $driver = 'Local', $config = null){
		/* 上传文件 */
		$setting['callback'] = array($this, 'isFile');
		$Upload = new \Think\Upload($setting, $driver, $config);
		$info   = $Upload->upload($files);

		/* 设置文件保存位置 */
		$this->_auto[] = array('location', 'Ftp' === $driver ? 1 : 0, self::MODEL_INSERT);

		if($info){ //文件上传成功，记录文件信息
			foreach ($info as $key => &$value) {
				/* 已经存在文件记录 */
				if(isset($value['id']) && is_numeric($value['id'])){
					$value['path'] = substr($setting['rootPath'], 1).$value['savepath'].$value['savename'];	//在模板里的url路径
					continue;
				}

				$value['path'] = substr($setting['rootPath'], 1).$value['savepath'].$value['savename'];	//在模板里的url路径
				/* 记录文件信息 */
				if($this->create($value) && ($id = $this->add())){
					$value['id'] = $id;
				} else {
					//TODO: 文件上传成功，但是记录文件信息失败，需记录日志
					unset($info[$key]);
				}
			}
			return $info; //文件上传成功
		} else {
			$this->error = $Upload->getError();
			return false;
		}
	}

	/**
	 * 下载指定文件
	 * @param  number  $root 文件存储根目录
	 * @param  integer $id   文件ID
	 * @param  string   $args     回调函数参数
	 * @return boolean       false-下载失败，否则输出下载文件
	 */
	public function download($root, $id, $callback = null, $args = null){
		/* 获取下载文件信息 */
		$file = $this->find($id);
		if(!$file){
			$this->error = '不存在该文件！';
			return false;
		}

		/* 下载文件 */
		switch ($file['location']) {
			case 0: //下载本地文件
				$file['rootpath'] = $root;
				//print_r($file);die();
				return $this->downLocalFile($file, $callback, $args);
			case 1: //TODO: 下载远程FTP文件
				break;
			default:
				$this->error = '不支持的文件存储类型！';
				return false;

		}

	}

	/**
	 * 检测当前上传的文件是否已经存在
	 * @param  array   $file 文件上传数组
	 * @return boolean       文件信息， false - 不存在该文件
	 */
	public function isFile($file){
		if(empty($file['md5'])){
			throw new Exception('缺少参数:md5');
		}
		/* 查找文件 */
		$map = array('md5' => $file['md5']);
		return $this->field(true)->where($map)->find();
	}

	/**
	 * 下载本地文件
	 * @param  array    $file     文件信息数组
	 * @param  callable $callback 下载回调函数，一般用于增加下载次数
	 * @param  string   $args     回调函数参数
	 * @return boolean            下载失败返回false
	 */
	private function downLocalFile($file, $callback = null, $args = null){
		if(is_file($file['rootpath'].$file['savepath'].$file['savename'])){
			//echo $file['rootpath'].$file['savepath'].$file['savename'];die();
			//print_r($file);die();
			/* 调用回调函数新增下载数 */
			is_callable($callback) && call_user_func($callback, $args);//call_user_func — 把第一个参数作为回调函数调用
			//is_callable — 检测参数是否为合法的可调用结构
			//is_callable()可以加收另外一个参数：一个布尔值，如果将该参数设置为true，函数仅仅检查给定的方法或函数名称的语法是否正确，
			//而不检查其是否真正存在。method_exists()函数的参数为一个对象（或类名）和一个方法名，如果给定方法在对象的类中存在，则返回true
			/* 执行下载 */ //TODO: 大文件断点续传
			header("Content-Description: File Transfer");
			header('Content-type: ' . $file['type']);
			header('Content-Length:' . $file['size']);
			if (preg_match('/MSIE/', $_SERVER['HTTP_USER_AGENT'])) { //for IE
				header('Content-Disposition: attachment; filename="' . rawurlencode($file['name']) . '"');
				//string rawurldecode(string str) 将字符串编码成 URL专用格式
			} else {
				header('Content-Disposition: attachment; filename="' . $file['name'] . '"');
			}
			//Content-disposition 是 MIME 协议的扩展，MIME 协议指示 MIME 用户代理如何显示附加的文件
			readfile($file['rootpath'].$file['savepath'].$file['savename']);
			//readfile() 函数输出一个文件。 该函数读入一个文件并写入到输出缓冲。
			exit;
		} else {
			$this->error = '文件已被删除！';
			return false;
		}
	}

}
