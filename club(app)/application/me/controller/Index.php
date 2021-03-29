<?php
namespace app\me\controller;

use app\extra\controller\Index as Test;
use think\Request;
use think\Controller;
use app\me\model\User;

use think\Db;
use think\Session;
use think\Model;

class Index extends Controller
{
	public function __construct()
	{   parent::__construct();
	}


    public function index()
     { 
        $userid=$this->getUserId();
        if($userid!=""){
            $this->assign('active',4);
           return $this->fetch('index');
        }
        else{
            $this->assign('active',4);
            return $this->fetch('login');
        }
        
    	$this->assign('active',4);
    	
        
    }
    public function login()
     {  
        $userid=$this->getUserId();
        if($userid!=""){
            $this->assign('active',4); 
           return $this->fetch('index');
        }
        else{
            $this->assign('active',4); 
            return $this->fetch('login');
        }
        
          
    }
    public function alterclub()
     {  
        return $this->fetch('person/alterclub');   
    }
    public function register()
     {  
        return $this->fetch('register');   
    }
    
    public function alterclubinfo()
     {  
        return $this->fetch('person/alterclubinfo');   
    }
    public function alterperson()
     {  
        return $this->fetch('alterperson');   
    }
    public function alterpassword()
     {  
        return $this->fetch('person/alterpassword');   
    }
     public function alterpersonname()
     {  
        return $this->fetch('person/alterpersonname');   
    }
   
    public function myrelease()
     {  
        return $this->fetch('myrelease');   
    }
    public function activity()
     {  
        return $this->fetch('person/activity');   
    }
    public function altersignature()
     {  
        return $this->fetch('person/altersignature');   
    }
    public function mymessage()
     {  
        return $this->fetch('mymessage');   
    }
     public function guanyu()
     {  
        return $this->fetch('person/guanyu');   
    }

    
    public function alterpersoncollege()
     {  
        return $this->fetch('person/alterpersoncollege');   
    }
    public function article()
     {  
        return $this->fetch('person/article');   
    }
     public function useragreement()
     {  
        return $this->fetch('person/useragreement');   
    }
    public function alterpersonmajor()
     {  
        return $this->fetch('person/alterpersonmajor');   
    }
    public function alterpersonlive()
     {  
        return $this->fetch('person/alterpersonlive');   
    }
    
     public function alterpersonimage()
     {  
        return $this->fetch('person/alterpersonimage');   
    }
    public function alterpersonimage1()
     {  
        return $this->fetch('person/alterpersonimage1');   
    }
     public function alterphone()
     {  
        return $this->fetch('person/alterphone');   
    }
    public function mychapter()
     {  
        return $this->fetch('person/mychapter');   
    }
    public function advice()
     {  
        return $this->fetch('advice');   
    }
    public function Information()
     {  
        return $this->fetch('Information');   
    }
   
    public function  myfavorite()
     {  
        return $this->fetch('myfavorite');   
    }
    public function myfocus()
     {  
        return $this->fetch('myfocus');   
    }
    public function systemSettings()
     {  
        return $this->fetch('systemSettings');   
    }
    public function mycomments()
     {  
        return $this->fetch('mycomments');   
    }

    

