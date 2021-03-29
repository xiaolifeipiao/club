<?php 
namespace app\me\model;
use think\Model;
/**
* 命名：
表名为  前缀+名称  例如  b_teacher ，model类名为：Teacher.php 
// b_term_info ,类名：TermInfo.php
*/
class User extends Model
{
	//自动写入create_time ,update_time
	protected $autoWriteTimestamp = true;
	protected $createTime = 'Start_time';
	protected $updateTime = 'Update_time';
	protected $deleteTime = false;
	// public function getTRoleAttr($val){
	// 	switch ($val) {
	// 		case '0':
	// 			return '教师';
	// 			break;
	// 		case '1':
	// 			return '管理员';
	// 			break;
			
	// 		default:
	// 			return '教师';
	// 			break;
	// 	}
	// }

	// public function setTpsdAttr($val,$data){
	// 	// return md5($val);
	// 	return $val.$data['T_role'];
	// }
	


}


?>