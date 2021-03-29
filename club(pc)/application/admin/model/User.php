<?php 
namespace app\admin\model;
use think\Model;
/**
* 命名：
表名为  前缀+名称  例如  b_teacher ，model类名为：Teacher.php 
// b_term_info ,类名：TermInfo.php
*/
class User extends Model
{
	//自动写入create_time ,update_time
	//protected $autoWriteTimestamp = true;
	//protected $createTime ='Create_time';
	//protected $updateTime = false;
	//protected $deleteTime = false;
	public function getUserroleAttr($val){
		switch ($val) {
			case '0':
				return '成员';
				break;
			case '1':
				return '社长';
				break;
			case '2':
				return '管理员';
				break;
			default:
				return '成员';
				break;
		}
	}

	


}


?>