/*
SQLyog Professional v12.09 (64 bit)
MySQL - 5.0.18-nt : Database - taotao
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`taotao` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `taotao`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `aid` int(11) NOT NULL auto_increment COMMENT '管理员id',
  `username` varchar(255) NOT NULL COMMENT '管理员登陆名',
  `password` varchar(255) NOT NULL COMMENT '管理员登陆密码',
  PRIMARY KEY  (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`aid`,`username`,`password`) values (1,'zhao','zhao');

/*Table structure for table `t_advert` */

DROP TABLE IF EXISTS `t_advert`;

CREATE TABLE `t_advert` (
  `adid` int(11) NOT NULL auto_increment,
  `adtype` int(11) NOT NULL,
  `adname` varchar(255) default NULL,
  `addesc` varchar(255) default NULL,
  `img` varchar(255) default NULL,
  `adprice` double(10,2) default NULL,
  `adtime` varchar(255) default NULL,
  `pid` int(11) default NULL,
  PRIMARY KEY  (`adid`),
  KEY `agid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_advert` */

insert  into `t_advert`(`adid`,`adtype`,`adname`,`addesc`,`img`,`adprice`,`adtime`,`pid`) values (1,1,'鱼缸造景','','ad/12.jpg',26.00,NULL,2203),(2,1,'武汉猫狮','','ad/11.jpg',38.00,NULL,1203),(3,21,'单孔氧气泵','','ad/21.jpg',25.00,NULL,4302),(4,22,'增色颗粒鱼食饲料','','ad/22.jpg',39.00,NULL,5204),(5,3,'青花瓷浅缸','凡购买此产品，另送景德镇陶瓷保温杯一个，数量有限，售完为止！颜色随机，以实物为准！','ad/3.jpg',388.00,'2017/6/1',3201);

/*Table structure for table `t_category` */

DROP TABLE IF EXISTS `t_category`;

CREATE TABLE `t_category` (
  `cid` int(11) NOT NULL auto_increment COMMENT '分类id',
  `cname` varchar(255) NOT NULL COMMENT '分类名',
  `cdesc` varchar(255) default NULL COMMENT '描述',
  `img` varchar(255) default NULL,
  PRIMARY KEY  (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_category` */

insert  into `t_category`(`cid`,`cname`,`cdesc`,`img`) values (1,'生物专区','生物专区','category/1.jpg'),(2,'水草专区','水草专区','category/2.jpg'),(3,'鱼缸专区','鱼缸专区','category/3.jpg'),(4,'器材专区','器材专区','category/4.jpg'),(5,'美味鱼粮','美味鱼粮','category/5.jpg'),(6,'水质调理','水质调理111','category/6.jpg');

/*Table structure for table `t_categorysecond` */

DROP TABLE IF EXISTS `t_categorysecond`;

CREATE TABLE `t_categorysecond` (
  `csid` int(11) NOT NULL auto_increment COMMENT '二级分类id',
  `csname` varchar(255) NOT NULL COMMENT '二级分类名',
  `csdesc` varchar(255) default NULL COMMENT '描述',
  `cid` int(11) NOT NULL COMMENT '一级分类id',
  PRIMARY KEY  (`csid`),
  KEY `FK4td4lluowiquqd2s9e9j2fmdq` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`),
  CONSTRAINT `FK4td4lluowiquqd2s9e9j2fmdq` FOREIGN KEY (`cid`) REFERENCES `t_category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_categorysecond` */

insert  into `t_categorysecond`(`csid`,`csname`,`csdesc`,`cid`) values (11,'热带鱼','热带鱼',1),(12,'金鱼','金鱼',1),(13,'锦鲤','锦鲤',1),(21,'水草','水草',2),(22,'装饰用品','造景用品',2),(31,'玻璃鱼缸','玻璃鱼缸',3),(32,'陶瓷鱼缸','陶瓷鱼缸',3),(33,'亚克力鱼缸','亚克力鱼缸',3),(41,'过滤器','过滤器',4),(42,'水泵',NULL,4),(43,'增氧泵',NULL,4),(44,'加热棒',NULL,4),(45,'过滤耗材',NULL,4),(51,'天然鱼粮',NULL,5),(52,'合成鱼粮',NULL,5),(61,'水质调理',NULL,6);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `oid` int(11) NOT NULL auto_increment,
  `total` double default NULL,
  `ordertime` datetime default NULL,
  `state` int(11) default NULL,
  `name` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  `payment` varchar(255) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`oid`),
  KEY `FKkymvvaj9rps3st3bkniqi0oci` (`uid`),
  CONSTRAINT `FKkymvvaj9rps3st3bkniqi0oci` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`oid`,`total`,`ordertime`,`state`,`name`,`addr`,`phone`,`remark`,`payment`,`uid`) values (1,363,'2017-04-27 15:33:09',3,'赵良涛','西安电子科技大学南校区','1234567890','','cod',1),(2,1099,'2017-04-27 15:57:45',1,'赵良涛','西安电子科技大学南校区','1234567890','','alipay',1),(3,450,'2017-04-27 15:58:05',0,NULL,NULL,NULL,NULL,NULL,1),(4,194,'2017-04-27 15:58:23',1,'赵良涛','西安电子科技大学南校区','1234567890','','bank',1),(5,288,'2017-04-27 15:58:36',4,'赵良涛','西安电子科技大学南校区','1234567890','','alipay',1);