    public function getUserList(){
        $userid=$this->getUserId();
        $userclass = new User();
        $userarr = $userclass->field(['Nickname','User_grade','image','Telephone','Signature'])
            ->where('User_id','eq',$userid)
            ->table('b_user')
              ->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

    }
     public function getUserList1(){
         $userid=$this->getUserId();
        $userclass = new User();
        $userarr = $userclass->field(['b_user.Nickname','b_user.Signature','b_user.image','b_user.live','b_user.Gender','b_college.College_name','b_college.Major_name'])
            ->table('b_user','b_college')
            ->join('b_college','b_user.College_id = b_college.College_id')
            ->where('b_user.User_id','eq',$userid)->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);
    }
    public function altermymessage($content){
        $userid=$this->getUserId();
        $data = ['id'=>null,'User_id' => $userid, 'content'=>$content,'time'=>date('Y-m-d H:i:s')];
        $resarr =Db::table('b_mymessage')->insert($data);
    }
    public function updateUserSex(){
        $userid=$this->getUserId();
        $user_sex= $_POST['sex']; 
        $userclass = new User();
        $userarr = $userclass->table('b_user')->where('User_id','eq',$userid)->setField('Gender', $user_sex);
        $res = ['success'=>true,'data'=>$userarr];
        if($userarr){
          $this->altermymessage("性别修改成功");
        }
        
        return json($res);
    }
    public function updateUserName(){
         $userid=$this->getUserId();
        $user_name= $_POST['user_name']; 
        $userclass = new User();
        $userarr = $userclass->table('b_user')->where('User_id','eq',$userid)->setField('Nickname', $user_name);
        if($userarr){
          $this->altermymessage("姓名修改成功");
        }
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);
    }
    public function alterclubname(){
        $request = Request::instance();
        $Club_name = $request->post('Club_name');
        $aid = $request->post('aid');
        $userarr = Db::table('b_club')->where('Club_id','eq',$aid)->setField('Club_name', $Club_name);
        
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);
    }
    public function alterclubcreat(){
        $request = Request::instance();
        $creat = $request->post('creat');
        $aid = $request->post('aid');
        $userarr = Db::table('b_club')->where('Club_id','eq',$aid)->setField('President', $creat);
        
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);
    }
    public function  alterclubintroduce(){
        $request = Request::instance();
        $introduce = $request->post('introduce');
        $aid = $request->post('aid');
        $userarr = Db::table('b_club')->where('Club_id','eq',$aid)->setField('Content', $introduce);
        
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);
    }
    public function  alterclubClubMaster(){
        $request = Request::instance();
        $Club_master = $request->post('Club_master');
        $aid = $request->post('aid');
        $userarr = Db::table('b_club')->where('Club_id','eq',$aid)->setField('Club_master', $Club_master);
        
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);
    }
    
   
    


    public function updateUserSignature(){
        $userid=$this->getUserId();
        $user_sign= $_POST['user_sign']; 
        $userclass = new User();
        $userarr = $userclass->table('b_user')->where('User_id','eq', $userid)->setField('Signature', $user_sign);
        if($userarr){
          $this->altermymessage("个性签名修改成功");
        }
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);
    }
    public function updateUserCollege(){
        $userid=$this->getUserId();
        $college_name= $_POST['college_name']; 
        $userclass = new User();
        $College_id=$userclass->where('User_id',$userid)->value('College_id');
        $userarr = $userclass->table('b_college')->where('College_id', $College_id)->setField('College_name', $college_name);
        $res = ['success'=>true,'data'=>$userarr];
        if($userarr){
          $this->altermymessage("学院修改成功");
        }
        return json($res);

    }
    public function updateUserMajor(){
        $userid=$this->getUserId();
        $major_name= $_POST['major_name']; 
        $userclass = new User();
        $College_id=$userclass->where('User_id',$userid)->value('College_id');
        $userarr = $userclass->table('b_college')->where('College_id', $College_id)->setField('Major_name', $major_name);
        $res = ['success'=>true,'data'=>$userarr];
        if($userarr){
          $this->altermymessage("专业修改成功");
        }
        return json($res);

    }
    public function updateUserLive(){
        $userid=$this->getUserId();
        $user_live= $_POST['user_live']; 
        $userclass = new User();
        $userarr = $userclass->table('b_user')->where('User_id','eq',$userid)->setField('live', $user_live);
        $res = ['success'=>true,'data'=>$userarr];
        if($userarr){
          $this->altermymessage("爱好修改成功");
        }
        return json($res);

    }
    
    public function AdiceInfo(){
        $userid=$this->getUserId(); 
        $request = Request::instance();
        $time = $request->post('datatime');
        $checkname=$request->post('checkname');
        $description=$request->post('description');
        $data = ['time' => $time, 'User_id' => $userid, 'advice'=>$checkname.$description];
        $resarr =Db::table('b_myadvice')->insert($data);
        $res = ['success'=>true,'data'=>$resarr];
        if($resarr){
          $this->altermymessage("意见提交成功");
        }
        return json($res);
    }
    
    public function getMyfocus(){ 
        $userid=$this->getUserId();
        $userarr=Db::table('b_userconcern')->field(['username','userimage','usersign'])->where('User_id','eq',$userid)->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

    }
    public function getMymessage(){ 
        $userid=$this->getUserId();
        $userarr=Db::table('b_mymessage')->where('User_id','eq',$userid)->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

    }
    public function getMyfavorite(){ 
        $userid=$this->getUserId();
        $userarr=Db::table('b_mycollect')
            ->field(['b_activity.Activity_ID','b_user.Nickname','b_user.image','b_activity.Activity_time','b_activity.Activity_title','b_activity.Article_image'])
            ->join('b_activity','b_mycollect.collect_id=b_activity.Activity_ID')->join('b_user','b_user.User_id=b_mycollect.User_id')->where('b_mycollect.User_id','eq',$userid)->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

    }
    
    public function getMyRelease(){ 
        $userid=$this->getUserId();
        $userarr1=Db::table('b_user')->field(['b_article.Article_id','b_article.Article_name','b_article.Update_time','b_article.Photo'])->join('b_article','b_user.User_id=b_article.User_id')->where('b_user.User_id','eq',$userid)->select();
        $userarr2=Db::table('b_user')->join('b_userclub','b_user.User_id=b_userclub.User_id')->join('b_club','b_userclub.Club_id=b_club.Club_id')->join('b_activity','b_activity.Club_id=b_club.Club_id')->where('b_user.User_id','eq',$userid)->select();
        foreach($userarr1 as $k=>$val){
          foreach ($val as $k2 => $val2) {
            $userarr1[$k]['type']= '文章';
            }     
         }
         foreach($userarr2 as $k=>$val){
          foreach ($val as $k2 => $val2) {
            $userarr2[$k]['type']= '活动';
            }    
         }
        $arr=array_merge($userarr1,$userarr2);
        shuffle($arr);
        $res = ['success'=>true,'data'=>$arr];
        return json($res);

    }
    
    
    public function getMychapter(){
        $userid=$this->getUserId();
        
        $result=Db::table('b_follow')->field(['b_club.Club_id','b_club.Club_name','b_club.Content','b_club.Image','b_club.Start_time'])->join('b_club','b_club.Club_id=b_follow.Club_id')->join('b_user','b_user.User_id=b_follow.User_id')->where('b_user.User_id',$userid)->where('b_club.flag','>',0)->select();
        $res = ['success'=>true,'data'=> $result];
        return json($res);

    }
    
     public function loadMyClub(){
        
         $request = Request::instance();
        $aid = $request->post('aid');
        $result=Db::table('b_club')->where('b_club.Club_id',$aid)->select();
        $res = ['success'=>true,'data'=> $result];
        return json($res);

    }
   
   
    public function getMyClub(){
        $userid=$this->getUserId();
        
        $result=Db::table('b_club')->field(['b_club.Club_id','b_club.Club_name','b_club.Content','b_club.Image','b_club.Start_time'])->join('b_userclub','b_club.Club_id=b_userclub.Club_id')->join('b_user','b_user.User_id=b_userclub.User_id')->where('b_user.User_id',$userid)->where('b_club.flag','>',0)->select();
        $res = ['success'=>true,'data'=> $result];
        return json($res);

    }
   
    //  public function  clearMycomments(){
    //     $result=Db::table('discuss')->where('User_id',1)->delete();
    //     $res = ['success'=>true,'data'=> $result];
    //     return json($res);

    // }
    
    public function alterUserPassword(){
        $userid=$this->getUserId();
        $request = Request::instance();
        $password = $request->post('password');
        $userclass = new User();
        $result = $userclass->table('b_user')->where('User_id','eq',$userid)->setField('Password', $password);
        $res = ['success'=>true,'data'=> $result];
        if($result){
          $this->altermymessage("密码修改成功");
        }
        return json($res);

    }
     public function updateUserPhone(){
        $userid=$this->getUserId();
        $request = Request::instance();
        $phone = $request->post('phone');
        $userclass = new User();
        $result = $userclass->table('b_user')->where('User_id','eq',$userid)->setField('Telephone',$phone);
        if($result){
          $this->altermymessage("手机修改成功");
        }
        $res = ['success'=>true,'data'=> $result];
        return json($res);

    }
    
     public function cheackPassword(){
        $userid=$this->getUserId();
        $request = Request::instance();
        $password = $request->post('oldpassword');
        $result=Db::table('b_user')->field('Password')->where('User_id',$userid)->where('Password',$password)->select();
        $res = ['success'=>true,'data'=> $result];
        return json($res);

    }
   
    public function  delClubInfo(){
        $request = Request::instance();
        $aid = $request->post('aid');
        $result=Db::table('b_club')->where('Club_id',$aid)->setField("flag",-1);
        $res = ['success'=>true,'data'=> $result];
        return json($res);

    }
    
    public function getDisscussList(){
        $userid=$this->getUserId();
       $result = Db::table('b_discuss')
           ->join('b_article',' b_discuss.article_id=b_article.Article_id')
           ->join('b_user','b_user.User_id=b_discuss.User_id')->where('b_user.User_id',$userid)->select();
        $res = ['success'=>true,'data'=> $result];
        return json($res);

    }
    public function updateUserImage(Request $request){
        $imgname=$_POST['imgname']; 
        $file = $request->file('targetImg');//首先获取到文件的名称
        // $info = $file->move(ROOT_PATH . 'public' . DS . 'img');
        // //将文件移动上传至根目录/public/uploads/ 目录之下
        // $data = ROOT_PATH .DS . 'img' . DS . $info->getSaveName();

        
        // $userclass = new User();
        // $userarr = $userclass->table('user')->where('User_id','eq',1)->setField('image', $imgurl);
        // $res = ['success'=>true,'data'=>$userarr];
        // return json($res);
        return $file;

    }
    public function clear() {  
        $a=glob(TEMP_PATH . '\*.php');
    // halt($a);
    if(!empty($a)){
        array_map('unlink', $a);
        rmdir(TEMP_PATH);
        $data='success';
    }
    else{
        $data="";
    }
    echo $data;
    }
    public function upload1(){

    $request = Request::instance();
    $aid = $request->post('aid');
    // 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('file');
    echo $file;
    // 移动到框架应用根目录/public/uploads/ 目录下
    if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            // 成功上传后 获取上传信息
            // 输出 jpg
            
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            $fliename= $info->getSaveName();
            $userarr = Db::table('b_club')->where('Club_id','eq',$aid)->setField('Image', $fliename);
            $res = ['success'=>true,'data'=>$userarr];
            if($userarr){
            $this->altermymessage("头像修改成功");
            }
            return json($res);

            
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getFilename(); 
            echo "</br>";
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }

    }
}

    public function upload(){
         $userid=$this->getUserId();
    // 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('file');
    echo $file;
    // 移动到框架应用根目录/public/uploads/ 目录下
    if($file){
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            // 成功上传后 获取上传信息
            // 输出 jpg
            
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            $fliename= $info->getSaveName();
            $userclass = new User();
            $userarr = $userclass->table('b_user')->where('User_id','eq',$userid)->setField('image', $fliename);
            $res = ['success'=>true,'data'=>$userarr];
            if($userarr){
            $this->altermymessage("头像修改成功");
            }
            return json($res);

            
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            echo $info->getFilename(); 
            echo "</br>";
        }else{
            // 上传失败获取错误信息
            echo $file->getError();
        }

    }
}

