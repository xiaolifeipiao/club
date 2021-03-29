<?php 
namespace app\admin\controller;
use think\Request;
use think\Controller;

use app\admin\model\Applyclub;
use app\admin\model\User;
use app\admin\model\Myapply;
use app\admin\model\Activity;
use app\admin\model\Club;
use app\admin\model\Clubtype;
use app\admin\model\Article;



use think\Db;
use think\Session;
use think\Loader;


/**
* 
*/
class Index extends Controller
{
	public function __construct()
	{   parent::__construct();
	    // $this->userid = 1;  
      // 
	}    
      
      public  function  saveBook(){

            $reques = Request::instance();
            $v0=$reques->post('b_name');
            $v1=$reques->post('b_isbn');
            $v2=$reques->post('b_version'); 
           // $publisher=$reques->post('publisher');//发布者
          //  $sname=$reques->post('sname');
            $str="";
             // $re=User::get(['Nickname'=>$publisher]);
             //  $r=Club::get(['Club_name'=>$sname]); 
             //  $e=User::get([''=>])
             //  if( !$re &&  !$r  &&  $e){
             //    $this->error("社团不存在或不存在此发布者或您不是改社团成员");
             //  }
             //   // 获取表单上传文件 
              
           $files=request()->file('imgs');
              // 判断是否有上传的图片
               if($files != null) {
                  
                 
               
               foreach($files as $file){
                  // 移动到框架应用根目录/public/uploads/ 目录下
                  $info = $file->move(ROOT_PATH.'public'.DS.'uploads');
                  $date[]=$info->getFilename(); 

                       // 输出 jpg  
                     //  $info->getExtension();
                       // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                        //$info->getSaveName();
                       // 输出 42a79759f284b767dfcb2a0197904287.jpg
                      //  $info->getFilename(); 
                 
               }
                
              $str= implode(';',$date);

            }
             
              //拼接成一个字符串url
             
            $data = [   //接受传递的参数                  
                 // 'User_id' =>$re->User_id,
                  //'Club_id'=>$r->Club_id,
                  'Article_name'=>$v0,
                  'Title' =>$v1,
                  'Content' =>$v2,
                  'Photo' =>$str
                 ];
                          
            $rowid=Db::table('b_article')->insert($data);
            if($rowid){
           $this->success("发布成功");}
           else{
            $this->success("发布失败");}
           // return  $rowid;
      }


      public   function  savaclub(){
         
         $clubid=($_POST['clubid']==""?"":$_POST['clubid']);
         $flag=($_POST['flag']==""?"":$_POST['flag']);
            
         $res=Db::table('b_club')->where('Club_id',$clubid)->update(['flag'=>$flag]);
         if($res){
          return  true;
          }
         return  false;
      }
      public  function   GetclubList(){
            $result=Db::table('b_club')
            ->alias('a')
            ->join(['b_clubtype'=>'b'],'a.CT_id=b.CT_id','LEFT')
            ->select();
                    $data='';
               
                foreach ($result as $row){
                        if($row['flag']==-2){
                        $data.='["'.$row['Club_name'].'","'.$row['CT_title'].'","'.$row['President'].'","未通过","'.$row['Club_id'].'","<a href=\"#\" class=\"btn btn-info btn-xs edit\"><i class=\"fa fa-edit\"></i>通过</a>"],';
                        }else if($row['flag']==1){
                         $data.='["'.$row['Club_name'].'","'.$row['CT_title'].'","'.$row['President'].'","通过","'.$row['Club_id'].'","<a  href=\"#\"  class=\"btn btn-danger btn-xs delete\"><i class=\"fa fa-trash-o\"></i>取消</a>"],';
                        }
                }
            $data=$data==''?$data:substr($data,0,-1);
           echo  '{"aaData":['.$data.']}'; 



      }
     

    
      
                 //连接查询
              // $result=Db::table('b_myapply')
              // ->alias('a')
              // ->join(['b_activity'=>'b'],'a.Activity_ID=b.Activity_ID')
              // ->where(["Club_id"=>Session::get('cid')])
              // ->select();
                 
     



