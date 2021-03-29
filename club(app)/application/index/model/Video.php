<?php 
namespace app\index\model;
use think\Model;
/**
* 命名：
表名为  前缀+名称  例如  b_teacher ，model类名为：Teacher.php 
// b_term_info ,类名：TermInfo.php
*/
class Video extends Model
{
	//自动写入create_time ,update_time
	protected $autoWriteTimestamp = true;
	protected $createTime = 'Start_time';
	protected $updateTime = 'Update_time';
	protected $deleteTime = false;

}


?>