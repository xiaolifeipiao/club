<?php
namespace app\common\controller;
use think\Request;
use think\Controller;


use think\Db;
use think\Session;
use think\Model;

class Index extends Controller
{
	public function __construct()
	{   parent::__construct();
	}
    public function getUserId(){
      $id=Session::get('USER_INFO_SESSION');
      return $id['User_id'];

    } 
    
    
}