  public  function  Saveuser(){
     
      $val0=$_POST['val0'];
      $val1=$_POST['val1'];
      $val2=$_POST['val2']; 
      $val3=$_POST['val3']; 
      $flag = $_POST['flag'];
      $firsttd2=$_POST['firsttd2'];
      $rowid=false;
      
       if($val0==""){
        return  $rowid;
       }
        $res = Db::table('b_user')->where(['Nickname'=>$val0])->select(); 
         if($res){
            return  $rowid;
         }
         $re=Club::get(['Club_name'=>$val3]);

         if($re){
          $val4=$re->Club_id;
         }else{
          $val4=-1;
         }
      if($flag==0){
        //新增
       
          $data = [   //接受传递的参数
        'Nickname'  =>$val0,
        'Club_id'=>$val4,
        'Password'     =>$val1,
        'User_role'    =>1
          ];
                
          $rowid=Db::table('b_user')->insert($data);
                 
                
      }else if($flag==1){

          if($val2=="社长"||$val2==1)
          {
            $val5=1;
          }else{
             $val5=0;
          }
        $rowid=Db::table('b_user')->where('User_id',$firsttd2)->update(['Nickname'=>$val0,'Club_id'=>$val4,'Password'=>$val1,'User_role'=>$val5]);
      }
             if($rowid)
                {  return true;}
                else
                { return false;}
      //echo $rowid;
  }

    public  function  Deleteuser(){
        $rowid=$_POST['rowid'];
      $result=Db::table('b_user')->where(['User_id'=>$rowid])->delete();
      if($result)
      return true;
      else
      return  false; 
    }


      public  function    GetuserList(){
       //$role="成员";
       // $result= Db::table('b_user')->where(['Club_id'=>Session::get('cid'),'User_role'=>0])->select();
        
        // $result= Db::table('b_user')->where(['User_role'=>1])->select();
        //  $role="社长";
      
       $result=Db::table('b_user')
       ->alias('a')
       ->join(['b_club'=>'b'],'a.Club_id=b.Club_id','LEFT')
       ->where('User_role','between','0,1')
       ->select();
       
           $data='';
        foreach ($result as $row){
          if($row['User_role']==0){
            $role="成员";
          }else{
            $role="社长";
          }

          $data.='["'.$row['Nickname'].'","'.$row['Password'].'","'.$role.'","'.$row['Club_name'].'","'.$row['User_id'].'","<a href=\"#\" class=\"btn btn-info btn-xs edit\"><i class=\"fa fa-edit\"></i> 编辑</a><a href=\"#\" class=\"btn btn-danger btn-xs delete\"><i class=\"fa fa-trash-o\"></i> 删除</a>"],';
          }

         $data=$data==''?$data:substr($data,0,-1);
         echo  '{"aaData":['.$data.']}';  
      
         }



        	public function login(){
            	$request = Request::instance();
            	Session::set('name',$request->post('name'));
            	Session::set('psd',$request->post('password'));
            	
            	$res =User::get(['Nickname'=>Session::get('name'),'Password'=>Session::get('psd')]);
            	
            	 
                  if(!$res){
                   return $this->fetch("index");
                   }
                  Session::set('uname',$res->name);
                   
                if($res->User_role=="管理员"){
                   $this->assign('flag',1);
                   $this->assign('tname',Session::get('uname'));
                	return $this->fetch('page1');
                }
                else{
                	return $this->fetch("index");
        	      }   
           }

    	public function index(){    	     
            
    		    return $this->fetch('index');
    		
    	}
      public function index1(){
           $this->assign('flag',1);
           $this->assign('tname',Session::get('uname'));
           return $this->fetch('page1');
      }
    	
      public function index2(){      
           $this->assign('flag',2);
           $this->assign('tname',Session::get('uname'));
           return $this->fetch('page2');
      }
    	public function index3(){
           $this->assign('flag',3);
           $this->assign('tname',Session::get('uname'));
           return $this->fetch('page3');
      }
     public function index4(){
           $this->assign('flag',4);
           $this->assign('tname',Session::get('uname'));

           $res=Db::table('b_myapply')
          ->alias('a')
          ->join(['b_activity'=>'b'],'a.Activity_ID=b.Activity_ID','LEFT')            
          ->field('flag,count(User_id) as s,Activity_title')
          ->group('a.Activity_ID')
          ->where('flag = 1')
          //->having('flag = 1')
          ->order('s desc')
          ->limit(6)
          ->select();
           if($res){
               $i=1;
             foreach ($res as $row){
               $this->assign('s'.$i,$row['Activity_title']);
               $this->assign('j'.$i,$row['s']);
                $i++;
              }
           }
          else{
          
          for($i=1;$i<7;$i++){            
          $this->assign('s'.$i,rand(100,200));
          $this->assign('j'.$i,rand(1,15));}
         }

           return $this->fetch('page4');
      }
//,'T_id'=>Session::get('id')
//{$Think.session.Name}  获取值
}
?>
