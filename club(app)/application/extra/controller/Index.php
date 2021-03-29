<?php
namespace app\extra\controller;
use think\Request;
use think\Controller;
use app\extra\model\Club;
use app\extra\model\ClubType;

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
    
    	$this->assign(['active'=>2,'type'=>1]);
    	return $this->fetch('index'); 
    }
    public function activity(){
        $request = Request::instance();
        $aid = $request->post('aid');
        $this->assign('aid',$aid);
        return $this->fetch('activity');
    }
    public function publish(){
        return $this->fetch('publish');
    }
    public function search(){
        return $this->fetch('search');
    }
    public function getUserId(){
      $id=Session::get('USER_INFO_SESSION');
      return $id['User_id'];
    } 
    public function getSearchList(){
        $request = Request::instance();
        $searchcontent = $request->post('searchName');
        $barr =Db::table('b_category')
            ->join('b_activity','b_category.Category_id = b_activity.Category_id')
            ->join('b_club','b_activity.Club_id=b_club.Club_id')
            ->where('Activity_title','like','%'.$searchcontent.'%')->select();
     $res = ['success'=>true,'data'=>$barr];
    return json($res);
    }
    
   public function getActiviTytypeList(){
        $clubclass = new Club();
        $request = Request::instance();
        $aid = $request->post('aid');
        if($aid){
            $userarr = Db::table('b_activity')
            ->join('b_club','b_activity.Club_id=b_club.Club_id')->where('b_activity.Activity_status','>','0')->where('b_club.Club_id',$aid)->order('b_activity.Activity_status','b_activity.Activity_time')->select();
        }else{
            $userarr = Db::table('b_activity')
            ->join('b_club','b_activity.Club_id=b_club.Club_id')->where('b_activity.Activity_status','>','0')->order('b_activity.Activity_status','b_activity.Activity_time')->select();
        }
        
        $statusstr = array('0' => '待上架','1'=>'可约','2'=>'已满','-1'=>'已过期' );
        $statusclass = array('0' => 'am-badge-secondary','1'=>'am-badge-warning','2'=>'am-badge-default','-1'=>'am-badge-default' );
        for ($i=0; $i < count($userarr ); $i++) { 
            $userarr[$i]['statusstr'] = $statusstr[$userarr[$i]['Activity_status']];
            $userarr[$i]['statusclass'] = $statusclass[$userarr[$i]['Activity_status']];
        }
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

    }
    public function getActivityList(){
       
        $request = Request::instance();
        $aid = $request->post('aid');
//        echo  $aid;
        $data = Db::table('b_category')
            ->join('b_activity','b_category.Category_id = b_activity.Category_id')->join('b_club','b_club.Club_id=b_activity.Club_id')
            ->where('b_activity.Activity_ID',$aid)
            ->select();
       $statusstr = array('0' => '待上架','1'=>'可约','2'=>'已满','-1'=>'已过期' );
        $statusclass = array('0' => 'am-badge-secondary','1'=>'am-badge-warning','2'=>'am-badge-default','-1'=>'am-badge-default' );
        for ($i=0; $i < count($data ); $i++) { 
            $data[$i]['statusstr'] = $statusstr[$data[$i]['Activity_status']];
            $data[$i]['statusclass'] = $statusclass[$data[$i]['Activity_status']];
        }
        $res = ['success'=>true,'data'=>$data];
        return json($res);

   }

   public function getlimitnbr($aid){
        $rs = Db::query("select  Activity_nbr from b_activity where Activity_ID = $aid ");
        foreach ($rs as $row) {
            return $row['Activity_nbr'];
        }
        return -1;
   }

   function isorderavailable($aid){
    $userid = $this->getUserId();
    $rs = Db::query("select  * from b_myapply where User_id = $userid and Activity_ID = $aid ");
        foreach ($rs as $row) {
            return false;
        }
        return true;
   }
   
   public function myApply(){
        $userid=$this->getUserId();
        $request = Request::instance();
        $aid = $request->post('aid'); 
        $tag= $request->post('tag');
        $resarr = 0;
                $nbr = $this->getApplynbr($aid);
                $limitnbr = $this->getlimitnbr($aid);
                if($this->isorderavailable($aid) &&($limitnbr==0 || $nbr < $limitnbr)){
                    $data = ['id'=>'','User_id' =>$userid, 'Activity_ID'=>$aid,'flag'=>1];
                    $resarr =Db::table('b_myapply')->insert($data);
                    $nbr = $this->getApplynbr($aid);
                    // echo $nbr;
                    //更新活动的报名数量
                    $resarr =Db::table('b_activity')->where('Activity_ID', $aid)->update(['Activity_orderedNbr' => $nbr]);
                    if($limitnbr>0&&$nbr > $limitnbr){
                         $resarr =Db::table('b_activity')->where('Activity_ID', $aid)->update(['Activity_status' => 2]);
                    }
               }
              
      
        if($resarr){
            $res = ['success'=>true];

        }else{
            $res = ['success'=>false];

        }
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

    public function getApplynbr($aid){
        $rs = Db::query("select Activity_ID, count(myapply_id) as nbr from b_myapply where Activity_ID = $aid group by Activity_ID ");
        foreach ($rs as $row) {
            return $row['nbr'];
        }
        return 0;
    }

public function getMycollectNumber()
    { 
        $userid=$this->getUserId();
        $request = Request::instance();
        $aid = $request->post('aid'); 
        $rs1=Db::table('b_mycollect')->where('collect_id', $aid)->where('User_id', $userid )->find();
        $rs = Db::table('b_mycollect')->where('type',"活动")->where('collect_id',$aid)->count('collect_id');
        $res = ['data1'=>$rs1,'data'=> $rs];
        return json($res);
      
    }
    
    public function cheakUserClub()
    { 
        $userid=$this->getUserId();
        $rs=Db::table('b_user')->join('b_userclub','b_userclub.User_id=b_user.User_id')->join('b_club','b_club.Club_id=b_userclub.Club_id')->where('b_user.User_id',$userid)->select();
        $rs1=Db::table('b_category')->select();
        if($rs){
          $res = ['data'=> $rs,'data1'=>$rs1];
        }
        else{
          $res = ['data'=> 0,'data1'=>$rs1];
        }
        
        return json($res);
      
    }
     public function cheakUserType()
    { 
        $rs=Db::table('b_category')->select();
        if($rs){
          $res = ['data'=> $rs];
        }
        else{
          $res = ['data'=> 0];
        }
        
        return json($res);
      
    }
    public function getMyApplyList()
    { 
      $userid=$this->getUserId();
        $request = Request::instance();
        $aid = $request->post('aid'); 
        $rs=Db::table('b_myapply')->where('Activity_ID', $aid)->where('User_id', $userid )->find();
        $res = ['data'=> $rs];
        return json($res);
      
    }
    
     public function postActivity()
    { 
        $request = Request::instance();
        $club_id = $request->post('club_id');
        // echo  $club_id.'</br>';
        $activityname=$request->post('activityname');
         // echo   $activityname.'</br>';
        $time=$request->post('time');
         // echo  $time.'</br>';
        $address=$request->post('address');
         // echo   $address.'</br>';
        $Category_id=$request->post('Category_id');
         // echo  $Category_id.'</br>';
        $introduce=$request->post('introduce');
//          echo   $introduce.'</br>';
        $file = request()->file('file');
        // echo  $file;
        if($file){
          $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
          if($info){
            $fliename= $info->getSaveName();
            // echo  THINK_PATH.$fliename;
            $data = ['Activity_ID'=>null,'Club_id' =>$club_id , 'Category_id' => $Category_id, 'Activity_title'=>$activityname,'Activity_time'=>$time,'Activity_location'=>$address,'Article_image'=>$fliename,'Activity_intro'=> $introduce];
            $rs =Db::table('b_activity')->insert($data);
            $res = ['success'=>true, 'data'=>$rs];
            
          }
          else{
            $res = ['success'=>false];
            
          }

        }
        else{
           $res = ['success'=>false];
            
        }
        return json($res);
      
    }
     public function shetuan2($id)
    { 
        $clubclass = new Club();
        $c = Db::table('b_club')->where('Club_id','=',$id)->select();
        $rs = [];
        foreach ($c as  $cvalue) {
            $rs = $cvalue;
        }
        $this->assign('data',$rs);
        // print_r($rs);
        return $this->fetch('shetuan2');
      
    }

 public function test()
    {
        return $this->fetch('test');
    }


 public function getUserpl(){
        $userclass = new Club();
        $userarr = $userclass->field(['b_user.User_id','b_user.image ','b_user.Nickname','b_article.Article_id','b_article.Article_name','b_discuss.Discuss_time','b_discuss.Content'])
        ->table('b_user','b_article','b_discuss')
        ->join('b_article','b_user.User_id = b_article.User_id')
        ->join('b_discuss','b_user.User_id = b_discuss.User_id')
        ->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

}

    public function getClubList(){
        $request = Request::instance();
        $searchStr = $request->post('str');
        $searchFlag = $request->post('sltSort');
        $clubclass = new Club();
    $clubarr = Db::table('b_clubtype')->field('CT_id ,CT_title  ')->select();
    foreach ($clubarr as $key=> $ctype) {
        $clubarr[$key]['data'] = Db::table('b_club')->field('Club_id,CT_id,Club_name ,Image ')->where(['CT_id'=>$ctype['CT_id']])->select();
    }
     $res = ['success'=>true,'data'=>$clubarr];
    return json($res);


    }
public function getClubudo(){
$clubclass = new Club();
$c = Db::table('b_activity')->select();
 $res = ['success'=>true,'data'=>$c];
    return json($res);
 }
}