/*Table structure for table `t_orderitem` */

DROP TABLE IF EXISTS `t_orderitem`;

CREATE TABLE `t_orderitem` (
  `oiid` int(11) NOT NULL auto_increment,
  `count` int(11) default NULL,
  `subtotal` double default NULL,
  `oid` int(11) default NULL,
  `gid` int(11) default NULL,
  `uid` int(11) default NULL,
  PRIMARY KEY  (`oiid`),
  KEY `FKiw2wap6k0hov6im3qafo0pmh5` (`oid`),
  KEY `FKlr0f3nrafiwmrawy64tjiwrf8` (`gid`),
  KEY `FKfiyd20mnbg3laxq3g9326duhn` (`uid`),
  CONSTRAINT `FKfiyd20mnbg3laxq3g9326duhn` FOREIGN KEY (`uid`) REFERENCES `t_order` (`oid`),
  CONSTRAINT `FKiw2wap6k0hov6im3qafo0pmh5` FOREIGN KEY (`oid`) REFERENCES `t_order` (`oid`),
  CONSTRAINT `FKlr0f3nrafiwmrawy64tjiwrf8` FOREIGN KEY (`gid`) REFERENCES `t_product` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_orderitem` */

insert  into `t_orderitem`(`oiid`,`count`,`subtotal`,`oid`,`gid`,`uid`) values (1,1,288,1,3103,1),(2,1,75,1,1101,1),(3,1,75,2,1101,2),(4,2,736,2,1102,2),(5,1,288,2,3103,2),(6,6,450,3,1101,3),(7,2,146,4,1306,4),(8,4,48,4,2101,4),(9,1,288,5,3103,5);

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `gid` int(11) NOT NULL auto_increment COMMENT '商品id',
  `pname` varchar(255) NOT NULL COMMENT '商品名',
  `nowprice` double(10,2) default NULL COMMENT '现价',
  `img1` varchar(255) default NULL COMMENT '图片',
  `img2` varchar(255) default NULL COMMENT '图片2',
  `star` int(11) NOT NULL default '0' COMMENT '星级',
  `pdesc` varchar(255) default NULL COMMENT '描述',
  `ptime` datetime default NULL COMMENT '上架时间',
  `ishot` int(11) NOT NULL default '0' COMMENT '是否热销',
  `csid` int(11) NOT NULL COMMENT '二级分类id',
  `cid` int(11) default NULL,
  PRIMARY KEY  (`gid`),
  KEY `FK7stakp6ge50jawogl5ep0s8av` (`cid`),
  KEY `FKrfkbevojv53oajihd6vqkovdi` (`csid`),
  CONSTRAINT `csid` FOREIGN KEY (`csid`) REFERENCES `t_categorysecond` (`csid`),
  CONSTRAINT `FK7stakp6ge50jawogl5ep0s8av` FOREIGN KEY (`cid`) REFERENCES `t_categorysecond` (`csid`),
  CONSTRAINT `FKrfkbevojv53oajihd6vqkovdi` FOREIGN KEY (`csid`) REFERENCES `t_categorysecond` (`csid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

insert  into `t_product`(`gid`,`pname`,`nowprice`,`img1`,`img2`,`star`,`pdesc`,`ptime`,`ishot`,`csid`,`cid`) values (1101,'鹦鹉鱼',75.00,'product\\1\\大正三色锦鲤1.jpg','product\\1\\大正三色锦鲤2.jpg',2,'鹦鹉鱼由于其嘴型酷似鹦鹉的嘴型而得名，成年的鹦鹉鱼体长可达1.2公尺，体重可达20公斤。鹦鹉鱼在野生环境下是生活在珊瑚礁中的热带鱼，所以人工饲养的时候需要注意水温。','2017-04-20 16:04:40',0,11,NULL),(1102,'招财鱼',368.00,'product\\1\\招财鱼1.jpg','product\\1\\招财鱼2.jpg',5,'招财鱼，又名飞船、长丝鲈。招财鱼可以说是丝足鲈科中的巨人了，他们成年体长可达20－69厘米。招财鱼对水质的要求并不严格，属于比较容易饲养的观赏鱼，并且招财鱼得性情温和，可以和别的观赏鱼混养。','2017-04-20 16:04:40',1,11,NULL),(1103,'孔雀鱼',120.00,'product\\1\\孔雀鱼1.jpg','product\\1\\孔雀鱼2.jpg',3,'孔雀鱼和其名字一样，有着像孔雀开屏一样的尾巴，其独特的外形以及饲养难度不大深受鱼友们的欢迎。而孔雀鱼其实是是台湾早期为了要预防登革热从国外引进的鱼种。孔雀鱼现今有几百种品系，依据比赛中的规定，大致可以分为八类。','2017-04-05 16:04:39',0,11,NULL),(1104,'金龙鱼',56.00,'product\\1\\金龙鱼1.jpg','product\\1\\金龙鱼2.jpg',1,'金龙鱼爱在2.9亿年前就已经开始存在了，是少数古生鱼类之一。现在金龙鱼主要分布在大洋洲、南美洲和亚洲等地。金龙鱼可以分为好几个品系，比较有名的品种有过背金龙和红龙鱼。','2017-04-05 16:04:39',0,11,NULL),(1105,'印尼虎鱼',132.00,'product\\1\\印尼虎鱼1.jpg','product\\1\\印尼虎鱼2.jpg',3,'印尼虎鱼最大的特点就是他们是夜行鱼，白天休息，到了夜间才会开始觅食并且活动。也正因为印尼虎鱼是夜行动物，所以印尼虎鱼的欣赏性比较差，饲养的鱼友并不是非常多。印尼虎鱼的黑色条纹是不稳定的发黑，更有甚者还会发黑到找不到条纹。','2017-04-05 16:04:39',0,11,NULL),(1106,'食人鲳',150.00,'product\\1\\食人鲳1.jpg','product\\1\\食人鲳2.jpg',3,'食人鲳是人们对一类分布在南美洲亚马逊河鱼类的统称，也有一种译名叫水虎鱼。食人鲳其实是一个类群，包括近30种，按照食性和习性的不同，可以分为植食性和肉食性两种。','2017-04-05 16:04:39',0,11,NULL),(1201,'黑兰寿',46.00,'product\\1\\黑兰寿1.jpg','product\\1\\黑兰寿2.jpg',1,'黑兰寿是金鱼的一个品种，是由兰寿和寿星所培育出来的，头瘤非常厚实，并且体型如兰寿般优美，深受鱼友爱好者们的喜爱。黑兰寿主要分布在日本，繁殖方式为卵生，有着和金鱼(详情介绍)一样的习性，属于变温动物。','2017-04-05 16:04:39',0,12,NULL),(1202,'鹤顶红金鱼',48.00,'product\\1\\鹤顶红金鱼1.jpg','product\\1\\鹤顶红金鱼2.jpg',3,'鹤顶红金鱼是金鱼的一个品种，从名字上我们就能理解其外观的独特。鹤顶红金鱼头部的红色肉瘤高高耸起，很像仙鹤的红冠，并且全身白色，故名鹤顶红。由于鹤顶红象征着吉祥的意思，所以对鹤顶红的外观要求非常严。','2017-04-05 16:04:39',0,12,NULL),(1203,'武汉猫狮',38.00,'product\\1\\武汉猫狮1.jpg','product\\1\\武汉猫狮2.jpg',4,'武汉猫狮是金鱼的一个品种，武汉猫狮的体型短并且圆，眼睛和嘴部都被发达的头瘤覆盖，所以这种品种比较容易出现栽头的现象。此外，武汉猫狮属于狮头类型。','2017-04-05 16:04:39',1,12,NULL),(1204,'红白草金鱼',15.00,'product\\1\\红白草金鱼1.jpg','product\\1\\红白草金鱼2.jpg',3,'红白草金鱼属于草种金鱼，主要分布在中国。由于草种金鱼形似锦鲤，也是金鱼中最古老的一种。红白草金鱼的饲养难度不大，属于比较容易饲养的金鱼品种，也是比较常见的品种。','2017-04-05 16:04:39',0,12,NULL),(1301,'大正三色锦鲤',20.00,'product\\1\\大正三色锦鲤1.jpg','product\\1\\大正三色锦鲤2.jpg',2,'大正三色是在公元1900年的日本大正时代培育出的墨色色斑的红、白、黑的三色锦鲤，所以命名为大正三色。其习性和锦鲤一样，只是花斑和别的品种略有不同。大正三色的名声非常响，和红白锦鲤同为锦鲤的代表品种。','2017-04-05 16:04:39',0,13,NULL),(1302,'黄金锦鲤',82.00,'product\\1\\黄金锦鲤1.jpg','product\\1\\黄金锦鲤2.jpg',3,'黄金锦鲤为金黄色的锦鲤，非常特别。由于黄金锦鲤的特色特殊，很多人都会将他们当做风水鱼饲养。由于黄金锦鲤又寓意着招财，所以摆放在风水好的地方也有吉利的说法。','2017-04-05 16:04:39',0,13,NULL),(1303,'丹顶锦鲤',106.00,'product\\1\\丹顶锦鲤1.jpg','product\\1\\丹顶锦鲤2.jpg',4,'丹顶锦鲤由于头顶正中有一块红色的圆斑，通体雪白，非常特别。在风水上有“鸿运当头”的美名，所以很多讲究的人都会饲养丹顶锦鲤。','2017-05-01 12:24:57',1,13,NULL),(1304,'红白锦鲤',32.00,'product\\1\\红白锦鲤1.jpg','product\\1\\红白锦鲤2.jpg',2,'红白锦鲤属于锦鲤的代表品种，很多鱼友也对红白锦鲤情有独钟，并且现在用红白锦鲤当做风水鱼来饲养的也越来越多。最早人们发现红白锦鲤是在一八零四年至一八二九年间，之后逐渐经过人工改良变成了现在的样子。','2017-04-05 16:04:39',0,13,NULL),(1305,'秋翠锦鲤',56.00,'product\\1\\秋翠锦鲤1.jpg','product\\1\\秋翠锦鲤2.jpg',2,'秋翠锦鲤是德国鲤系统的浅黄锦鲤，也因此很多人都没办法分清楚浅黄锦鲤和秋翠锦鲤的区别。秋翠锦鲤根据色彩的分布可以分为花秋翠、黄秋翠和绯秋翠三种。','2017-04-05 16:04:39',0,13,NULL),(1306,'昭和三色',73.00,'product\\1\\昭和三色1.jpg','product\\1\\昭和三色2.jpg',4,'昭和三色是锦鲤的一个非常重要的品种，昭和三色和大正三色一样，都是由墨黑、绯红、白三种色彩所构成，而昭和三色是以黑色为基地，加上白色及绯红所构成。','2017-04-20 16:04:39',1,13,NULL),(2101,'金鱼藻',12.00,'product\\2\\金鱼藻1.jpg','product\\2\\金鱼藻2.jpg',4,'金鱼藻是多年生沉水草本；茎长40-150厘米，平滑，具分枝。叶4-12轮生， 1-2次二叉状分歧，裂片丝状，或丝状条形，长1.5-2厘米，宽0.1-0.5毫米，先端带白色软骨质，边缘仅一侧有数细齿。','2017-04-05 16:04:39',0,21,NULL),(2102,'水盾草',37.00,'product\\2\\水盾草1.jpg','product\\2\\水盾草2.jpg',3,'茎细长。叶两型：沉水叶对生，圆扇形，掌状分裂，裂片3~4次二叉分裂。由于其雅致美观的沉水叶，常被作为水族馆观赏植物。浮水叶少数，在花枝顶端互生，叶片狭椭圆形，盾状着生。花单生枝上部叶腋，三基数，花冠白色。','2017-04-05 16:04:39',0,21,NULL),(2103,'莫丝',28.00,'product\\2\\莫丝1.jpg','product\\2\\莫丝2.jpg',1,'莫丝的汉译名称来自英文Moss；种类有陆生，半水生和水生三种。通常被造景者绑在沉木或岩石上运用。对于环境的适应力强，唯对新换的水较不能马上适应，并不需要太强的光线即能良好的生长。','2017-04-05 16:04:39',0,21,NULL),(2104,'小水榕',8.00,'product\\2\\小水榕1.jpg','product\\2\\小水榕2.jpg',4,'','2017-04-05 16:04:39',0,21,NULL),(2105,'水蕴草',15.00,'product\\2\\水蕴草1.jpg','product\\2\\水蕴草2.jpg',2,'','2017-04-05 16:04:39',0,21,NULL),(2201,'雨花石',8.00,'product\\2\\雨花石1.jpg','product\\2\\雨花石2.jpg',4,NULL,'2017-04-05 16:04:39',0,22,NULL),(2202,'白石子',3.00,'product\\2\\白石子1.jpg','product\\2\\白石子2.jpg',5,NULL,'2017-04-05 16:04:39',0,22,NULL),(2203,'鱼缸造景',26.00,'product\\2\\鱼缸造景1.jpg','product\\2\\鱼缸造景2.jpg',3,NULL,'2017-04-05 16:04:39',0,22,NULL),(2204,'仿真水草',2.00,'product\\2\\仿真水草1.jpg','product\\2\\仿真水草1.jpg',2,NULL,'2017-04-05 16:04:39',0,22,NULL),(3101,'小型鱼缸',186.00,'product\\3\\小型鱼缸1.jpg','product\\3\\小型鱼缸2.jpg',2,NULL,'2017-04-05 16:04:39',0,31,NULL),(3102,'中型鱼缸',198.00,'product\\3\\中型鱼缸1.jpg','product\\3\\中型鱼缸1.jpg',3,NULL,'2017-04-05 16:04:39',0,31,NULL),(3103,'组合鱼缸',288.00,'product\\3\\组合鱼缸1.jpg','product\\3\\组合鱼缸2.jpg',5,NULL,'2017-04-20 16:04:39',1,31,NULL),(3104,'悬挂鱼缸',138.00,'product\\3\\悬挂鱼缸1.jpg','product\\3\\悬挂鱼缸2.jpg',3,NULL,'2017-04-05 16:04:39',0,31,NULL),(3201,'青花瓷浅缸',388.00,'product\\3\\青花瓷1.jpg','product\\3\\青花瓷2.jpg',4,NULL,'2017-04-05 16:04:39',1,32,NULL),(4101,'缸外过滤器',50.00,'product\\4\\缸外过滤器1.jpg','product\\4\\缸外过滤器2.jpg',4,NULL,'2017-04-05 16:04:39',0,41,NULL),(4102,'超强过滤器',618.00,'product\\4\\超强过滤器1.jpg','product\\4\\超强过滤器2jpg',2,NULL,'2017-04-05 16:04:39',0,41,NULL),(4103,'简装过滤器',22.00,'product\\4\\简装过滤器1.jpg','product\\4\\简装过滤器2.jpg',5,NULL,'2017-04-05 16:04:39',0,41,NULL),(4201,'三合一鱼缸潜水泵',167.00,'product\\4\\三合一鱼缸潜水泵1.jpg','product\\4\\三合一鱼缸潜水泵2.jpg',2,NULL,'2017-04-05 16:04:39',0,42,NULL),(4301,'水族箱2W氧气泵',27.00,'product\\4\\水族箱2W氧气泵1.jpg','product\\4\\水族箱2W氧气泵1.jpg',4,NULL,'2017-04-05 16:04:39',0,43,NULL),(4302,'单孔氧气泵',25.00,'product\\4\\单孔氧气泵1.jpg','product\\4\\单孔氧气泵2.jpg',2,NULL,'2017-04-05 16:04:39',0,43,NULL),(4401,'防爆加热棒',73.00,'product\\4\\防爆加热棒1.jpg','product\\4\\防爆加热棒1.jpg',3,NULL,'2017-04-05 16:04:39',0,44,NULL),(4402,'Neo-Therm Heater加热棒',371.00,'product\\4\\Neo-Therm Heater加热棒1.jpg','product\\4\\Neo-Therm Heater加热棒2.jpg',4,NULL,'2017-04-05 16:04:39',0,44,NULL),(4403,'Finnex Max-300加热棒',200.00,'product\\4\\Finnex Max-300加热棒1.jpg','product\\4\\Finnex Max-300加热棒2.jpg',3,NULL,'2017-04-05 16:04:39',0,44,NULL),(4404,'加热棒保护套',21.00,'product\\4\\加热棒保护套1.jpg','product\\4\\加热棒保护套1.jpg',2,NULL,'2017-04-05 16:04:39',0,44,NULL),(4501,'竹碳过滤耗材',27.00,'product\\4\\竹碳过滤耗材1.jpg','product\\4\\竹碳过滤耗材2.jpg',4,NULL,'2017-04-05 16:04:39',0,45,NULL),(4502,'白色生化过滤棉',10.00,'product\\4\\白色生化过滤棉1.jpg','product\\4\\白色生化过滤棉2.jpg',2,NULL,'2017-04-05 16:04:39',0,45,NULL),(5101,'南极虾',38.00,'product\\5\\南极虾1.jpg','product\\5\\南极虾2.jpg',2,NULL,'2017-04-05 16:04:39',1,51,NULL),(5102,'蚯蚓干',22.00,'product\\5\\蚯蚓干1.jpg','product\\5\\蚯蚓干2.jpg',4,NULL,'2017-04-05 16:04:39',0,51,NULL),(5103,'冻干丰年虫卵脱壳卵',19.00,'product\\5\\冻干丰年虫卵脱壳卵1.jpg','product\\5\\冻干丰年虫卵脱壳卵2.jpg',3,NULL,'2017-04-05 16:04:39',0,51,NULL),(5104,'面包虫黄粉虫',44.00,'product\\5\\面包虫黄粉虫1.jpg','product\\5\\面包虫黄粉虫2.jpg',3,NULL,'2017-04-05 16:04:39',0,51,NULL),(5201,'育成锦鲤鱼食饲料',25.00,'product\\5\\育成锦鲤鱼食饲料1.jpg','product\\5\\育成锦鲤鱼食饲料2.jpg',2,NULL,'2017-04-05 16:04:39',0,52,NULL),(5202,'颗粒鱼食饲料',29.00,'product\\5\\颗粒鱼食饲料1.jpg','product\\5\\颗粒鱼食饲料2.jpg',4,NULL,'2017-04-05 16:04:39',0,52,NULL),(5203,'胚芽锦鲤鱼食饲料',29.00,'product\\5\\胚芽锦鲤鱼食饲料1.jpg','product\\5\\胚芽锦鲤鱼食饲料2.jpg',2,NULL,'2017-04-05 16:04:39',0,52,NULL),(5204,'增色颗粒鱼食饲料',39.00,'product\\5\\增色颗粒鱼食饲料1.jpg','product\\5\\增色颗粒鱼食饲料2.jpg',4,NULL,'2017-04-05 16:04:39',0,52,NULL),(6101,'茶色大微水质净化环',288.00,'product\\6\\茶色大微水质净化环1.jpg','product\\6\\茶色大微水质净化环2.jpg',3,NULL,'2017-04-05 16:04:39',0,61,NULL),(6102,'绿色大微水质净化环',287.00,'product\\6\\绿色大微水质净化环1.jpg','product\\6\\绿色大微水质净化环2.jpg',3,NULL,'2017-04-05 16:04:39',0,61,NULL);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` int(11) NOT NULL auto_increment COMMENT '用户id',
  `email` varchar(255) NOT NULL default '' COMMENT '激活邮箱',
  `username` varchar(255) default NULL COMMENT '用户登陆名',
  `password` varchar(255) NOT NULL COMMENT '登陆密码',
  `realname` varchar(255) default NULL COMMENT '用户真实姓名',
  `phone` varchar(255) default NULL COMMENT '电话',
  `addr` varchar(255) default NULL COMMENT '地址',
  `state` int(11) NOT NULL default '0' COMMENT '状态',
  `activationcode` varchar(255) default NULL COMMENT '激活码',
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`uid`,`email`,`username`,`password`,`realname`,`phone`,`addr`,`state`,`activationcode`) values (1,'aaa@wulala.com','aaa','123','赵良涛','1234567890','西安电子科技大学南校区',1,NULL),(2,'bbb@wulala.com','','123','','','',1,'48df9cbeafec41d1a4117e00108bf740b63ba208fcd24145b3dbf77169775450'),(10,'ccc@wulala.com',NULL,'123',NULL,NULL,NULL,0,'5bc9bd872c1247efbeaf50d626218d67d764b4d4d3ac4e188a0d8f9c18a4e165');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