public function getActivityList(){
       
        $request = Request::instance();
        $aid = $request->post('aid');
        $data = Db::table('b_category')
            ->join('b_activity','b_category.Category_id =b_activity.Category_id')
            ->join('b_club','b_activity.Club_id=b_club.Club_id')
            ->join('b_userclub','b_userclub.Club_id=b_club.Club_id')
            ->join('b_user','b_user.User_id= b_userclub.User_id')->where('b_activity.Activity_ID','eq',$aid)->select();
       
        $res = ['success'=>true,'data'=>$data];
        return json($res);

   }
   public function delMyRelease(){
      $request = Request::instance();
      $aid = $request->post('aid');
      $resarr= Db::table('b_activity')->delete($aid);
      return json($resarr);
   }
   public function delMyReleases(){
      $request = Request::instance();
      $aid = $request->post('aid');
      $resarr= Db::table('b_article')->delete($aid);
      return json($resarr);
   }
   
   public function getMyApplyList()
    { 
        $userid=$this->getUserId();
        $request = Request::instance();
        $aid = $request->post('aid'); 
        $rs=Db::table('b_myapply')->where('Activity_ID', $aid)->where('User_id', $userid)->find();
        $res = ['data'=> $rs];
        return json($res);
      
    }
    public function getMycollectNumber()
    { 
         $userid=$this->getUserId();
        $request = Request::instance();
        $aid = $request->post('aid'); 
        $rs1=Db::table('b_mycollect')->where('collect_id', $aid)->where('User_id', $userid)->find();
        $rs = Db::table('b_mycollect')->where('type',"活动")->where('collect_id',$aid)->count('collect_id');
        $res = ['data1'=>$rs1,'data'=> $rs];
        return json($res);
      
    }
    public function updateHeartClick(){
        $userid=$this->getUserId();
        $request = Request::instance();
        $aid = $request->post('aid'); 
        $flag= $request->post('flag');
        if($flag==1){
                $data = ['id'=>'','type' => '活动', 'User_id' => $userid, 'collect_id'=>$aid];
                $resarr =Db::table('b_mycollect')->insert($data);
        }
        else if($flag==0){
           $resarr= Db::table('b_mycollect')->where('collect_id','eq',$aid)->where('User_id',$userid)->delete();
           $resarr=$resarr-1;
        }
        
        $res = ['success'=>true,'data'=> $resarr];
        return json($res);
    }

    public function getlogin(){
        $request = Request::instance();
        $username = $request->post('username'); 
        $password= $request->post('password');
        $rs=Db::table("b_user")->where("Nickname",$username)->where("Password",$password)->find();
        if($rs){
          Session::set('USER_INFO_SESSION',$rs);
          $res = ['success'=>true];
          $id=Session::get('USER_INFO_SESSION');
          $uid=$id['User_id'];
          $data = ['id'=>null,'User_id' =>$uid, 'content'=>'登录成功','time'=>date('Y-m-d H:i:s')];
          $resarr =Db::table('b_mymessage')->insert($data);

          $res = ['success'=>true]; 
        }else{
          $res = ['success'=>false]; 
          
        }
        
        
        return json($res);
    }
    public function getUserId(){
      $id=Session::get('USER_INFO_SESSION');
      return $id['User_id'];
      } 
    public function cheakUser(){
        $id=Session::get('USER_INFO_SESSION');
        if($id['flag']==1){
            $rs=false;
        }
        else{
            $rs=true;
        }
        return json($rs);
    }
    public function clearSession(){
        $this->altermymessage("退出成功");
        Session::clear();
       return $this->login();

    } 
    public function cheakName(){
        $request = Request::instance();
        $username = $request->post('username');
        $rs=Db::table("b_user")->where("Nickname",$username)->find();
        if($rs){
            $data=false;
        }
        else{
             $data=true;
        }

        
        return json($data);
    }
    public function myApply(){
        $userid=$this->getUserId();
        $request = Request::instance();
        $aid = $request->post('aid'); 
        $tag= $request->post('tag');
        if($tag==1){
                $data = ['id'=>'','User_id' =>$userid, 'Activity_ID'=>$aid,'flag'=>0];
                $resarr =Db::table('b_myapply')->insert($data);
        }
        else{
           $resarr= Db::table('b_myapply')->where('Activity_ID','eq',$aid)->delete();
           $resarr=$resarr-1;
        }
        
        $res = ['success'=>true,'data'=> $resarr];
        return json($res);
    }
    public function postregister(){
        $request = Request::instance();
        $username = $request->post('username');
        $password = $request->post('password');
        $phone = $request->post('phone');
        $email = $request->post('email');
        $data = ['User_id'=>NULL,'Nickname' =>$username ,'Password' => $password, 'Telephone'=>$phone,'email'=>$email,'College_id'=>1,'image'=>'20190430\c15124d8e39576e079544fde2de9fc3a.png','Signature'=>'我是江小白,生活很简单','flag'=>0];
        $resarr =Db::table('b_user')->insert($data);
        if($resarr){
            $res = ['success'=>true];
        }  
        else{
            $res = ['success'=>false];
        }
         return json($res); 
        
    } 
     
    
   
}

