-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-05-08 07:36:40
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rw1`
--

-- --------------------------------------------------------

--
-- 表的结构 `b_activity`
--

CREATE TABLE `b_activity` (
  `Activity_ID` int(11) NOT NULL,
  `Club_id` int(11) DEFAULT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `Activity_title` varchar(200) DEFAULT NULL,
  `Activity_time` varchar(200) DEFAULT NULL,
  `Activity_location` varchar(40) DEFAULT NULL,
  `Article_image` varchar(500) NOT NULL,
  `Activity_intro` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_activity`
--

INSERT INTO `b_activity` (`Activity_ID`, `Club_id`, `Category_id`, `Activity_title`, `Activity_time`, `Activity_location`, `Article_image`, `Activity_intro`) VALUES
(4, 9, 3, 'lol社团春季赛', '05-01 04:04 05-03 04:04', '重庆电子工程职业学院', '20190430\\af0f69676ad6f65516406b4bb35a5122.jpg', '天神下凡一锤四，赢一局我能吹一个月，赢两局我能吹一年，三比零我能吹一辈子！等等经典台词，让我们难以忘怀，如果你lol够牛，来吧这里就是你的战场。'),
(6, 6, 5, '社团聚餐', '05-01 04:04 05-03 04:04', '重庆电子工程职业学院', '20190430\\9e80c84e1796000bfd44f704dea9830a.jpg', '我是江小白，生活很简单我是江小白，生活很简单我是江小我是江小白，生活很简单我是江小白，生活很简单我是江小白，生活很简单白，生活很简单'),
(12, 10, 3, '志愿者活动', '05-01 04:04 05-03 04:04', '重庆电子工程职业学院', '20190430\\af0f69676ad6f65516406b4bb35a5122.jpg', '天神下凡一锤四，赢一局我能吹一个月，赢两局我能吹一年，三比零我能吹一辈子！等等经典台词，让我们难以忘怀，如果你lol够牛，来吧这里就是你的战场。'),
(13, 6, 5, '社团聚餐', '05-01 04:04 05-03 04:04', '重庆电子工程职业学院', '20190430\\9e80c84e1796000bfd44f704dea9830a.jpg', '我是江小白，生活很简单我是江小白，生活很简单我是江小我是江小白，生活很简单我是江小白，生活很简单我是江小白，生活很简单白，生活很简单'),
(14, 10, 3, 'lol社团春季赛', '05-01 04:04 05-03 04:04', '重庆电子工程职业学院', '20190430\\af0f69676ad6f65516406b4bb35a5122.jpg', '天神下凡一锤四，赢一局我能吹一个月，赢两局我能吹一年，三比零我能吹一辈子！等等经典台词，让我们难以忘怀，如果你lol够牛，来吧这里就是你的战场。'),
(15, 8, 3, 'lol社团春季赛', '05-01 04:04 05-03 04:04', '重庆电子工程职业学院', '20190430\\af0f69676ad6f65516406b4bb35a5122.jpg', '天神下凡一锤四，赢一局我能吹一个月，赢两局我能吹一年，三比零我能吹一辈子！等等经典台词，让我们难以忘怀，如果你lol够牛，来吧这里就是你的战场。'),
(16, 8, 3, '校园篮球大赛', '05-01 04:04 05-03 04:04', '重庆电子工程职业学院', '20190430\\af0f69676ad6f65516406b4bb35a5122.jpg', '天神下凡一锤四，赢一局我能吹一个月，赢两局我能吹一年，三比零我能吹一辈子！等等经典台词，让我们难以忘怀，如果你lol够牛，来吧这里就是你的战场。'),
(33, 5, 1, 'python', '05-01 01:01 05-02 11:11', '请问', '20190508\\b14da328427858a39a3a55c75fe95c18.jpeg', '请问');

-- --------------------------------------------------------

--
-- 表的结构 `b_applyclub`
--

