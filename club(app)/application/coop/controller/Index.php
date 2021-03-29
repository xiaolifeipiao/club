<?php
namespace app\coop\controller;
use think\Request;
use think\Controller;
use app\coop\model\Club;
use app\coop\model\ClubType;

use think\Db;
use think\Session;
use think\Model;

class Index extends Controller
{
	public function __construct()
	{   parent::__construct();
	}
    public function demo(){
        return $this->fetch('demo');
    }
    public function teste(){
        return $this->fetch('teste');
    }
    public function alterpersonimage(){
        return $this->fetch('alterpersonimage');
    }
    public function index()
    {
    
    	$this->assign('active',3);
    	return $this->fetch('index');
    }
    public function getUserId(){
        $id=Session::get('USER_INFO_SESSION');
        return $id['User_id'];
    }
    public function shetuan2()
    { 
        $clubclass = new Club();
        $request = Request::instance();
        $aid = $request->post('aid');
        $c = Db::table('b_club')->where('Club_id','=',$aid)->select();
        $rs = [];
        foreach ($c as  $cvalue) {
            $rs = $cvalue;
        }
        $this->assign('data',$rs);

        return $this->fetch('shetuan2');
      
    }
    public function getclub(){
        $request = Request::instance();
        $aid = $request->post('aid');
        $arr=Db::table('b_club')
            ->where('Club_id',$aid)
            ->select();
        $res = ['success'=>true,'data'=>$arr];
            return json($res);
    }
    public function getClubudo(){
        $clubclass = new Club();
        $request = Request::instance();
        $aid = $request->post('aid');
        $c = Db::table('b_activity')
            ->join('b_club','b_club.Club_id=b_activity.Club_id')
            ->where('b_club.Club_id','eq',$aid)->select();
        $res = ['success'=>true,'data'=>$c];
        return json($res);
    }
    public function getUserpl(){
        $request = Request::instance();
        $aid = $request->post('aid');
        $userclass = new Club();
        $userarr = $userclass->field(['b_user.User_id','b_user.image ','b_user.Nickname','b_discuss.Club_id','b_club.Club_id','b_discuss.Discuss_time','b_discuss.discuss_Content'])
            ->table('b_user','b_discuss','b_club')
            ->join('b_discuss','b_user.User_id = b_discuss.User_id')
            ->join('b_club','b_club.club_id=b_discuss.club_id')
            ->where('b_club.Club_id','eq',$aid)
            ->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

    }
 public function test()
    {
        return $this->fetch('test');}

    

    public function creatClub(){
        $userid=$this->getUserId();
        $request = Request::instance();
        $clubname = $request->post('clubname');
        // echo  $clubname.'</br>';
        $creat=$request->post('creat');
         // echo   $creat.'</br>';
        $Category=$request->post('Category');
         // echo    $Category.'</br>';
        $introduce=$request->post('introduce');
         // echo   $introduce.'</br>';
        $img = request()->file('img');
        $file0 = request()->file('file0');
        $file1 = request()->file('file1');
        $file2 = request()->file('file2');
        $file3 = request()->file('file3');
        $file4 = request()->file('file4');

        $info = $img->move(ROOT_PATH . 'public' . DS . 'uploads');
        $info0 = $file0->move(ROOT_PATH . 'public' . DS . 'uploads');
        $info1 = $file1->move(ROOT_PATH . 'public' . DS . 'uploads');
        $info2 = $file2->move(ROOT_PATH . 'public' . DS . 'uploads');
        $info3 = $file3->move(ROOT_PATH . 'public' . DS . 'uploads');
        $info4 = $file4->move(ROOT_PATH . 'public' . DS . 'uploads'); 
        $fliename= $info->getSaveName();
        $fliename0= $info0->getSaveName();
        $fliename1= $info1->getSaveName();
        $fliename2= $info2->getSaveName();
        $fliename3= $info3->getSaveName();
        $fliename4= $info4->getSaveName();
        $photos=$fliename0.";".$fliename1.";".$fliename2.";".$fliename3.";".$fliename4.";";
        // echo $photos;
            
        $data = ['Club_id'=>null,'CT_id' =>$Category, 'Club_name' => $clubname, 'Image'=> $fliename,'Content'=>$introduce,'Start_time'=>date("Y-m-d H:i:s"),'President'=>$creat,'photo'=>$photos,'flag'=>-2];
            $rs =Db::table('b_club')->insert($data);
        $club_id=Db::table('b_club')->where('President',$creat)->where('Content',$introduce)->value('Club_id');
        echo $club_id;
        $data1=['User_id'=>$userid,'Club_id'=>$club_id];
        $rs1=Db::table("b_userclub")->insert($data1);
        $res = ['success'=>true, 'data'=>$rs,'data2'=>$rs1];
            
          
            
       
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

    public function getClubList(){
        $request = Request::instance();
        $searchStr = $request->post('str');
        $clubclass = new Club();
    $clubarr = Db::table('b_clubtype')->field('CT_id ,CT_title  ')->select();
    foreach ($clubarr as $key=> $ctype) {
        $clubarr[$key]['data'] = Db::table('b_club')->field('Club_id,CT_id,Club_name ,Image ')->where(['CT_id'=>$ctype['CT_id']])->where('flag','eq',1)->select();
    }
     $res = ['success'=>true,'data'=>$clubarr];
    return json($res);
    }
    public function findclub(){
        $request = Request::instance();
        $str = $request->post('strInput');
        $arr=Db::table('b_club')
            ->where('Club_name|President','like','%'.$str.'%')
            ->select();
        $res = ['success'=>true,'data'=>$arr];
        return json($res);
    }
    public function getActiviTytypeList(){
        $request = Request::instance();
        $aid = $request->post('aid');
        $userarr = Db::table('b_category')
            ->join('b_activity','b_category.Category_id = b_activity.Category_id')
            ->join('b_club','b_activity.Club_id=b_club.Club_id')
            ->where('b_club.Club_id','eq',$aid)
            ->select();
        $res = ['success'=>true,'data'=>$userarr];
        return json($res);

    }
    public function getdiscuss(){
        $request = Request::instance();
        $userid=$this->getUserId();
        $aid = $request->post('aid');
        $discuss=$request->post('Discuss_Content');
        $time=date('Y-m-d H:i:s',time());
        $data =['Discuss_id'=>null,'User_id'=>$userid,'Discuss_time'=>$time,'Anonymity'=>null,'Discuss_Content'=>$discuss,'article_id'=>0,'Club_id'=>$aid];
        $rs =Db::table('b_discuss')->insert($data);
        $res = ['success'=>true, 'data'=>$rs];
        return json($res);
    }
    public function joinclub(){
        $request = Request::instance();
        $userid=$this->getUserId();
        $aid = $request->post('aid');
        $data=['Follow_id'=>null,'Club_id'=>$aid,'User_id'=>$userid];
        $rs =Db::table('b_follow')->insert($data);
        $res = ['success'=>true, 'data'=>$rs];
        return json($res);
    }
    public function numberPeople(){
        $request = Request::instance();
        $aid = $request->post('aid');
        $rs=Db::table('b_club')->where('b_club.Club_id','eq',$aid)->select();
        $res = ['success'=>true, 'data'=>$rs];
        return json($res);
    }
}
