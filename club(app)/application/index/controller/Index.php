<?php
namespace app\index\controller;
use think\Controller;
use think\Request;
use app\index\model\Article;
use app\coop\model\Club;

use think\Db;
use think\Session;
use think\Model;

class Index extends Controller{
	public function __construct()
	{   parent::__construct();
	    // $this->userid = 1;
	}
	public function articles(){
	    return $this->fetch('articles');
    }
    public function getUserId(){
        $id=Session::get('USER_INFO_SESSION');
        return $id['User_id'];
    }
    public function index()
    {
        
    	$this->assign('active',1);
    	return $this->fetch('index');
      }
     public function getHomeList(){
        $request = Request::instance();
        $strl = $request->post('strl');
        $articleclass=new Article();
       
             // $articlearr=DB::field(['*'])
             //     ->table('b_article')
             //     ->join('b_user','b_article.User_id=b_user.User_id')
             //     ->where('Article_name|Title|Nickname','like','%'.$strl.'%')
             //     ->select();

            $data = DB::query("select b_article.*,b_user.Nickname,discuss.cnt from b_article left join b_user on b_article.User_id = b_user.User_id left join (select article_id , count(Discuss_id) as cnt from b_discuss group by article_id)discuss on discuss.article_id = b_article.article_id order by b_article.Start_time");

            for($i = 0;$i<count($data);$i++) {
                $str = '';
                $data[$i]['timestr'] =$this->timediff(strtotime($data[$i]['Start_time']));

              }
        $res=['success'=>true,'data'=>$data];
        return json($res);
    }
    public function getList(){
	    $art=Db::table('b_article','b_club')
            ->where('Article_type',4)
            ->join('b_club','b_club.Club_id=b_article.Club_id')
            ->field('*')
            ->select();
        $res=['success'=>true,'data'=>$art];
        return json($res);
    }

    public function updatePageView(){
         $request = Request::instance();
        $pv = $request->post('pv');
        $articleclass= new Article();
        $articlearr= DB::table('b_article')->where('Article_id','=',$id)->setInc('Pageview',$pv);
    }

    public function getarticles(){

        $request = Request::instance();
        $aid = $request->post('aid');
          $data=Db::field(['Article_id','b_article.User_id','b_user.User_id','Content','Article_name','b_article.Photo','b_article.Update_time','b_user.image','Nickname'])
              ->table('b_article')
              ->join('b_user','b_article.User_id=b_user.User_id')
              ->where('article_id','eq',$aid)
              ->select();

        $res = ['success'=>true,'data'=>$data];
        return json($res);
	}
    public function getHomeActivity(){
        $Activityclass=new Article();
        $Activityarr=DB::field('[*')->table('b_activity')->select();
        $res=['success'=>true,'data'=>$Activityarr];
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
    public function getUserpl(){
        $request = Request::instance();
        $aid = $request->post('aid');
        $userarr = Db::table('b_user')
            ->join('b_discuss','b_discuss.User_id = b_user.User_id')
            ->where('b_discuss.article_id','eq',$aid)
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
        $data =['Discuss_id'=>null,'User_id'=>$userid,'Discuss_time'=>$time,'Anonymity'=>null,'Discuss_Content'=>$discuss,'article_id'=>$aid,'Club_id'=>'0'];
        $rs =Db::table('b_discuss')->insert($data);
        $res = ['success'=>true, 'data'=>$rs];
        return json($res);
    }


    function timediff($begin_time)
    {
        $str = '';
        $end_time = strtotime(date('Y-m-d H:i:s'));
                // echo $begin_time+'0000000000'+ $end_time;

        if($begin_time < $end_time){
            $starttime = $begin_time;
            $endtime = $end_time;
        }else{
            $starttime = $end_time;
            $endtime = $begin_time;
        }
        //计算天数
        $timediff = $endtime-$starttime;
        $days = intval($timediff/86400);
        //计算小时数
        $remain = $timediff%86400;
        $hours = intval($remain/3600);
        //计算分钟数
        $remain = $remain%3600;
        $mins = intval($remain/60);
        //计算秒数
        $secs = $remain%60;
        $arr = array("day" => $days,"hour" => $hours,"min" => $mins,"sec" => $secs);
        if($arr['day']>0){
            $str = $arr['day'].'天以前';
        }else{
            if($arr['hour']>0){
                $str = $arr['hour'].'小时以前';

            }else{
                $str = $arr['min'].'分钟以前';
            }
        }
        return $str;
        }
   
    }