CREATE TABLE `b_applyclub` (
  `applyclub_id` int(11) NOT NULL,
  `CT_name` varchar(50) NOT NULL,
  `Club_name` varchar(20) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `Content` varchar(2000) NOT NULL,
  `applyuser` varchar(20) NOT NULL,
  `photo` varchar(900) NOT NULL,
  `User_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_applyclub`
--

INSERT INTO `b_applyclub` (`applyclub_id`, `CT_name`, `Club_name`, `Image`, `Content`, `applyuser`, `photo`, `User_id`) VALUES
(1, 'undefined', '爱的色放的', '20190502\\f20ee0fb004e18f4eae5e08ac423bfca.png', '地方发的', '的发生', '20190502\\46042a194eb59ca177d7bd2e304f7f3c.png', 0),
(2, 'undefined', '电竞', '20190503\\10a2a48ea7d9f07c787e78464a1fc6a7.jpg', '大家一起happy', '李白', '20190503\\d0cbc4b82201166fa35f36d9a80a95c3.png', 0),
(3, 'undefined', 'saf', '20190503\\7c0b551df4bb5b9647ef798b39edfd87.png', 'sdfsd', 'ffasf', '20190503\\d2a42865fa57178cd52f7c0162195d0a.png', 0),
(4, 'undefined', '睡得', '20190503\\df4ae2bc73c0d3e5f57af6f61c67760e.png', '啊实打实打算', '啊是大a', '20190503\\491bf0d17116de8a53d2dfe7b9f7a5e0.png', 0),
(5, '公益', 'python', '20190508\\6945d6f51c705381657766ffee04945e.jpg', '阿萨德阿萨德爱迪生阿萨德', '漂', '20190508\\ac406bb4fcb98158e7e908c893981740.jpg；20190508\\c9851e0ce5352ae1da6cfe3905c67cda.jpg；20190508\\141de134f9a940e42bf59fa61f7bffe0.jpg；20190508\\f72bb2296b2d991bddb4d956c20c3f83.jpg；20190508\\5f6024a2521234306ff96fdd2995eb99.jpg', 12),
(6, '音乐', '阿萨德', '20190508\\6f3d45ac7692618c2ffe11911db8b601.jpg', '十大', '阿萨德', '20190508\\da5641bc55d6050275af0380d0ded9e3.jpg；20190508\\b14e25f924549a6df8c2daf8be00d42e.jpg；20190508\\8067c6aa4deed72e22af0fd27861ab9b.jpg；20190508\\a7e9f50c64f87713116167035da95e3b.jpg；20190508\\ff1fdff24cf085c4c6b1d1bc7d43b7e5.jpg', 12),
(7, '娱乐', '篮球社', '20190508\\b7ada6fbe0a15f4f5f522c536b0cf28b.jpg', '篮球', '江小白', '20190508\\0389a567a0e21387d6b5aa53a520c133.jpg；20190508\\0edc0b91583769653d00cb87496187bd.jpg；20190508\\aad687f9965875e4c06fb455024a83a0.jpg；20190508\\5eea4ad665c6c3cb4e6de4f47291027f.jpg；20190508\\a2c5abc63c957a5db70e755574df10ca.jpg', 12);

-- --------------------------------------------------------

--
-- 表的结构 `b_article`
--

CREATE TABLE `b_article` (
  `Article_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Article_name` char(30) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Content` varchar(5000) DEFAULT NULL,
  `Club_id` int(11) DEFAULT NULL,
  `Photo` varchar(900) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `Article_type` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_article`
--

INSERT INTO `b_article` (`Article_id`, `User_id`, `Article_name`, `Title`, `Content`, `Club_id`, `Photo`, `Start_time`, `Update_time`, `Article_type`) VALUES
(3, 1, '51岁的“灭霸”曾说做演员太可悲，庆幸没演成蝙蝠侠', '复仇者联盟火了', '复仇者联盟4》上映了，一时间全球影迷纷纷整装待发，准备去参加他的“葬礼”——没错，就是史上最强反派“灭霸”。\n\n51岁的“灭霸”曾说做演员太可悲，庆幸没演成蝙蝠侠\n这位打个响指能让半个宇宙生命灰飞烟灭，需要所有漫威超级英雄集结起来抵抗的“紫薯侠”，虽然大家都知道他的形象是通过特效化妆及后期制作而成的，但灭霸的面部表情、声音以及动作捕捉，都是由演员完成的，而他的饰演者就是现年51岁的乔什·布洛林。\n\n撰文/孟天翔\n\n演艺世家的浪荡公子哥\n\n——曾称“做演员很可悲”\n\n乔什·布洛林出生于演艺世家，他的父亲乃至祖父都是好莱坞演员，父亲是上世纪六七十年代的好莱坞老牌帅哥詹姆斯·布洛林，继母是传奇明星芭芭拉·史翠珊，母亲则是一位推广野生动植物保护人士。不过从小在加州近郊坦普尔顿农场长大的布洛林，演戏并非幼时的梦想，他曾受访表示“做演员很可悲，毕生所求不过是来自别人的掌声和认可”，而他自己决不愿落入这样可悲的境地，“做演员收入不稳定的起伏浮动，我也不喜欢。”\n\n布洛林的学生时代，是戴着牙套、不折不扣的书呆子模样，直到高中，因为一节即兴表演体验课，他忽然对演戏产生了浓厚的兴趣。于是借着家庭的东风，布洛林搬去洛杉矶与父亲同住，并如愿进入演艺圈，17岁那年就出演了当时的暑期档大片《七宝奇谋》。\n\n51岁的“灭霸”曾说做演员太可悲，庆幸没演成蝙蝠侠51岁的“灭霸”曾说做演员太可悲，庆幸没演成蝙蝠侠\n电影《死侍2》有款特别海报，正是致敬布洛林当年主演的《七宝奇谋》，下图（《七宝奇谋》剧照）后排中为乔什·布洛林。\n\n不过之后，布洛林出演了一大堆反响平平之作，甚至接过很多烂片，当过龙套，做过剧院演员，却一直没有打开知名度。在父辈荫庇之下的布洛林似乎也没有什么野心，那时候演戏对他来说，更像是个聊以谋生的工具。出道整整二十年，这位大器晚成的演员在好莱坞几乎还是查无此人的状态。2004年，他在电影《碧海追踪》中出演一个小配角，导演嘲讽他：“布洛林是谁？《七宝奇谋》？那是20年前的事了！”这句话终于刺激到布洛林，此后他才开始认真挑选剧本，研究戏剧，钻研起了真本事。\n\n2008年，科恩兄弟执导的第80届奥斯卡最佳影片《老无所依》，可以说是布洛林第一个能拿得出手的电影作品。他在片中饰演一穷二白的越南老兵，偶然得到一个装有200万美元的皮箱，从而走上逃亡之路。不过该片男主角哈维尔·巴登饰演的杀手气场太强，光芒太盛，而布洛林演的这个小人物，并没有太大的发挥空间。好在同年上映的《美国黑帮》《小布什传》《决战以拉谷》《米尔克》等影片，逐渐为布洛林在圈内奠定了“会演戏”的名声。\n\n快50岁接受魔鬼训练变身灭霸\n\n——楞可讨饭也不接“不对眼”的戏\n\n布洛林并没有接受过正规的表演教育，但演戏天赋就好像是天生印在骨子里的。对他来说，演艺事业最重要的一年，就是2012年出演了《黑衣人3》。风靡全球的《黑衣人》系列，让威尔·史密斯与汤米·李·琼斯这对气场迥异又火花四射的“J&K黑超探员组合”红遍全球。而当J探员穿越时空回到过去，与年轻时代的K一起执行任务，剧组便找来了和汤米·李·琼斯长相酷似的布洛林，出演他的年轻时代。', 4, '灭霸.jpg;', NULL, '2019-04-30 13:16:31', 1),
(12, 2, '“我就是查酒驾的，没人敢查我”：有权就能任性？', '自称“没人敢查”的交警中队长，最终因为酒后驾车肇事被查了，而处理他案件的正是曾经的同事——这也给该事件平添了很多戏剧化的色彩。', '“不要紧，我就是查酒驾的，只有我查别人，没人敢查我。”河南日报日前报道的一则“交警中队长醉酒驾驶被查”的新闻，引发广泛关注。\n\n据报道，2019年1月25日21时许，时任河南焦作孟州市交警一中队中队长的刘某某晚间饮酒后，在十字路口与另一正常行驶的车辆相撞。经鉴定，刘某某血样中酒精含量检测结果为226.047mg/100ml，属于醉酒驾驶，他也因此承担事故全部责任。4月10日，他因犯危险驾驶罪被开除党籍、开除公职。\n\n自称“没人敢查”的交警中队长，最终因为酒后驾车肇事被查了，而处理他案件的正是曾经的同事——这也给该事件平添了很多戏剧化的色彩。\n\n查酒驾“不为亲者讳”，当地有关方面对其并判处拘役、罚金，现在又被开除党籍、公职……不得不说，当地交警和执纪等部门执法执纪挺公正。而这秉公办事的态度，也为该案画上了正义的句号。\n\n如今此事已尘埃落定，但该事件细节暴露出的很多问题，特别是“只有我查别人，没人敢查我”中体现出的傲慢，仍值得当地有关部门警醒。\n\n因为自己是“查酒驾”的，就心生“没人敢查”的优越感，还不顾他人劝阻，这本质上是另一种“醉驾”：只不过，“违规驾驭”的是权力。正因其借着职能耍特权，监督的“手电筒”只照别人不照自己，所以“出事”成了必然——与“没人敢查我”的特权意识对应的，也是对生命安全的漠视。\n\n现实中，在特权意识“加持”下铤而走险，最终坑人坑己的案例时有曝光。如2019年3月，陕西甘泉县交警大队大队长涉嫌酒后驾车，且拒不配合交警执法，后被交警强行带上警车；2019年2月，甘肃陇西县一工商局干部醉酒驾驶撞死环卫工……\n\n这些人被特权意识导向“作死”之路，的确需要法纪严惩。与此同时，掐灭其特权意识也很重要：该事件中，身为执法者自身却酒驾，还叫嚣着“没人敢查”，这显然需要通过该查就查、通过敲掉其可能存在的保护伞，消除其侥幸心理乃至特权心态。\n\n公职人员尤其是交通执法者本身酒驾，危害了公共安全，也损害了公职人员的形象。而寓于酒驾行为中的特权意识及对法律法规的藐视，也提醒部分基层执法部门，对执法者本身的法规教育、行为督导不能松懈。', 5, '酒驾.jpg;', NULL, '2019-04-16 12:17:32', 1),
(13, 2, '火箭若想逆转勇士，或该弃用这两人，德帅可考虑扶正60万奇兵？', '火箭队在客场已经连败两场，接下来回到主场的他们已经没有退路，要想继续前进甚至争夺总冠军的话，显然已经输不起了。从前两场比赛来看，火箭队暴露出了不少问题，这都是德帅和教练组需要解决的，我觉得接下来的比赛球队也要适当做出一些改变了。火箭队若想逆转勇士，或该弃用这两人，德帅可考虑扶正60万奇兵？', '火箭队在客场已经连败两场，接下来回到主场的他们已经没有退路，要想继续前进甚至争夺总冠军的话，显然已经输不起了。从前两场比赛来看，火箭队暴露出了不少问题，这都是德帅和教练组需要解决的，我觉得接下来的比赛球队也要适当做出一些改变了。火箭队若想逆转勇士，或该弃用这两人，德帅可考虑扶正60万奇兵？\n\n火箭若想逆转勇士，或该弃用这两人，德帅可考虑扶正60万奇兵？\n豪斯\n\n如果评选前两场比赛火箭队表现最差的三名球员的话，除了中锋卡佩拉外，两名侧翼替补豪斯和香波特的表现同样糟糕。卡佩拉毕竟对于火箭至关重要，直接弃用他根本不可能，当然传奇球星麦迪也建议火箭队可以考虑把卡佩拉放到替补席上，让小里弗斯改打先发。而另两名球员的话，火箭队是时候考虑缩减他们的出场时间甚至暂时弃用他们了。先说豪斯，原本球队和球迷们都对他寄予厚望，也认为他是火箭锋线位置上的重要成员，可惜这轮系列赛他的发挥真的不太好，面对勇士队的高强度防守，豪斯的持球能力几乎派不上用场，他的问题其实不在于能力和态度，而是如此高强度的比赛让他彻底迷失，不但经常出现不应该有的失误，防守中也时常有漏人或者抢篮板不卡位的现象出现，所以适当让他在场下等待机会并且好好冷静一下，对球队和球员双方都是好事。\n\n火箭若想逆转勇士，或该弃用这两人，德帅可考虑扶正60万奇兵？\n香波特\n\n而香波特的话，毫不客气的说自从加入火箭后几乎就没有好的表现，火勇大战前两场他总共8次出手只进1球，加上首轮和爵士的比赛，香波特季后赛中整体命中率是10%，三分命中率也只有11.1%，这种表现在进攻端不就是拖后腿，让球队陷入4打5的不利局面吗？原本火箭用香波特或许是看重他的防守能力，可以一定程度上消耗对手的王牌，可结果却是"海啸三兄弟"顺风顺水，尤其是杜兰特两场轰下64分，那你还坚持用香波特干啥呢？\n\n火箭若想逆转勇士，或该弃用这两人，德帅可考虑扶正60万奇兵？\n克拉克\n\n局面已经如此，不改变显然是不行了，德帅为何不考虑扶正同位置的加里-克拉克呢？进入季后赛后，克拉克总共只打了4分钟，显然也是憋足了劲想要证明自己。克拉克的进攻未必强于豪斯和香波特，但他的防守和篮板球能力着实出色，虽然赛季薪水只有60万美元，可常规赛中便数次成为奇兵，既然豪斯有些迷失，香波特的表现更是辣眼睛，咱们说句大实话：你就算改用克拉克，他的表现还能比那两位上场比赛的表现更差吗？\n\n火箭若想逆转勇士，或该弃用这两人，德帅可考虑扶正60万奇兵？\n德帅\n\n别忘了昨天勇士拿下第二战，除了核心球员的发挥外，久疏战阵的杰雷布科获得机会便成为奇兵，一定程度上改变了比赛的走势。克拉克和杰雷布科在所在球队的境遇有些相似，同样一直饱受诟病的科尔已经变阵并取得了不错效果，而德帅您真的不考虑进行一些改变吗？', 6, '篮球1.jpg;', NULL, '2018-12-14 00:00:00', 1),
(15, 2, '科技大厦55', '世界这么大', NULL, 8, 'p2.jpg;', NULL, '2018-12-14 00:00:00', 1),
(16, 2, '走进邓小平故居', 'akd九回复', NULL, 9, NULL, NULL, NULL, 4),
(17, 2, '五一happy', '歌乐山一日游\r\n', NULL, 10, NULL, NULL, NULL, 4),
(18, 2, '电子校清明踏青', '清明快乐呀\r\n\r\n', NULL, 8, NULL, NULL, NULL, 4),
(19, 2, '三峡广场汇演', '嘿嘿\r\n\r\n', NULL, 6, NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- 表的结构 `b_category`
--

CREATE TABLE `b_category` (
  `Category_id` int(11) NOT NULL,
  `Category_title` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_category`
--

INSERT INTO `b_category` (`Category_id`, `Category_title`) VALUES
(1, '文娱'),
(2, '学术'),
(3, '体育'),
(4, '公益'),
(5, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `b_club`
--

CREATE TABLE `b_club` (
  `Club_id` int(11) NOT NULL,
  `CT_id` int(11) DEFAULT NULL,
  `Club_master` varchar(10000) DEFAULT NULL,
  `Club_name` varchar(30) DEFAULT NULL,
  `Image` varchar(900) DEFAULT NULL,
  `Content` varchar(900) DEFAULT NULL,
  `FollowersCount` int(11) DEFAULT NULL,
  `Club_level` int(11) DEFAULT NULL,
  `Club_population` int(11) DEFAULT NULL,
  `Club_watchword` varchar(60) DEFAULT NULL,
  `President` varchar(10) DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `photo` varchar(900) NOT NULL,
  `flag` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_club`
--

INSERT INTO `b_club` (`Club_id`, `CT_id`, `Club_master`, `Club_name`, `Image`, `Content`, `FollowersCount`, `Club_level`, `Club_population`, `Club_watchword`, `President`, `Update_time`, `Start_time`, `photo`, `flag`) VALUES
(4, 2, '张三；李白', '话剧', '话剧.jpg', '社团简介，社团简介', NULL, NULL, NULL, '委屈二群无', '江小白', NULL, '2019-05-03 14:37:35', '话剧1.jpg;话剧2.jpg;话剧3.jpg;话剧1.jpg;话剧2.jpg;', 1),
(5, 2, '张三；李白\n', '吉他社', '20190508\\dd31762c94eb951f3e4cfcdbf6295d5d.jpg', '社团简介，社团简介', NULL, NULL, NULL, '我去额qw', '阿萨德撒点', NULL, '2019-05-03 14:37:48', '吉他1.jpg;吉他2.jpg;吉他3.jpg;吉他4.jpg;吉他1.jpg', 1),
(6, 1, NULL, '网球', '网球.jpg', '网尽天下，球起心动，迷一样的ACE ！', 99, 4, 120, '网尽天下，球起心动，迷一样的ACE ！网尽天下，球起心动，迷一样的ACE ！网尽天下，球起心动，迷一样的ACE ！', '张三', NULL, '2019-05-03 14:35:45', '网球5.jpg;网球2.jpg;网球3.jpg;网球5.jpg;网球2.jpg;', 1),
(7, 1, NULL, '足球', '足球.jpg', '只要心脏在跳动就不会舍弃脚下滚动的足球！', 99, 5, 120, '只要心脏在跳动就不会舍弃脚下滚动的足球！只要心脏在跳动就不会舍弃脚下滚动的足球！', '李四', NULL, '2019-05-03 14:44:41', '足球1.jpg;足球2.jpg;足球3.jpg;足球4.jpg;足球5.jpg;', 1),
(8, 1, NULL, '篮球', 'timg (1).jpg', '打球的渴望让我分分钟都不想停下来。！', 99, 5, 120, '打球的渴望让我分分钟都不想停下来。打球的渴望让我分分钟都不想停下来。', '陈四', NULL, '2019-05-03 14:12:38', '篮球3.jpg;篮球1.jpg;篮球2.jpg;篮球 (3).jpg;篮球 (2).jpg;', 1),
(9, 4, NULL, '文学', '文学.jpg', '这里有世界上最优美的文字', 99, 5, 120, '这里有世界上最优美的文字', '李芳', NULL, '2019-05-03 14:38:05', '文学1.jpg;文学2.jpg;文学3.jpg;文学1.jpg;文学2.jpg;文学3.jpg;', 1),
(10, 3, NULL, '青志社', '志愿.jpg', '青年志愿者精神——奉献、友爱、互助、进步', 99, 5, 120, '青年志愿者精神——奉献、友爱、互助、进步', '王老大', NULL, '2019-05-03 14:39:03', '志愿者1.jpg;志愿者2.jpg;志愿者3.jpg;志愿者1.jpg;志愿者2.jpg;志愿者3.jpg;', 1);

-- --------------------------------------------------------

--
-- 表的结构 `b_clubtype`
--

CREATE TABLE `b_clubtype` (
  `CT_id` int(11) NOT NULL,
  `CT_title` varchar(20) DEFAULT NULL,
  `CT_status` int(11) DEFAULT '1',
  `Create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_clubtype`
--

INSERT INTO `b_clubtype` (`CT_id`, `CT_title`, `CT_status`, `Create_time`) VALUES
(1, '娱乐', 1, '2018-12-31 12:24:34'),
(2, '乐器', 1, '2018-12-31 12:24:46'),
(3, '公益', 1, '2018-12-31 12:24:54'),
(4, '文学', 1, '2019-05-03 06:38:24');

-- --------------------------------------------------------

--
-- 表的结构 `b_college`
--

CREATE TABLE `b_college` (
  `College_id` int(11) NOT NULL,
  `College_name` varchar(20) DEFAULT NULL,
  `Major_name` varchar(15) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_college`
--

INSERT INTO `b_college` (`College_id`, `College_name`, `Major_name`, `Start_time`, `Update_time`) VALUES
(1, '人工智能大数据', '人工智能', '2019-01-01 00:00:00', '2019-01-02 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `b_discuss`
--

CREATE TABLE `b_discuss` (
  `Discuss_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Discuss_time` datetime DEFAULT NULL,
  `Anonymity` tinyint(1) DEFAULT NULL,
  `Discuss_Content` varchar(500) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `article_id` int(10) NOT NULL,
  `Club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_discuss`
--

INSERT INTO `b_discuss` (`Discuss_id`, `User_id`, `Discuss_time`, `Anonymity`, `Discuss_Content`, `Start_time`, `Update_time`, `article_id`, `Club_id`) VALUES
(1, 1, '2019-04-08 00:00:00', NULL, '我是谁', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 1, 0),
(2, 1, '2019-04-10 00:00:00', NULL, '32iojre frkdw\r\nf \r\n', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 2, 0),
(3, 1, '2019-04-02 00:00:00', NULL, '按时阿萨德了家十大十大asD 时代风帆第三方大法师答复阿道夫ad封禅大典第三方', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 3, 0),
(4, 1, '2019-04-02 00:00:00', NULL, '按时阿萨德了家十大十大asD 时代风帆第三方大法师答复阿道夫ad封禅大典第三方', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 1),
(5, 1, '2019-04-02 00:00:00', NULL, '明天会更好', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 2),
(6, 1, '2019-04-02 00:00:00', NULL, 'good', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 3),
(7, 1, '2019-04-02 00:00:00', NULL, '好样的', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 4),
(8, 1, '2019-04-02 00:00:00', NULL, '优秀社团', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 5),
(9, 1, '2019-04-02 00:00:00', NULL, 'good', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 6),
(10, 1, '2019-04-02 00:00:00', NULL, '最好的我们', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 7),
(11, 1, '2019-04-02 00:00:00', NULL, 'good', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 8),
(12, 1, '2019-04-02 00:00:00', NULL, '大家的社团', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 0, 9),
(13, 1, '2019-04-02 00:00:00', NULL, '按时阿萨德了家十大十大asD 时代风帆第三方大法师答复阿道夫ad封禅大典第三方', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 4, 0),
(14, 1, '2019-04-02 00:00:00', NULL, '按时阿萨德了家十大十大asD 时代风帆第三方大法师答复阿道夫ad封禅大典第三方', '2019-01-01 00:00:00', '2019-04-24 00:00:00', 5, 0),
(15, 12, '2019-05-08 15:02:01', NULL, '打', NULL, NULL, 13, 0),
(16, 12, '2019-05-08 15:08:41', NULL, '江小白', NULL, NULL, 3, 0),
(17, 12, '2019-05-08 15:14:53', NULL, '我是谁', NULL, NULL, 3, 0);

-- --------------------------------------------------------

--
-- 表的结构 `b_follow`
--

CREATE TABLE `b_follow` (
  `Follow_id` int(11) NOT NULL,
  `Club_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_follow`
--

INSERT INTO `b_follow` (`Follow_id`, `Club_id`, `User_id`) VALUES
(1, 5, 12),
(2, 7, 12),
(3, 6, 12);

-- --------------------------------------------------------

--
-- 表的结构 `b_history`
--

CREATE TABLE `b_history` (
  `History_id` int(11) NOT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Article_id` varchar(30) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `History_type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `b_myadvice`
--

CREATE TABLE `b_myadvice` (
  `id` int(11) NOT NULL,
  `User_id` int(10) NOT NULL,
  `time` varchar(100) NOT NULL,
  `advice` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_myadvice`
--

INSERT INTO `b_myadvice` (`id`, `User_id`, `time`, `advice`) VALUES
(1, 1, '2019-4-20 15:11:39', '产品建议：用的不爽，我有意见其他问题请输入不少于10个字的描述'),
(2, 1, '2019-4-25 22:57:18', '功能异常：功能异常或不可以用产品建议：用的不爽，我有意见其他问题请输入不少于10个字的描述'),
(3, 1, '2019-4-25 22:59:46', '产品建议：用的不爽，我有意见asd aa s q'),
(4, 1, '2019-4-25 22:59:57', '产品建议：用的不爽，我有意见其他问题qwe qerwq rqw '),
(5, 1, '2019-4-25 23:0:15', '产品建议：用的不爽，我有意见其他问题sad asd qwe'),
(6, 1, '2019-4-30 13:39:14', '请输入不少于10个字的描述'),
(7, 1, '2019-4-30 13:39:55', '请输入不少于10个字的描述'),
(8, 1, '2019-4-30 13:40:6', '请输入不少于10个字的描述'),
(9, 1, '2019-4-30 13:40:51', '请输入不少于10个字的描述');

-- --------------------------------------------------------

--
-- 表的结构 `b_myapply`
--

CREATE TABLE `b_myapply` (
  `User_id` int(10) NOT NULL,
  `Activity_ID` int(10) NOT NULL,
  `flag` int(10) NOT NULL,
  `myapply_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_myapply`
--

INSERT INTO `b_myapply` (`User_id`, `Activity_ID`, `flag`, `myapply_id`) VALUES
(1, 2, 0, 23),
(12, 33, 1, 47),
(12, 13, 0, 37),
(12, 4, 1, 46);

-- --------------------------------------------------------

--
-- 表的结构 `b_mycollect`
--

CREATE TABLE `b_mycollect` (
  `id` int(11) NOT NULL,
  `collect_id` int(11) NOT NULL,
  `User_id` int(10) NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_mycollect`
--

INSERT INTO `b_mycollect` (`id`, `collect_id`, `User_id`, `type`) VALUES
(103, 1, 1, '活动'),
(98, 3, 2, '活动'),
(105, 4, 6, '活动'),
(87, 1, 2, '活动'),
(113, 4, 2, '活动'),
(108, 5, 1, '活动'),
(109, 6, 2, '活动'),
(110, 6, 1, '活动'),
(111, 4, 2, '活动'),
(112, 23, 2, '活动'),
(127, 4, 12, '活动'),
(125, 25, 12, '活动');

-- --------------------------------------------------------

--
-- 表的结构 `b_mymessage`
--

CREATE TABLE `b_mymessage` (
  `id` int(10) UNSIGNED NOT NULL,
  `User_id` int(11) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_mymessage`
--

INSERT INTO `b_mymessage` (`id`, `User_id`, `content`, `time`) VALUES
(1, 1, '修改信息成功', '2019-04-01 00:00:00'),
(2, 1, '登录成功', '2019-04-09 00:00:00'),
(3, 1, '登录成功', '2019-04-30 13:23:40'),
(4, 1, '性别修改成功', '2019-04-30 13:33:03'),
(5, 1, '姓名修改成功', '2019-04-30 13:38:10'),
(6, 1, '姓名修改成功', '2019-04-30 13:38:37'),
(7, 1, '手机修改成功', '2019-04-30 13:39:56'),
(8, 1, '手机修改成功', '2019-04-30 13:40:07'),
(9, 1, '意见提交成功', '2019-04-30 13:40:52'),
(10, 1, '登录成功', '2019-04-30 13:48:40'),
(11, 2, '登录成功', '2019-04-30 14:10:26'),
(12, 2, '头像修改成功', '2019-04-30 14:10:37'),
(13, 2, '姓名修改成功', '2019-04-30 14:10:46'),
(14, 2, '姓名修改成功', '2019-04-30 14:11:12'),
(15, 2, '性别修改成功', '2019-04-30 14:11:20'),
(16, 2, '退出成功', '2019-04-30 14:12:15'),
(17, 6, '登录成功', '2019-04-30 14:13:17'),
(18, 6, '密码修改成功', '2019-04-30 14:14:51'),
(19, 6, '手机修改成功', '2019-04-30 14:15:21'),
(20, 6, '退出成功', '2019-04-30 14:23:39'),
(21, 1, '登录成功', '2019-04-30 14:29:11'),
(22, 1, '退出成功', '2019-04-30 14:29:17'),
(23, 1, '登录成功', '2019-04-30 14:39:18'),
(24, 1, '登录成功', '2019-05-02 10:28:21'),
(25, 1, '退出成功', '2019-05-02 13:19:44'),
(26, 1, '登录成功', '2019-05-02 13:20:06'),
(27, 1, '退出成功', '2019-05-02 13:20:27'),
(28, 1, '登录成功', '2019-05-02 13:20:47'),
(29, 1, '头像修改成功', '2019-05-02 13:21:21'),
(30, 1, '头像修改成功', '2019-05-02 13:26:00'),
(31, 1, '头像修改成功', '2019-05-02 13:26:20'),
(32, 1, '头像修改成功', '2019-05-02 13:26:35'),
(33, 1, '头像修改成功', '2019-05-02 13:29:04'),
(34, 1, '头像修改成功', '2019-05-02 13:31:30'),
(35, 1, '头像修改成功', '2019-05-02 13:31:47'),
(36, 1, '头像修改成功', '2019-05-02 13:33:12'),
(37, 1, '头像修改成功', '2019-05-02 13:40:56'),
(38, 1, '头像修改成功', '2019-05-02 13:42:30'),
(39, 1, '头像修改成功', '2019-05-02 13:43:02'),
(40, 1, '登录成功', '2019-05-02 14:12:13'),
(41, 1, '头像修改成功', '2019-05-02 14:13:31'),
(42, 1, '登录成功', '2019-05-02 15:14:06'),
(43, 1, '登录成功', '2019-05-02 16:10:47'),
(44, 1, '姓名修改成功', '2019-05-02 18:05:28'),
(45, 1, '头像修改成功', '2019-05-02 18:27:41'),
(46, 1, '头像修改成功', '2019-05-02 18:27:54'),
(47, 1, '头像修改成功', '2019-05-02 18:32:03'),
(48, 1, '头像修改成功', '2019-05-02 18:40:44'),
(49, 1, '退出成功', '2019-05-02 18:44:36'),
(50, 2, '登录成功', '2019-05-02 18:45:35'),
(51, 1, '登录成功', '2019-05-03 10:40:56'),
(52, 1, '登录成功', '2019-05-03 15:47:02'),
(53, 1, '退出成功', '2019-05-03 19:52:35'),
(54, 2, '登录成功', '2019-05-03 19:53:35'),
(55, 2, '登录成功', '2019-05-03 20:11:49'),
(56, 2, '头像修改成功', '2019-05-03 20:42:13'),
(57, 1, '登录成功', '2019-05-03 23:25:29'),
(58, 1, '退出成功', '2019-05-03 23:27:11'),
(59, 2, '登录成功', '2019-05-03 23:27:33'),
(60, 12, '登录成功', '2019-05-04 19:24:45'),
(61, 12, '登录成功', '2019-05-04 19:52:05'),
(62, 12, '退出成功', '2019-05-04 19:59:28'),
(63, 12, '登录成功', '2019-05-04 20:01:39'),
(64, 12, '登录成功', '2019-05-04 20:15:20'),
(65, 12, '登录成功', '2019-05-05 13:05:22'),
(66, 12, '头像修改成功', '2019-05-05 13:10:52'),
(67, 12, '性别修改成功', '2019-05-05 13:11:07'),
(68, 12, '登录成功', '2019-05-06 14:40:23'),
(69, 12, '退出成功', '2019-05-06 18:21:31'),
(70, 12, '登录成功', '2019-05-06 18:21:46'),
(71, 12, '退出成功', '2019-05-06 18:23:19'),
(72, 13, '登录成功', '2019-05-06 19:19:11'),
(73, 13, '退出成功', '2019-05-06 19:36:02'),
(74, 12, '登录成功', '2019-05-06 19:36:13'),
(75, 12, '退出成功', '2019-05-06 19:41:12'),
(76, 13, '登录成功', '2019-05-06 19:41:20'),
(77, 13, '退出成功', '2019-05-06 19:45:04'),
(78, 12, '登录成功', '2019-05-06 19:45:14'),
(79, 12, '退出成功', '2019-05-06 19:45:27'),
(80, 12, '登录成功', '2019-05-07 21:08:05'),
(81, 12, '登录成功', '2019-05-08 10:14:36'),
(82, 12, '头像修改成功', '2019-05-08 11:58:59'),
(83, 12, '头像修改成功', '2019-05-08 12:00:03'),
(84, 12, '头像修改成功', '2019-05-08 12:08:55'),
(85, 12, '头像修改成功', '2019-05-08 12:09:27'),
(86, 12, '头像修改成功', '2019-05-08 12:09:54'),
(87, 12, '退出成功', '2019-05-08 15:05:08'),
(88, 12, '登录成功', '2019-05-08 15:07:44'),
(89, 12, '性别修改成功', '2019-05-08 15:07:57'),
(90, 12, '退出成功', '2019-05-08 15:13:10'),
(91, 12, '登录成功', '2019-05-08 15:13:20'),
(92, 12, '退出成功', '2019-05-08 15:14:13'),
(93, 12, '登录成功', '2019-05-08 15:14:35'),
(94, 12, '性别修改成功', '2019-05-08 15:16:38'),
(95, 12, '头像修改成功', '2019-05-08 15:17:15'),
(96, 12, '退出成功', '2019-05-08 15:18:15'),
(97, 12, '登录成功', '2019-05-08 15:23:40');

-- --------------------------------------------------------

--
-- 表的结构 `b_oeders`
--

CREATE TABLE `b_oeders` (
  `Orders_id` int(11) NOT NULL,
  `Serve_id` int(11) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `Update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Star` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `b_serve`
--

CREATE TABLE `b_serve` (
  `Serve_id` int(11) NOT NULL,
  `Type_id` tinyint(1) DEFAULT NULL,
  `User_id` int(11) DEFAULT NULL,
  `Club_id` int(11) DEFAULT NULL,
  `Photo` varchar(900) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `Phone` varchar(11) DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Good_nbr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `b_user`
--

CREATE TABLE `b_user` (
  `User_id` int(11) NOT NULL,
  `User_grade` int(10) DEFAULT NULL,
  `College_id` int(11) DEFAULT NULL,
  `Nickname` varchar(10) DEFAULT NULL,
  `Password` varchar(15) DEFAULT NULL,
  `Telephone` varchar(11) DEFAULT NULL,
  `Signature` varchar(900) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `Gender` smallint(6) DEFAULT NULL,
  `Autonym` tinyint(1) DEFAULT NULL,
  `Start_time` datetime DEFAULT NULL,
  `Update_time` datetime DEFAULT NULL,
  `Verification` tinyint(1) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `live` varchar(100) DEFAULT NULL,
  `User_role` smallint(6) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `Club_id` int(11) NOT NULL DEFAULT '-1',
  `flag` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_user`
--

INSERT INTO `b_user` (`User_id`, `User_grade`, `College_id`, `Nickname`, `Password`, `Telephone`, `Signature`, `image`, `Gender`, `Autonym`, `Start_time`, `Update_time`, `Verification`, `name`, `photo`, `live`, `User_role`, `email`, `Club_id`, `flag`) VALUES
(1, 12, 1, '你好', '123456', '15802337653', '我是江小白，生活很简单', '20190502\\b4cbceb57ef94799ef7dc2aa98d87644.jpg', 1, 1, '2019-01-01 00:00:00', '2019-01-02 00:00:00', 1, '李漂', NULL, '吉他', 1, NULL, -1, 0),
(2, 1, 1, '江小白一号', '123456', '13985001459', NULL, '20190503\\97064fa2aa11cdb23ba7bcbcb0ff0efa.jpg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, 0),
(3, 0, 1, '江小白二号', '123', '123456', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, -1, 0),
(4, NULL, 1, '还问我', '123', '15802337956', NULL, '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(5, NULL, 1, '123456', '123', '13985001459', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(6, NULL, 1, '李漂as阿萨德阿萨德', '123456', '15802338956', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(7, NULL, 1, '撒点', '123', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(8, NULL, 1, '撒点', '123', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(9, NULL, 1, '撒点', '123', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(10, NULL, 1, '撒点', '123', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(11, NULL, 1, '的451', '123', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(12, 1, 1, '江小白', '123456', '15802337653', '我是江小白,生活很简单', '20190505\\70152593ba6ca7b126a8135367d508c4.jpeg', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 1),
(13, NULL, 1, '123', '123', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(14, NULL, 1, '10', '100', '13985001459', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(15, NULL, 1, '11', '100', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(16, NULL, 1, '111', '111', '13985001459', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0),
(17, NULL, 1, '158', '111', '15802337653', '我是江小白,生活很简单', '20190430\\c15124d8e39576e079544fde2de9fc3a.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1921513506@qq.com', -1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `b_useractivity`
--

CREATE TABLE `b_useractivity` (
  `flag` int(10) NOT NULL,
  `Activity_ID` int(10) NOT NULL,
  `User_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_useractivity`
--

INSERT INTO `b_useractivity` (`flag`, `Activity_ID`, `User_id`) VALUES
(1, 1, 1),
(1, 1, 2),
(0, 1, 3),
(1, 2, 2),
(1, 3, 3),
(1, 3, 1),
(1, 4, 3),
(1, 5, 2),
(1, 6, 2);

-- --------------------------------------------------------

--
-- 表的结构 `b_userclub`
--

CREATE TABLE `b_userclub` (
  `User_id` int(11) NOT NULL,
  `Club_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_userclub`
--

INSERT INTO `b_userclub` (`User_id`, `Club_id`) VALUES
(2, 5),
(3, 5),
(1, 2),
(1, 1),
(3, 3),
(2, 4),
(12, 5);

-- --------------------------------------------------------

--
-- 表的结构 `b_userconcern`
--

CREATE TABLE `b_userconcern` (
  `id` int(10) NOT NULL,
  `User_id` int(10) NOT NULL,
  `username` varchar(200) NOT NULL,
  `userimage` varchar(1000) NOT NULL,
  `usersign` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `b_userconcern`
--

INSERT INTO `b_userconcern` (`id`, `User_id`, `username`, `userimage`, `usersign`) VALUES
(1, 1, '丁小黑', 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1551061972&di=6c74d004e03c086edbc8c0f11b904f07&src=http://image.9928.tv/UserFiles/shangshi/20181226/10220446.jpg', '我是丁小黑，有你就有我。'),
(2, 1, '江小白', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1551080317128&di=41b48fd07cf2862ca0cab3adda7bfcc6&imgtype=0&src=http%3A%2F%2Fspider.nosdn.127.net%2F72ed1e2205799dadd3db07cc75d9916f.jpeg', '我叫江小白，生活很简单');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `b_activity`
--
ALTER TABLE `b_activity`
  ADD PRIMARY KEY (`Activity_ID`),
  ADD KEY `FK_Reference_18` (`Club_id`),
  ADD KEY `FK_Reference_19` (`Category_id`);

--
-- Indexes for table `b_applyclub`
--
ALTER TABLE `b_applyclub`
  ADD PRIMARY KEY (`applyclub_id`),
  ADD UNIQUE KEY `applyclub_id` (`applyclub_id`);

--
-- Indexes for table `b_article`
--
ALTER TABLE `b_article`
  ADD PRIMARY KEY (`Article_id`),
  ADD KEY `FK_Reference_13` (`User_id`),
  ADD KEY `FK_Reference_24` (`Club_id`);

--
-- Indexes for table `b_category`
--
ALTER TABLE `b_category`
  ADD PRIMARY KEY (`Category_id`);

--
-- Indexes for table `b_club`
--
ALTER TABLE `b_club`
  ADD PRIMARY KEY (`Club_id`),
  ADD KEY `FK_Reference_17` (`CT_id`);

--
-- Indexes for table `b_clubtype`
--
ALTER TABLE `b_clubtype`
  ADD PRIMARY KEY (`CT_id`);

--
-- Indexes for table `b_college`
--
ALTER TABLE `b_college`
  ADD PRIMARY KEY (`College_id`);

--
-- Indexes for table `b_discuss`
--
ALTER TABLE `b_discuss`
  ADD PRIMARY KEY (`Discuss_id`),
  ADD KEY `FK_Reference_14` (`User_id`);

--
-- Indexes for table `b_follow`
--
ALTER TABLE `b_follow`
  ADD PRIMARY KEY (`Follow_id`),
  ADD KEY `FK_Reference_15` (`Club_id`),
  ADD KEY `FK_Reference_16` (`User_id`);

--
-- Indexes for table `b_history`
--
ALTER TABLE `b_history`
  ADD PRIMARY KEY (`History_id`),
  ADD KEY `FK_Reference_10` (`User_id`);

--
-- Indexes for table `b_myadvice`
--
ALTER TABLE `b_myadvice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_myapply`
--
ALTER TABLE `b_myapply`
  ADD PRIMARY KEY (`myapply_id`);

--
-- Indexes for table `b_mycollect`
--
ALTER TABLE `b_mycollect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_mymessage`
--
ALTER TABLE `b_mymessage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `b_oeders`
--
ALTER TABLE `b_oeders`
  ADD PRIMARY KEY (`Orders_id`),
  ADD KEY `FK_Reference_21` (`Serve_id`),
  ADD KEY `FK_Reference_23` (`User_id`);

--
-- Indexes for table `b_serve`
--
ALTER TABLE `b_serve`
  ADD PRIMARY KEY (`Serve_id`),
  ADD KEY `FK_Reference_11` (`User_id`),
  ADD KEY `FK_Reference_12` (`Club_id`);

--
-- Indexes for table `b_user`
--
ALTER TABLE `b_user`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `FK_Reference_6` (`College_id`);

--
-- Indexes for table `b_userconcern`
--
ALTER TABLE `b_userconcern`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `b_activity`
--
ALTER TABLE `b_activity`
  MODIFY `Activity_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `b_applyclub`
--
ALTER TABLE `b_applyclub`
  MODIFY `applyclub_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `b_article`
--
ALTER TABLE `b_article`
  MODIFY `Article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `b_category`
--
ALTER TABLE `b_category`
  MODIFY `Category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `b_club`
--
ALTER TABLE `b_club`
  MODIFY `Club_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `b_clubtype`
--
ALTER TABLE `b_clubtype`
  MODIFY `CT_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `b_college`
--
ALTER TABLE `b_college`
  MODIFY `College_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `b_discuss`
--
ALTER TABLE `b_discuss`
  MODIFY `Discuss_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `b_follow`
--
ALTER TABLE `b_follow`
  MODIFY `Follow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `b_history`
--
ALTER TABLE `b_history`
  MODIFY `History_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `b_myadvice`
--
ALTER TABLE `b_myadvice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用表AUTO_INCREMENT `b_myapply`
--
ALTER TABLE `b_myapply`
  MODIFY `myapply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
--
-- 使用表AUTO_INCREMENT `b_mycollect`
--
ALTER TABLE `b_mycollect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;
--
-- 使用表AUTO_INCREMENT `b_mymessage`
--
ALTER TABLE `b_mymessage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;
--
-- 使用表AUTO_INCREMENT `b_oeders`
--
ALTER TABLE `b_oeders`
  MODIFY `Orders_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `b_serve`
--
ALTER TABLE `b_serve`
  MODIFY `Serve_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `b_user`
--
ALTER TABLE `b_user`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 限制导出的表
--

--
-- 限制表 `b_activity`
--
ALTER TABLE `b_activity`
  ADD CONSTRAINT `FK_Reference_18` FOREIGN KEY (`Club_id`) REFERENCES `b_club` (`Club_id`),
  ADD CONSTRAINT `FK_Reference_19` FOREIGN KEY (`Category_id`) REFERENCES `b_category` (`Category_id`);

--
-- 限制表 `b_article`
--
ALTER TABLE `b_article`
  ADD CONSTRAINT `FK_Reference_13` FOREIGN KEY (`User_id`) REFERENCES `b_user` (`User_id`),
  ADD CONSTRAINT `FK_Reference_24` FOREIGN KEY (`Club_id`) REFERENCES `b_club` (`Club_id`);

--
-- 限制表 `b_club`
--
ALTER TABLE `b_club`
  ADD CONSTRAINT `FK_Reference_17` FOREIGN KEY (`CT_id`) REFERENCES `b_clubtype` (`CT_id`);

--
-- 限制表 `b_discuss`
--
ALTER TABLE `b_discuss`
  ADD CONSTRAINT `FK_Reference_14` FOREIGN KEY (`User_id`) REFERENCES `b_user` (`User_id`);

--
-- 限制表 `b_follow`
--
ALTER TABLE `b_follow`
  ADD CONSTRAINT `FK_Reference_15` FOREIGN KEY (`Club_id`) REFERENCES `b_club` (`Club_id`),
  ADD CONSTRAINT `FK_Reference_16` FOREIGN KEY (`User_id`) REFERENCES `b_user` (`User_id`);

--
-- 限制表 `b_history`
--
ALTER TABLE `b_history`
  ADD CONSTRAINT `FK_Reference_10` FOREIGN KEY (`User_id`) REFERENCES `b_user` (`User_id`);

--
-- 限制表 `b_oeders`
--
ALTER TABLE `b_oeders`
  ADD CONSTRAINT `FK_Reference_21` FOREIGN KEY (`Serve_id`) REFERENCES `b_serve` (`Serve_id`),
  ADD CONSTRAINT `FK_Reference_23` FOREIGN KEY (`User_id`) REFERENCES `b_user` (`User_id`);

--
-- 限制表 `b_serve`
--
ALTER TABLE `b_serve`
  ADD CONSTRAINT `FK_Reference_11` FOREIGN KEY (`User_id`) REFERENCES `b_user` (`User_id`),
  ADD CONSTRAINT `FK_Reference_12` FOREIGN KEY (`Club_id`) REFERENCES `b_club` (`Club_id`);

--
-- 限制表 `b_user`
--
ALTER TABLE `b_user`
  ADD CONSTRAINT `FK_Reference_6` FOREIGN KEY (`College_id`) REFERENCES `b_college` (`College_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
