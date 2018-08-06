# phpcms bakfile
# version:PHPCMS V9
# time:2017-07-31 11:28:40
# type:phpcms
# phpcms:http://www.phpcms.cn
# --------------------------------------------------------


DROP TABLE IF EXISTS `v9_admin`;
CREATE TABLE `v9_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_admin` VALUES('1','admin','30ea3efafb0da6ebbadaf6e369be4598','1','1aQjeV','127.0.0.1','1501471131','admin@qq.com','','','');

DROP TABLE IF EXISTS `v9_admin_panel`;
CREATE TABLE `v9_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_admin_role`;
CREATE TABLE `v9_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `v9_admin_role` VALUES('1','超级管理员','超级管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('2','站点管理员','站点管理员','0','0');
INSERT INTO `v9_admin_role` VALUES('3','运营总监','运营总监','1','0');
INSERT INTO `v9_admin_role` VALUES('4','总编','总编','5','0');
INSERT INTO `v9_admin_role` VALUES('5','编辑','编辑','1','0');
INSERT INTO `v9_admin_role` VALUES('7','发布人员','发布人员','0','0');

DROP TABLE IF EXISTS `v9_admin_role_priv`;
CREATE TABLE `v9_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_announce`;
CREATE TABLE `v9_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '0000-00-00',
  `endtime` date NOT NULL DEFAULT '0000-00-00',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_attachment`;
CREATE TABLE `v9_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_attachment_index`;
CREATE TABLE `v9_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_badword`;
CREATE TABLE `v9_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_badword` VALUES('1','污染','1','**','1497608720','0');

DROP TABLE IF EXISTS `v9_block`;
CREATE TABLE `v9_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `v9_block` VALUES('1','1','【PC】版权信息','copyright','1','<p style=\"text-align: center;\">本站纯属免费<a href=\"http://www.mm131.com/\" title=\"美女图片\">美女图片</a>欣赏网站,所有<a href=\"http://www.mm131.com/\" title=\"mm\">mm</a>图片均收集于互联网,如有侵犯版权请来信告知,我们将立即更正。<br />\r\n&copy; 2016 (<a href=\"http://www.xxxx.com/\" target=\"_blank\">www.xxx.com</a>) MM131美女图片 版权所有 黔ICP备140xxx50号-2</p>','');
INSERT INTO `v9_block` VALUES('2','1','【PC】头部左侧文字','toptxt','1','<p>欢迎您来到MM131<b>美女图片</b>网,本站永久域名http://www.xxx.com</p>','');
INSERT INTO `v9_block` VALUES('3','1','【PC】搜索下方内容','top_search','1','<p><a>热门搜索：</a><a href=\"/\">美女</a>&nbsp;<a href=\"\">mm 图片</a>&nbsp;<a href=\"\">美女写真</a>&nbsp;<a href=\"\">校花</a>&nbsp;<a href=\"\">人体艺术</a></p>','');
INSERT INTO `v9_block` VALUES('4','1','【手机】底部版权信息','m_copyright','1','<p>&copy; 2017 <a href=\"http://m.mm131.com/\" target=\"_blank\">MM131美女图片</a> All Rights Reserved.</p><p><a href=\"http://m.mm131.com/\" target=\"_blank\"><span style=\"font-size:18px\">m.mm131.com</span></a></p>','');

DROP TABLE IF EXISTS `v9_block_history`;
CREATE TABLE `v9_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `v9_block_history` VALUES('1','1','{\"id\":\"1\",\"siteid\":\"1\",\"name\":\"\\u3010\\u5e95\\u90e8\\u3011\\u7248\\u6743\\u4fe1\\u606f\",\"pos\":\"copyright\",\"type\":\"1\",\"data\":\"\",\"template\":\"\"}','1500826121','1','admin');
INSERT INTO `v9_block_history` VALUES('2','2','{\"id\":\"2\",\"siteid\":\"1\",\"name\":\"\\u5934\\u90e8\\u5de6\\u4fa7\\u6587\\u5b57\",\"pos\":\"toptxt\",\"type\":\"1\",\"data\":\"\",\"template\":\"\"}','1500827277','1','admin');
INSERT INTO `v9_block_history` VALUES('3','2','{\"id\":\"2\",\"siteid\":\"1\",\"name\":\"\\u5934\\u90e8\\u5de6\\u4fa7\\u6587\\u5b57\",\"pos\":\"toptxt\",\"type\":\"1\",\"data\":\"<p>\\u6b22\\u8fce\\u60a8\\u6765\\u5230MM131<b>\\u7f8e\\u5973\\u56fe\\u7247<\\/b>\\u7f51,\\u672c\\u7ad9\\u6c38\\u4e45\\u57df\\u540dhttp:\\/\\/www.mm131.com<\\/p>\",\"template\":\"\"}','1500827314','1','admin');
INSERT INTO `v9_block_history` VALUES('4','1','{\"id\":\"1\",\"siteid\":\"1\",\"name\":\"\\u3010\\u5e95\\u90e8\\u3011\\u7248\\u6743\\u4fe1\\u606f\",\"pos\":\"copyright\",\"type\":\"1\",\"data\":\"<p style=\\\"text-align: center;\\\">\\u672c\\u7ad9\\u7eaf\\u5c5e\\u514d\\u8d39<a href=\\\"http:\\/\\/www.mm131.com\\/\\\" title=\\\"\\u7f8e\\u5973\\u56fe\\u7247\\\">\\u7f8e\\u5973\\u56fe\\u7247<\\/a>\\u6b23\\u8d4f\\u7f51\\u7ad9,\\u6240\\u6709<a href=\\\"http:\\/\\/www.mm131.com\\/\\\" title=\\\"mm\\\">mm<\\/a>\\u56fe\\u7247\\u5747\\u6536\\u96c6\\u4e8e\\u4e92\\u8054\\u7f51,\\u5982\\u6709\\u4fb5\\u72af\\u7248\\u6743\\u8bf7\\u6765\\u4fe1\\u544a\\u77e5,\\u6211\\u4eec\\u5c06\\u7acb\\u5373\\u66f4\\u6b63\\u3002<br \\/>\\r\\n&copy; 2016 (<a href=\\\"http:\\/\\/www.mm131.com\\/\\\" target=\\\"_blank\\\">www.mm131.com<\\/a>) MM131\\u7f8e\\u5973\\u56fe\\u7247 \\u7248\\u6743\\u6240\\u6709 \\u9ed4ICP\\u590714005250\\u53f7-2<\\/p>\",\"template\":\"\"}','1500827331','1','admin');
INSERT INTO `v9_block_history` VALUES('5','1','{\"id\":\"1\",\"siteid\":\"1\",\"name\":\"\\u3010\\u5e95\\u90e8\\u3011\\u7248\\u6743\\u4fe1\\u606f\",\"pos\":\"copyright\",\"type\":\"1\",\"data\":\"<p style=\\\"text-align: center;\\\">\\u672c\\u7ad9\\u7eaf\\u5c5e\\u514d\\u8d39<a href=\\\"http:\\/\\/www.mm131.com\\/\\\" title=\\\"\\u7f8e\\u5973\\u56fe\\u7247\\\">\\u7f8e\\u5973\\u56fe\\u7247<\\/a>\\u6b23\\u8d4f\\u7f51\\u7ad9,\\u6240\\u6709<a href=\\\"http:\\/\\/www.mm131.com\\/\\\" title=\\\"mm\\\">mm<\\/a>\\u56fe\\u7247\\u5747\\u6536\\u96c6\\u4e8e\\u4e92\\u8054\\u7f51,\\u5982\\u6709\\u4fb5\\u72af\\u7248\\u6743\\u8bf7\\u6765\\u4fe1\\u544a\\u77e5,\\u6211\\u4eec\\u5c06\\u7acb\\u5373\\u66f4\\u6b63\\u3002<br \\/>\\r\\n&copy; 2016 (<a href=\\\"http:\\/\\/www.xxxx.com\\/\\\" target=\\\"_blank\\\">www.xxx.com<\\/a>) MM131\\u7f8e\\u5973\\u56fe\\u7247 \\u7248\\u6743\\u6240\\u6709 \\u9ed4ICP\\u590714005250\\u53f7-2<\\/p>\",\"template\":\"\"}','1500827339','1','admin');
INSERT INTO `v9_block_history` VALUES('6','1','{\"id\":\"1\",\"siteid\":\"1\",\"name\":\"\\u3010\\u5e95\\u90e8\\u3011\\u7248\\u6743\\u4fe1\\u606f\",\"pos\":\"copyright\",\"type\":\"1\",\"data\":\"<p style=\\\"text-align: center;\\\">\\u672c\\u7ad9\\u7eaf\\u5c5e\\u514d\\u8d39<a href=\\\"http:\\/\\/www.mm131.com\\/\\\" title=\\\"\\u7f8e\\u5973\\u56fe\\u7247\\\">\\u7f8e\\u5973\\u56fe\\u7247<\\/a>\\u6b23\\u8d4f\\u7f51\\u7ad9,\\u6240\\u6709<a href=\\\"http:\\/\\/www.mm131.com\\/\\\" title=\\\"mm\\\">mm<\\/a>\\u56fe\\u7247\\u5747\\u6536\\u96c6\\u4e8e\\u4e92\\u8054\\u7f51,\\u5982\\u6709\\u4fb5\\u72af\\u7248\\u6743\\u8bf7\\u6765\\u4fe1\\u544a\\u77e5,\\u6211\\u4eec\\u5c06\\u7acb\\u5373\\u66f4\\u6b63\\u3002<br \\/>\\r\\n&copy; 2016 (<a href=\\\"http:\\/\\/www.xxxx.com\\/\\\" target=\\\"_blank\\\">www.xxx.com<\\/a>) MM131\\u7f8e\\u5973\\u56fe\\u7247 \\u7248\\u6743\\u6240\\u6709 \\u9ed4ICP\\u5907140xxx50\\u53f7-2<\\/p>\",\"template\":\"\"}','1500827340','1','admin');
INSERT INTO `v9_block_history` VALUES('7','3','{\"id\":\"3\",\"siteid\":\"1\",\"name\":\"\\u3010\\u9876\\u90e8\\u3011\\u641c\\u7d22\\u4e0b\\u65b9\\u5185\\u5bb9\",\"pos\":\"top_search\",\"type\":\"1\",\"data\":\"\",\"template\":\"\"}','1500827669','1','admin');

DROP TABLE IF EXISTS `v9_block_priv`;
CREATE TABLE `v9_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_cache`;
CREATE TABLE `v9_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_cache` VALUES('mood_program.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'震惊\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'不解\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'愤怒\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'杯具\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'无聊\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'高兴\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'支持\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'超赞\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'1\',\n  2 => \'1\',\n  3 => \'1\',\n  4 => \'1\',\n  5 => \'1\',\n  6 => \'1\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'catid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'1\',\n    \'catname\' => \'性感美女\',\n    \'catename\' => NULL,\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'xingganmeinv\',\n    \'url\' => \'http://s.2017.07.18mm.huhangnet.com/list-1-1.html\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xingganmeinv\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'30\',\n    \'show_ruleid\' => \'17\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  2 => \n  array (\n    \'catid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'2\',\n    \'catname\' => \'清纯美眉\',\n    \'catename\' => NULL,\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'qingchunmeimei\',\n    \'url\' => \'http://s.2017.07.18mm.huhangnet.com/list-2-1.html\',\n    \'items\' => \'3\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}\',\n    \'listorder\' => \'2\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qingchunmeimei\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'30\',\n    \'show_ruleid\' => \'17\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  3 => \n  array (\n    \'catid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'3\',\n    \'catname\' => \'美女校花\',\n    \'catename\' => NULL,\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'meinvxiaohua\',\n    \'url\' => \'http://s.2017.07.18mm.huhangnet.com/list-3-1.html\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'meinvxiaohua\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'30\',\n    \'show_ruleid\' => \'17\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  4 => \n  array (\n    \'catid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'4\',\n    \'catname\' => \'性感车模\',\n    \'catename\' => NULL,\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'xingganchemo\',\n    \'url\' => \'http://s.2017.07.18mm.huhangnet.com/list-4-1.html\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}\',\n    \'listorder\' => \'4\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'xingganchemo\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'30\',\n    \'show_ruleid\' => \'17\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  5 => \n  array (\n    \'catid\' => \'5\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'5\',\n    \'catname\' => \'旗袍美女\',\n    \'catename\' => NULL,\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'qipaomeinv\',\n    \'url\' => \'http://s.2017.07.18mm.huhangnet.com/list-5-1.html\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}\',\n    \'listorder\' => \'5\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'qipaomeinv\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'30\',\n    \'show_ruleid\' => \'17\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n  6 => \n  array (\n    \'catid\' => \'6\',\n    \'siteid\' => \'1\',\n    \'type\' => \'0\',\n    \'modelid\' => \'3\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'6\',\n    \'catname\' => \'明星写真\',\n    \'catename\' => NULL,\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'mingxingxiezhen\',\n    \'url\' => \'http://s.2017.07.18mm.huhangnet.com/list-6-1.html\',\n    \'items\' => \'2\',\n    \'hits\' => \'0\',\n    \'setting\' => \'{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}\',\n    \'listorder\' => \'6\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'mingxingxiezhen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => \'0\',\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => \'0\',\n    \'category_ruleid\' => \'30\',\n    \'show_ruleid\' => \'17\',\n    \'workflowid\' => \'\',\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('bakup_tables.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  0 => \'v9_admin\',\n  1 => \'v9_admin_panel\',\n  2 => \'v9_admin_role\',\n  3 => \'v9_admin_role_priv\',\n  4 => \'v9_announce\',\n  5 => \'v9_attachment\',\n  6 => \'v9_attachment_index\',\n  7 => \'v9_badword\',\n  8 => \'v9_block\',\n  9 => \'v9_block_history\',\n  10 => \'v9_block_priv\',\n  11 => \'v9_cache\',\n  12 => \'v9_category\',\n  13 => \'v9_category_priv\',\n  14 => \'v9_collection_content\',\n  15 => \'v9_collection_history\',\n  16 => \'v9_collection_node\',\n  17 => \'v9_collection_program\',\n  18 => \'v9_comment\',\n  19 => \'v9_comment_check\',\n  20 => \'v9_comment_data_1\',\n  21 => \'v9_comment_setting\',\n  22 => \'v9_comment_table\',\n  23 => \'v9_content_check\',\n  24 => \'v9_copyfrom\',\n  25 => \'v9_datacall\',\n  26 => \'v9_dbsource\',\n  27 => \'v9_download\',\n  28 => \'v9_download_data\',\n  29 => \'v9_downservers\',\n  30 => \'v9_extend_setting\',\n  31 => \'v9_favorite\',\n  32 => \'v9_hits\',\n  33 => \'v9_ipbanned\',\n  34 => \'v9_keylink\',\n  35 => \'v9_keyword\',\n  36 => \'v9_keyword_data\',\n  37 => \'v9_link\',\n  38 => \'v9_linkage\',\n  39 => \'v9_log\',\n  40 => \'v9_member\',\n  41 => \'v9_member_detail\',\n  42 => \'v9_member_group\',\n  43 => \'v9_member_menu\',\n  44 => \'v9_member_verify\',\n  45 => \'v9_member_vip\',\n  46 => \'v9_menu\',\n  47 => \'v9_message\',\n  48 => \'v9_message_data\',\n  49 => \'v9_message_group\',\n  50 => \'v9_model\',\n  51 => \'v9_model_field\',\n  52 => \'v9_module\',\n  53 => \'v9_mood\',\n  54 => \'v9_news\',\n  55 => \'v9_news_data\',\n  56 => \'v9_page\',\n  57 => \'v9_pay_account\',\n  58 => \'v9_pay_payment\',\n  59 => \'v9_pay_spend\',\n  60 => \'v9_picture\',\n  61 => \'v9_picture_data\',\n  62 => \'v9_position\',\n  63 => \'v9_position_data\',\n  64 => \'v9_poster\',\n  65 => \'v9_poster_201706\',\n  66 => \'v9_poster_201707\',\n  67 => \'v9_poster_space\',\n  68 => \'v9_queue\',\n  69 => \'v9_release_point\',\n  70 => \'v9_search\',\n  71 => \'v9_search_keyword\',\n  72 => \'v9_session\',\n  73 => \'v9_site\',\n  74 => \'v9_sms_report\',\n  75 => \'v9_special\',\n  76 => \'v9_special_c_data\',\n  77 => \'v9_special_content\',\n  78 => \'v9_sphinx_counter\',\n  79 => \'v9_sso_admin\',\n  80 => \'v9_sso_applications\',\n  81 => \'v9_sso_members\',\n  82 => \'v9_sso_messagequeue\',\n  83 => \'v9_sso_session\',\n  84 => \'v9_sso_settings\',\n  85 => \'v9_tag\',\n  86 => \'v9_template_bak\',\n  87 => \'v9_ticket\',\n  88 => \'v9_times\',\n  89 => \'v9_type\',\n  90 => \'v9_urlrule\',\n  91 => \'v9_vote_data\',\n  92 => \'v9_vote_option\',\n  93 => \'v9_vote_subject\',\n  94 => \'v9_wap\',\n  95 => \'v9_wap_type\',\n  96 => \'v9_workflow\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('sitelist.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'美女图片\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://s.2017.07.18mm.huhangnet.com/\',\n    \'site_title\' => \'美女图片\',\n    \'keywords\' => \'美女图片\',\n    \'description\' => \'美女图片\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'huhangnet\',\n    \'template\' => \'huhangnet\',\n    \'setting\' => \'{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\\\/images\\\\/water\\\\/\\\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}\',\n    \'uuid\' => \'693b717c-2722-11e7-961b-00163e004142\',\n    \'url\' => \'http://s.2017.07.18mm.huhangnet.com/\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('downservers.cache.php','caches_commons/caches_data/','<?php\nreturn NULL;\n?>');
INSERT INTO `v9_cache` VALUES('badword.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  0 => \n  array (\n    \'badid\' => \'1\',\n    \'badword\' => \'污染\',\n    \'replaceword\' => \'**\',\n    \'level\' => \'1\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('ipbanned.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('keylink.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('position.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'3\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页幻灯片\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'3\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页头条\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  3 => \n  array (\n    \'posid\' => \'3\',\n    \'modelid\' => \'3\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页栏目图片推荐\',\n    \'maxnum\' => \'200\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  4 => \n  array (\n    \'posid\' => \'4\',\n    \'modelid\' => \'3\',\n    \'catid\' => \'0\',\n    \'name\' => \'首页右侧推荐\',\n    \'maxnum\' => \'26\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('role_siteid.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('role.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'超级管理员\',\n  2 => \'站点管理员\',\n  3 => \'运营总监\',\n  4 => \'总编\',\n  5 => \'编辑\',\n  7 => \'发布人员\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules_detail.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('urlrules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('modules.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'phpcms@phpcms.cn\\\',\n  \\\'adminaccessip\\\' => \\\'0\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'maxiplockedtime\\\' => \\\'15\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'mail_user\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_password\\\' => \\\'\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'会员\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \\\',\n  \\\'registerverifymessage\\\' => \\\' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'支付\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'顶一下\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'专题\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'内容模块\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'全站搜索\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'木马扫描\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'附件\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'碎片\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'采集模块\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'数据源\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'模板风格\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'发布点\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'视频库\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'公告\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'公告\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-04-22\',\n    \'updatedate\' => \'2017-04-22\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'评论\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'评论\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-04-22\',\n    \'updatedate\' => \'2017-04-22\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'友情链接\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'vote\' => \n  array (\n    \'module\' => \'vote\',\n    \'name\' => \'投票\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\r\n  1 => \r\n  array (\r\n    \\\'default_style\\\' => \\\'default\\\',\r\n    \\\'vote_tp_template\\\' => \\\'vote_tp\\\',\r\n    \\\'allowguest\\\' => \\\'1\\\',\r\n    \\\'enabled\\\' => \\\'1\\\',\r\n    \\\'interval\\\' => \\\'1\\\',\r\n    \\\'credit\\\' => \\\'1\\\',\r\n  ),\r\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'短消息\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'mood\' => \n  array (\n    \'module\' => \'mood\',\n    \'name\' => \'新闻心情\',\n    \'url\' => \'mood/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'新闻心情\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-04-22\',\n    \'updatedate\' => \'2017-04-22\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'广告模块\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'广告模块\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-04-22\',\n    \'updatedate\' => \'2017-04-22\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'表单向导\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'用户向我们提交了表单数据，赶快去看看吧。\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'手机门户\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'手机门户\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-04-22\',\n    \'updatedate\' => \'2017-04-22\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'在线升级\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'标签向导\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'标签向导\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2017-04-22\',\n    \'updatedate\' => \'2017-04-22\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'短信平台\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'短信平台\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'文章模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'下载模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'图片模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'视频模型\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('workflow_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'一级审核\',\n    \'description\' => \'审核一次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'二级审核\',\n    \'description\' => \'审核两次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'三级审核\',\n    \'description\' => \'审核三次\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'四级审核\',\n    \'description\' => \'四级审核\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('member_model.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'普通会员\',\n    \'description\' => \'普通会员\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('special.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('common.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('vote.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'default_style\' => \'default\',\n    \'vote_tp_template\' => \'vote_tp\',\n    \'allowguest\' => \'1\',\n    \'enabled\' => \'1\',\n    \'interval\' => \'1\',\n    \'credit\' => \'1\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_2.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_3.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \'0\',\n  2 => \'3\',\n  3 => \'0\',\n  4 => \'0\',\n  5 => \'0\',\n  6 => \'2\',\n);\n?>');
INSERT INTO `v9_cache` VALUES('category_items_11.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES('link.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES('type_content_1.cache.php','caches_commons/caches_data/','<?php\nreturn array (\n);\n?>');

DROP TABLE IF EXISTS `v9_category`;
CREATE TABLE `v9_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `catename` varchar(255) DEFAULT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `v9_category` VALUES('1','1','content','0','3','0','0','0','1','性感美女','','','','','','xingganmeinv','http://s.2017.07.18mm.huhangnet.com/list-1-1.html','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}','1','1','0','xingganmeinv','');
INSERT INTO `v9_category` VALUES('2','1','content','0','3','0','0','0','2','清纯美眉','','','','','','qingchunmeimei','http://s.2017.07.18mm.huhangnet.com/list-2-1.html','3','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}','2','1','0','qingchunmeimei','');
INSERT INTO `v9_category` VALUES('3','1','content','0','3','0','0','0','3','美女校花','','','','','','meinvxiaohua','http://s.2017.07.18mm.huhangnet.com/list-3-1.html','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}','3','1','0','meinvxiaohua','');
INSERT INTO `v9_category` VALUES('4','1','content','0','3','0','0','0','4','性感车模','','','','','','xingganchemo','http://s.2017.07.18mm.huhangnet.com/list-4-1.html','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}','4','1','0','xingganchemo','');
INSERT INTO `v9_category` VALUES('5','1','content','0','3','0','0','0','5','旗袍美女','','','','','','qipaomeinv','http://s.2017.07.18mm.huhangnet.com/list-5-1.html','0','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}','5','1','0','qipaomeinv','');
INSERT INTO `v9_category` VALUES('6','1','content','0','3','0','0','0','6','明星写真','','','','','','mingxingxiezhen','http://s.2017.07.18mm.huhangnet.com/list-6-1.html','2','0','{\"workflowid\":\"\",\"ishtml\":\"0\",\"content_ishtml\":\"0\",\"create_to_html_root\":\"0\",\"template_list\":\"huhangnet\",\"category_template\":\"category_picture\",\"list_template\":\"list_picture\",\"show_template\":\"show_picture\",\"meta_title\":\"\",\"meta_keywords\":\"\",\"meta_description\":\"\",\"presentpoint\":\"1\",\"defaultchargepoint\":\"0\",\"paytype\":\"0\",\"repeatchargedays\":\"1\",\"category_ruleid\":\"30\",\"show_ruleid\":\"17\"}','6','1','0','mingxingxiezhen','');

DROP TABLE IF EXISTS `v9_category_priv`;
CREATE TABLE `v9_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_content`;
CREATE TABLE `v9_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_history`;
CREATE TABLE `v9_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_node`;
CREATE TABLE `v9_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_collection_program`;
CREATE TABLE `v9_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_comment`;
CREATE TABLE `v9_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment` VALUES('content_6-5-1','1','现代潘金莲龚玥菲气质写真','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=show&catid=6&id=5','3','0','0','0','0','1','1500948761');
INSERT INTO `v9_comment` VALUES('content_2-3-1','1','清纯少女刘奕宁Lynn酥胸覆白色内衣','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=show&catid=2&id=3','1','0','0','0','0','1','1500955283');

DROP TABLE IF EXISTS `v9_comment_check`;
CREATE TABLE `v9_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '论评ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '数据存储表ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_check` VALUES('1','5','1','1');

DROP TABLE IF EXISTS `v9_comment_data_1`;
CREATE TABLE `v9_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '评论ID号',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '用户ID',
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `creat_at` int(10) DEFAULT NULL COMMENT '发布时间',
  `ip` varchar(15) DEFAULT NULL COMMENT '用户IP地址',
  `status` tinyint(1) DEFAULT '0' COMMENT '评论状态{0:未审核,-1:未通过审核,1:通过审核}',
  `content` text COMMENT '评论内容',
  `direction` tinyint(1) DEFAULT '0' COMMENT '评论方向{0:无方向,1:正文,2:反方,3:中立}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '支持数',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为回复',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_data_1` VALUES('1','content_6-5-1','1','0','美女图片网友','1500948700','127.0.0.1','1','vb','0','0','0');
INSERT INTO `v9_comment_data_1` VALUES('2','content_6-5-1','1','0','美女图片网友','1500948714','127.0.0.1','1','i vbja fjak','0','1','0');
INSERT INTO `v9_comment_data_1` VALUES('3','content_6-5-1','1','0','美女图片网友','1500948761','127.0.0.1','1','445454','0','0','0');
INSERT INTO `v9_comment_data_1` VALUES('4','content_2-3-1','1','0','美女图片网友','1500955129','121.58.217.54','1','aaa','0','0','0');
INSERT INTO `v9_comment_data_1` VALUES('5','content_2-3-1','1','0','美女图片网友','1500955283','121.58.217.54','0','sdafsdf','0','0','0');

DROP TABLE IF EXISTS `v9_comment_setting`;
CREATE TABLE `v9_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '站点ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '是否允许游客评论',
  `check` tinyint(1) DEFAULT '0' COMMENT '是否需要审核',
  `code` tinyint(1) DEFAULT '0' COMMENT '是否开启验证码',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '添加的积分数',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '扣除的积分数',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_setting` VALUES('1','1','1','1','0','0');

DROP TABLE IF EXISTS `v9_comment_table`;
CREATE TABLE `v9_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '表ID号',
  `total` int(10) unsigned DEFAULT '0' COMMENT '数据总量',
  `creat_at` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_comment_table` VALUES('1','5','0');

DROP TABLE IF EXISTS `v9_content_check`;
CREATE TABLE `v9_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_copyfrom`;
CREATE TABLE `v9_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_datacall`;
CREATE TABLE `v9_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_dbsource`;
CREATE TABLE `v9_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_download`;
CREATE TABLE `v9_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_download_data`;
CREATE TABLE `v9_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_downservers`;
CREATE TABLE `v9_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_extend_setting`;
CREATE TABLE `v9_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_favorite`;
CREATE TABLE `v9_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_hits`;
CREATE TABLE `v9_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_hits` VALUES('c-1-1','7','0','0','0','0','0','1482972363');
INSERT INTO `v9_hits` VALUES('c-1-2','7','0','0','0','0','0','1482990179');
INSERT INTO `v9_hits` VALUES('c-1-3','7','1','0','1','1','1','1497410330');
INSERT INTO `v9_hits` VALUES('c-1-4','7','3','0','3','3','3','1497608998');
INSERT INTO `v9_hits` VALUES('c-1-5','7','2','0','1','1','1','1499052326');
INSERT INTO `v9_hits` VALUES('c-1-6','7','19','0','1','2','2','1496559468');
INSERT INTO `v9_hits` VALUES('c-1-7','10','0','0','0','0','0','1482991533');
INSERT INTO `v9_hits` VALUES('c-1-8','10','0','0','0','0','0','1482991614');
INSERT INTO `v9_hits` VALUES('c-1-9','10','0','0','0','0','0','1482991703');
INSERT INTO `v9_hits` VALUES('c-1-10','10','0','0','0','0','0','1482991746');
INSERT INTO `v9_hits` VALUES('c-1-11','10','0','0','0','0','0','1482991826');
INSERT INTO `v9_hits` VALUES('c-1-12','10','31','0','1','30','30','1486266897');
INSERT INTO `v9_hits` VALUES('c-1-13','13','0','0','0','0','0','1482992037');
INSERT INTO `v9_hits` VALUES('c-1-14','13','0','0','0','0','0','1482992095');
INSERT INTO `v9_hits` VALUES('c-1-15','13','0','0','0','0','0','1482992136');
INSERT INTO `v9_hits` VALUES('c-1-16','13','0','0','0','0','0','1482992186');
INSERT INTO `v9_hits` VALUES('c-1-17','13','0','0','0','0','0','1482992231');
INSERT INTO `v9_hits` VALUES('c-1-18','13','0','0','0','0','0','1482992286');
INSERT INTO `v9_hits` VALUES('c-1-19','13','0','0','0','0','0','1486110684');
INSERT INTO `v9_hits` VALUES('c-1-20','7','7','0','2','2','2','1495098006');
INSERT INTO `v9_hits` VALUES('c-3-1','2','6','3','2','6','6','1501136161');
INSERT INTO `v9_hits` VALUES('c-3-2','2','94','0','2','2','94','1501471427');
INSERT INTO `v9_hits` VALUES('c-3-3','2','96','50','43','43','96','1501470866');
INSERT INTO `v9_hits` VALUES('c-3-4','6','0','0','0','0','0','1500830875');
INSERT INTO `v9_hits` VALUES('c-3-5','6','23','2','21','23','23','1500949078');

DROP TABLE IF EXISTS `v9_ipbanned`;
CREATE TABLE `v9_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_keylink`;
CREATE TABLE `v9_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_keyword`;
CREATE TABLE `v9_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `v9_keyword` VALUES('1','1','邻家','linjia','3','0');
INSERT INTO `v9_keyword` VALUES('2','1','女孩','nvhai','3','0');
INSERT INTO `v9_keyword` VALUES('3','1','豹纹','baowen','3','0');
INSERT INTO `v9_keyword` VALUES('4','1','美女','meinv','3','0');
INSERT INTO `v9_keyword` VALUES('5','1','白色','baise','1','0');
INSERT INTO `v9_keyword` VALUES('6','1','内衣','neiyi','5','0');
INSERT INTO `v9_keyword` VALUES('7','1','少女','shaonv','1','0');
INSERT INTO `v9_keyword` VALUES('8','1','高清','gaoqing','1','0');
INSERT INTO `v9_keyword` VALUES('9','1','艺人','yiren','1','0');
INSERT INTO `v9_keyword` VALUES('10','1','气质','qizhi','2','0');
INSERT INTO `v9_keyword` VALUES('11','1','潘金莲','panjinlian','1','0');
INSERT INTO `v9_keyword` VALUES('12','1','龚玥菲','gongfei','1','0');

DROP TABLE IF EXISTS `v9_keyword_data`;
CREATE TABLE `v9_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

INSERT INTO `v9_keyword_data` VALUES('1','1','1','1-3');
INSERT INTO `v9_keyword_data` VALUES('2','2','1','1-3');
INSERT INTO `v9_keyword_data` VALUES('3','3','1','2-3');
INSERT INTO `v9_keyword_data` VALUES('4','4','1','2-3');
INSERT INTO `v9_keyword_data` VALUES('5','5','1','3-3');
INSERT INTO `v9_keyword_data` VALUES('6','6','1','3-3');
INSERT INTO `v9_keyword_data` VALUES('7','7','1','3-3');
INSERT INTO `v9_keyword_data` VALUES('8','8','1','4-3');
INSERT INTO `v9_keyword_data` VALUES('9','9','1','4-3');
INSERT INTO `v9_keyword_data` VALUES('10','10','1','4-3');
INSERT INTO `v9_keyword_data` VALUES('11','11','1','5-3');
INSERT INTO `v9_keyword_data` VALUES('12','10','1','5-3');
INSERT INTO `v9_keyword_data` VALUES('13','12','1','5-3');
INSERT INTO `v9_keyword_data` VALUES('14','6','1','2-3');
INSERT INTO `v9_keyword_data` VALUES('15','6','1','1-3');

DROP TABLE IF EXISTS `v9_link`;
CREATE TABLE `v9_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO `v9_link` VALUES('1','1','0','0','PHPCMS','http://www.phpcms.cn','http://www.phpcms.cn/images/logo_88_31.gif','','','0','0','1','1492841413');
INSERT INTO `v9_link` VALUES('2','1','0','0','盛大在线','http://www.sdo.com','http://www.snda.com/cn/logo/comp_logo_sdo.gif','','','0','0','1','1492841413');

DROP TABLE IF EXISTS `v9_linkage`;
CREATE TABLE `v9_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

INSERT INTO `v9_linkage` VALUES('1','中国','1','0','0','','0','0','','','0');
INSERT INTO `v9_linkage` VALUES('2','北京市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3','上海市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('4','天津市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('5','重庆市','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('6','河北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('7','山西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('8','内蒙古','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('9','辽宁省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('10','吉林省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('11','黑龙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('12','江苏省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('13','浙江省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('14','安徽省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('15','福建省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('16','江西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('17','山东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('18','河南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('19','湖北省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('20','湖南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('21','广东省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('22','广西','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('23','海南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('24','四川省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('25','贵州省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('26','云南省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('27','西藏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('28','陕西省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('29','甘肃省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('30','青海省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('31','宁夏','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('32','新疆','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('33','台湾省','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('34','香港','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('35','澳门','0','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('36','东城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('37','西城区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('38','崇文区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('39','宣武区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('40','朝阳区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('41','石景山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('42','海淀区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('43','门头沟区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('44','房山区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('45','通州区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('46','顺义区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('47','昌平区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('48','大兴区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('49','怀柔区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('50','平谷区','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('51','密云县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('52','延庆县','0','2','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('53','黄浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('54','卢湾区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('55','徐汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('56','长宁区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('57','静安区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('58','普陀区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('59','闸北区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('60','虹口区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('61','杨浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('62','闵行区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('63','宝山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('64','嘉定区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('65','浦东新区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('66','金山区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('67','松江区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('68','青浦区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('69','南汇区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('70','奉贤区','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('71','崇明县','0','3','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('72','和平区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('73','河东区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('74','河西区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('75','南开区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('76','河北区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('77','红桥区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('78','塘沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('79','汉沽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('80','大港区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('81','东丽区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('82','西青区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('83','津南区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('84','北辰区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('85','武清区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('86','宝坻区','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('87','宁河县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('88','静海县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('89','蓟县','0','4','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('90','万州区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('91','涪陵区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('92','渝中区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('93','大渡口区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('94','江北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('95','沙坪坝区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('96','九龙坡区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('97','南岸区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('98','北碚区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('99','万盛区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('100','双桥区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('101','渝北区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('102','巴南区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('103','黔江区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('104','长寿区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('105','綦江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('106','潼南县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('107','铜梁县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('108','大足县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('109','荣昌县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('110','璧山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('111','梁平县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('112','城口县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('113','丰都县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('114','垫江县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('115','武隆县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('116','忠县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('117','开县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('118','云阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('119','奉节县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('120','巫山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('121','巫溪县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('122','石柱县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('123','秀山县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('124','酉阳县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('125','彭水县','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('126','江津区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('127','合川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('128','永川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('129','南川区','0','5','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('130','石家庄市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('131','唐山市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('132','秦皇岛市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('133','邯郸市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('134','邢台市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('135','保定市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('136','张家口市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('137','承德市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('138','沧州市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('139','廊坊市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('140','衡水市','0','6','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('141','太原市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('142','大同市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('143','阳泉市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('144','长治市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('145','晋城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('146','朔州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('147','晋中市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('148','运城市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('149','忻州市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('150','临汾市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('151','吕梁市','0','7','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('152','呼和浩特市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('153','包头市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('154','乌海市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('155','赤峰市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('156','通辽市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('157','鄂尔多斯市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('158','呼伦贝尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('159','巴彦淖尔市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('160','乌兰察布市','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('161','兴安盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('162','锡林郭勒盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('163','阿拉善盟','0','8','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('164','沈阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('165','大连市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('166','鞍山市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('167','抚顺市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('168','本溪市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('169','丹东市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('170','锦州市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('171','营口市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('172','阜新市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('173','辽阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('174','盘锦市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('175','铁岭市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('176','朝阳市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('177','葫芦岛市','0','9','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('178','长春市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('179','吉林市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('180','四平市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('181','辽源市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('182','通化市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('183','白山市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('184','松原市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('185','白城市','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('186','延边','0','10','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('187','哈尔滨市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('188','齐齐哈尔市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('189','鸡西市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('190','鹤岗市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('191','双鸭山市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('192','大庆市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('193','伊春市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('194','佳木斯市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('195','七台河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('196','牡丹江市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('197','黑河市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('198','绥化市','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('199','大兴安岭地区','0','11','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('200','南京市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('201','无锡市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('202','徐州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('203','常州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('204','苏州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('205','南通市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('206','连云港市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('207','淮安市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('208','盐城市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('209','扬州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('210','镇江市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('211','泰州市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('212','宿迁市','0','12','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('213','杭州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('214','宁波市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('215','温州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('216','嘉兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('217','湖州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('218','绍兴市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('219','金华市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('220','衢州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('221','舟山市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('222','台州市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('223','丽水市','0','13','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('224','合肥市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('225','芜湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('226','蚌埠市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('227','淮南市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('228','马鞍山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('229','淮北市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('230','铜陵市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('231','安庆市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('232','黄山市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('233','滁州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('234','阜阳市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('235','宿州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('236','巢湖市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('237','六安市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('238','亳州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('239','池州市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('240','宣城市','0','14','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('241','福州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('242','厦门市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('243','莆田市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('244','三明市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('245','泉州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('246','漳州市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('247','南平市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('248','龙岩市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('249','宁德市','0','15','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('250','南昌市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('251','景德镇市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('252','萍乡市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('253','九江市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('254','新余市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('255','鹰潭市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('256','赣州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('257','吉安市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('258','宜春市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('259','抚州市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('260','上饶市','0','16','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('261','济南市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('262','青岛市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('263','淄博市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('264','枣庄市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('265','东营市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('266','烟台市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('267','潍坊市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('268','济宁市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('269','泰安市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('270','威海市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('271','日照市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('272','莱芜市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('273','临沂市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('274','德州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('275','聊城市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('276','滨州市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('277','荷泽市','0','17','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('278','郑州市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('279','开封市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('280','洛阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('281','平顶山市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('282','安阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('283','鹤壁市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('284','新乡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('285','焦作市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('286','濮阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('287','许昌市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('288','漯河市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('289','三门峡市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('290','南阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('291','商丘市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('292','信阳市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('293','周口市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('294','驻马店市','0','18','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('295','武汉市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('296','黄石市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('297','十堰市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('298','宜昌市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('299','襄樊市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('300','鄂州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('301','荆门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('302','孝感市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('303','荆州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('304','黄冈市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('305','咸宁市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('306','随州市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('307','恩施土家族苗族自治州','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('308','仙桃市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('309','潜江市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('310','天门市','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('311','神农架林区','0','19','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('312','长沙市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('313','株洲市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('314','湘潭市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('315','衡阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('316','邵阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('317','岳阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('318','常德市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('319','张家界市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('320','益阳市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('321','郴州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('322','永州市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('323','怀化市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('324','娄底市','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('325','湘西土家族苗族自治州','0','20','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('326','广州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('327','韶关市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('328','深圳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('329','珠海市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('330','汕头市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('331','佛山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('332','江门市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('333','湛江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('334','茂名市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('335','肇庆市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('336','惠州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('337','梅州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('338','汕尾市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('339','河源市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('340','阳江市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('341','清远市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('342','东莞市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('343','中山市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('344','潮州市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('345','揭阳市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('346','云浮市','0','21','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('347','南宁市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('348','柳州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('349','桂林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('350','梧州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('351','北海市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('352','防城港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('353','钦州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('354','贵港市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('355','玉林市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('356','百色市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('357','贺州市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('358','河池市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('359','来宾市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('360','崇左市','0','22','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('361','海口市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('362','三亚市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('363','五指山市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('364','琼海市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('365','儋州市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('366','文昌市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('367','万宁市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('368','东方市','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('369','定安县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('370','屯昌县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('371','澄迈县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('372','临高县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('373','白沙黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('374','昌江黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('375','乐东黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('376','陵水黎族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('377','保亭黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('378','琼中黎族苗族自治县','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('379','西沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('380','南沙群岛','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('381','中沙群岛的岛礁及其海域','0','23','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('382','成都市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('383','自贡市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('384','攀枝花市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('385','泸州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('386','德阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('387','绵阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('388','广元市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('389','遂宁市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('390','内江市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('391','乐山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('392','南充市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('393','眉山市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('394','宜宾市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('395','广安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('396','达州市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('397','雅安市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('398','巴中市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('399','资阳市','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('400','阿坝州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('401','甘孜州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('402','凉山州','0','24','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('403','贵阳市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('404','六盘水市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('405','遵义市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('406','安顺市','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('407','铜仁地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('408','黔西南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('409','毕节地区','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('410','黔东南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('411','黔南州','0','25','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('412','昆明市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('413','曲靖市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('414','玉溪市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('415','保山市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('416','昭通市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('417','丽江市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('418','思茅市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('419','临沧市','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('420','楚雄州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('421','红河州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('422','文山州','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('423','西双版纳','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('424','大理','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('425','德宏','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('426','怒江','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('427','迪庆','0','26','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('428','拉萨市','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('429','昌都','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('430','山南','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('431','日喀则','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('432','那曲','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('433','阿里','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('434','林芝','0','27','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('435','西安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('436','铜川市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('437','宝鸡市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('438','咸阳市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('439','渭南市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('440','延安市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('441','汉中市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('442','榆林市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('443','安康市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('444','商洛市','0','28','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('445','兰州市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('446','嘉峪关市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('447','金昌市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('448','白银市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('449','天水市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('450','武威市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('451','张掖市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('452','平凉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('453','酒泉市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('454','庆阳市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('455','定西市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('456','陇南市','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('457','临夏州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('458','甘州','0','29','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('459','西宁市','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('460','海东地区','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('461','海州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('462','黄南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('463','海南州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('464','果洛州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('465','玉树州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('466','海西州','0','30','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('467','银川市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('468','石嘴山市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('469','吴忠市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('470','固原市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('471','中卫市','0','31','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('472','乌鲁木齐市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('473','克拉玛依市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('474','吐鲁番地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('475','哈密地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('476','昌吉州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('477','博尔州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('478','巴音郭楞州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('479','阿克苏地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('480','克孜勒苏柯尔克孜自治州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('481','喀什地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('482','和田地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('483','伊犁州','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('484','塔城地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('485','阿勒泰地区','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('486','石河子市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('487','阿拉尔市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('488','图木舒克市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('489','五家渠市','0','32','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('490','台北市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('491','高雄市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('492','基隆市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('493','新竹市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('494','台中市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('495','嘉义市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('496','台南市','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('497','台北县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('498','桃园县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('499','新竹县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('500','苗栗县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('501','台中县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('502','彰化县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('503','南投县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('504','云林县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('505','嘉义县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('506','台南县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('507','高雄县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('508','屏东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('509','宜兰县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('510','花莲县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('511','台东县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('512','澎湖县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('513','金门县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('514','连江县','0','33','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('515','中西区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('516','东区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('517','南区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('518','湾仔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('519','九龙城区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('520','观塘区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('521','深水埗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('522','黄大仙区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('523','油尖旺区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('524','离岛区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('525','葵青区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('526','北区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('527','西贡区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('528','沙田区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('529','大埔区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('530','荃湾区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('531','屯门区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('532','元朗区','0','34','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('533','花地玛堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('534','市圣安多尼堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('535','大堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('536','望德堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('537','风顺堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('538','嘉模堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('539','圣方济各堂区','0','35','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('540','长安区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('541','桥东区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('542','桥西区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('543','新华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('544','井陉矿区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('545','裕华区','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('546','井陉县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('547','正定县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('548','栾城县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('549','行唐县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('550','灵寿县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('551','高邑县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('552','深泽县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('553','赞皇县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('554','无极县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('555','平山县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('556','元氏县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('557','赵县','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('558','辛集市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('559','藁城市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('560','晋州市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('561','新乐市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('562','鹿泉市','0','130','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('563','路南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('564','路北区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('565','古冶区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('566','开平区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('567','丰南区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('568','丰润区','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('569','滦县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('570','滦南县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('571','乐亭县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('572','迁西县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('573','玉田县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('574','唐海县','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('575','遵化市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('576','迁安市','0','131','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('577','海港区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('578','山海关区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('579','北戴河区','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('580','青龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('581','昌黎县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('582','抚宁县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('583','卢龙县','0','132','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('584','邯山区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('585','丛台区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('586','复兴区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('587','峰峰矿区','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('588','邯郸县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('589','临漳县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('590','成安县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('591','大名县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('592','涉县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('593','磁县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('594','肥乡县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('595','永年县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('596','邱县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('597','鸡泽县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('598','广平县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('599','馆陶县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('600','魏县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('601','曲周县','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('602','武安市','0','133','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('603','桥东区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('604','桥西区','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('605','邢台县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('606','临城县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('607','内丘县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('608','柏乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('609','隆尧县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('610','任县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('611','南和县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('612','宁晋县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('613','巨鹿县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('614','新河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('615','广宗县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('616','平乡县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('617','威县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('618','清河县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('619','临西县','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('620','南宫市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('621','沙河市','0','134','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('622','新市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('623','北市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('624','南市区','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('625','满城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('626','清苑县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('627','涞水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('628','阜平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('629','徐水县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('630','定兴县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('631','唐县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('632','高阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('633','容城县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('634','涞源县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('635','望都县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('636','安新县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('637','易县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('638','曲阳县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('639','蠡县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('640','顺平县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('641','博野县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('642','雄县','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('643','涿州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('644','定州市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('645','安国市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('646','高碑店市','0','135','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('647','桥东区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('648','桥西区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('649','宣化区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('650','下花园区','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('651','宣化县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('652','张北县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('653','康保县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('654','沽源县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('655','尚义县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('656','蔚县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('657','阳原县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('658','怀安县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('659','万全县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('660','怀来县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('661','涿鹿县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('662','赤城县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('663','崇礼县','0','136','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('664','双桥区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('665','双滦区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('666','鹰手营子矿区','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('667','承德县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('668','兴隆县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('669','平泉县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('670','滦平县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('671','隆化县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('672','丰宁县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('673','宽城县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('674','围场县','0','137','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('675','新华区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('676','运河区','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('677','沧县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('678','青县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('679','东光县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('680','海兴县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('681','盐山县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('682','肃宁县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('683','南皮县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('684','吴桥县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('685','献县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('686','孟村县','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('687','泊头市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('688','任丘市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('689','黄骅市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('690','河间市','0','138','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('691','安次区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('692','广阳区','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('693','固安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('694','永清县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('695','香河县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('696','大城县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('697','文安县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('698','大厂县','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('699','霸州市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('700','三河市','0','139','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('701','桃城区','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('702','枣强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('703','武邑县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('704','武强县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('705','饶阳县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('706','安平县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('707','故城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('708','景县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('709','阜城县','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('710','冀州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('711','深州市','0','140','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('712','小店区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('713','迎泽区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('714','杏花岭区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('715','尖草坪区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('716','万柏林区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('717','晋源区','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('718','清徐县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('719','阳曲县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('720','娄烦县','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('721','古交市','0','141','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('722','城区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('723','矿区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('724','南郊区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('725','新荣区','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('726','阳高县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('727','天镇县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('728','广灵县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('729','灵丘县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('730','浑源县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('731','左云县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('732','大同县','0','142','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('733','城区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('734','矿区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('735','郊区','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('736','平定县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('737','盂县','0','143','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('738','城区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('739','郊区','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('740','长治县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('741','襄垣县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('742','屯留县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('743','平顺县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('744','黎城县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('745','壶关县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('746','长子县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('747','武乡县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('748','沁县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('749','沁源县','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('750','潞城市','0','144','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('751','城区','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('752','沁水县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('753','阳城县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('754','陵川县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('755','泽州县','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('756','高平市','0','145','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('757','朔城区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('758','平鲁区','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('759','山阴县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('760','应县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('761','右玉县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('762','怀仁县','0','146','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('763','榆次区','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('764','榆社县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('765','左权县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('766','和顺县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('767','昔阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('768','寿阳县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('769','太谷县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('770','祁县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('771','平遥县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('772','灵石县','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('773','介休市','0','147','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('774','盐湖区','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('775','临猗县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('776','万荣县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('777','闻喜县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('778','稷山县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('779','新绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('780','绛县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('781','垣曲县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('782','夏县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('783','平陆县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('784','芮城县','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('785','永济市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('786','河津市','0','148','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('787','忻府区','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('788','定襄县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('789','五台县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('790','代县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('791','繁峙县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('792','宁武县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('793','静乐县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('794','神池县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('795','五寨县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('796','岢岚县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('797','河曲县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('798','保德县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('799','偏关县','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('800','原平市','0','149','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('801','尧都区','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('802','曲沃县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('803','翼城县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('804','襄汾县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('805','洪洞县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('806','古县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('807','安泽县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('808','浮山县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('809','吉县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('810','乡宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('811','大宁县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('812','隰县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('813','永和县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('814','蒲县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('815','汾西县','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('816','侯马市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('817','霍州市','0','150','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('818','离石区','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('819','文水县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('820','交城县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('821','兴县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('822','临县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('823','柳林县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('824','石楼县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('825','岚县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('826','方山县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('827','中阳县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('828','交口县','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('829','孝义市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('830','汾阳市','0','151','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('831','新城区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('832','回民区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('833','玉泉区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('834','赛罕区','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('835','土默特左旗','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('836','托克托县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('837','和林格尔县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('838','清水河县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('839','武川县','0','152','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('840','东河区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('841','昆都仑区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('842','青山区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('843','石拐区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('844','白云矿区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('845','九原区','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('846','土默特右旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('847','固阳县','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('848','达尔罕茂明安联合旗','0','153','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('849','海勃湾区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('850','海南区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('851','乌达区','0','154','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('852','红山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('853','元宝山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('854','松山区','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('855','阿鲁科尔沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('856','巴林左旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('857','巴林右旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('858','林西县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('859','克什克腾旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('860','翁牛特旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('861','喀喇沁旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('862','宁城县','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('863','敖汉旗','0','155','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('864','科尔沁区','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('865','科尔沁左翼中旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('866','科尔沁左翼后旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('867','开鲁县','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('868','库伦旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('869','奈曼旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('870','扎鲁特旗','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('871','霍林郭勒市','0','156','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('872','东胜区','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('873','达拉特旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('874','准格尔旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('875','鄂托克前旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('876','鄂托克旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('877','杭锦旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('878','乌审旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('879','伊金霍洛旗','0','157','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('880','海拉尔区','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('881','阿荣旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('882','莫力达瓦达斡尔族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('883','鄂伦春自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('884','鄂温克族自治旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('885','陈巴尔虎旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('886','新巴尔虎左旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('887','新巴尔虎右旗','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('888','满洲里市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('889','牙克石市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('890','扎兰屯市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('891','额尔古纳市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('892','根河市','0','158','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('893','临河区','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('894','五原县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('895','磴口县','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('896','乌拉特前旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('897','乌拉特中旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('898','乌拉特后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('899','杭锦后旗','0','159','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('900','集宁区','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('901','卓资县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('902','化德县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('903','商都县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('904','兴和县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('905','凉城县','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('906','察哈尔右翼前旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('907','察哈尔右翼中旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('908','察哈尔右翼后旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('909','四子王旗','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('910','丰镇市','0','160','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('911','乌兰浩特市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('912','阿尔山市','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('913','科尔沁右翼前旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('914','科尔沁右翼中旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('915','扎赉特旗','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('916','突泉县','0','161','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('917','二连浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('918','锡林浩特市','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('919','阿巴嘎旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('920','苏尼特左旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('921','苏尼特右旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('922','东乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('923','西乌珠穆沁旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('924','太仆寺旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('925','镶黄旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('926','正镶白旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('927','正蓝旗','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('928','多伦县','0','162','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('929','阿拉善左旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('930','阿拉善右旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('931','额济纳旗','0','163','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('932','和平区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('933','沈河区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('934','大东区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('935','皇姑区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('936','铁西区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('937','苏家屯区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('938','东陵区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('939','新城子区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('940','于洪区','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('941','辽中县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('942','康平县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('943','法库县','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('944','新民市','0','164','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('945','中山区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('946','西岗区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('947','沙河口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('948','甘井子区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('949','旅顺口区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('950','金州区','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('951','长海县','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('952','瓦房店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('953','普兰店市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('954','庄河市','0','165','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('955','铁东区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('956','铁西区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('957','立山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('958','千山区','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('959','台安县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('960','岫岩满族自治县','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('961','海城市','0','166','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('962','新抚区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('963','东洲区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('964','望花区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('965','顺城区','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('966','抚顺县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('967','新宾满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('968','清原满族自治县','0','167','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('969','平山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('970','溪湖区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('971','明山区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('972','南芬区','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('973','本溪满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('974','桓仁满族自治县','0','168','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('975','元宝区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('976','振兴区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('977','振安区','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('978','宽甸满族自治县','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('979','东港市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('980','凤城市','0','169','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('981','古塔区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('982','凌河区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('983','太和区','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('984','黑山县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('985','义县','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('986','凌海市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('987','北镇市','0','170','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('988','站前区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('989','西市区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('990','鲅鱼圈区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('991','老边区','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('992','盖州市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('993','大石桥市','0','171','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('994','海州区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('995','新邱区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('996','太平区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('997','清河门区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('998','细河区','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('999','阜新蒙古族自治县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1000','彰武县','0','172','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1001','白塔区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1002','文圣区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1003','宏伟区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1004','弓长岭区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1005','太子河区','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1006','辽阳县','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1007','灯塔市','0','173','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1008','双台子区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1009','兴隆台区','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1010','大洼县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1011','盘山县','0','174','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1012','银州区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1013','清河区','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1014','铁岭县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1015','西丰县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1016','昌图县','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1017','调兵山市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1018','开原市','0','175','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1019','双塔区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1020','龙城区','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1021','朝阳县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1022','建平县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1023','喀喇沁左翼蒙古族自治县','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1024','北票市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1025','凌源市','0','176','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1026','连山区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1027','龙港区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1028','南票区','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1029','绥中县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1030','建昌县','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1031','兴城市','0','177','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1032','南关区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1033','宽城区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1034','朝阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1035','二道区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1036','绿园区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1037','双阳区','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1038','农安县','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1039','九台市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1040','榆树市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1041','德惠市','0','178','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1042','昌邑区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1043','龙潭区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1044','船营区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1045','丰满区','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1046','永吉县','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1047','蛟河市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1048','桦甸市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1049','舒兰市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1050','磐石市','0','179','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1051','铁西区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1052','铁东区','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1053','梨树县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1054','伊通满族自治县','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1055','公主岭市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1056','双辽市','0','180','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1057','龙山区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1058','西安区','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1059','东丰县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1060','东辽县','0','181','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1061','东昌区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1062','二道江区','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1063','通化县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1064','辉南县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1065','柳河县','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1066','梅河口市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1067','集安市','0','182','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1068','八道江区','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1069','抚松县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1070','靖宇县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1071','长白朝鲜族自治县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1072','江源县','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1073','临江市','0','183','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1074','宁江区','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1075','前郭尔罗斯蒙古族自治县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1076','长岭县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1077','乾安县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1078','扶余县','0','184','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1079','洮北区','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1080','镇赉县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1081','通榆县','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1082','洮南市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1083','大安市','0','185','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1084','延吉市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1085','图们市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1086','敦化市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1087','珲春市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1088','龙井市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1089','和龙市','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1090','汪清县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1091','安图县','0','186','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1092','道里区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1093','南岗区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1094','道外区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1095','香坊区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1096','动力区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1097','平房区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1098','松北区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1099','呼兰区','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1100','依兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1101','方正县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1102','宾县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1103','巴彦县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1104','木兰县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1105','通河县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1106','延寿县','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1107','阿城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1108','双城市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1109','尚志市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1110','五常市','0','187','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1111','龙沙区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1112','建华区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1113','铁锋区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1114','昂昂溪区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1115','富拉尔基区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1116','碾子山区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1117','梅里斯达斡尔族区','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1118','龙江县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1119','依安县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1120','泰来县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1121','甘南县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1122','富裕县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1123','克山县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1124','克东县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1125','拜泉县','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1126','讷河市','0','188','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1127','鸡冠区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1128','恒山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1129','滴道区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1130','梨树区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1131','城子河区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1132','麻山区','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1133','鸡东县','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1134','虎林市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1135','密山市','0','189','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1136','向阳区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1137','工农区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1138','南山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1139','兴安区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1140','东山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1141','兴山区','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1142','萝北县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1143','绥滨县','0','190','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1144','尖山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1145','岭东区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1146','四方台区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1147','宝山区','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1148','集贤县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1149','友谊县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1150','宝清县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1151','饶河县','0','191','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1152','萨尔图区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1153','龙凤区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1154','让胡路区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1155','红岗区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1156','大同区','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1157','肇州县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1158','肇源县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1159','林甸县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1160','杜尔伯特蒙古族自治县','0','192','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1161','伊春区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1162','南岔区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1163','友好区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1164','西林区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1165','翠峦区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1166','新青区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1167','美溪区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1168','金山屯区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1169','五营区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1170','乌马河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1171','汤旺河区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1172','带岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1173','乌伊岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1174','红星区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1175','上甘岭区','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1176','嘉荫县','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1177','铁力市','0','193','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1178','永红区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1179','向阳区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1180','前进区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1181','东风区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1182','郊区','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1183','桦南县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1184','桦川县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1185','汤原县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1186','抚远县','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1187','同江市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1188','富锦市','0','194','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1189','新兴区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1190','桃山区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1191','茄子河区','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1192','勃利县','0','195','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1193','东安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1194','阳明区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1195','爱民区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1196','西安区','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1197','东宁县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1198','林口县','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1199','绥芬河市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1200','海林市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1201','宁安市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1202','穆棱市','0','196','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1203','爱辉区','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1204','嫩江县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1205','逊克县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1206','孙吴县','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1207','北安市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1208','五大连池市','0','197','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1209','北林区','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1210','望奎县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1211','兰西县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1212','青冈县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1213','庆安县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1214','明水县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1215','绥棱县','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1216','安达市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1217','肇东市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1218','海伦市','0','198','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1219','呼玛县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1220','塔河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1221','漠河县','0','199','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1222','玄武区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1223','白下区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1224','秦淮区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1225','建邺区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1226','鼓楼区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1227','下关区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1228','浦口区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1229','栖霞区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1230','雨花台区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1231','江宁区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1232','六合区','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1233','溧水县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1234','高淳县','0','200','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1235','崇安区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1236','南长区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1237','北塘区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1238','锡山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1239','惠山区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1240','滨湖区','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1241','江阴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1242','宜兴市','0','201','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1243','鼓楼区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1244','云龙区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1245','九里区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1246','贾汪区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1247','泉山区','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1248','丰县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1249','沛县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1250','铜山县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1251','睢宁县','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1252','新沂市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1253','邳州市','0','202','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1254','天宁区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1255','钟楼区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1256','戚墅堰区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1257','新北区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1258','武进区','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1259','溧阳市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1260','金坛市','0','203','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1261','沧浪区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1262','平江区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1263','金阊区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1264','虎丘区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1265','吴中区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1266','相城区','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1267','常熟市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1268','张家港市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1269','昆山市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1270','吴江市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1271','太仓市','0','204','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1272','崇川区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1273','港闸区','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1274','海安县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1275','如东县','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1276','启东市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1277','如皋市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1278','通州市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1279','海门市','0','205','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1280','连云区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1281','新浦区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1282','海州区','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1283','赣榆县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1284','东海县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1285','灌云县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1286','灌南县','0','206','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1287','清河区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1288','楚州区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1289','淮阴区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1290','清浦区','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1291','涟水县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1292','洪泽县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1293','盱眙县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1294','金湖县','0','207','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1295','亭湖区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1296','盐都区','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1297','响水县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1298','滨海县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1299','阜宁县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1300','射阳县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1301','建湖县','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1302','东台市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1303','大丰市','0','208','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1304','广陵区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1305','邗江区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1306','维扬区','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1307','宝应县','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1308','仪征市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1309','高邮市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1310','江都市','0','209','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1311','京口区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1312','润州区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1313','丹徒区','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1314','丹阳市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1315','扬中市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1316','句容市','0','210','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1317','海陵区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1318','高港区','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1319','兴化市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1320','靖江市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1321','泰兴市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1322','姜堰市','0','211','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1323','宿城区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1324','宿豫区','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1325','沭阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1326','泗阳县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1327','泗洪县','0','212','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1328','上城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1329','下城区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1330','江干区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1331','拱墅区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1332','西湖区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1333','滨江区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1334','萧山区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1335','余杭区','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1336','桐庐县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1337','淳安县','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1338','建德市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1339','富阳市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1340','临安市','0','213','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1341','海曙区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1342','江东区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1343','江北区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1344','北仑区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1345','镇海区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1346','鄞州区','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1347','象山县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1348','宁海县','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1349','余姚市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1350','慈溪市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1351','奉化市','0','214','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1352','鹿城区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1353','龙湾区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1354','瓯海区','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1355','洞头县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1356','永嘉县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1357','平阳县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1358','苍南县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1359','文成县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1360','泰顺县','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1361','瑞安市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1362','乐清市','0','215','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1363','秀城区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1364','秀洲区','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1365','嘉善县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1366','海盐县','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1367','海宁市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1368','平湖市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1369','桐乡市','0','216','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1370','吴兴区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1371','南浔区','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1372','德清县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1373','长兴县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1374','安吉县','0','217','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1375','越城区','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1376','绍兴县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1377','新昌县','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1378','诸暨市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1379','上虞市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1380','嵊州市','0','218','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1381','婺城区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1382','金东区','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1383','武义县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1384','浦江县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1385','磐安县','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1386','兰溪市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1387','义乌市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1388','东阳市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1389','永康市','0','219','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1390','柯城区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1391','衢江区','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1392','常山县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1393','开化县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1394','龙游县','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1395','江山市','0','220','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1396','定海区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1397','普陀区','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1398','岱山县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1399','嵊泗县','0','221','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1400','椒江区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1401','黄岩区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1402','路桥区','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1403','玉环县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1404','三门县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1405','天台县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1406','仙居县','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1407','温岭市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1408','临海市','0','222','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1409','莲都区','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1410','青田县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1411','缙云县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1412','遂昌县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1413','松阳县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1414','云和县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1415','庆元县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1416','景宁畲族自治县','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1417','龙泉市','0','223','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1418','瑶海区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1419','庐阳区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1420','蜀山区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1421','包河区','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1422','长丰县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1423','肥东县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1424','肥西县','0','224','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1425','镜湖区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1426','弋江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1427','鸠江区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1428','三山区','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1429','芜湖县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1430','繁昌县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1431','南陵县','0','225','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1432','龙子湖区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1433','蚌山区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1434','禹会区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1435','淮上区','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1436','怀远县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1437','五河县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1438','固镇县','0','226','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1439','大通区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1440','田家庵区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1441','谢家集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1442','八公山区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1443','潘集区','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1444','凤台县','0','227','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1445','金家庄区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1446','花山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1447','雨山区','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1448','当涂县','0','228','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1449','杜集区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1450','相山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1451','烈山区','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1452','濉溪县','0','229','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1453','铜官山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1454','狮子山区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1455','郊区','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1456','铜陵县','0','230','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1457','迎江区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1458','大观区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1459','宜秀区','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1460','怀宁县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1461','枞阳县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1462','潜山县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1463','太湖县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1464','宿松县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1465','望江县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1466','岳西县','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1467','桐城市','0','231','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1468','屯溪区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1469','黄山区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1470','徽州区','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1471','歙县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1472','休宁县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1473','黟县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1474','祁门县','0','232','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1475','琅琊区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1476','南谯区','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1477','来安县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1478','全椒县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1479','定远县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1480','凤阳县','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1481','天长市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1482','明光市','0','233','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1483','颍州区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1484','颍东区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1485','颍泉区','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1486','临泉县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1487','太和县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1488','阜南县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1489','颍上县','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1490','界首市','0','234','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1491','埇桥区','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1492','砀山县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1493','萧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1494','灵璧县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1495','泗县','0','235','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1496','居巢区','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1497','庐江县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1498','无为县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1499','含山县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1500','和县','0','236','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1501','金安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1502','裕安区','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1503','寿县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1504','霍邱县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1505','舒城县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1506','金寨县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1507','霍山县','0','237','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1508','谯城区','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1509','涡阳县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1510','蒙城县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1511','利辛县','0','238','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1512','贵池区','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1513','东至县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1514','石台县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1515','青阳县','0','239','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1516','宣州区','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1517','郎溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1518','广德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1519','泾县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1520','绩溪县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1521','旌德县','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1522','宁国市','0','240','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1523','鼓楼区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1524','台江区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1525','仓山区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1526','马尾区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1527','晋安区','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1528','闽侯县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1529','连江县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1530','罗源县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1531','闽清县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1532','永泰县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1533','平潭县','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1534','福清市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1535','长乐市','0','241','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1536','思明区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1537','海沧区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1538','湖里区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1539','集美区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1540','同安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1541','翔安区','0','242','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1542','城厢区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1543','涵江区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1544','荔城区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1545','秀屿区','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1546','仙游县','0','243','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1547','梅列区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1548','三元区','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1549','明溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1550','清流县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1551','宁化县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1552','大田县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1553','尤溪县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1554','沙县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1555','将乐县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1556','泰宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1557','建宁县','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1558','永安市','0','244','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1559','鲤城区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1560','丰泽区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1561','洛江区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1562','泉港区','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1563','惠安县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1564','安溪县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1565','永春县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1566','德化县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1567','金门县','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1568','石狮市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1569','晋江市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1570','南安市','0','245','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1571','芗城区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1572','龙文区','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1573','云霄县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1574','漳浦县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1575','诏安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1576','长泰县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1577','东山县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1578','南靖县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1579','平和县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1580','华安县','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1581','龙海市','0','246','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1582','延平区','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1583','顺昌县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1584','浦城县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1585','光泽县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1586','松溪县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1587','政和县','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1588','邵武市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1589','武夷山市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1590','建瓯市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1591','建阳市','0','247','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1592','新罗区','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1593','长汀县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1594','永定县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1595','上杭县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1596','武平县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1597','连城县','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1598','漳平市','0','248','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1599','蕉城区','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1600','霞浦县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1601','古田县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1602','屏南县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1603','寿宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1604','周宁县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1605','柘荣县','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1606','福安市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1607','福鼎市','0','249','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1608','东湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1609','西湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1610','青云谱区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1611','湾里区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1612','青山湖区','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1613','南昌县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1614','新建县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1615','安义县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1616','进贤县','0','250','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1617','昌江区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1618','珠山区','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1619','浮梁县','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1620','乐平市','0','251','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1621','安源区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1622','湘东区','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1623','莲花县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1624','上栗县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1625','芦溪县','0','252','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1626','庐山区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1627','浔阳区','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1628','九江县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1629','武宁县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1630','修水县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1631','永修县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1632','德安县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1633','星子县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1634','都昌县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1635','湖口县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1636','彭泽县','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1637','瑞昌市','0','253','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1638','渝水区','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1639','分宜县','0','254','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1640','月湖区','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1641','余江县','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1642','贵溪市','0','255','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1643','章贡区','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1644','赣县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1645','信丰县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1646','大余县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1647','上犹县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1648','崇义县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1649','安远县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1650','龙南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1651','定南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1652','全南县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1653','宁都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1654','于都县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1655','兴国县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1656','会昌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1657','寻乌县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1658','石城县','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1659','瑞金市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1660','南康市','0','256','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1661','吉州区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1662','青原区','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1663','吉安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1664','吉水县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1665','峡江县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1666','新干县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1667','永丰县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1668','泰和县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1669','遂川县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1670','万安县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1671','安福县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1672','永新县','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1673','井冈山市','0','257','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1674','袁州区','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1675','奉新县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1676','万载县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1677','上高县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1678','宜丰县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1679','靖安县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1680','铜鼓县','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1681','丰城市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1682','樟树市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1683','高安市','0','258','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1684','临川区','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1685','南城县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1686','黎川县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1687','南丰县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1688','崇仁县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1689','乐安县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1690','宜黄县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1691','金溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1692','资溪县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1693','东乡县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1694','广昌县','0','259','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1695','信州区','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1696','上饶县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1697','广丰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1698','玉山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1699','铅山县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1700','横峰县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1701','弋阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1702','余干县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1703','鄱阳县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1704','万年县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1705','婺源县','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1706','德兴市','0','260','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1707','历下区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1708','市中区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1709','槐荫区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1710','天桥区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1711','历城区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1712','长清区','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1713','平阴县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1714','济阳县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1715','商河县','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1716','章丘市','0','261','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1717','市南区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1718','市北区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1719','四方区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1720','黄岛区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1721','崂山区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1722','李沧区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1723','城阳区','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1724','胶州市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1725','即墨市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1726','平度市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1727','胶南市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1728','莱西市','0','262','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1729','淄川区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1730','张店区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1731','博山区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1732','临淄区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1733','周村区','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1734','桓台县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1735','高青县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1736','沂源县','0','263','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1737','市中区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1738','薛城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1739','峄城区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1740','台儿庄区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1741','山亭区','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1742','滕州市','0','264','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1743','东营区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1744','河口区','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1745','垦利县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1746','利津县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1747','广饶县','0','265','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1748','芝罘区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1749','福山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1750','牟平区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1751','莱山区','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1752','长岛县','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1753','龙口市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1754','莱阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1755','莱州市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1756','蓬莱市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1757','招远市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1758','栖霞市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1759','海阳市','0','266','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1760','潍城区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1761','寒亭区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1762','坊子区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1763','奎文区','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1764','临朐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1765','昌乐县','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1766','青州市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1767','诸城市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1768','寿光市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1769','安丘市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1770','高密市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1771','昌邑市','0','267','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1772','市中区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1773','任城区','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1774','微山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1775','鱼台县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1776','金乡县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1777','嘉祥县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1778','汶上县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1779','泗水县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1780','梁山县','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1781','曲阜市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1782','兖州市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1783','邹城市','0','268','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1784','泰山区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1785','岱岳区','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1786','宁阳县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1787','东平县','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1788','新泰市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1789','肥城市','0','269','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1790','环翠区','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1791','文登市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1792','荣成市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1793','乳山市','0','270','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1794','东港区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1795','岚山区','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1796','五莲县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1797','莒县','0','271','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1798','莱城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1799','钢城区','0','272','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1800','兰山区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1801','罗庄区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1802','河东区','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1803','沂南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1804','郯城县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1805','沂水县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1806','苍山县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1807','费县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1808','平邑县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1809','莒南县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1810','蒙阴县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1811','临沭县','0','273','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1812','德城区','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1813','陵县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1814','宁津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1815','庆云县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1816','临邑县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1817','齐河县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1818','平原县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1819','夏津县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1820','武城县','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1821','乐陵市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1822','禹城市','0','274','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1823','东昌府区','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1824','阳谷县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1825','莘县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1826','茌平县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1827','东阿县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1828','冠县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1829','高唐县','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1830','临清市','0','275','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1831','滨城区','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1832','惠民县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1833','阳信县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1834','无棣县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1835','沾化县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1836','博兴县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1837','邹平县','0','276','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1838','牡丹区','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1839','曹县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1840','单县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1841','成武县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1842','巨野县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1843','郓城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1844','鄄城县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1845','定陶县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1846','东明县','0','277','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1847','中原区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1848','二七区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1849','管城回族区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1850','金水区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1851','上街区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1852','惠济区','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1853','中牟县','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1854','巩义市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1855','荥阳市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1856','新密市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1857','新郑市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1858','登封市','0','278','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1859','龙亭区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1860','顺河回族区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1861','鼓楼区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1862','禹王台区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1863','金明区','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1864','杞县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1865','通许县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1866','尉氏县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1867','开封县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1868','兰考县','0','279','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1869','老城区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1870','西工区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1871','廛河回族区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1872','涧西区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1873','吉利区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1874','洛龙区','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1875','孟津县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1876','新安县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1877','栾川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1878','嵩县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1879','汝阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1880','宜阳县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1881','洛宁县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1882','伊川县','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1883','偃师市','0','280','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1884','新华区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1885','卫东区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1886','石龙区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1887','湛河区','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1888','宝丰县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1889','叶县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1890','鲁山县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1891','郏县','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1892','舞钢市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1893','汝州市','0','281','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1894','文峰区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1895','北关区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1896','殷都区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1897','龙安区','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1898','安阳县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1899','汤阴县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1900','滑县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1901','内黄县','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1902','林州市','0','282','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1903','鹤山区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1904','山城区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1905','淇滨区','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1906','浚县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1907','淇县','0','283','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1908','红旗区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1909','卫滨区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1910','凤泉区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1911','牧野区','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1912','新乡县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1913','获嘉县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1914','原阳县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1915','延津县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1916','封丘县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1917','长垣县','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1918','卫辉市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1919','辉县市','0','284','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1920','解放区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1921','中站区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1922','马村区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1923','山阳区','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1924','修武县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1925','博爱县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1926','武陟县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1927','温县','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1928','济源市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1929','沁阳市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1930','孟州市','0','285','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1931','华龙区','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1932','清丰县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1933','南乐县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1934','范县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1935','台前县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1936','濮阳县','0','286','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1937','魏都区','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1938','许昌县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1939','鄢陵县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1940','襄城县','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1941','禹州市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1942','长葛市','0','287','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1943','源汇区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1944','郾城区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1945','召陵区','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1946','舞阳县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1947','临颍县','0','288','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1948','湖滨区','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1949','渑池县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1950','陕县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1951','卢氏县','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1952','义马市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1953','灵宝市','0','289','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1954','宛城区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1955','卧龙区','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1956','南召县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1957','方城县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1958','西峡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1959','镇平县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1960','内乡县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1961','淅川县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1962','社旗县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1963','唐河县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1964','新野县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1965','桐柏县','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1966','邓州市','0','290','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1967','梁园区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1968','睢阳区','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1969','民权县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1970','睢县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1971','宁陵县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1972','柘城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1973','虞城县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1974','夏邑县','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1975','永城市','0','291','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1976','浉河区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1977','平桥区','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1978','罗山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1979','光山县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1980','新县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1981','商城县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1982','固始县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1983','潢川县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1984','淮滨县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1985','息县','0','292','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1986','川汇区','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1987','扶沟县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1988','西华县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1989','商水县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1990','沈丘县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1991','郸城县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1992','淮阳县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1993','太康县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1994','鹿邑县','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1995','项城市','0','293','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1996','驿城区','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1997','西平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1998','上蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('1999','平舆县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2000','正阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2001','确山县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2002','泌阳县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2003','汝南县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2004','遂平县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2005','新蔡县','0','294','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2006','江岸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2007','江汉区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2008','硚口区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2009','汉阳区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2010','武昌区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2011','青山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2012','洪山区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2013','东西湖区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2014','汉南区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2015','蔡甸区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2016','江夏区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2017','黄陂区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2018','新洲区','0','295','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2019','黄石港区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2020','西塞山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2021','下陆区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2022','铁山区','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2023','阳新县','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2024','大冶市','0','296','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2025','茅箭区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2026','张湾区','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2027','郧县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2028','郧西县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2029','竹山县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2030','竹溪县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2031','房县','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2032','丹江口市','0','297','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2033','西陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2034','伍家岗区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2035','点军区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2036','猇亭区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2037','夷陵区','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2038','远安县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2039','兴山县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2040','秭归县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2041','长阳土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2042','五峰土家族自治县','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2043','宜都市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2044','当阳市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2045','枝江市','0','298','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2046','襄城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2047','樊城区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2048','襄阳区','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2049','南漳县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2050','谷城县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2051','保康县','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2052','老河口市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2053','枣阳市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2054','宜城市','0','299','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2055','梁子湖区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2056','华容区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2057','鄂城区','0','300','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2058','东宝区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2059','掇刀区','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2060','京山县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2061','沙洋县','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2062','钟祥市','0','301','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2063','孝南区','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2064','孝昌县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2065','大悟县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2066','云梦县','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2067','应城市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2068','安陆市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2069','汉川市','0','302','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2070','沙市区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2071','荆州区','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2072','公安县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2073','监利县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2074','江陵县','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2075','石首市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2076','洪湖市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2077','松滋市','0','303','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2078','黄州区','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2079','团风县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2080','红安县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2081','罗田县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2082','英山县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2083','浠水县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2084','蕲春县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2085','黄梅县','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2086','麻城市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2087','武穴市','0','304','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2088','咸安区','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2089','嘉鱼县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2090','通城县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2091','崇阳县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2092','通山县','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2093','赤壁市','0','305','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2094','曾都区','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2095','广水市','0','306','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2096','恩施市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2097','利川市','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2098','建始县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2099','巴东县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2100','宣恩县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2101','咸丰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2102','来凤县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2103','鹤峰县','0','307','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2104','芙蓉区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2105','天心区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2106','岳麓区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2107','开福区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2108','雨花区','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2109','长沙县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2110','望城县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2111','宁乡县','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2112','浏阳市','0','312','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2113','荷塘区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2114','芦淞区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2115','石峰区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2116','天元区','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2117','株洲县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2118','攸县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2119','茶陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2120','炎陵县','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2121','醴陵市','0','313','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2122','雨湖区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2123','岳塘区','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2124','湘潭县','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2125','湘乡市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2126','韶山市','0','314','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2127','珠晖区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2128','雁峰区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2129','石鼓区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2130','蒸湘区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2131','南岳区','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2132','衡阳县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2133','衡南县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2134','衡山县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2135','衡东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2136','祁东县','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2137','耒阳市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2138','常宁市','0','315','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2139','双清区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2140','大祥区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2141','北塔区','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2142','邵东县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2143','新邵县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2144','邵阳县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2145','隆回县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2146','洞口县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2147','绥宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2148','新宁县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2149','城步苗族自治县','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2150','武冈市','0','316','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2151','岳阳楼区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2152','云溪区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2153','君山区','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2154','岳阳县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2155','华容县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2156','湘阴县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2157','平江县','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2158','汨罗市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2159','临湘市','0','317','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2160','武陵区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2161','鼎城区','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2162','安乡县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2163','汉寿县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2164','澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2165','临澧县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2166','桃源县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2167','石门县','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2168','津市市','0','318','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2169','永定区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2170','武陵源区','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2171','慈利县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2172','桑植县','0','319','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2173','资阳区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2174','赫山区','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2175','南县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2176','桃江县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2177','安化县','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2178','沅江市','0','320','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2179','北湖区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2180','苏仙区','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2181','桂阳县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2182','宜章县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2183','永兴县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2184','嘉禾县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2185','临武县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2186','汝城县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2187','桂东县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2188','安仁县','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2189','资兴市','0','321','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2190','零陵区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2191','冷水滩区','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2192','祁阳县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2193','东安县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2194','双牌县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2195','道县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2196','江永县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2197','宁远县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2198','蓝山县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2199','新田县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2200','江华瑶族自治县','0','322','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2201','鹤城区','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2202','中方县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2203','沅陵县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2204','辰溪县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2205','溆浦县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2206','会同县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2207','麻阳苗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2208','新晃侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2209','芷江侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2210','靖州苗族侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2211','通道侗族自治县','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2212','洪江市','0','323','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2213','娄星区','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2214','双峰县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2215','新化县','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2216','冷水江市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2217','涟源市','0','324','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2218','吉首市','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2219','泸溪县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2220','凤凰县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2221','花垣县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2222','保靖县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2223','古丈县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2224','永顺县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2225','龙山县','0','325','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2226','荔湾区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2227','越秀区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2228','海珠区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2229','天河区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2230','白云区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2231','黄埔区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2232','番禺区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2233','花都区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2234','南沙区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2235','萝岗区','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2236','增城市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2237','从化市','0','326','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2238','武江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2239','浈江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2240','曲江区','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2241','始兴县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2242','仁化县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2243','翁源县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2244','乳源瑶族自治县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2245','新丰县','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2246','乐昌市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2247','南雄市','0','327','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2248','罗湖区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2249','福田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2250','南山区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2251','宝安区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2252','龙岗区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2253','盐田区','0','328','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2254','香洲区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2255','斗门区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2256','金湾区','0','329','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2257','龙湖区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2258','金平区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2259','濠江区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2260','潮阳区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2261','潮南区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2262','澄海区','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2263','南澳县','0','330','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2264','禅城区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2265','南海区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2266','顺德区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2267','三水区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2268','高明区','0','331','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2269','蓬江区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2270','江海区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2271','新会区','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2272','台山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2273','开平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2274','鹤山市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2275','恩平市','0','332','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2276','赤坎区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2277','霞山区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2278','坡头区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2279','麻章区','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2280','遂溪县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2281','徐闻县','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2282','廉江市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2283','雷州市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2284','吴川市','0','333','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2285','茂南区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2286','茂港区','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2287','电白县','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2288','高州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2289','化州市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2290','信宜市','0','334','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2291','端州区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2292','鼎湖区','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2293','广宁县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2294','怀集县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2295','封开县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2296','德庆县','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2297','高要市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2298','四会市','0','335','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2299','惠城区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2300','惠阳区','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2301','博罗县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2302','惠东县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2303','龙门县','0','336','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2304','梅江区','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2305','梅县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2306','大埔县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2307','丰顺县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2308','五华县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2309','平远县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2310','蕉岭县','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2311','兴宁市','0','337','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2312','城区','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2313','海丰县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2314','陆河县','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2315','陆丰市','0','338','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2316','源城区','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2317','紫金县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2318','龙川县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2319','连平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2320','和平县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2321','东源县','0','339','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2322','江城区','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2323','阳西县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2324','阳东县','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2325','阳春市','0','340','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2326','清城区','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2327','佛冈县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2328','阳山县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2329','连山壮族瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2330','连南瑶族自治县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2331','清新县','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2332','英德市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2333','连州市','0','341','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2334','湘桥区','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2335','潮安县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2336','饶平县','0','344','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2337','榕城区','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2338','揭东县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2339','揭西县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2340','惠来县','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2341','普宁市','0','345','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2342','云城区','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2343','新兴县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2344','郁南县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2345','云安县','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2346','罗定市','0','346','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2347','兴宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2348','青秀区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2349','江南区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2350','西乡塘区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2351','良庆区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2352','邕宁区','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2353','武鸣县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2354','隆安县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2355','马山县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2356','上林县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2357','宾阳县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2358','横县','0','347','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2359','城中区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2360','鱼峰区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2361','柳南区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2362','柳北区','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2363','柳江县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2364','柳城县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2365','鹿寨县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2366','融安县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2367','融水苗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2368','三江侗族自治县','0','348','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2369','秀峰区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2370','叠彩区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2371','象山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2372','七星区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2373','雁山区','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2374','阳朔县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2375','临桂县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2376','灵川县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2377','全州县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2378','兴安县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2379','永福县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2380','灌阳县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2381','龙胜各族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2382','资源县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2383','平乐县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2384','荔蒲县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2385','恭城瑶族自治县','0','349','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2386','万秀区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2387','蝶山区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2388','长洲区','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2389','苍梧县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2390','藤县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2391','蒙山县','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2392','岑溪市','0','350','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2393','海城区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2394','银海区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2395','铁山港区','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2396','合浦县','0','351','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2397','港口区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2398','防城区','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2399','上思县','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2400','东兴市','0','352','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2401','钦南区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2402','钦北区','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2403','灵山县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2404','浦北县','0','353','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2405','港北区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2406','港南区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2407','覃塘区','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2408','平南县','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2409','桂平市','0','354','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2410','玉州区','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2411','容县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2412','陆川县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2413','博白县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2414','兴业县','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2415','北流市','0','355','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2416','右江区','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2417','田阳县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2418','田东县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2419','平果县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2420','德保县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2421','靖西县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2422','那坡县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2423','凌云县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2424','乐业县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2425','田林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2426','西林县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2427','隆林各族自治县','0','356','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2428','八步区','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2429','昭平县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2430','钟山县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2431','富川瑶族自治县','0','357','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2432','金城江区','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2433','南丹县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2434','天峨县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2435','凤山县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2436','东兰县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2437','罗城仫佬族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2438','环江毛南族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2439','巴马瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2440','都安瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2441','大化瑶族自治县','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2442','宜州市','0','358','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2443','兴宾区','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2444','忻城县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2445','象州县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2446','武宣县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2447','金秀瑶族自治县','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2448','合山市','0','359','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2449','江洲区','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2450','扶绥县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2451','宁明县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2452','龙州县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2453','大新县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2454','天等县','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2455','凭祥市','0','360','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2456','秀英区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2457','龙华区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2458','琼山区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2459','美兰区','0','361','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2460','锦江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2461','青羊区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2462','金牛区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2463','武侯区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2464','成华区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2465','龙泉驿区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2466','青白江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2467','新都区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2468','温江区','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2469','金堂县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2470','双流县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2471','郫县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2472','大邑县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2473','蒲江县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2474','新津县','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2475','都江堰市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2476','彭州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2477','邛崃市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2478','崇州市','0','382','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2479','自流井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2480','贡井区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2481','大安区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2482','沿滩区','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2483','荣县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2484','富顺县','0','383','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2485','东区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2486','西区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2487','仁和区','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2488','米易县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2489','盐边县','0','384','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2490','江阳区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2491','纳溪区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2492','龙马潭区','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2493','泸县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2494','合江县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2495','叙永县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2496','古蔺县','0','385','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2497','旌阳区','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2498','中江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2499','罗江县','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2500','广汉市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2501','什邡市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2502','绵竹市','0','386','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2503','涪城区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2504','游仙区','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2505','三台县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2506','盐亭县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2507','安县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2508','梓潼县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2509','北川羌族自治县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2510','平武县','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2511','江油市','0','387','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2512','市中区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2513','元坝区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2514','朝天区','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2515','旺苍县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2516','青川县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2517','剑阁县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2518','苍溪县','0','388','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2519','船山区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2520','安居区','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2521','蓬溪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2522','射洪县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2523','大英县','0','389','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2524','市中区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2525','东兴区','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2526','威远县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2527','资中县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2528','隆昌县','0','390','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2529','市中区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2530','沙湾区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2531','五通桥区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2532','金口河区','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2533','犍为县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2534','井研县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2535','夹江县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2536','沐川县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2537','峨边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2538','马边彝族自治县','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2539','峨眉山市','0','391','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2540','顺庆区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2541','高坪区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2542','嘉陵区','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2543','南部县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2544','营山县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2545','蓬安县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2546','仪陇县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2547','西充县','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2548','阆中市','0','392','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2549','东坡区','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2550','仁寿县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2551','彭山县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2552','洪雅县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2553','丹棱县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2554','青神县','0','393','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2555','翠屏区','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2556','宜宾县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2557','南溪县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2558','江安县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2559','长宁县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2560','高县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2561','珙县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2562','筠连县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2563','兴文县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2564','屏山县','0','394','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2565','广安区','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2566','岳池县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2567','武胜县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2568','邻水县','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2569','华蓥市','0','395','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2570','通川区','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2571','达县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2572','宣汉县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2573','开江县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2574','大竹县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2575','渠县','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2576','万源市','0','396','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2577','雨城区','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2578','名山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2579','荥经县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2580','汉源县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2581','石棉县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2582','天全县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2583','芦山县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2584','宝兴县','0','397','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2585','巴州区','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2586','通江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2587','南江县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2588','平昌县','0','398','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2589','雁江区','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2590','安岳县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2591','乐至县','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2592','简阳市','0','399','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2593','汶川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2594','理县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2595','茂县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2596','松潘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2597','九寨沟县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2598','金川县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2599','小金县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2600','黑水县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2601','马尔康县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2602','壤塘县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2603','阿坝县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2604','若尔盖县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2605','红原县','0','400','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2606','康定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2607','泸定县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2608','丹巴县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2609','九龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2610','雅江县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2611','道孚县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2612','炉霍县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2613','甘孜县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2614','新龙县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2615','德格县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2616','白玉县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2617','石渠县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2618','色达县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2619','理塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2620','巴塘县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2621','乡城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2622','稻城县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2623','得荣县','0','401','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2624','西昌市','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2625','木里藏族自治县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2626','盐源县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2627','德昌县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2628','会理县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2629','会东县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2630','宁南县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2631','普格县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2632','布拖县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2633','金阳县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2634','昭觉县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2635','喜德县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2636','冕宁县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2637','越西县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2638','甘洛县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2639','美姑县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2640','雷波县','0','402','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2641','南明区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2642','云岩区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2643','花溪区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2644','乌当区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2645','白云区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2646','小河区','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2647','开阳县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2648','息烽县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2649','修文县','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2650','清镇市','0','403','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2651','钟山区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2652','六枝特区','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2653','水城县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2654','盘县','0','404','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2655','红花岗区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2656','汇川区','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2657','遵义县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2658','桐梓县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2659','绥阳县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2660','正安县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2661','道真仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2662','务川仡佬族苗族自治县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2663','凤冈县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2664','湄潭县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2665','余庆县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2666','习水县','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2667','赤水市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2668','仁怀市','0','405','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2669','西秀区','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2670','平坝县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2671','普定县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2672','镇宁布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2673','关岭布依族苗族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2674','紫云苗族布依族自治县','0','406','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2675','铜仁市','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2676','江口县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2677','玉屏侗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2678','石阡县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2679','思南县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2680','印江土家族苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2681','德江县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2682','沿河土家族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2683','松桃苗族自治县','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2684','万山特区','0','407','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2685','兴义市','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2686','兴仁县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2687','普安县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2688','晴隆县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2689','贞丰县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2690','望谟县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2691','册亨县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2692','安龙县','0','408','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2693','毕节市','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2694','大方县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2695','黔西县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2696','金沙县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2697','织金县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2698','纳雍县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2699','威宁彝族回族苗族自治县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2700','赫章县','0','409','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2701','凯里市','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2702','黄平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2703','施秉县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2704','三穗县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2705','镇远县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2706','岑巩县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2707','天柱县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2708','锦屏县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2709','剑河县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2710','台江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2711','黎平县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2712','榕江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2713','从江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2714','雷山县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2715','麻江县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2716','丹寨县','0','410','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2717','都匀市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2718','福泉市','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2719','荔波县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2720','贵定县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2721','瓮安县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2722','独山县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2723','平塘县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2724','罗甸县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2725','长顺县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2726','龙里县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2727','惠水县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2728','三都水族自治县','0','411','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2729','五华区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2730','盘龙区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2731','官渡区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2732','西山区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2733','东川区','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2734','呈贡县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2735','晋宁县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2736','富民县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2737','宜良县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2738','石林彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2739','嵩明县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2740','禄劝彝族苗族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2741','寻甸回族彝族自治县','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2742','安宁市','0','412','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2743','麒麟区','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2744','马龙县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2745','陆良县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2746','师宗县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2747','罗平县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2748','富源县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2749','会泽县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2750','沾益县','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2751','宣威市','0','413','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2752','红塔区','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2753','江川县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2754','澄江县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2755','通海县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2756','华宁县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2757','易门县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2758','峨山彝族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2759','新平彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2760','元江哈尼族彝族傣族自治县','0','414','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2761','隆阳区','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2762','施甸县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2763','腾冲县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2764','龙陵县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2765','昌宁县','0','415','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2766','昭阳区','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2767','鲁甸县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2768','巧家县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2769','盐津县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2770','大关县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2771','永善县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2772','绥江县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2773','镇雄县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2774','彝良县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2775','威信县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2776','水富县','0','416','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2777','古城区','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2778','玉龙纳西族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2779','永胜县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2780','华坪县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2781','宁蒗彝族自治县','0','417','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2782','翠云区','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2783','普洱哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2784','墨江哈尼族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2785','景东彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2786','景谷傣族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2787','镇沅彝族哈尼族拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2788','江城哈尼族彝族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2789','孟连傣族拉祜族佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2790','澜沧拉祜族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2791','西盟佤族自治县','0','418','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2792','临翔区','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2793','凤庆县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2794','云县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2795','永德县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2796','镇康县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2797','双江拉祜族佤族布朗族傣族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2798','耿马傣族佤族自治县','0','419','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2799','沧源佤族自治县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2800','楚雄市','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2801','双柏县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2802','牟定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2803','南华县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2804','姚安县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2805','大姚县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2806','永仁县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2807','元谋县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2808','武定县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2809','禄丰县','0','420','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2810','个旧市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2811','开远市','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2812','蒙自县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2813','屏边苗族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2814','建水县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2815','石屏县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2816','弥勒县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2817','泸西县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2818','元阳县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2819','红河县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2820','金平苗族瑶族傣族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2821','绿春县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2822','河口瑶族自治县','0','421','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2823','文山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2824','砚山县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2825','西畴县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2826','麻栗坡县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2827','马关县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2828','丘北县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2829','广南县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2830','富宁县','0','422','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2831','景洪市','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2832','勐海县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2833','勐腊县','0','423','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2834','大理市','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2835','漾濞彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2836','祥云县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2837','宾川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2838','弥渡县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2839','南涧彝族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2840','巍山彝族回族自治县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2841','永平县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2842','云龙县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2843','洱源县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2844','剑川县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2845','鹤庆县','0','424','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2846','瑞丽市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2847','潞西市','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2848','梁河县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2849','盈江县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2850','陇川县','0','425','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2851','泸水县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2852','福贡县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2853','贡山独龙族怒族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2854','兰坪白族普米族自治县','0','426','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2855','香格里拉县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2856','德钦县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2857','维西傈僳族自治县','0','427','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2858','城关区','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2859','林周县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2860','当雄县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2861','尼木县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2862','曲水县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2863','堆龙德庆县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2864','达孜县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2865','墨竹工卡县','0','428','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2866','昌都县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2867','江达县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2868','贡觉县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2869','类乌齐县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2870','丁青县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2871','察雅县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2872','八宿县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2873','左贡县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2874','芒康县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2875','洛隆县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2876','边坝县','0','429','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2877','乃东县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2878','扎囊县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2879','贡嘎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2880','桑日县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2881','琼结县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2882','曲松县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2883','措美县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2884','洛扎县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2885','加查县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2886','隆子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2887','错那县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2888','浪卡子县','0','430','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2889','日喀则市','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2890','南木林县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2891','江孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2892','定日县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2893','萨迦县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2894','拉孜县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2895','昂仁县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2896','谢通门县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2897','白朗县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2898','仁布县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2899','康马县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2900','定结县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2901','仲巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2902','亚东县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2903','吉隆县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2904','聂拉木县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2905','萨嘎县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2906','岗巴县','0','431','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2907','那曲县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2908','嘉黎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2909','比如县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2910','聂荣县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2911','安多县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2912','申扎县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2913','索县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2914','班戈县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2915','巴青县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2916','尼玛县','0','432','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2917','普兰县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2918','札达县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2919','噶尔县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2920','日土县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2921','革吉县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2922','改则县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2923','措勤县','0','433','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2924','林芝县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2925','工布江达县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2926','米林县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2927','墨脱县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2928','波密县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2929','察隅县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2930','朗县','0','434','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2931','新城区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2932','碑林区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2933','莲湖区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2934','灞桥区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2935','未央区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2936','雁塔区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2937','阎良区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2938','临潼区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2939','长安区','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2940','蓝田县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2941','周至县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2942','户县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2943','高陵县','0','435','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2944','王益区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2945','印台区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2946','耀州区','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2947','宜君县','0','436','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2948','渭滨区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2949','金台区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2950','陈仓区','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2951','凤翔县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2952','岐山县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2953','扶风县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2954','眉县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2955','陇县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2956','千阳县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2957','麟游县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2958','凤县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2959','太白县','0','437','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2960','秦都区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2961','杨凌区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2962','渭城区','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2963','三原县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2964','泾阳县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2965','乾县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2966','礼泉县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2967','永寿县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2968','彬县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2969','长武县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2970','旬邑县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2971','淳化县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2972','武功县','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2973','兴平市','0','438','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2974','临渭区','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2975','华县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2976','潼关县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2977','大荔县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2978','合阳县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2979','澄城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2980','蒲城县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2981','白水县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2982','富平县','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2983','韩城市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2984','华阴市','0','439','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2985','宝塔区','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2986','延长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2987','延川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2988','子长县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2989','安塞县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2990','志丹县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2991','吴起县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2992','甘泉县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2993','富县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2994','洛川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2995','宜川县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2996','黄龙县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2997','黄陵县','0','440','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2998','汉台区','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('2999','南郑县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3000','城固县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3001','洋县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3002','西乡县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3003','勉县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3004','宁强县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3005','略阳县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3006','镇巴县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3007','留坝县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3008','佛坪县','0','441','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3009','榆阳区','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3010','神木县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3011','府谷县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3012','横山县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3013','靖边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3014','定边县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3015','绥德县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3016','米脂县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3017','佳县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3018','吴堡县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3019','清涧县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3020','子洲县','0','442','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3021','汉滨区','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3022','汉阴县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3023','石泉县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3024','宁陕县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3025','紫阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3026','岚皋县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3027','平利县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3028','镇坪县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3029','旬阳县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3030','白河县','0','443','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3031','商州区','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3032','洛南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3033','丹凤县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3034','商南县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3035','山阳县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3036','镇安县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3037','柞水县','0','444','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3038','城关区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3039','七里河区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3040','西固区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3041','安宁区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3042','红古区','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3043','永登县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3044','皋兰县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3045','榆中县','0','445','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3046','金川区','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3047','永昌县','0','447','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3048','白银区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3049','平川区','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3050','靖远县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3051','会宁县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3052','景泰县','0','448','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3053','秦城区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3054','北道区','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3055','清水县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3056','秦安县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3057','甘谷县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3058','武山县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3059','张家川回族自治县','0','449','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3060','凉州区','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3061','民勤县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3062','古浪县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3063','天祝藏族自治县','0','450','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3064','甘州区','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3065','肃南裕固族自治县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3066','民乐县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3067','临泽县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3068','高台县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3069','山丹县','0','451','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3070','崆峒区','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3071','泾川县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3072','灵台县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3073','崇信县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3074','华亭县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3075','庄浪县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3076','静宁县','0','452','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3077','肃州区','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3078','金塔县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3079','瓜州县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3080','肃北蒙古族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3081','阿克塞哈萨克族自治县','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3082','玉门市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3083','敦煌市','0','453','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3084','西峰区','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3085','庆城县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3086','环县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3087','华池县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3088','合水县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3089','正宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3090','宁县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3091','镇原县','0','454','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3092','安定区','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3093','通渭县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3094','陇西县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3095','渭源县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3096','临洮县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3097','漳县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3098','岷县','0','455','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3099','武都区','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3100','成县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3101','文县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3102','宕昌县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3103','康县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3104','西和县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3105','礼县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3106','徽县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3107','两当县','0','456','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3108','临夏市','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3109','临夏县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3110','康乐县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3111','永靖县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3112','广河县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3113','和政县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3114','东乡族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3115','积石山保安族东乡族撒拉族自治县','0','457','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3116','合作市','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3117','临潭县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3118','卓尼县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3119','舟曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3120','迭部县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3121','玛曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3122','碌曲县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3123','夏河县','0','458','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3124','城东区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3125','城中区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3126','城西区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3127','城北区','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3128','大通回族土族自治县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3129','湟中县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3130','湟源县','0','459','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3131','平安县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3132','民和回族土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3133','乐都县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3134','互助土族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3135','化隆回族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3136','循化撒拉族自治县','0','460','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3137','门源回族自治县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3138','祁连县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3139','海晏县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3140','刚察县','0','461','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3141','同仁县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3142','尖扎县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3143','泽库县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3144','河南蒙古族自治县','0','462','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3145','共和县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3146','同德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3147','贵德县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3148','兴海县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3149','贵南县','0','463','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3150','玛沁县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3151','班玛县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3152','甘德县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3153','达日县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3154','久治县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3155','玛多县','0','464','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3156','玉树县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3157','杂多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3158','称多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3159','治多县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3160','囊谦县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3161','曲麻莱县','0','465','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3162','格尔木市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3163','德令哈市','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3164','乌兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3165','都兰县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3166','天峻县','0','466','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3167','兴庆区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3168','西夏区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3169','金凤区','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3170','永宁县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3171','贺兰县','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3172','灵武市','0','467','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3173','大武口区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3174','惠农区','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3175','平罗县','0','468','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3176','利通区','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3177','盐池县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3178','同心县','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3179','青铜峡市','0','469','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3180','原州区','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3181','西吉县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3182','隆德县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3183','泾源县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3184','彭阳县','0','470','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3185','沙坡头区','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3186','中宁县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3187','海原县','0','471','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3188','天山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3189','沙依巴克区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3190','新市区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3191','水磨沟区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3192','头屯河区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3193','达坂城区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3194','东山区','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3195','乌鲁木齐县','0','472','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3196','独山子区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3197','克拉玛依区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3198','白碱滩区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3199','乌尔禾区','0','473','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3200','吐鲁番市','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3201','鄯善县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3202','托克逊县','0','474','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3203','哈密市','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3204','巴里坤哈萨克自治县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3205','伊吾县','0','475','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3206','昌吉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3207','阜康市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3208','米泉市','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3209','呼图壁县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3210','玛纳斯县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3211','奇台县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3212','吉木萨尔县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3213','木垒哈萨克自治县','0','476','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3214','博乐市','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3215','精河县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3216','温泉县','0','477','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3217','库尔勒市','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3218','轮台县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3219','尉犁县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3220','若羌县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3221','且末县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3222','焉耆回族自治县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3223','和静县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3224','和硕县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3225','博湖县','0','478','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3226','阿克苏市','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3227','温宿县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3228','库车县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3229','沙雅县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3230','新和县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3231','拜城县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3232','乌什县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3233','阿瓦提县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3234','柯坪县','0','479','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3235','阿图什市','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3236','阿克陶县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3237','阿合奇县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3238','乌恰县','0','480','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3239','喀什市','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3240','疏附县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3241','疏勒县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3242','英吉沙县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3243','泽普县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3244','莎车县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3245','叶城县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3246','麦盖提县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3247','岳普湖县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3248','伽师县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3249','巴楚县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3250','塔什库尔干塔吉克自治县','0','481','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3251','和田市','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3252','和田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3253','墨玉县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3254','皮山县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3255','洛浦县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3256','策勒县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3257','于田县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3258','民丰县','0','482','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3259','伊宁市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3260','奎屯市','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3261','伊宁县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3262','察布查尔锡伯自治县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3263','霍城县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3264','巩留县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3265','新源县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3266','昭苏县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3267','特克斯县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3268','尼勒克县','0','483','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3269','塔城市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3270','乌苏市','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3271','额敏县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3272','沙湾县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3273','托里县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3274','裕民县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3275','和布克赛尔蒙古自治县','0','484','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3276','阿勒泰市','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3277','布尔津县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3278','富蕴县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3279','福海县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3280','哈巴河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3281','青河县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3282','吉木乃县','0','485','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3358','钓鱼岛','','0','0','','1','0','','','0');
INSERT INTO `v9_linkage` VALUES('3359','钓鱼岛','','3358','0','','1','0','','','0');

DROP TABLE IF EXISTS `v9_log`;
CREATE TABLE `v9_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=515 DEFAULT CHARSET=utf8;

INSERT INTO `v9_log` VALUES('1','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-04-22 14:10:28');
INSERT INTO `v9_log` VALUES('2','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-04-22 14:10:29');
INSERT INTO `v9_log` VALUES('3','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-04-22 14:10:37');
INSERT INTO `v9_log` VALUES('4','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-04-22 14:13:29');
INSERT INTO `v9_log` VALUES('5','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-04-22 14:13:29');
INSERT INTO `v9_log` VALUES('6','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-04-22 14:13:42');
INSERT INTO `v9_log` VALUES('7','','0','video','','video','?m=video&c=video&a=subscribe_list','','1','phpcms','127.0.0.1','2017-04-22 14:14:31');
INSERT INTO `v9_log` VALUES('8','','0','video','','video','?m=video&c=video&a=open','','1','phpcms','127.0.0.1','2017-04-22 14:14:32');
INSERT INTO `v9_log` VALUES('9','','0','video','','video','?m=video&c=video&a=open','','1','phpcms','127.0.0.1','2017-04-22 14:14:33');
INSERT INTO `v9_log` VALUES('10','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-22 15:04:53');
INSERT INTO `v9_log` VALUES('11','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-22 15:04:53');
INSERT INTO `v9_log` VALUES('12','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-22 15:05:01');
INSERT INTO `v9_log` VALUES('13','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-22 15:05:03');
INSERT INTO `v9_log` VALUES('14','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-22 15:05:11');
INSERT INTO `v9_log` VALUES('15','','0','admin','','category','?m=admin&c=category&a=count_items','','1','admin','127.0.0.1','2017-04-22 15:06:27');
INSERT INTO `v9_log` VALUES('16','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-04-22 15:10:29');
INSERT INTO `v9_log` VALUES('17','','0','admin','','category','?m=admin&c=category&a=count_items','','1','admin','127.0.0.1','2017-04-22 15:13:35');
INSERT INTO `v9_log` VALUES('18','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:10');
INSERT INTO `v9_log` VALUES('19','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:12');
INSERT INTO `v9_log` VALUES('20','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:13');
INSERT INTO `v9_log` VALUES('21','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:14');
INSERT INTO `v9_log` VALUES('22','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:15');
INSERT INTO `v9_log` VALUES('23','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:16');
INSERT INTO `v9_log` VALUES('24','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:17');
INSERT INTO `v9_log` VALUES('25','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:18');
INSERT INTO `v9_log` VALUES('26','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:19');
INSERT INTO `v9_log` VALUES('27','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-22 15:14:20');
INSERT INTO `v9_log` VALUES('28','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','127.0.0.1','2017-04-22 15:23:04');
INSERT INTO `v9_log` VALUES('29','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','127.0.0.1','2017-04-22 15:23:33');
INSERT INTO `v9_log` VALUES('30','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 20:39:21');
INSERT INTO `v9_log` VALUES('31','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 20:39:21');
INSERT INTO `v9_log` VALUES('32','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 20:39:28');
INSERT INTO `v9_log` VALUES('33','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:05:02');
INSERT INTO `v9_log` VALUES('34','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:05:05');
INSERT INTO `v9_log` VALUES('35','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:05:20');
INSERT INTO `v9_log` VALUES('36','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:05:22');
INSERT INTO `v9_log` VALUES('37','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:05:57');
INSERT INTO `v9_log` VALUES('38','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:06:02');
INSERT INTO `v9_log` VALUES('39','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:06:09');
INSERT INTO `v9_log` VALUES('40','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:07:12');
INSERT INTO `v9_log` VALUES('41','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:07:37');
INSERT INTO `v9_log` VALUES('42','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:07:43');
INSERT INTO `v9_log` VALUES('43','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:07:48');
INSERT INTO `v9_log` VALUES('44','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:08:02');
INSERT INTO `v9_log` VALUES('45','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:09:57');
INSERT INTO `v9_log` VALUES('46','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:10:20');
INSERT INTO `v9_log` VALUES('47','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:10:43');
INSERT INTO `v9_log` VALUES('48','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:11:06');
INSERT INTO `v9_log` VALUES('49','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:11:10');
INSERT INTO `v9_log` VALUES('50','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:19:24');
INSERT INTO `v9_log` VALUES('51','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:20:07');
INSERT INTO `v9_log` VALUES('52','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:20:41');
INSERT INTO `v9_log` VALUES('53','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:20:52');
INSERT INTO `v9_log` VALUES('54','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 21:20:55');
INSERT INTO `v9_log` VALUES('55','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:18');
INSERT INTO `v9_log` VALUES('56','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:20');
INSERT INTO `v9_log` VALUES('57','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:20');
INSERT INTO `v9_log` VALUES('58','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:22');
INSERT INTO `v9_log` VALUES('59','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:23');
INSERT INTO `v9_log` VALUES('60','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:24');
INSERT INTO `v9_log` VALUES('61','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:25');
INSERT INTO `v9_log` VALUES('62','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:27');
INSERT INTO `v9_log` VALUES('63','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:28');
INSERT INTO `v9_log` VALUES('64','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-04-23 21:21:29');
INSERT INTO `v9_log` VALUES('65','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 22:01:23');
INSERT INTO `v9_log` VALUES('66','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:02:01');
INSERT INTO `v9_log` VALUES('67','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:03:15');
INSERT INTO `v9_log` VALUES('68','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:04:10');
INSERT INTO `v9_log` VALUES('69','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:04:38');
INSERT INTO `v9_log` VALUES('70','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:06:02');
INSERT INTO `v9_log` VALUES('71','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:07:54');
INSERT INTO `v9_log` VALUES('72','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:11:24');
INSERT INTO `v9_log` VALUES('73','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:11:55');
INSERT INTO `v9_log` VALUES('74','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:12:20');
INSERT INTO `v9_log` VALUES('75','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:12:43');
INSERT INTO `v9_log` VALUES('76','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:13:28');
INSERT INTO `v9_log` VALUES('77','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:13:49');
INSERT INTO `v9_log` VALUES('78','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:16:34');
INSERT INTO `v9_log` VALUES('79','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:19:29');
INSERT INTO `v9_log` VALUES('80','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-04-23 22:19:41');
INSERT INTO `v9_log` VALUES('81','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 22:20:06');
INSERT INTO `v9_log` VALUES('82','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 22:20:06');
INSERT INTO `v9_log` VALUES('83','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 22:20:06');
INSERT INTO `v9_log` VALUES('84','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 22:20:13');
INSERT INTO `v9_log` VALUES('85','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 22:20:15');
INSERT INTO `v9_log` VALUES('86','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-04-23 22:20:22');
INSERT INTO `v9_log` VALUES('87','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 22:20:32');
INSERT INTO `v9_log` VALUES('88','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 22:20:36');
INSERT INTO `v9_log` VALUES('89','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 22:23:31');
INSERT INTO `v9_log` VALUES('90','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 22:23:36');
INSERT INTO `v9_log` VALUES('91','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-04-23 22:23:43');
INSERT INTO `v9_log` VALUES('92','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-18 09:23:28');
INSERT INTO `v9_log` VALUES('93','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-18 09:23:29');
INSERT INTO `v9_log` VALUES('94','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-18 09:23:37');
INSERT INTO `v9_log` VALUES('95','','0','admin','','index','?m=admin&c=index&a=login','','1','','127.0.0.1','2017-05-18 09:27:04');
INSERT INTO `v9_log` VALUES('96','','0','admin','','index','?m=admin&c=index&a=login','','1','','127.0.0.1','2017-05-18 09:27:12');
INSERT INTO `v9_log` VALUES('97','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2017-05-18 09:28:51');
INSERT INTO `v9_log` VALUES('98','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2017-05-18 09:28:55');
INSERT INTO `v9_log` VALUES('99','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2017-05-18 09:29:05');
INSERT INTO `v9_log` VALUES('100','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2017-05-18 09:29:08');
INSERT INTO `v9_log` VALUES('101','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2017-05-18 09:29:28');
INSERT INTO `v9_log` VALUES('102','','0','admin','','menu','?m=admin&c=menu&a=edit','','1','admin','127.0.0.1','2017-05-18 09:29:35');
INSERT INTO `v9_log` VALUES('103','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-23 14:48:21');
INSERT INTO `v9_log` VALUES('104','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-23 14:50:40');
INSERT INTO `v9_log` VALUES('105','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-05-23 14:56:37');
INSERT INTO `v9_log` VALUES('106','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-05-23 14:56:57');
INSERT INTO `v9_log` VALUES('107','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-05-23 14:56:59');
INSERT INTO `v9_log` VALUES('108','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-05-23 14:56:59');
INSERT INTO `v9_log` VALUES('109','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-05-23 14:57:21');
INSERT INTO `v9_log` VALUES('110','','0','content','','content','?m=content&c=content&a=clear_data','','1','admin','127.0.0.1','2017-05-25 10:16:18');
INSERT INTO `v9_log` VALUES('111','','0','content','','create_html','?m=content&c=create_html&a=show','','1','admin','127.0.0.1','2017-05-25 10:16:20');
INSERT INTO `v9_log` VALUES('112','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 10:16:31');
INSERT INTO `v9_log` VALUES('113','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 10:16:43');
INSERT INTO `v9_log` VALUES('114','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-05-25 10:17:48');
INSERT INTO `v9_log` VALUES('115','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:20:54');
INSERT INTO `v9_log` VALUES('116','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:20:54');
INSERT INTO `v9_log` VALUES('117','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:20:57');
INSERT INTO `v9_log` VALUES('118','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:21:19');
INSERT INTO `v9_log` VALUES('119','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 10:21:50');
INSERT INTO `v9_log` VALUES('120','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 10:23:42');
INSERT INTO `v9_log` VALUES('121','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:25:36');
INSERT INTO `v9_log` VALUES('122','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:25:40');
INSERT INTO `v9_log` VALUES('123','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:26:31');
INSERT INTO `v9_log` VALUES('124','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:26:33');
INSERT INTO `v9_log` VALUES('125','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:26:55');
INSERT INTO `v9_log` VALUES('126','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:26:57');
INSERT INTO `v9_log` VALUES('127','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:27:28');
INSERT INTO `v9_log` VALUES('128','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:28:57');
INSERT INTO `v9_log` VALUES('129','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:29:10');
INSERT INTO `v9_log` VALUES('130','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:29:28');
INSERT INTO `v9_log` VALUES('131','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:31:18');
INSERT INTO `v9_log` VALUES('132','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:32:33');
INSERT INTO `v9_log` VALUES('133','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:33:53');
INSERT INTO `v9_log` VALUES('134','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:33:54');
INSERT INTO `v9_log` VALUES('135','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:35:07');
INSERT INTO `v9_log` VALUES('136','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:36:45');
INSERT INTO `v9_log` VALUES('137','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:36:47');
INSERT INTO `v9_log` VALUES('138','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:36:49');
INSERT INTO `v9_log` VALUES('139','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:36:55');
INSERT INTO `v9_log` VALUES('140','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:37:44');
INSERT INTO `v9_log` VALUES('141','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:40:09');
INSERT INTO `v9_log` VALUES('142','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:41:10');
INSERT INTO `v9_log` VALUES('143','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:46:29');
INSERT INTO `v9_log` VALUES('144','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-05-25 10:46:30');
INSERT INTO `v9_log` VALUES('145','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:46:35');
INSERT INTO `v9_log` VALUES('146','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 10:46:47');
INSERT INTO `v9_log` VALUES('147','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:46:50');
INSERT INTO `v9_log` VALUES('148','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:48:10');
INSERT INTO `v9_log` VALUES('149','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:48:11');
INSERT INTO `v9_log` VALUES('150','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:48:31');
INSERT INTO `v9_log` VALUES('151','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:48:51');
INSERT INTO `v9_log` VALUES('152','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:49:33');
INSERT INTO `v9_log` VALUES('153','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:49:50');
INSERT INTO `v9_log` VALUES('154','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-05-25 10:50:04');
INSERT INTO `v9_log` VALUES('155','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:50:42');
INSERT INTO `v9_log` VALUES('156','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:52:37');
INSERT INTO `v9_log` VALUES('157','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:55:11');
INSERT INTO `v9_log` VALUES('158','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:55:41');
INSERT INTO `v9_log` VALUES('159','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:56:03');
INSERT INTO `v9_log` VALUES('160','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 10:56:20');
INSERT INTO `v9_log` VALUES('161','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:16:45');
INSERT INTO `v9_log` VALUES('162','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:40:44');
INSERT INTO `v9_log` VALUES('163','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:41:19');
INSERT INTO `v9_log` VALUES('164','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:21');
INSERT INTO `v9_log` VALUES('165','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:23');
INSERT INTO `v9_log` VALUES('166','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:24');
INSERT INTO `v9_log` VALUES('167','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:26');
INSERT INTO `v9_log` VALUES('168','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:28');
INSERT INTO `v9_log` VALUES('169','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:29');
INSERT INTO `v9_log` VALUES('170','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:30');
INSERT INTO `v9_log` VALUES('171','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:30');
INSERT INTO `v9_log` VALUES('172','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:32');
INSERT INTO `v9_log` VALUES('173','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:32');
INSERT INTO `v9_log` VALUES('174','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:33');
INSERT INTO `v9_log` VALUES('175','','0','content','','create_html','?m=content&c=create_html&a=category','','1','admin','127.0.0.1','2017-05-25 11:41:34');
INSERT INTO `v9_log` VALUES('176','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 11:41:34');
INSERT INTO `v9_log` VALUES('177','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 11:41:34');
INSERT INTO `v9_log` VALUES('178','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 11:41:35');
INSERT INTO `v9_log` VALUES('179','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 11:41:35');
INSERT INTO `v9_log` VALUES('180','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-05-25 11:41:36');
INSERT INTO `v9_log` VALUES('181','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:41:46');
INSERT INTO `v9_log` VALUES('182','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:45:00');
INSERT INTO `v9_log` VALUES('183','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:45:11');
INSERT INTO `v9_log` VALUES('184','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:45:19');
INSERT INTO `v9_log` VALUES('185','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:45:23');
INSERT INTO `v9_log` VALUES('186','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:45:29');
INSERT INTO `v9_log` VALUES('187','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:45:31');
INSERT INTO `v9_log` VALUES('188','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:45:37');
INSERT INTO `v9_log` VALUES('189','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:46:20');
INSERT INTO `v9_log` VALUES('190','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:47:26');
INSERT INTO `v9_log` VALUES('191','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:47:29');
INSERT INTO `v9_log` VALUES('192','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:47:32');
INSERT INTO `v9_log` VALUES('193','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:50:57');
INSERT INTO `v9_log` VALUES('194','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:51:50');
INSERT INTO `v9_log` VALUES('195','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:52:02');
INSERT INTO `v9_log` VALUES('196','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:52:16');
INSERT INTO `v9_log` VALUES('197','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:52:47');
INSERT INTO `v9_log` VALUES('198','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:53:11');
INSERT INTO `v9_log` VALUES('199','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:53:23');
INSERT INTO `v9_log` VALUES('200','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:53:37');
INSERT INTO `v9_log` VALUES('201','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:53:49');
INSERT INTO `v9_log` VALUES('202','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:56:22');
INSERT INTO `v9_log` VALUES('203','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:56:30');
INSERT INTO `v9_log` VALUES('204','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:56:36');
INSERT INTO `v9_log` VALUES('205','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 11:57:27');
INSERT INTO `v9_log` VALUES('206','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:03:20');
INSERT INTO `v9_log` VALUES('207','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:07:32');
INSERT INTO `v9_log` VALUES('208','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:08:02');
INSERT INTO `v9_log` VALUES('209','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:08:09');
INSERT INTO `v9_log` VALUES('210','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:08:15');
INSERT INTO `v9_log` VALUES('211','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:08:52');
INSERT INTO `v9_log` VALUES('212','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:11:16');
INSERT INTO `v9_log` VALUES('213','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:12:34');
INSERT INTO `v9_log` VALUES('214','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:12:37');
INSERT INTO `v9_log` VALUES('215','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:12:37');
INSERT INTO `v9_log` VALUES('216','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:12:42');
INSERT INTO `v9_log` VALUES('217','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:12:48');
INSERT INTO `v9_log` VALUES('218','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:12:51');
INSERT INTO `v9_log` VALUES('219','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:12:51');
INSERT INTO `v9_log` VALUES('220','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:13:00');
INSERT INTO `v9_log` VALUES('221','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:13:06');
INSERT INTO `v9_log` VALUES('222','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:13:10');
INSERT INTO `v9_log` VALUES('223','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:13:49');
INSERT INTO `v9_log` VALUES('224','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:14:30');
INSERT INTO `v9_log` VALUES('225','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:14:35');
INSERT INTO `v9_log` VALUES('226','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:14:36');
INSERT INTO `v9_log` VALUES('227','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:15:33');
INSERT INTO `v9_log` VALUES('228','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:15:50');
INSERT INTO `v9_log` VALUES('229','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:15:53');
INSERT INTO `v9_log` VALUES('230','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:18:13');
INSERT INTO `v9_log` VALUES('231','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:18:49');
INSERT INTO `v9_log` VALUES('232','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:19:06');
INSERT INTO `v9_log` VALUES('233','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:19:29');
INSERT INTO `v9_log` VALUES('234','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:20:24');
INSERT INTO `v9_log` VALUES('235','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:20:26');
INSERT INTO `v9_log` VALUES('236','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:20:28');
INSERT INTO `v9_log` VALUES('237','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:21:38');
INSERT INTO `v9_log` VALUES('238','','0','ticket','','index','?m=ticket&c=index&a=del','','1','admin','127.0.0.1','2017-05-25 12:21:45');
INSERT INTO `v9_log` VALUES('239','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:21:48');
INSERT INTO `v9_log` VALUES('240','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:22:21');
INSERT INTO `v9_log` VALUES('241','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:23:13');
INSERT INTO `v9_log` VALUES('242','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:23:31');
INSERT INTO `v9_log` VALUES('243','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:23:48');
INSERT INTO `v9_log` VALUES('244','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:24:54');
INSERT INTO `v9_log` VALUES('245','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:25:04');
INSERT INTO `v9_log` VALUES('246','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:25:09');
INSERT INTO `v9_log` VALUES('247','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:25:13');
INSERT INTO `v9_log` VALUES('248','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:25:21');
INSERT INTO `v9_log` VALUES('249','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:25:29');
INSERT INTO `v9_log` VALUES('250','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:28:21');
INSERT INTO `v9_log` VALUES('251','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:28:24');
INSERT INTO `v9_log` VALUES('252','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:28:29');
INSERT INTO `v9_log` VALUES('253','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:28:31');
INSERT INTO `v9_log` VALUES('254','','0','ticket','','index','?m=ticket&c=index&a=edit','','1','admin','127.0.0.1','2017-05-25 12:28:35');
INSERT INTO `v9_log` VALUES('255','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:28:37');
INSERT INTO `v9_log` VALUES('256','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:28:42');
INSERT INTO `v9_log` VALUES('257','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:29:48');
INSERT INTO `v9_log` VALUES('258','','0','ticket','','index','?m=ticket&c=index&a=del','','1','admin','127.0.0.1','2017-05-25 12:29:54');
INSERT INTO `v9_log` VALUES('259','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:29:57');
INSERT INTO `v9_log` VALUES('260','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:31:09');
INSERT INTO `v9_log` VALUES('261','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:31:15');
INSERT INTO `v9_log` VALUES('262','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:31:26');
INSERT INTO `v9_log` VALUES('263','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:32:16');
INSERT INTO `v9_log` VALUES('264','','0','ticket','','index','?m=ticket&c=index&a=add','','1','admin','127.0.0.1','2017-05-25 12:32:31');
INSERT INTO `v9_log` VALUES('265','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:32:34');
INSERT INTO `v9_log` VALUES('266','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:40:12');
INSERT INTO `v9_log` VALUES('267','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:40:16');
INSERT INTO `v9_log` VALUES('268','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:21');
INSERT INTO `v9_log` VALUES('269','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:26');
INSERT INTO `v9_log` VALUES('270','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:29');
INSERT INTO `v9_log` VALUES('271','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:36');
INSERT INTO `v9_log` VALUES('272','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:41');
INSERT INTO `v9_log` VALUES('273','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:48');
INSERT INTO `v9_log` VALUES('274','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:51');
INSERT INTO `v9_log` VALUES('275','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:56');
INSERT INTO `v9_log` VALUES('276','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:41:59');
INSERT INTO `v9_log` VALUES('277','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:42:03');
INSERT INTO `v9_log` VALUES('278','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:42:44');
INSERT INTO `v9_log` VALUES('279','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:46:10');
INSERT INTO `v9_log` VALUES('280','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:46:47');
INSERT INTO `v9_log` VALUES('281','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:48:09');
INSERT INTO `v9_log` VALUES('282','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:48:11');
INSERT INTO `v9_log` VALUES('283','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:51:41');
INSERT INTO `v9_log` VALUES('284','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:51:43');
INSERT INTO `v9_log` VALUES('285','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:52:04');
INSERT INTO `v9_log` VALUES('286','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:52:07');
INSERT INTO `v9_log` VALUES('287','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:53:56');
INSERT INTO `v9_log` VALUES('288','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:54:00');
INSERT INTO `v9_log` VALUES('289','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:54:02');
INSERT INTO `v9_log` VALUES('290','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:54:05');
INSERT INTO `v9_log` VALUES('291','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:54:42');
INSERT INTO `v9_log` VALUES('292','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:54:45');
INSERT INTO `v9_log` VALUES('293','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:54:50');
INSERT INTO `v9_log` VALUES('294','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:56:23');
INSERT INTO `v9_log` VALUES('295','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:56:43');
INSERT INTO `v9_log` VALUES('296','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:57:09');
INSERT INTO `v9_log` VALUES('297','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 12:57:13');
INSERT INTO `v9_log` VALUES('298','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 12:57:15');
INSERT INTO `v9_log` VALUES('299','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 13:00:23');
INSERT INTO `v9_log` VALUES('300','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 13:00:37');
INSERT INTO `v9_log` VALUES('301','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 13:04:18');
INSERT INTO `v9_log` VALUES('302','','0','ticket','','index','?m=ticket&c=index&a=export','','1','admin','127.0.0.1','2017-05-25 13:04:21');
INSERT INTO `v9_log` VALUES('303','','0','ticket','','index','?m=ticket&c=index&a=index','','1','admin','127.0.0.1','2017-05-25 13:04:26');
INSERT INTO `v9_log` VALUES('304','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-25 22:26:52');
INSERT INTO `v9_log` VALUES('305','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-25 22:27:35');
INSERT INTO `v9_log` VALUES('306','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-25 22:28:38');
INSERT INTO `v9_log` VALUES('307','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-25 22:28:45');
INSERT INTO `v9_log` VALUES('308','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-25 22:29:44');
INSERT INTO `v9_log` VALUES('309','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-25 22:30:14');
INSERT INTO `v9_log` VALUES('310','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-26 11:11:26');
INSERT INTO `v9_log` VALUES('311','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-26 11:11:33');
INSERT INTO `v9_log` VALUES('312','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','127.0.0.1','2017-05-26 11:11:44');
INSERT INTO `v9_log` VALUES('313','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-28 22:48:33');
INSERT INTO `v9_log` VALUES('314','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-05-28 22:48:41');
INSERT INTO `v9_log` VALUES('315','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-28 22:58:15');
INSERT INTO `v9_log` VALUES('316','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-28 22:58:20');
INSERT INTO `v9_log` VALUES('317','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-28 23:15:31');
INSERT INTO `v9_log` VALUES('318','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-28 23:15:36');
INSERT INTO `v9_log` VALUES('319','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-28 23:15:41');
INSERT INTO `v9_log` VALUES('320','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-28 23:16:01');
INSERT INTO `v9_log` VALUES('321','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-05-28 23:19:28');
INSERT INTO `v9_log` VALUES('322','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-06-02 16:41:01');
INSERT INTO `v9_log` VALUES('323','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-06-02 16:41:02');
INSERT INTO `v9_log` VALUES('324','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-06-02 16:41:05');
INSERT INTO `v9_log` VALUES('325','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-04 13:52:32');
INSERT INTO `v9_log` VALUES('326','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-04 13:52:40');
INSERT INTO `v9_log` VALUES('327','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','127.0.0.1','2017-06-04 13:54:07');
INSERT INTO `v9_log` VALUES('328','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-06-04 13:54:50');
INSERT INTO `v9_log` VALUES('329','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-14 11:09:24');
INSERT INTO `v9_log` VALUES('330','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-14 11:09:24');
INSERT INTO `v9_log` VALUES('331','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-14 11:18:16');
INSERT INTO `v9_log` VALUES('332','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-14 11:18:26');
INSERT INTO `v9_log` VALUES('333','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-16 18:24:27');
INSERT INTO `v9_log` VALUES('334','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-16 18:24:34');
INSERT INTO `v9_log` VALUES('335','','0','admin','','badword','?m=admin&c=badword&a=add','','1','admin','127.0.0.1','2017-06-16 18:25:09');
INSERT INTO `v9_log` VALUES('336','','0','admin','','badword','?m=admin&c=badword&a=add','','1','admin','127.0.0.1','2017-06-16 18:25:20');
INSERT INTO `v9_log` VALUES('337','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-22 13:05:07');
INSERT INTO `v9_log` VALUES('338','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-22 13:05:07');
INSERT INTO `v9_log` VALUES('339','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-22 13:05:15');
INSERT INTO `v9_log` VALUES('340','','0','admin','','linkage','?m=admin&c=linkage&a=edit','','1','admin','127.0.0.1','2017-06-22 13:05:35');
INSERT INTO `v9_log` VALUES('341','','0','admin','','linkage','?m=admin&c=linkage&a=edit','','1','admin','127.0.0.1','2017-06-22 13:07:55');
INSERT INTO `v9_log` VALUES('342','','0','admin','','linkage','?m=admin&c=linkage&a=edit','','1','admin','127.0.0.1','2017-06-22 13:08:02');
INSERT INTO `v9_log` VALUES('343','','0','admin','','linkage','?m=admin&c=linkage&a=edit','','1','admin','127.0.0.1','2017-06-22 13:47:50');
INSERT INTO `v9_log` VALUES('344','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-23 13:27:47');
INSERT INTO `v9_log` VALUES('345','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-26 14:45:04');
INSERT INTO `v9_log` VALUES('346','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-26 14:45:05');
INSERT INTO `v9_log` VALUES('347','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-06-26 14:45:14');
INSERT INTO `v9_log` VALUES('348','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-06-29 10:35:06');
INSERT INTO `v9_log` VALUES('349','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-06-29 10:35:06');
INSERT INTO `v9_log` VALUES('350','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-06-29 10:35:14');
INSERT INTO `v9_log` VALUES('351','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-07 09:55:22');
INSERT INTO `v9_log` VALUES('352','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-07 09:55:31');
INSERT INTO `v9_log` VALUES('353','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-08 08:50:58');
INSERT INTO `v9_log` VALUES('354','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-08 08:51:07');
INSERT INTO `v9_log` VALUES('355','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:11:59');
INSERT INTO `v9_log` VALUES('356','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:12:08');
INSERT INTO `v9_log` VALUES('357','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:12:28');
INSERT INTO `v9_log` VALUES('358','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:12:33');
INSERT INTO `v9_log` VALUES('359','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:13:12');
INSERT INTO `v9_log` VALUES('360','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:14:13');
INSERT INTO `v9_log` VALUES('361','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:14:22');
INSERT INTO `v9_log` VALUES('362','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:14:28');
INSERT INTO `v9_log` VALUES('363','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:14:33');
INSERT INTO `v9_log` VALUES('364','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:14:38');
INSERT INTO `v9_log` VALUES('365','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:14:46');
INSERT INTO `v9_log` VALUES('366','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-08 15:14:52');
INSERT INTO `v9_log` VALUES('367','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-08 19:52:40');
INSERT INTO `v9_log` VALUES('368','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-08 19:52:53');
INSERT INTO `v9_log` VALUES('369','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-08 19:52:56');
INSERT INTO `v9_log` VALUES('370','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-08 19:53:06');
INSERT INTO `v9_log` VALUES('371','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-08 19:53:20');
INSERT INTO `v9_log` VALUES('372','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-08 19:53:45');
INSERT INTO `v9_log` VALUES('373','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-08 19:54:02');
INSERT INTO `v9_log` VALUES('374','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-13 15:58:44');
INSERT INTO `v9_log` VALUES('375','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-13 15:58:44');
INSERT INTO `v9_log` VALUES('376','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-13 15:58:52');
INSERT INTO `v9_log` VALUES('377','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-13 15:59:25');
INSERT INTO `v9_log` VALUES('378','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-13 15:59:28');
INSERT INTO `v9_log` VALUES('379','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-22 10:59:58');
INSERT INTO `v9_log` VALUES('380','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-22 11:00:06');
INSERT INTO `v9_log` VALUES('381','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-22 11:00:06');
INSERT INTO `v9_log` VALUES('382','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-23 23:56:34');
INSERT INTO `v9_log` VALUES('383','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-24 00:00:37');
INSERT INTO `v9_log` VALUES('384','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','127.0.0.1','2017-07-24 00:00:50');
INSERT INTO `v9_log` VALUES('385','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','127.0.0.1','2017-07-24 00:01:13');
INSERT INTO `v9_log` VALUES('386','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-07-24 00:08:19');
INSERT INTO `v9_log` VALUES('387','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-07-24 00:08:31');
INSERT INTO `v9_log` VALUES('388','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:08:33');
INSERT INTO `v9_log` VALUES('389','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:08:33');
INSERT INTO `v9_log` VALUES('390','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:08:41');
INSERT INTO `v9_log` VALUES('391','','0','link','','link','?m=link&c=link&a=edit','','1','admin','127.0.0.1','2017-07-24 00:19:40');
INSERT INTO `v9_log` VALUES('392','','0','link','','link','?m=link&c=link&a=edit','','1','admin','127.0.0.1','2017-07-24 00:19:44');
INSERT INTO `v9_log` VALUES('393','','0','link','','link','?m=link&c=link&a=edit','','1','admin','127.0.0.1','2017-07-24 00:19:47');
INSERT INTO `v9_log` VALUES('394','','0','link','','link','?m=link&c=link&a=edit','','1','admin','127.0.0.1','2017-07-24 00:19:50');
INSERT INTO `v9_log` VALUES('395','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:21:02');
INSERT INTO `v9_log` VALUES('396','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:21:16');
INSERT INTO `v9_log` VALUES('397','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:21:53');
INSERT INTO `v9_log` VALUES('398','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:22:03');
INSERT INTO `v9_log` VALUES('399','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:23:44');
INSERT INTO `v9_log` VALUES('400','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:24:04');
INSERT INTO `v9_log` VALUES('401','','0','admin','','position','?m=admin&c=position&a=edit','','1','admin','127.0.0.1','2017-07-24 00:24:09');
INSERT INTO `v9_log` VALUES('402','','0','admin','','position','?m=admin&c=position&a=edit','','1','admin','127.0.0.1','2017-07-24 00:24:12');
INSERT INTO `v9_log` VALUES('403','','0','admin','','position','?m=admin&c=position&a=edit','','1','admin','127.0.0.1','2017-07-24 00:24:31');
INSERT INTO `v9_log` VALUES('404','','0','admin','','position','?m=admin&c=position&a=edit','','1','admin','127.0.0.1','2017-07-24 00:24:38');
INSERT INTO `v9_log` VALUES('405','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:24:43');
INSERT INTO `v9_log` VALUES('406','','0','admin','','position','?m=admin&c=position&a=add','','1','admin','127.0.0.1','2017-07-24 00:24:53');
INSERT INTO `v9_log` VALUES('407','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-07-24 00:27:32');
INSERT INTO `v9_log` VALUES('408','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-07-24 00:27:51');
INSERT INTO `v9_log` VALUES('409','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:27:53');
INSERT INTO `v9_log` VALUES('410','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:27:57');
INSERT INTO `v9_log` VALUES('411','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:28:26');
INSERT INTO `v9_log` VALUES('412','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:28:34');
INSERT INTO `v9_log` VALUES('413','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:28:37');
INSERT INTO `v9_log` VALUES('414','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:28:51');
INSERT INTO `v9_log` VALUES('415','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:28:54');
INSERT INTO `v9_log` VALUES('416','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:28:59');
INSERT INTO `v9_log` VALUES('417','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:29:00');
INSERT INTO `v9_log` VALUES('418','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-07-24 00:33:21');
INSERT INTO `v9_log` VALUES('419','','0','block','','block_admin','?m=block&c=block_admin&a=add','','1','admin','127.0.0.1','2017-07-24 00:33:43');
INSERT INTO `v9_log` VALUES('420','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:33:45');
INSERT INTO `v9_log` VALUES('421','','0','block','','block_admin','?m=block&c=block_admin&a=block_update','','1','admin','127.0.0.1','2017-07-24 00:34:29');
INSERT INTO `v9_log` VALUES('422','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-07-24 00:39:35');
INSERT INTO `v9_log` VALUES('423','','0','admin','','category','?m=admin&c=category&a=add','','1','admin','127.0.0.1','2017-07-24 00:41:05');
INSERT INTO `v9_log` VALUES('424','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:41:20');
INSERT INTO `v9_log` VALUES('425','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','admin','127.0.0.1','2017-07-24 00:41:39');
INSERT INTO `v9_log` VALUES('426','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:42:19');
INSERT INTO `v9_log` VALUES('427','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:44:29');
INSERT INTO `v9_log` VALUES('428','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:44:32');
INSERT INTO `v9_log` VALUES('429','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:46:39');
INSERT INTO `v9_log` VALUES('430','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 00:47:02');
INSERT INTO `v9_log` VALUES('431','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:49:25');
INSERT INTO `v9_log` VALUES('432','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:49:29');
INSERT INTO `v9_log` VALUES('433','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 00:50:59');
INSERT INTO `v9_log` VALUES('434','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 01:27:04');
INSERT INTO `v9_log` VALUES('435','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 01:27:55');
INSERT INTO `v9_log` VALUES('436','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 01:28:55');
INSERT INTO `v9_log` VALUES('437','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 01:29:33');
INSERT INTO `v9_log` VALUES('438','','0','poster','','space','?m=poster&c=space&a=add','','1','admin','127.0.0.1','2017-07-24 01:34:20');
INSERT INTO `v9_log` VALUES('439','','0','poster','','space','?m=poster&c=space&a=add','','1','admin','127.0.0.1','2017-07-24 01:34:56');
INSERT INTO `v9_log` VALUES('440','','0','poster','','poster','?m=poster&c=poster&a=add','','1','admin','127.0.0.1','2017-07-24 01:34:59');
INSERT INTO `v9_log` VALUES('441','','0','poster','','poster','?m=poster&c=poster&a=add','','1','admin','127.0.0.1','2017-07-24 01:35:11');
INSERT INTO `v9_log` VALUES('442','','0','poster','','space','?m=poster&c=space&a=create_js','','1','admin','127.0.0.1','2017-07-24 01:35:22');
INSERT INTO `v9_log` VALUES('443','','0','admin','','position','?m=admin&c=position&a=edit','','1','admin','127.0.0.1','2017-07-24 01:49:05');
INSERT INTO `v9_log` VALUES('444','','0','admin','','position','?m=admin&c=position&a=edit','','1','admin','127.0.0.1','2017-07-24 01:49:08');
INSERT INTO `v9_log` VALUES('445','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 07:28:38');
INSERT INTO `v9_log` VALUES('446','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 07:28:45');
INSERT INTO `v9_log` VALUES('447','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 07:28:50');
INSERT INTO `v9_log` VALUES('448','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 07:28:53');
INSERT INTO `v9_log` VALUES('449','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 07:28:56');
INSERT INTO `v9_log` VALUES('450','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 07:29:01');
INSERT INTO `v9_log` VALUES('451','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 07:29:04');
INSERT INTO `v9_log` VALUES('452','','0','content','','sitemodel_field','?m=content&c=sitemodel_field&a=disabled','','1','admin','127.0.0.1','2017-07-24 07:32:19');
INSERT INTO `v9_log` VALUES('453','','0','content','','content','?m=content&c=content&a=add','','1','admin','127.0.0.1','2017-07-24 07:32:42');
INSERT INTO `v9_log` VALUES('454','','0','content','','content','?m=content&c=content&a=edit','','1','admin','127.0.0.1','2017-07-24 08:02:58');
INSERT INTO `v9_log` VALUES('455','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','127.0.0.1','2017-07-24 08:35:37');
INSERT INTO `v9_log` VALUES('456','','0','admin','','site','?m=admin&c=site&a=edit','','1','admin','127.0.0.1','2017-07-24 08:35:46');
INSERT INTO `v9_log` VALUES('457','','0','admin','','index','?m=admin&c=index&a=login','','0','','121.58.217.54','2017-07-24 12:07:49');
INSERT INTO `v9_log` VALUES('458','','0','admin','','index','?m=admin&c=index&a=login','','0','','121.58.217.54','2017-07-24 12:08:13');
INSERT INTO `v9_log` VALUES('459','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','121.58.217.54','2017-07-24 12:09:31');
INSERT INTO `v9_log` VALUES('460','','0','collection','','node','?m=collection&c=node&a=add','','1','admin','121.58.217.54','2017-07-24 12:09:37');
INSERT INTO `v9_log` VALUES('461','','0','wap','','wap_admin','?m=wap&c=wap_admin&a=edit','','1','admin','121.58.217.54','2017-07-24 14:15:16');
INSERT INTO `v9_log` VALUES('462','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','121.58.217.54','2017-07-24 14:23:33');
INSERT INTO `v9_log` VALUES('463','','0','wap','','wap_admin','?m=wap&c=wap_admin&a=type_manage','','1','admin','121.58.217.54','2017-07-24 14:26:53');
INSERT INTO `v9_log` VALUES('464','','0','wap','','wap_admin','?m=wap&c=wap_admin&a=edit','','1','admin','121.58.217.54','2017-07-24 14:27:01');
INSERT INTO `v9_log` VALUES('465','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','121.58.217.54','2017-07-24 15:43:31');
INSERT INTO `v9_log` VALUES('466','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-25 10:08:53');
INSERT INTO `v9_log` VALUES('467','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-25 10:08:53');
INSERT INTO `v9_log` VALUES('468','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-25 10:09:00');
INSERT INTO `v9_log` VALUES('469','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','121.58.217.54','2017-07-25 11:59:38');
INSERT INTO `v9_log` VALUES('470','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','121.58.217.54','2017-07-25 12:00:21');
INSERT INTO `v9_log` VALUES('471','','0','comment','','check','?m=comment&c=check&a=checks','','1','admin','121.58.217.54','2017-07-25 12:00:29');
INSERT INTO `v9_log` VALUES('472','','0','comment','','comment_admin','?m=comment&c=comment_admin&a=listinfo','','1','admin','121.58.217.54','2017-07-25 12:03:57');
INSERT INTO `v9_log` VALUES('473','','0','comment','','check','?m=comment&c=check&a=checks','','1','admin','121.58.217.54','2017-07-25 12:04:08');
INSERT INTO `v9_log` VALUES('474','','0','admin','','release_point','?m=admin&c=release_point&a=add','','1','admin','121.58.217.54','2017-07-25 12:10:13');
INSERT INTO `v9_log` VALUES('475','','0','collection','','node','?m=collection&c=node&a=manage','','1','admin','121.58.217.54','2017-07-25 12:10:45');
INSERT INTO `v9_log` VALUES('476','','0','collection','','node','?m=collection&c=node&a=add','','1','admin','121.58.217.54','2017-07-25 12:10:49');
INSERT INTO `v9_log` VALUES('477','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-25 17:26:20');
INSERT INTO `v9_log` VALUES('478','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-25 17:26:20');
INSERT INTO `v9_log` VALUES('479','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-25 17:26:28');
INSERT INTO `v9_log` VALUES('480','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2017-07-25 17:26:42');
INSERT INTO `v9_log` VALUES('481','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2017-07-25 17:26:44');
INSERT INTO `v9_log` VALUES('482','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2017-07-25 17:26:48');
INSERT INTO `v9_log` VALUES('483','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2017-07-25 17:27:29');
INSERT INTO `v9_log` VALUES('484','','0','admin','','database','?m=admin&c=database&a=import','','1','admin','127.0.0.1','2017-07-25 17:27:32');
INSERT INTO `v9_log` VALUES('485','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-31 10:45:11');
INSERT INTO `v9_log` VALUES('486','','0','admin','','index','?m=admin&c=index&a=login','','0','admin','127.0.0.1','2017-07-31 10:45:23');
INSERT INTO `v9_log` VALUES('487','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:45:45');
INSERT INTO `v9_log` VALUES('488','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:45:59');
INSERT INTO `v9_log` VALUES('489','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:49:06');
INSERT INTO `v9_log` VALUES('490','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:49:15');
INSERT INTO `v9_log` VALUES('491','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:49:31');
INSERT INTO `v9_log` VALUES('492','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:49:39');
INSERT INTO `v9_log` VALUES('493','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:49:44');
INSERT INTO `v9_log` VALUES('494','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:49:51');
INSERT INTO `v9_log` VALUES('495','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:49:56');
INSERT INTO `v9_log` VALUES('496','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:50:04');
INSERT INTO `v9_log` VALUES('497','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:50:17');
INSERT INTO `v9_log` VALUES('498','','0','admin','','category','?m=admin&c=category&a=edit','','1','admin','127.0.0.1','2017-07-31 10:50:26');
INSERT INTO `v9_log` VALUES('499','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:43');
INSERT INTO `v9_log` VALUES('500','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:44');
INSERT INTO `v9_log` VALUES('501','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:45');
INSERT INTO `v9_log` VALUES('502','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:46');
INSERT INTO `v9_log` VALUES('503','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:48');
INSERT INTO `v9_log` VALUES('504','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:50');
INSERT INTO `v9_log` VALUES('505','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:51');
INSERT INTO `v9_log` VALUES('506','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:52');
INSERT INTO `v9_log` VALUES('507','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:54');
INSERT INTO `v9_log` VALUES('508','','0','content','','create_html','?m=content&c=create_html&a=update_urls','','1','admin','127.0.0.1','2017-07-31 10:50:56');
INSERT INTO `v9_log` VALUES('509','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-31 11:18:28');
INSERT INTO `v9_log` VALUES('510','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-31 11:18:43');
INSERT INTO `v9_log` VALUES('511','','0','admin','','index','?m=admin&c=index&a=login','','0','','127.0.0.1','2017-07-31 11:18:51');
INSERT INTO `v9_log` VALUES('512','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2017-07-31 11:27:54');
INSERT INTO `v9_log` VALUES('513','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2017-07-31 11:27:57');
INSERT INTO `v9_log` VALUES('514','','0','admin','','database','?m=admin&c=database&a=export','','1','admin','127.0.0.1','2017-07-31 11:28:01');

DROP TABLE IF EXISTS `v9_member`;
CREATE TABLE `v9_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_detail`;
CREATE TABLE `v9_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_group`;
CREATE TABLE `v9_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

INSERT INTO `v9_member_group` VALUES('8','游客','1','0','0','0','0','0','0','1','0','0','0','0','0.00','0.00','0.00','','','','0','0');
INSERT INTO `v9_member_group` VALUES('2','新手上路','1','1','50','100','1','1','0','0','0','1','0','0','50.00','10.00','1.00','','','','2','0');
INSERT INTO `v9_member_group` VALUES('6','注册会员','1','2','100','150','0','1','0','0','1','1','0','0','300.00','30.00','1.00','','','','6','0');
INSERT INTO `v9_member_group` VALUES('4','中级会员','1','3','150','500','1','1','0','1','1','1','0','0','500.00','60.00','1.00','','','','4','0');
INSERT INTO `v9_member_group` VALUES('5','高级会员','1','5','300','999','1','1','0','1','1','1','0','0','360.00','90.00','5.00','','','','5','0');
INSERT INTO `v9_member_group` VALUES('1','禁止访问','1','0','0','0','1','1','0','1','0','0','0','0','0.00','0.00','0.00','','','0','0','0');
INSERT INTO `v9_member_group` VALUES('7','邮件认证','1','0','0','0','0','0','0','0','0','0','0','0','0.00','0.00','0.00','images/group/vip.jpg','#000000','','7','0');

DROP TABLE IF EXISTS `v9_member_menu`;
CREATE TABLE `v9_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `v9_member_menu` VALUES('1','member_init','0','member','index','init','t=0','0','1','','');
INSERT INTO `v9_member_menu` VALUES('2','account_manage','0','member','index','account_manage','t=1','0','1','','');
INSERT INTO `v9_member_menu` VALUES('3','favorite','0','member','index','favorite','t=2','0','1','','');

DROP TABLE IF EXISTS `v9_member_verify`;
CREATE TABLE `v9_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_member_vip`;
CREATE TABLE `v9_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_menu`;
CREATE TABLE `v9_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1669 DEFAULT CHARSET=utf8;

INSERT INTO `v9_menu` VALUES('1','sys_setting','0','admin','setting','init','','1','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('2','module','0','admin','module','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('872','sync_release_point','873','release','index','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('4','content','0','content','content','init','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('5','members','0','member','member','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('6','userinterface','0','template','style','init','','6','0','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('30','correlative_setting','1','admin','admin','admin','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('31','menu_manage','977','admin','menu','init','','8','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('32','posid_manage','975','admin','position','init','','7','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('29','module_list','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('82','module_manage','2','admin','module','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('10','panel','0','admin','index','public_main','','0','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('35','menu_add','31','admin','menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('826','template_manager','6','','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('54','admin_manage','49','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('43','category_manage','975','admin','category','init','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('42','add_category','43','admin','category','add','s=0','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('44','edit_category','43','admin','category','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('45','badword_manage','977','admin','badword','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('46','posid_add','32','admin','position','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('49','admin_setting','1','admin','','','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('50','role_manage','49','admin','role','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('51','role_add','50','admin','role','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('52','category_cache','43','admin','category','public_cache','module=admin','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('55','manage_member','5','member','member','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('58','admin_add','54','admin','admin_manage','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('59','model_manage','975','content','sitemodel','init','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('64','site_management','30','admin','site','init','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('81','member_add','72','member','member','add','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('62','add_model','59','content','sitemodel','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('65','release_point_management','30','admin','release_point','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('66','badword_export','45','admin','badword','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('67','add_site','64','admin','site','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('68','badword_import','45','admin','badword','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('812','member_group_manage','76','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('74','member_verify','55','member','member_verify','manage','s=0','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('76','manage_member_group','5','member','member_group','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('77','manage_member_model','5','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('78','member_group_add','812','member','member_group','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('79','member_model_add','813','member','member_model','add','','1','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('80','member_model_import','77','member','member_model','import','','2','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('72','member_manage','55','member','member','manage','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('813','member_model_manage','77','member','member_model','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('814','site_edit','64','admin','site','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('815','site_del','64','admin','site','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('816','release_point_add','65','admin','release_point','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('817','release_point_del','65','admin','release_point','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('818','release_point_edit','65','admin','release_point','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('821','content_publish','4','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('822','content_manage','821','content','content','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('867','linkage','977','admin','linkage','init','','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('827','template_style','826','template','style','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('828','import_style','827','template','style','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('831','template_export','827','template','style','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('830','template_file','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('832','template_onoff','827','template','style','disable','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('833','template_updatename','827','template','style','updatename','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('834','member_lock','72','member','member','lock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('835','member_unlock','72','member','member','unlock','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('836','member_move','72','member','member','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('837','member_delete','72','member','member','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('842','verify_ignore','74','member','member_verify','manage','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('839','member_setting','55','member','member_setting','manage','','4','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('841','verify_pass','74','member','member_verify','manage','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('843','verify_delete','74','member','member_verify','manage','s=3','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('844','verify_deny','74','member','member_verify','manage','s=4','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('845','never_pass','74','member','member_verify','manage','s=5','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('846','template_file_list','827','template','file','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('847','template_file_edit','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('848','file_add_file','827','template','file','add_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('850','listorder','76','member','member_group','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('852','priv_setting','50','admin','role','priv_setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('853','role_priv','50','admin','role','role_priv','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('857','attachment_manage','821','attachment','manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('868','special','821','special','special','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('869','template_editor','827','template','file','edit_file','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('870','template_visualization','827','template','file','visualization','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('871','pc_tag_edit','827','template','file','edit_pc_tag','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('873','release_manage','4','release','html','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('874','type_manage','975','content','type_manage','init','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('875','add_type','874','content','type_manage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('876','linkageadd','867','admin','linkage','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('877','failure_list','872','release','index','failed','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('879','member_search','72','member','member','search','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('880','queue_del','872','release','index','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('881','member_model_delete','813','member','member_model','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('882','member_model_edit','813','member','member_model','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('885','workflow','977','content','workflow','init','','15','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('888','add_workflow','885','content','workflow','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('889','member_modelfield_add','813','member','member_modelfield','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('890','member_modelfield_edit','813','member','member_modelfield','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('891','member_modelfield_delete','813','member','member_modelfield','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('892','member_modelfield_manage','813','member','member_modelfield','manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('895','sitemodel_import','59','content','sitemodel','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('896','pay','29','pay','payment','pay_list','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('897','payments','896','pay','payment','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('898','paylist','896','pay','payment','pay_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('899','add_content','822','content','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('900','modify_deposit','896','pay','payment','modify_deposit','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('901','check_content','822','content','content','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('902','dbsource','29','dbsource','data','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('905','create_content_html','873','content','create_html','show','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('904','external_data_sources','902','dbsource','dbsource_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('906','update_urls','873','content','create_html','update_urls','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('960','node_add','957','collection','node','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('909','fulltext_search','29','search','search_type','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('910','manage_type','909','search','search_type','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('911','search_setting','909','search','search_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('912','createindex','909','search','search_admin','createindex','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('913','add_search_type','909','search','search_type','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('914','database_toos','977','admin','database','export','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('915','database_export','914','admin','database','export','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('916','database_import','914','admin','database','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('917','dbsource_add','902','dbsource','dbsource_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('918','dbsource_edit','902','dbsource','dbsource_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('919','dbsource_del','902','dbsource','dbsource_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('920','dbsource_data_add','902','dbsource','data','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('921','dbsource_data_edit','902','dbsource','data','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('922','dbsource_data_del','902','dbsource','data','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('926','add_special','868','special','special','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('927','edit_special','868','special','special','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('928','special_list','868','special','special','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('929','special_elite','868','special','special','elite','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('930','delete_special','868','special','special','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('931','badword_add','45','admin','badword','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('932','badword_edit','45','admin','badword','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('933','badword_delete','45','admin','badword','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('934','special_listorder','868','special','special','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('935','special_content_list','868','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('936','special_content_add','935','special','content','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('937','special_content_list','935','special','content','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('938','special_content_edit','935','special','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('939','special_content_delete','935','special','content','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('940','special_content_listorder','935','special','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('941','special_content_import','935','special','special','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('942','history_version','827','template','template_bak','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('943','restore_version','827','template','template_bak','restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('944','del_history_version','827','template','template_bak','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('945','block','821','block','block_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('946','block_add','945','block','block_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('950','block_edit','945','block','block_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('951','block_del','945','block','block_admin','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('952','block_update','945','block','block_admin','block_update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('953','block_restore','945','block','block_admin','history_restore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('954','history_del','945','block','block_admin','history_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('978','urlrule_manage','977','admin','urlrule','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('957','collection_node','821','collection','node','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('979','safe_config','30','admin','setting','init','&tab=2','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('959','basic_config','30','admin','setting','init','','10','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('961','position_edit','32','admin','position','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('962','collection_node_edit','957','collection','node','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('963','collection_node_delete','957','collection','node','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('990','col_url_list','957','collection','node','col_url_list','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('965','collection_node_publish','957','collection','node','publist','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('966','collection_node_import','957','collection','node','node_import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('967','collection_node_export','957','collection','node','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('968','collection_node_collection_content','957','collection','node','col_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('969','googlesitemap','977','admin','googlesitemap','set','','11','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('970','admininfo','10','admin','admin_manage','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('971','editpwd','970','admin','admin_manage','public_edit_pwd','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('972','editinfo','970','admin','admin_manage','public_edit_info','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('973','keylink','977','admin','keylink','init','','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('974','add_keylink','973','admin','keylink','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('975','content_settings','4','content','content_settings','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('7','extend','0','admin','extend','init_extend','','7','1','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('977','extend_all','7','admin','extend_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('980','sso_config','30','admin','setting','init','&tab=3','12','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('981','email_config','30','admin','setting','init','&tab=4','13','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('982','module_manage','82','admin','module','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('983','ipbanned','977','admin','ipbanned','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('984','add_ipbanned','983','admin','ipbanned','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('993','collection_content_import','957','collection','node','import','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('991','copy_node','957','collection','node','copy','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('992','content_del','957','collection','node','content_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('989','downsites','977','admin','downservers','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('994','import_program_add','957','collection','node','import_program_add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('995','import_program_del','957','collection','node','import_program_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('996','import_content','957','collection','node','import_content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('997','log','977','admin','log','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('998','add_page','43','admin','category','add','s=1','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('999','add_cat_link','43','admin','category','add','s=2','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1000','count_items','43','admin','category','count_items','','5','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1001','cache_all','977','admin','cache_all','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1002','create_list_html','873','content','create_html','category','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1003','create_html_quick','10','content','create_html_opt','index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1004','create_index','1003','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1005','scan','977','scan','index','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1006','scan_report','1005','scan','index','scan_report','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1007','md5_creat','1005','scan','index','md5_creat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1008','album_import','868','special','album','import','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('8','phpsso','0','admin','phpsso','menu','','7','0','0','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1011','edit_content','822','content','content','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1012','push_to_special','822','content','push','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1023','delete_log','997','admin','log','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1024','delete_ip','983','admin','ipbanned','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1026','delete_keylink','973','admin','keylink','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1027','edit_keylink','973','admin','keylink','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1034','operation_pass','74','member','member_verify','pass','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1035','operation_delete','74','member','member_verify','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1039','operation_ignore','74','member','member_verify','ignore','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1038','settingsave','30','admin','setting','save','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1040','admin_edit','54','admin','admin_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1041','operation_reject','74','member','member_verify','reject','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1042','admin_delete','54','admin','admin_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1043','card','54','admin','admin_manage','card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1044','creat_card','54','admin','admin_manage','creat_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1045','remove_card','54','admin','admin_manage','remove_card','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1049','member_group_edit','812','member','member_group','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1048','member_edit','72','member','member','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1050','role_edit','50','admin','role','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1051','member_group_delete','812','member','member_group','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1052','member_manage','50','admin','role','member_manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1053','role_delete','50','admin','role','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1054','member_model_export','77','member','member_model','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1055','member_model_sort','77','member','member_model','sort','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1056','member_model_move','77','member','member_model','move','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1057','payment_add','897','pay','payment','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1058','payment_delete','897','pay','payment','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1059','payment_edit','897','pay','payment','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1060','spend_record','896','pay','spend','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1061','pay_stat','896','pay','payment','pay_stat','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1062','fields_manage','59','content','sitemodel_field','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1063','edit_model_content','59','content','sitemodel','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1064','disabled_model','59','content','sitemodel','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1065','delete_model','59','content','sitemodel','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1066','export_model','59','content','sitemodel','export','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1067','delete','874','content','type_manage','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1068','edit','874','content','type_manage','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1069','add_urlrule','978','admin','urlrule','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1070','edit_urlrule','978','admin','urlrule','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1071','delete_urlrule','978','admin','urlrule','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1072','edit_menu','31','admin','menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1073','delete_menu','31','admin','menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1074','edit_workflow','885','content','workflow','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1075','delete_workflow','885','content','workflow','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1076','creat_html','868','special','special','html','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1093','connect_config','30','admin','setting','init','&tab=5','14','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1102','view_modelinfo','74','member','member_verify','modelinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1202','create_special_list','868','special','special','create_special_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1240','view_memberlinfo','72','member','member','memberinfo','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1239','copyfrom_manage','977','admin','copyfrom','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1241','move_content','822','content','content','remove','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1242','poster_template','56','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1243','create_index','873','content','create_html','public_index','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1244','add_othors','822','content','content','add_othors','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1295','attachment_manager_dir','857','attachment','manage','dir','','2','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1296','attachment_manager_db','857','attachment','manage','init','','1','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1346','attachment_address_replace','857','attachment','address','init','','3','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1347','attachment_address_update','857','attachment','address','update','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1348','delete_content','822','content','content','delete','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1349','member_menu_manage','977','member','member_menu','manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1350','member_menu_add','1349','member','member_menu','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1351','member_menu_edit','1349','member','member_menu','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1352','member_menu_delete','1349','member','member_menu','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1353','batch_show','822','content','create_html','batch_show','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1354','pay_delete','898','pay','payment','pay_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1355','pay_cancel','898','pay','payment','pay_cancel','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1356','discount','898','pay','payment','discount','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1360','category_batch_edit','43','admin','category','batch_edit','','6','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1500','listorder','822','content','content','listorder','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1501','a_clean_data','873','content','content','clear_data','','0','1','0','0','0','0','0');
INSERT INTO `v9_menu` VALUES('9','video','0','video','video','init','','11','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1589','video','9','video','video','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1583','sub_delete','1589','video','video','sub_del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1582','subscribe_manage','1589','video','video','subscribe_list','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1581','video_open','1589','video','video','open','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1592','complete_info','1581','video','video','complete_info','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1591','video_inputinfo','1581','video','video','open','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1577','video_manage','1589','video','video','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1590','player_manage','1589','video','player','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1585','import_ku6_video','1589','video','video','import_ku6video','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1579','video_edit','1589','video','video','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1580','video_delete','1589','video','video','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1578','video_upload','1589','video','video','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1593','video_stat','1589','video','stat','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1586','video_store','1589','video','video','video2content','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1594','announce','29','announce','admin_announce','init','s=1','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1595','announce_add','1594','announce','admin_announce','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1596','edit_announce','1594','announce','admin_announce','edit','s=1','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1597','check_announce','1594','announce','admin_announce','init','s=2','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1598','overdue','1594','announce','admin_announce','init','s=3','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1599','del_announce','1594','announce','admin_announce','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1600','comment','29','comment','comment_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1601','comment_manage','821','comment','comment_admin','listinfo','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1602','comment_check','1601','comment','check','checks','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1603','comment_list','1600','comment','comment_admin','lists','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1604','link','29','link','link','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1605','add_link','1604','link','link','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1606','edit_link','1604','link','link','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1607','delete_link','1604','link','link','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1608','link_setting','1604','link','link','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1609','add_type','1604','link','link','add_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1610','list_type','1604','link','link','list_type','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1611','check_register','1604','link','link','check_register','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1612','vote','29','vote','vote','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1613','add_vote','1612','vote','vote','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1614','edit_vote','1612','vote','vote','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1615','delete_vote','1612','vote','vote','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1616','vote_setting','1612','vote','vote','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1617','statistics_vote','1612','vote','vote','statistics','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1618','statistics_userlist','1612','vote','vote','statistics_userlist','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1619','create_js','1612','vote','vote','create_js','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1620','message','29','message','message','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1621','send_one','1620','message','message','send_one','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1622','delete_message','1620','message','message','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1623','message_send','1620','message','message','message_send','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1624','message_group_manage','1620','message','message','message_group_manage','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1625','mood','29','mood','mood_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1626','mood_setting','1625','mood','mood_admin','setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1627','poster','29','poster','space','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1628','add_space','1627','poster','space','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1629','edit_space','1627','poster','space','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1630','del_space','1627','poster','space','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1631','poster_list','1627','poster','poster','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1632','add_poster','1627','poster','poster','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1633','edit_poster','1627','poster','poster','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1634','del_poster','1627','poster','poster','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1635','poster_stat','1627','poster','poster','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1636','poster_setting','1627','poster','space','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1637','create_poster_js','1627','poster','space','create_js','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1638','poster_template','1627','poster','space','poster_template','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1639','formguide','29','formguide','formguide','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1640','formguide_add','1639','formguide','formguide','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1641','formguide_edit','1639','formguide','formguide','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1642','form_info_list','1639','formguide','formguide_info','init','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1643','formguide_disabled','1639','formguide','formguide','disabled','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1644','formguide_delete','1639','formguide','formguide','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1645','formguide_stat','1639','formguide','formguide','stat','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1646','add_public_field','1639','formguide','formguide_field','add','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1647','list_public_field','1639','formguide','formguide_field','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1648','module_setting','1639','formguide','formguide','setting','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1649','wap','29','wap','wap_admin','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1650','wap_add','1649','wap','wap_admin','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1651','wap_edit','1649','wap','wap_admin','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1652','wap_delete','1649','wap','wap_admin','delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1653','wap_type_manage','1649','wap','wap_admin','type_manage','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1654','wap_type_edit','1649','wap','wap_admin','type_edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1655','wap_type_delete','1649','wap','wap_admin','type_delete','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1656','upgrade','977','upgrade','index','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1657','checkfile','1656','upgrade','index','checkfile','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1658','tag','826','tag','tag','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1659','add_tag','1658','tag','tag','add','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1660','edit_tag','1658','tag','tag','edit','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1661','delete_tag','1658','tag','tag','del','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1662','tag_lists','1658','tag','tag','lists','','0','0','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1663','sms','29','sms','sms','init','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1664','sms_setting','1663','sms','sms','sms_setting','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1665','sms_pay_history','1663','sms','sms','sms_pay_history','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1666','sms_buy_history','1663','sms','sms','sms_buy_history','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1667','sms_api','1663','sms','sms','sms_api','','0','1','1','1','1','1','1');
INSERT INTO `v9_menu` VALUES('1668','sms_sent','1663','sms','sms','sms_sent','','0','1','1','1','1','1','1');

DROP TABLE IF EXISTS `v9_message`;
CREATE TABLE `v9_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_message_data`;
CREATE TABLE `v9_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_message_group`;
CREATE TABLE `v9_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_model`;
CREATE TABLE `v9_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

INSERT INTO `v9_model` VALUES('1','1','文章模型','','news','','0','0','1','0','default','category','list','show','','','','','0','0');
INSERT INTO `v9_model` VALUES('2','1','下载模型','','download','','0','0','1','0','default','category_download','list_download','show_download','','','','','0','0');
INSERT INTO `v9_model` VALUES('3','1','图片模型','','picture','','0','0','1','0','default','category_picture','list_picture','show_picture','','','','','0','0');
INSERT INTO `v9_model` VALUES('10','1','普通会员','普通会员','member_detail','','0','0','1','0','','','','','','','','','0','2');
INSERT INTO `v9_model` VALUES('11','1','视频模型','','video','','0','0','1','0','default','category_video','list_video','show_video','','','','','0','0');

DROP TABLE IF EXISTS `v9_model_field`;
CREATE TABLE `v9_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

INSERT INTO `v9_model_field` VALUES('1','1','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('2','1','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('3','1','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('4','1','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('5','1','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('6','1','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('7','1','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('8','1','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('9','1','1','voteid','添加投票','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"选择已有投票\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'选择已有投票\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"新增投票\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'添加投票\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)','','','','0','0','0','1','0','0','1','0','21','0','0');
INSERT INTO `v9_model_field` VALUES('10','1','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('11','1','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('12','1','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('13','1','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('14','1','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('15','1','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('16','1','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('17','1','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('18','1','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('19','1','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('20','1','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('21','1','1','copyfrom','来源','','','0','100','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('80','1','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('22','2','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('23','2','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','1','0');
INSERT INTO `v9_model_field` VALUES('24','2','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('25','2','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('26','2','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('27','2','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('28','2','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','1','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('29','2','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('30','2','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('31','2','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `v9_model_field` VALUES('32','2','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('33','2','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('34','2','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('35','2','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('36','2','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('37','2','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('38','2','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('39','2','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('40','2','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('41','2','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('42','2','1','downfiles','本地下载','','','0','0','','','downfiles','array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('43','2','1','downfile','镜像下载','','','0','0','','','downfile','array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)','','','','0','0','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('44','2','1','systems','软件平台','<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>','','0','100','','','text','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','1','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('45','2','1','copytype','软件授权形式','','','0','15','','','box','array (\n  \'options\' => \'免费版|免费版\r\n共享版|共享版\r\n试用版|试用版\r\n演示版|演示版\r\n注册版|注册版\r\n破解版|破解版\r\n零售版|零售版\r\nOEM版|OEM版\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'免费版\',\n)','','','','0','1','0','1','0','1','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('46','2','1','language','软件语言','','','0','16','','','box','array (\n  \'options\' => \'英文|英文\r\n简体中文|简体中文\r\n繁体中文|繁体中文\r\n简繁中文|简繁中文\r\n多国语言|多国语言\r\n其他语言|其他语言\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'简体中文\',\n)','','','','0','1','0','1','0','1','0','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('47','2','1','classtype','软件类型','','','0','20','','','box','array (\n  \'options\' => \'国产软件|国产软件\r\n国外软件|国外软件\r\n汉化补丁|汉化补丁\r\n程序源码|程序源码\r\n其他|其他\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'国产软件\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('48','2','1','version','版本号','','','0','20','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('49','2','1','filesize','文件大小','','','0','10','','','text','array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'未知\',\n  \'ispassword\' => \'0\',\n)','','','','0','1','0','0','0','1','1','0','14','0','0');
INSERT INTO `v9_model_field` VALUES('50','2','1','stars','评分等级','','','0','20','','','box','array (\n  \'options\' => \'★☆☆☆☆|★☆☆☆☆\r\n★★☆☆☆|★★☆☆☆\r\n★★★☆☆|★★★☆☆\r\n★★★★☆|★★★★☆\r\n★★★★★|★★★★★\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'★★★☆☆\',\n)','','','','0','1','0','1','0','1','0','0','17','0','0');
INSERT INTO `v9_model_field` VALUES('51','3','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('52','3','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('53','3','1','url','URL','','','0','100','','','text','','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('54','3','1','listorder','排序','','','0','6','','','number','','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('55','3','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('56','3','1','groupids_view','阅读权限','','','0','0','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('57','3','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('58','3','1','pages','分页方式','','','0','0','','','pages','','','-99','-99','0','0','0','1','0','0','0','0','16','1','0');
INSERT INTO `v9_model_field` VALUES('59','3','1','relation','相关组图','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('60','3','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('61','3','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)','','','','0','0','0','1','0','1','1','0','13','1','0');
INSERT INTO `v9_model_field` VALUES('62','3','1','updatetime','更新时间','','','0','0','','','datetime','array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('63','3','1','description','摘要','','','0','255','','','textarea','array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('64','3','1','title','标题','','inputtitle','1','80','','请输入标题','title','','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('65','3','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('66','3','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('67','3','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('68','3','1','status','状态','','','0','2','','','box','','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('69','3','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('70','3','1','username','用户名','','','0','20','','','text','','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('71','3','1','pictureurls','组图','','','0','0','','','images','array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)','','','','0','0','0','1','0','1','0','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('72','3','1','copyfrom','来源','','','0','0','','','copyfrom','array (\n  \'defaultvalue\' => \'\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('73','1','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('74','2','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('75','3','1','islink','转向链接','','','0','0','','','islink','','','','','0','1','0','0','0','1','0','0','30','0','0');
INSERT INTO `v9_model_field` VALUES('83','10','1','birthday','生日','','','0','0','','生日格式错误','datetime','array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)','','','','0','0','0','0','0','1','1','0','0','0','0');
INSERT INTO `v9_model_field` VALUES('84','11','1','catid','栏目','','','1','6','/^[0-9]{1,6}$/','请选择栏目','catid','array (\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','0','0','1','0','0');
INSERT INTO `v9_model_field` VALUES('85','11','1','typeid','类别','','','0','0','','','typeid','array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','','','0','1','0','1','1','1','0','0','2','0','0');
INSERT INTO `v9_model_field` VALUES('86','11','1','title','标题','','inputtitle','1','80','','请输入标题','title','array (\n)','','','','0','1','0','1','1','1','1','1','4','0','0');
INSERT INTO `v9_model_field` VALUES('87','11','1','keywords','关键词','多关键词之间用空格或者“,”隔开','','0','40','','','keyword','array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','1','0','1','1','1','1','0','7','0','0');
INSERT INTO `v9_model_field` VALUES('88','11','1','description','摘要','','','0','255','','','textarea','array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)','','','','0','1','0','1','0','1','1','1','10','0','0');
INSERT INTO `v9_model_field` VALUES('89','11','1','updatetime','更新时间','','','0','0','','','datetime','array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)','','','','1','1','0','1','0','0','0','0','12','0','0');
INSERT INTO `v9_model_field` VALUES('90','11','1','content','内容','<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>是否截取内容</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">字符至内容摘要\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>是否获取内容第</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">张图片作为标题图片\r\n</div>','','0','999999','','内容不能为空','editor','array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)','','','','0','0','0','1','0','1','1','0','13','0','0');
INSERT INTO `v9_model_field` VALUES('91','11','1','thumb','缩略图','','','0','100','','','image','array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)','','','','0','1','0','0','0','1','0','1','14','0','0');
INSERT INTO `v9_model_field` VALUES('92','11','1','relation','相关文章','','','0','0','','','omnipotent','array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"添加相关\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'添加相关文章\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"显示已有\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)','','2,6,4,5,1,17,18,7','','0','0','0','0','0','0','1','0','15','0','0');
INSERT INTO `v9_model_field` VALUES('93','11','1','pages','分页方式','','','0','0','','','pages','array (\n)','','-99','-99','0','0','0','1','0','0','0','0','16','0','0');
INSERT INTO `v9_model_field` VALUES('94','11','1','inputtime','发布时间','','','0','0','','','datetime','array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)','','','','0','1','0','0','0','0','0','1','17','0','0');
INSERT INTO `v9_model_field` VALUES('95','11','1','posids','推荐位','','','0','0','','','posid','array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)','','','','0','1','0','1','0','0','0','0','18','0','0');
INSERT INTO `v9_model_field` VALUES('96','11','1','groupids_view','阅读权限','','','0','100','','','groupid','array (\n  \'groupids\' => \'\',\n)','','','','0','0','0','1','0','0','0','0','19','0','0');
INSERT INTO `v9_model_field` VALUES('97','11','1','url','URL','','','0','100','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','50','0','0');
INSERT INTO `v9_model_field` VALUES('98','11','1','listorder','排序','','','0','6','','','number','array (\n)','','','','1','1','0','1','0','0','0','0','51','0','0');
INSERT INTO `v9_model_field` VALUES('99','11','1','template','内容页模板','','','0','30','','','template','array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','53','0','0');
INSERT INTO `v9_model_field` VALUES('100','11','1','allow_comment','允许评论','','','0','0','','','box','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)','','','','0','0','0','0','0','0','0','0','54','0','0');
INSERT INTO `v9_model_field` VALUES('101','11','1','status','状态','','','0','2','','','box','array (\n)','','','','1','1','0','1','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('102','11','1','readpoint','阅读收费','','','0','5','','','readpoint','array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)','','-99','-99','0','0','0','0','0','0','0','0','55','0','0');
INSERT INTO `v9_model_field` VALUES('103','11','1','username','用户名','','','0','20','','','text','array (\n)','','','','1','1','0','1','0','0','0','0','98','0','0');
INSERT INTO `v9_model_field` VALUES('104','11','1','islink','转向链接','','','0','0','','','islink','array (\n)','','','','0','1','0','1','0','1','0','0','20','0','0');
INSERT INTO `v9_model_field` VALUES('105','11','1','video','视频上传','','','0','0','','','video','array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)','','','','0','0','0','1','0','1','0','0','8','0','0');
INSERT INTO `v9_model_field` VALUES('106','11','1','vision','画质','','','0','0','','','box','array (\n  \'options\' => \'高清|1\r\n普通|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');
INSERT INTO `v9_model_field` VALUES('107','11','1','video_category','视频分类','','','0','0','','','box','array (\n  \'options\' => \'喜剧|1\r\n爱情|2\r\n科幻|3\r\n剧情|4\r\n动作|5\r\n伦理|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)','','','','0','1','0','1','0','1','0','0','9','0','0');

DROP TABLE IF EXISTS `v9_module`;
CREATE TABLE `v9_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '0000-00-00',
  `updatedate` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_module` VALUES('admin','admin','','1','1.0','','array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)','0','0','2010-10-18','2010-10-18');
INSERT INTO `v9_module` VALUES('member','会员','','1','1.0','','array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 欢迎您注册成为phpcms用户\r\n请仔细阅读下面的协议，只有接受协议才能继续进行注册。 \r\n1．服务条款的确认和接纳\r\n　　phpcms用户服务的所有权和运作权归phpcms拥有。phpcms所提供的服务将按照有关章程、服务条款和操作规则严格执行。用户通过注册程序点击“我同意” 按钮，即表示用户与phpcms达成协议并接受所有的服务条款。\r\n2． phpcms服务简介\r\n　　phpcms通过国际互联网为用户提供新闻及文章浏览、图片浏览、软件下载、网上留言和BBS论坛等服务。\r\n　　用户必须： \r\n　　1)购置设备，包括个人电脑一台、调制解调器一个及配备上网装置。 \r\n　　2)个人上网和支付与此服务有关的电话费用、网络费用。\r\n　　用户同意： \r\n　　1)提供及时、详尽及准确的个人资料。 \r\n　　2)不断更新注册资料，符合及时、详尽、准确的要求。所有原始键入的资料将引用为注册资料。 \r\n　　3)用户同意遵守《中华人民共和国保守国家秘密法》、《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》等有关计算机及互联网规定的法律和法规、实施办法。在任何情况下，phpcms合理地认为用户的行为可能违反上述法律、法规，phpcms可以在任何时候，不经事先通知终止向该用户提供服务。用户应了解国际互联网的无国界性，应特别注意遵守当地所有有关的法律和法规。\r\n3． 服务条款的修改\r\n　　phpcms会不定时地修改服务条款，服务条款一旦发生变动，将会在相关页面上提示修改内容。如果您同意改动，则再一次点击“我同意”按钮。 如果您不接受，则及时取消您的用户使用服务资格。\r\n4． 服务修订\r\n　　phpcms保留随时修改或中断服务而不需知照用户的权利。phpcms行使修改或中断服务的权利，不需对用户或第三方负责。\r\n5． 用户隐私制度\r\n　　尊重用户个人隐私是phpcms的 基本政策。phpcms不会公开、编辑或透露用户的注册信息，除非有法律许可要求，或phpcms在诚信的基础上认为透露这些信息在以下三种情况是必要的： \r\n　　1)遵守有关法律规定，遵从合法服务程序。 \r\n　　2)保持维护phpcms的商标所有权。 \r\n　　3)在紧急情况下竭力维护用户个人和社会大众的隐私安全。 \r\n　　4)符合其他相关的要求。 \r\n6．用户的帐号，密码和安全性\r\n　　一旦注册成功成为phpcms用户，您将得到一个密码和帐号。如果您不保管好自己的帐号和密码安全，将对因此产生的后果负全部责任。另外，每个用户都要对其帐户中的所有活动和事件负全责。您可随时根据指示改变您的密码，也可以结束旧的帐户重开一个新帐户。用户同意若发现任何非法使用用户帐号或安全漏洞的情况，立即通知phpcms。\r\n7． 免责条款\r\n　　用户明确同意网站服务的使用由用户个人承担风险。 　　 \r\n　　phpcms不作任何类型的担保，不担保服务一定能满足用户的要求，也不担保服务不会受中断，对服务的及时性，安全性，出错发生都不作担保。用户理解并接受：任何通过phpcms服务取得的信息资料的可靠性取决于用户自己，用户自己承担所有风险和责任。 \r\n8．有限责任\r\n　　phpcms对任何直接、间接、偶然、特殊及继起的损害不负责任。\r\n9． 不提供零售和商业性服务 \r\n　　用户使用网站服务的权利是个人的。用户只能是一个单独的个体而不能是一个公司或实体商业性组织。用户承诺不经phpcms同意，不能利用网站服务进行销售或其他商业用途。\r\n10．用户责任 \r\n　　用户单独承担传输内容的责任。用户必须遵循： \r\n　　1)从中国境内向外传输技术性资料时必须符合中国有关法规。 \r\n　　2)使用网站服务不作非法用途。 \r\n　　3)不干扰或混乱网络服务。 \r\n　　4)不在论坛BBS或留言簿发表任何与政治相关的信息。 \r\n　　5)遵守所有使用网站服务的网络协议、规定、程序和惯例。\r\n　　6)不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益。\r\n　　7)不得利用本站制作、复制和传播下列信息： \r\n　　　1、煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　　　2、煽动颠覆国家政权，推翻社会主义制度的；\r\n　　　3、煽动分裂国家、破坏国家统一的；\r\n　　　4、煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　　　5、捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　　　6、宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　　　7、公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　　　8、损害国家机关信誉的；\r\n　　　9、其他违反宪法和法律行政法规的；\r\n　　　10、进行商业广告行为的。\r\n　　用户不能传输任何教唆他人构成犯罪行为的资料；不能传输长国内不利条件和涉及国家安全的资料；不能传输任何不符合当地法规、国家法律和国际法 律的资料。未经许可而非法进入其它电脑系统是禁止的。若用户的行为不符合以上的条款，phpcms将取消用户服务帐号。\r\n11．网站内容的所有权\r\n　　phpcms定义的内容包括：文字、软件、声音、相片、录象、图表；在广告中全部内容；电子邮件的全部内容；phpcms为用户提供的商业信息。所有这些内容受版权、商标、标签和其它财产所有权法律的保护。所以，用户只能在phpcms和广告商授权下才能使用这些内容，而不能擅自复制、篡改这些内容、或创造与内容有关的派生产品。\r\n12．附加信息服务\r\n　　用户在享用phpcms提供的免费服务的同时，同意接受phpcms提供的各类附加信息服务。\r\n13．解释权\r\n　　本注册协议的解释权归phpcms所有。如果其中有任何条款与国家的有关法律相抵触，则以国家法律的明文规定为准。 \',\n  \'registerverifymessage\' => \' 欢迎您注册成为phpcms用户，您的账号需要邮箱认证，点击下面链接进行认证：{click}\r\n或者将网址复制到浏览器：{url}\',\n  \'forgetpassword\' => \' phpcms密码找回，请在一小时内点击下面链接进行操作：{click}\r\n或者将网址复制到浏览器：{url}\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('pay','支付','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('digg','顶一下','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('special','专题','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('content','内容模块','','1','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('search','全站搜索','','0','1.0','','array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('scan','木马扫描','scan','0','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('attachment','附件','attachment','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('block','碎片','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('collection','采集模块','collection','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('dbsource','数据源','','1','','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('template','模板风格','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('release','发布点','','1','1.0','','','0','0','2010-09-01','2010-09-06');
INSERT INTO `v9_module` VALUES('video','视频库','','0','1.0','','','0','0','2012-09-28','2012-09-28');
INSERT INTO `v9_module` VALUES('announce','公告','announce/','0','1.0','公告','','0','0','2017-04-22','2017-04-22');
INSERT INTO `v9_module` VALUES('comment','评论','comment/','0','1.0','评论','','0','0','2017-04-22','2017-04-22');
INSERT INTO `v9_module` VALUES('link','友情链接','','0','1.0','','array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('vote','投票','','0','1.0','','array (\r\n  1 => \r\n  array (\r\n    \'default_style\' => \'default\',\r\n    \'vote_tp_template\' => \'vote_tp\',\r\n    \'allowguest\' => \'1\',\r\n    \'enabled\' => \'1\',\r\n    \'interval\' => \'1\',\r\n    \'credit\' => \'1\',\r\n  ),\r\n)','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('message','短消息','','0','1.0','','','0','0','2010-09-06','2010-09-06');
INSERT INTO `v9_module` VALUES('mood','新闻心情','mood/','0','1.0','新闻心情','','0','0','2017-04-22','2017-04-22');
INSERT INTO `v9_module` VALUES('poster','广告模块','poster/','0','1.0','广告模块','','0','0','2017-04-22','2017-04-22');
INSERT INTO `v9_module` VALUES('formguide','表单向导','formguide/','0','1.0','formguide','array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'用户向我们提交了表单数据，赶快去看看吧。\',\n)','0','0','2010-10-20','2010-10-20');
INSERT INTO `v9_module` VALUES('wap','手机门户','wap/','0','1.0','手机门户','','0','0','2017-04-22','2017-04-22');
INSERT INTO `v9_module` VALUES('upgrade','在线升级','','0','1.0','','','0','0','2011-05-18','2011-05-18');
INSERT INTO `v9_module` VALUES('tag','标签向导','tag/','0','1.0','标签向导','','0','0','2017-04-22','2017-04-22');
INSERT INTO `v9_module` VALUES('sms','短信平台','sms/','0','1.0','短信平台','','0','0','2011-09-02','2011-09-02');

DROP TABLE IF EXISTS `v9_mood`;
CREATE TABLE `v9_mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目id',
  `siteid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '站点ID',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_news`;
CREATE TABLE `v9_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

INSERT INTO `v9_news` VALUES('1','7','0','明年坐飞机需知新规：部分延误旅客需自费食宿','','http://img.huhangnet.com/24jie/006.jpg','食宿 新规 明年','中新网北京12月29日电 （种卿） 自2017年1月1日起，多个民航业新规都将正式施行，包括备受关注的《民用航空安全检查规则》、《航班正常管...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=7&id=1','0','99','1','0','admin','1482972265','1482972363');
INSERT INTO `v9_news` VALUES('2','7','0','2017年反腐工作有啥新动向？中央政治局开会定了！','','http://img.huhangnet.com/24jie/005.jpg','新动向 反腐 工作','中共中央政治局12月28日召开会议，听取中央纪律检查委员会2016年工作汇报，研究部署2017年党风廉政建设和反腐败工作。中共中央总书记习近平...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=7&id=2','0','99','1','0','admin','1482990131','1482990179');
INSERT INTO `v9_news` VALUES('3','7','0','央视曝农补黑幕：村干部冒领300万 村民治癌款也贪','','http://img.huhangnet.com/24jie/004.jpg','村民 治癌款 300万','近年来，农业、农村和农民工作得到了党中央的高度重视，从2004年至今，连续13年的中央一号文件都是关于三农问题的。在实际工作中，中央实行   ','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=7&id=3','0','99','1','0','admin','1482990187','1486113800');
INSERT INTO `v9_news` VALUES('4','7','0','京津冀明起迎来新一轮空气重污染 将带雾霾跨年','','http://img.huhangnet.com/24jie/003.jpg','迎来 明起 京津冀','京华时报讯(记者贾婷)昨天，记者从中国环境监测总站获悉，受不利气象扩散条件影响，明天至明年1月5日，京津冀及周边区域将遭遇跨年重污染过...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=7&id=4','0','99','1','0','admin','1482990259','1482990311');
INSERT INTO `v9_news` VALUES('5','7','0','完善网络安全法律法规体系 个人信息保护法立法有望提速','','http://img.huhangnet.com/24jie/002.jpg','保护法 有望 体系','　　网络安全法立法之后，需要再制定配套法规或者出台司法解释，以增强法律可操作性，此外还需要在网络安全的其他领域进一步制定专门法律。   ','1','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=7&id=5','0','99','1','0','admin','1482990324','1485854505');
INSERT INTO `v9_news` VALUES('6','7','0','特朗普推特再次炮轰奥巴马：政府平稳过渡没有可能','','http://img.huhangnet.com/24jie/001.jpg','平稳 政府 有可能','　【环球网报道记者周骥滢】哥俩好的假面终于被打破了。之前一直试图营造冰释前嫌假象的美国现任总统奥巴马和美国候任总统特朗普终于都撕破   ','1','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=7&id=6','0','99','1','0','admin','1482990401','1486110341');
INSERT INTO `v9_news` VALUES('7','10','0','最怕你一生碌碌无为，还安慰自己平凡可贵','','http://img.huhangnet.com/24jie/012.jpg','平凡 碌碌无为 最怕','送给拖延症、懒癌和假情怀患者。 送给对自己用心太少，对生活用力太小的人。 有了一份糊口的工作，你就不敢奢望更高的工资了吗？ 守着一...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=10&id=7','0','99','1','0','admin','1482991508','1482991533');
INSERT INTO `v9_news` VALUES('8','10','0','我与世界只差一个你(电子书)','','http://img.huhangnet.com/24jie/011.jpg','电子书 一个 世界','你的感情可能正在感冒，你的生活可能一团糟，你的世界可能只差一个最好的人&hellip;&hellip;可不去经历，如何成长？不去受伤，如何坚强？不去相信，如何...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=10&id=8','0','99','1','0','admin','1482991538','1482991614');
INSERT INTO `v9_news` VALUES('9','10','0','愿你的青春不负梦想(俞敏洪写给千万年轻人的诚意励志新作)','','http://img.huhangnet.com/24jie/010.jpg','诚意 青春 不负','本书是梦想导师俞敏洪与千万年轻人分享的关于青春、梦想、成长、奋斗、事业、生活的励志感悟，由俞敏洪的演讲精华整理而成，真实地反映了俞...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=10&id=9','0','99','1','0','admin','1482991619','1482991703');
INSERT INTO `v9_news` VALUES('10','10','0','微商2.0：打造月入百万的微商新模式(电子书)','','http://img.huhangnet.com/24jie/009.jpg','','被定义为微商元年的2015年承载着众多个人及组织在微商领域的梦想，人们期望在这个巨大的风口之上分一杯羹。而微商未来的发展，也将会产生更   ','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=10&id=10','0','99','1','0','admin','1482991707','1484406936');
INSERT INTO `v9_news` VALUES('11','10','0','华为工作法(华为核心工作方法重磅披露)(电子书)','','http://img.huhangnet.com/24jie/008.jpg','披露 电子书 工作','二十余年间，华为从一个作坊式小企业成为全球知名企业，靠的正是它不断坚持的核心价值观和秘而不传的工作方法。 为什么华为的工作效率很高...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=10&id=11','0','99','1','0','admin','1482991794','1482991826');
INSERT INTO `v9_news` VALUES('12','10','0','顾客行为心理学(电子书)','','http://img.huhangnet.com/24jie/007.jpg','电子书 心理学 顾客','刁难的顾客，对很多销售员而言就像无解的数学题。但顾客毕竟不是数学题，而且始终遵循存在即合理的原则。所以，正面强攻不成，销售员就要学   ','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=10&id=12','0','99','1','0','admin','1482991831','1486065970');
INSERT INTO `v9_news` VALUES('13','13','0','香格里拉普达措国家公园花卉工程案例','','http://img.huhangnet.com/24jie/018.jpg','花卉 工程 公园','普达措国家公园，位于滇西北三江并流世界自然遗产中心地带，由国际重要湿地碧塔海自然保护区和三江并流世界自然遗产哈巴片区之属都湖景区两...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=13&id=13','0','99','1','0','admin','1482992001','1482992037');
INSERT INTO `v9_news` VALUES('14','13','0','上海佘山高尔夫俱乐部项目案例','','http://img.huhangnet.com/24jie/017.jpg','项目 案例 佘山','上海佘山国际高尔夫俱乐部坐落于上海松江佘山国家旅游度假区，总占地面积2200亩，其中1700亩为18洞72杆国际锦标级高尔夫球场，由N&amp;H公司所...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=13&id=14','0','99','1','0','admin','1482992042','1482992095');
INSERT INTO `v9_news` VALUES('15','13','0','甘肃紫花苜蓿种植案例  ','','http://img.huhangnet.com/24jie/016.jpg','案例 种植 紫花','甘肃荣华奶牛养殖基地是一家一座集标准化、规模化、集约化为一体的现代化生态牧场和大型现代农业产业示范园区。整个养殖场规划为6个养殖分...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=13&id=15','0','99','1','0','admin','1482992101','1482992136');
INSERT INTO `v9_news` VALUES('16','13','0','河南龙亭公园花卉工程案例','','http://img.huhangnet.com/24jie/015.jpg','案例 公园 龙亭','龙亭公园位于开封城内西北隅，占地面积1300多亩，其中水域面积410亩。全园包括午门、玉带桥、朝门、照壁、朝房、龙亭、北宋皇宫宸拱门遗址...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=13&id=16','0','99','1','0','admin','1482992144','1482992186');
INSERT INTO `v9_news` VALUES('17','13','0','湖北木兰草原景区花卉案例','','http://img.huhangnet.com/24jie/014.jpg','花卉 案例 景区','木兰草原风景区，位于木兰故里&mdash;&mdash;湖北省武汉市黄陂木兰生态旅游区境内，距武汉中心城区42公里。国家AAAA级旅游风景区、华中地区唯一草原风...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=13&id=17','0','99','1','0','admin','1482992197','1482992231');
INSERT INTO `v9_news` VALUES('18','13','0','大奇山国家森林公园案例','','http://img.huhangnet.com/24jie/013.jpg','案例 森林公园 国家','浙江大奇山国家森林公园景区案例大奇山国家森林公园位于浙江省杭州市桐庐县，在富春江南岸，是一处集江南山水与草原风光于一体的综合性森林...','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=13&id=18','0','99','1','0','admin','1482992235','1482992286');
INSERT INTO `v9_news` VALUES('19','13','0','测试标题实验','','',' 1 1 1','测试分页，这时是第一页的内容分页标题第二页内容','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=13&id=19','0','99','1','0','admin','1486110622','1486110684');
INSERT INTO `v9_news` VALUES('20','7','0','测试手动分页生成问题','','','成问题 分页 手动','测试手动分页生成问题阿萨法苛阿萨法fa','0','http://s.hh.pcbasic.huhangnet.com/index.php?m=content&c=index&a=show&catid=7&id=20','0','99','1','0','admin','1486110718','1486291996');

DROP TABLE IF EXISTS `v9_news_data`;
CREATE TABLE `v9_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_news_data` VALUES('1','<p>中新网北京12月29日电 （种卿） 自2017年1月1日起，多个民航业新规都将正式施行，包括备受关注的《民用航空安全检查规则》、《航班正常管理规定》、《2017年航班正常考核指标和限制措施》&hellip;&hellip;新规落地后，旅客在登机、安检、延误处置等环节都将面临不少改变：乘坐部分国内航班可刷身份证登机；安检不允许旅客拍照、摄像；因天气、突发事件等原因延误，食宿费用旅客自理等。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('2','<p>中共中央政治局12月28日召开会议，听取中央纪律检查委员会2016年工作汇报，研究部署2017年党风廉政建设和反腐败工作。中共中央总书记习近平主持会议。</p>\r\n<p>2016年中央反腐取得了哪些成绩？2017年的反腐重点是什么？一起来看看&mdash;&mdash;</p>\r\n<p>2016年成绩单&mdash;&mdash;反腐败斗争压倒性态势已经形成</p>\r\n<p>会议指出，党的十八大以来，以习近平同志为核心的党中央把全面从严治党纳入战略布局，领导全党全社会共同努力，推动全面从严治党取得重要阶段性成果，党内政治生活呈现新的气象，反腐败斗争压倒性态势已经形成，得到人民群众称赞，党心民心得到极大提振。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('3','<p>近年来，农业、农村和农民工作得到了党中央的高度重视，从2004年至今，连续13年的中央一号文件都是关于三农问题的。在实际工作中，中央实行了一系列直接有力的政策措施。从粮食直补、良种补贴、农资综合补贴、农机具购置补贴到退耕还林补贴，等等等等，可以说农民想到的，中央做到了，农民没想到的，中央也为农民想好了。</p>\r\n<p>习近平总书记强调，重农固本，是安民之基。&ldquo;十三五&rdquo;时期，必须坚持把解决好&ldquo;三农&rdquo;问题作为全党工作重中之重，牢固树立和切实贯彻创新、协调、绿色、开放、共享的发展理念，加大强农惠农富农力度，让农民真正得到实惠。然而在个别地区，个别人却假借惠农政策之名，行坑农害农之实，《经济半小时》记者进行了调查。</p>\r\n<p>调查01</p>\r\n<p>村民名下莫名多了640亩生态林每年8160元补贴不翼而飞</p>\r\n<p>湖北省郧[y&uacute;n]西县三官洞林区共有5个行政村，蒿坪河村是其中之一。2015年7月20日，一家网站上出现了来自蒿坪河村上百人的实名举报材料，反映有人骗取、贪污、截留、挪用国家专项资金及各种补贴。根据这个线索，2016年12月14日，记者赶到郧西县实地调查。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('4','<p>京华时报讯(记者贾婷)昨天，记者从<a href=\"http://country.huanqiu.com/china\" target=\"_blank\" title=\"中国\">中国</a>环境监测总站获悉，受不利气象扩散条件影响，明天至明年1月5日，京津冀及周边区域将遭遇跨年重污染过程。在此期间，京津冀中南部，以及晋南、鲁西、豫北等地空气质量将以重度污染为主，局部地区可能出现严重污染。6日空气污染扩散条件开始好转，污染形势有望逐步缓解。</p>\r\n<p>　　对比昨天的晴冷天气，记者从北京市气象局获悉，早晨8:00南郊观象台的气温只有-5.2℃，城区气温在-5至-7℃之间，不仅气温低，而且北风大。昨天南郊观象台的最高气温为2.1℃，出现在13点31分，比前一天低了1.3℃。</p>\r\n<p>　　据预报，今天又是个大晴天，相比昨天而言，没有了强势的北风，更适合户外活动和居室通风。但是最高气温只有4℃，最低气温-7℃，在此提醒市民注意防寒保暖。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('5','<div style=\"text-align: center;\"><img alt=\"网络安全法立法之后，需要再制定配套法规或者出台司法解释，以增强法律可操作性，此外还需要在网络安全的其他领域进一步制定专门法律。“网络安全法的通过，完成了（网络安全领域）基本制度框架的建构，同时意味着更艰巨立法任务的开始。”中国法学会法治研究所副研究员刘金瑞认为。\" border=\"1\" src=\"http://s.hh.pcbasic.huhangnet.com/uploadfile/2017/0131/20170131052145534.jpg\" /></div>\r\n<p>　　网络安全法立法之后，需要再制定配套法规或者出台司法解释，以增强法律可操作性，此外还需要在网络安全的其他领域进一步制定专门法律。&ldquo;网络安全法的通过，完成了（网络安全领域）基本制度框架的建构，同时意味着更艰巨立法任务的开始。&rdquo;中国法学会法治研究所副研究员刘金瑞认为。</p>\r\n<p>　　本报记者 王峰 北京报道</p>\r\n<p>　　国务院近日印发《&ldquo;十三五&rdquo;国家信息化规划》（下称《规划》）。《规划》要求完善信息化法律框架，统筹信息化立法需求，优先推进<a href=\"http://tech.hexun.com/telecom/\" target=\"_blank\">电信</a>、网络安全、密码、个人信息保护、电子商务、电子政务、关键信息基础设施等重点领域相关立法工作。</p>\r\n<p>　　《规划》还提出完善网络安全法律法规体系，推动出台网络安全法、密码法、个人信息保护法，研究制定未成年人网络保护条例。</p>\r\n<p>　　与今年7月印发的《国家信息化发展战略纲要》相比，相关立法进度被重构，比如密码法、个人信息保护法从&ldquo;研究制定&rdquo;转为&ldquo;推动出台&rdquo;，未成年人网络保护条例草案已经完成，但仍在&ldquo;研究制定&rdquo;当中。</p>\r\n<p>　　12月25日，全国人大法律委员会作出报告称，对于三件今年全国&ldquo;<a href=\"http://news.hexun.com/2013/lh/\" target=\"_blank\">两会</a>&rdquo;上关于制定个人信息保护法的议案，&ldquo;将会同有关方面积极推进立法进程，建议适时纳入立法规划或立法工作计划&rdquo;。</p>\r\n<p>　　&ldquo;网络安全法的通过，完成了（网络安全领域）基本制度框架的建构，同时意味着更艰巨立法任务的开始。&rdquo;中国法学会法治研究所副研究员刘金瑞认为。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('6','<p>　【环球网报道&nbsp;记者&nbsp;周骥滢】&ldquo;哥俩好&rdquo;的假面终于被打破了。之前一直试图营造冰释前嫌假象的美国现任总统奥巴马和美国候任总统特朗普终于都&ldquo;撕破脸&rdquo;，毫不留情地进行彼此攻击。特朗普最新的推文则再次宣告：奥巴马政府和特朗普政府之间所谓的平稳过渡没希望了。</p>\r\n<p>　　之前奥巴马在接受采访时宣称，如果自己能够第三次参选总统，特朗普铁定没戏。这可惹毛了特朗普。他连续几天发推文，怒火直指奥巴马。在最新的推文中，特朗普说道：&ldquo;我已经尽我所能不去理睬奥巴马总统很多煽动性的言论还有设置的障碍。我本以为能够实现平稳过渡&mdash;&mdash;异想天开!&rdquo;</p>\r\n<p>　　之前，特朗普也在推特上发言：&ldquo;奥巴马总统自认为可以(在大选中)击败我。他可以这么说，但我认为&lsquo;没戏&rsquo;!因为工作减少、IS还有奥巴马医疗法案等问题(的存在)。&rdquo;</p>\r\n','0','','1','500','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('19','测试分页，这时是第一页的内容<br />\r\n[page]分页标题[/page]<br />\r\n第二页内容<br />\r\n','0','','2','10000','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('7','<p>送给拖延症、懒癌和假情怀患者。 送给对自己用心太少，对生活用力太小的人。 有了一份糊口的工作，你就不敢奢望更高的工资了吗？ 守着一个安稳的职位，你就没有勇气跳槽了吗？ 穿着阿迪、耐克的爆款，你就感到知足了吗？ 看着别人晒iphone、晒旅游照，你只剩吐槽或点赞的份了吗？ 一辈子过着这样平凡、无趣的生活，就是你这个年纪的终极梦想吗？ 你很累，你说不出累在哪里。 你烦恼，你不知烦恼来自何方。 你讨厌自己，你决定不了自己。 你怀疑自己的生活是否出了问题，却无从下手解决。 你抚摸着一步步走过的路，一路上都是不甘。 你可能理解错了。不是只有惊天动地的人生才需要努力，平凡的幸福，也需要不凡的努力。 这本书里都是能让你大呼过瘾的故事，就像是在街边的小店里吃一盘入味十足的麻辣小吃。无论是齿间的嚼</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('8','<p>你的感情可能正在感冒，你的生活可能一团糟，你的世界可能只差一个最好的人&hellip;&hellip;可不去经历，如何成长？不去受伤，如何坚强？不去相信，如何相遇？ 12个温馨治愈的情感故事，给年轻人爱的正能量和信心，让你在面对爱时无惧，怀疑爱时坚定。 这些故事也许你生活中永远不会碰触，亦或许曾经经历、正在经历并且将会经历，张皓宸以电影化的手法，将故事中的人物带到你身边，你将与他们共同欢笑，共同哭泣，经历12段美妙人生。 这本书就像酒店门口的伞，遇见下雨天，告诉你别淋着，它也像一个残忍的耳光，让你沾沾自喜快忘了自己模样时狠心提醒，它还像你淹没在孤独人群里的一声叫喊，你一定会回过头。嗯，有人正在找你。 12个故事，各式各样的男女，在你某个临睡的深夜或是赶路的地铁公车里看看，任你选择，跟其中几个人认识，感受他们的爱恨，或欢喜或悲哀，或疯狂或遗憾。在你落单时、暗恋时、失恋时、试图放弃时能成为一个隔空的拥抱，给你些许无声的安慰。 希望你慢点读它，可以听着歌，吃着爆米花&hellip;&hellip; 希望你也能把它放在枕边，相信爱的吸引力，一定会得到最好的幸福&hellip;&hellip; 希望这本书能给你忙碌的生活中带去一点甜头，对爱情还抱有几多向往和期待，那终究也对得起这份相遇&hellip;&hellip; 友情提示： 1、阅读本书中的12个故事，相当于观看12部精彩电影，配之以适当的背景音乐体验更佳，合理安排时间，享受健康生活。 2、不同的城市，相似的你我，如有雷同，实属巧合，因对号入座造成的肝肠寸断，需自行承受。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('9','<p>本书是梦想导师俞敏洪与千万年轻人分享的关于青春、梦想、成长、奋斗、事业、生活的励志感悟，由俞敏洪的演讲精华整理而成，真实地反映了俞敏洪所走过的50多年的人生风雨路程。 在本书中，俞敏洪以真诚的态度、坦荡的胸怀、幽默的语言，娓娓讲述了自己的青春、梦想、成长、奋斗、事业、生活方面的经历和感受，分享了自己从出生到成长，从成长到考上北大，从北大离职后创业，经历种种挫折与磨难的人生奋斗历程。他以非凡的气魄、坚忍不拔的毅力、大无畏的精神，渡过了一道道难关，一步步走到了今天，希望以此激励你勇敢地追逐自己的梦想。 读完本书，你将收获前所未有的勇气，以及俞敏洪分享的宝贵经验与方法，坚定自己前进的步伐，实现自己的梦想。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('10','<p>被定义为&ldquo;微商元年&rdquo;的2015年承载着众多个人及组织在微商领域的梦想，人们期望在这个巨大的风口之上分一杯羹。而微商未来的发展，也将会产生更多多元化的形式。《微商2.0 打造月入百万的微商新模式》详细介绍了微商+平台的搭建与运营、微商+C28的设计与指导、微商+O2O的对接与运营、微商+农村的布局与发展等。外界的推动加上内在的需求，将促使微商进行新一轮的转型与升级，微商2.0时代即将到来！</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('11','<p>二十余年间，华为从一个作坊式小企业成为全球知名企业，靠的正是它不断坚持的核心价值观和秘而不传的工作方法。 为什么华为的工作效率很高？为什么华为员工的执行力如此强？华为核心竞争力是什么，依靠什么来获得发展？为什么你努力工作却收效甚微？为什么工作总是越做越忙，越忙越乱？为什么工作中的错误总是越做越多？为什么公司的业绩始终不见起色？为什么管理得很严格，却总是难以起到应有的效果？读完这本书，您将豁然开朗。 本书立足于华为公司的实际情况，从发展过程中的案例、华为人的经验与任正非本人的内部演讲出发，着重讲解了华为公司的目标管理、工作执行、工作原则、工作经验等方面，从中提取、整合相关的工作法则和实操方法，从而帮助阅读者更好地掌握和理解工作的本质和精髓。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('12','<p>刁难的顾客，对很多销售员而言就像无解的数学题。但顾客毕竟不是数学题，而且始终遵循&ldquo;存在即合理&rdquo;的原则。所以，正面强攻不成，销售员就要学会从顾客的行为心理入手，采取迂回进攻的策略。 ? ? ? 顾客行为都有目的，心理变化也会遵循一定的规律，只要销售员能够从顾客的外貌服饰、语言声音、肢体动作、面部表情、日常习惯等行为中，揣摩出他们的心理，就可以明确他们的目的，从而进行有针对性的说服。除此之外，本书也将顾客的心理规律、弱势，以及行为特征等做了一番梳理，再结合具体的情境，对销售员了解顾客，都会产生如虎添翼之效。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('13','<p>普达措国家公园，位于滇西北&ldquo;三江并流&rdquo;世界自然遗产中心地带，由国际重要湿地碧塔海自然保护区和&ldquo;三江并流&rdquo;世界自然遗产哈巴片区之属都湖景区两部分构成，以碧塔海、蜀都湖和霞给藏族文化自然村为主要组成部分，也是香格里拉旅游的主要景点之一。海拔在3500米至4159米之间，属省级自然保护区，是&ldquo;三江并流&rdquo;风景名胜区的重要组成部分。普达措国家公园拥有地质地貌、湖泊湿地、森林草甸、河谷溪流、珍稀动植物等，原始生态环境保存完好。距香格里拉市城区22公里，总面积约1313平方公里。受当地政府部门委托本公司负责400亩花海的施工。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('14','<p>上海佘山国际高尔夫俱乐部坐落于上海松江佘山国家旅游度假区，总占地面积2200亩，其中1700亩为18洞72杆国际锦标级高尔夫球场，由N&amp;H公司所设计，设计规划极力保护原生植被，精心营造上海唯一森林丘陵型生态高尔夫球场。还有26道高尔夫练习场。俱乐部还用500亩用于建造意大利托斯卡纳风格的顶级别墅社区。我公司受委托对球场以及别墅区50万平米土地进行绿化建造。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('15','<p>甘肃荣华奶牛养殖基地是一家一座集标准化、规模化、集约化为一体的现代化生态牧场和大型现代农业产业示范园区。整个养殖场规划为6个养殖分场，包括4个奶牛场、2个肉牛场，每个奶牛场可养奶牛1万头。年产优质奶30万吨，年出栏肉牛2万头。&ldquo;奶牛的生产性能，尤其是产奶量与环境因素密切相关。一个比较理想的奶牛养殖场对预防疾病发生、降低生产成本、保持奶牛健康成长、达到预期生产目的有着很现实的意义。所以，有一个生态环保的环境对发展奶牛养殖尤为重要。&rdquo;石斌对记者说，从一开始我们就为养殖场注入了环保理念。首先选在没有污染的沙漠里建厂，其次是选用绿色无污染的牧草精心喂养，我们利用自种的优质牧草进行加工，然后又添加优质绿色饲料，混合在一起，用进口的TMR饲喂机喂给奶牛吃，确保奶牛的健康和鲜奶的品质。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('16','<p>龙亭公园位于开封城内西北隅，占地面积1300多亩，其中水域面积410亩。全园包括午门、玉带桥、朝门、照壁、朝房、龙亭、北宋皇宫宸拱门遗址、碑亭、北门及东门等清朝万寿宫建筑群体，还有奇妙的潘杨二湖、明媚的四季同春园、典雅的盆景园、号称中原一绝的植物造型园及长廊水榭等园林景观。受业主委托对公园内400亩进行绿化。包括草坪花卉的栽植，水上花卉植物的栽植。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('17','<p>木兰草原风景区，位于木兰故里&mdash;&mdash;湖北省武汉市黄陂木兰生态旅游区境内，距武汉中心城区42公里。国家AAAA级旅游风景区、华中地区唯一草原风情景区。本公司受景区管委会委托负责景区400亩地花海的施工。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('18','<p>浙江大奇山国家森林公园景区案例大奇山国家森林公园位于浙江省杭州市桐庐县，在富春江南岸，是一处集江南山水与草原风光于一体的综合性森林公园。大奇山又称&quot;塞基山&quot;，史称&quot;江南第</p>\r\n<p>大奇山国家森林公园位于浙江省杭州市桐庐县，在富春江南岸，是一处集江南山水与草原风光于一体的综合性森林公园。大奇山又称&quot;塞基山&quot;，史称&quot;江南第一名山&quot;。境内有山峦、怪石、峡谷、溪瀑，以雄、险、奇、秀、旷著称。大奇山国家森林公园距320国道1公里，与桐君山、七里扬帆、富春江小三峡、严子陵钓台共同构成富春江旅游板块。受国家林业局委托负责整体花卉绿化。</p>\r\n','0','','0','0','','0','','0','1','|0');
INSERT INTO `v9_news_data` VALUES('20','测试手动分页生成问题<br />\r\n[page]阿萨法苛[/page]<br />\r\n阿萨法fa<br />\r\n','0','','2','10000','','0','','0','1','|0');

DROP TABLE IF EXISTS `v9_page`;
CREATE TABLE `v9_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_account`;
CREATE TABLE `v9_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_payment`;
CREATE TABLE `v9_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_pay_spend`;
CREATE TABLE `v9_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_picture`;
CREATE TABLE `v9_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `v9_picture` VALUES('1','2','0','邻家女孩甜Abby3酥胸美臀粉嫩可爱','','/statics/huhangnet/pc/del/2/3.jpg','邻家 女孩 内衣','','1','http://s.2017.07.18mm.huhangnet.com/show-2-1-1.html','0','99','1','0','admin','1500828139','1500852544');
INSERT INTO `v9_picture` VALUES('2','2','0','清纯美女Sukki豹纹SM秀白嫩美胸','','/statics/huhangnet/pc/del/3/1.jpg','豹纹 美女 内衣','','1','http://s.2017.07.18mm.huhangnet.com/show-2-2-1.html','0','99','1','0','admin','1500828399','1500852533');
INSERT INTO `v9_picture` VALUES('3','2','0','清纯少女刘奕宁Lynn酥胸覆白色内衣','','/statics/huhangnet/pc/del/4/1.jpg','白色 内衣 少女','','1','http://s.2017.07.18mm.huhangnet.com/show-2-3-1.html','0','99','1','0','admin','1500828569','1500828659');
INSERT INTO `v9_picture` VALUES('4','6','0','内地艺人刘雨欣气质高清杂志图片','','/statics/huhangnet/pc/del/5/1.jpg','高清 艺人 气质','','1','http://s.2017.07.18mm.huhangnet.com/show-6-4-1.html','0','99','1','0','admin','1500830824','1500830875');
INSERT INTO `v9_picture` VALUES('5','6','0','现代潘金莲龚玥菲气质写真','','/statics/huhangnet/pc/del/6/2.jpg','潘金莲 气质 龚玥菲','','1','http://s.2017.07.18mm.huhangnet.com/show-6-5-1.html','0','99','1','0','admin','1500830935','1500830973');

DROP TABLE IF EXISTS `v9_picture_data`;
CREATE TABLE `v9_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_picture_data` VALUES('1','','0','','0','10000','','0','','{\"0\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/1.jpg\",\"alt\":\"\"},\"1\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/2.jpg\",\"alt\":\"\"},\"2\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/3.jpg\",\"alt\":\"\"},\"3\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/4.jpg\",\"alt\":\"\"}}','|0','1');
INSERT INTO `v9_picture_data` VALUES('2','','0','','0','10000','','0','','{\"0\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/1.jpg\",\"alt\":\"\"},\"1\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/2.jpg\",\"alt\":\"\"},\"2\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/3.jpg\",\"alt\":\"\"},\"3\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/4.jpg\",\"alt\":\"\"},\"4\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/5.jpg\",\"alt\":\"\"},\"5\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/6.jpg\",\"alt\":\"\"},\"6\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/7.jpg\",\"alt\":\"\"},\"7\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/8.jpg\",\"alt\":\"\"},\"8\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/9.jpg\",\"alt\":\"\"},\"9\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/10.jpg\",\"alt\":\"\"}}','|0','1');
INSERT INTO `v9_picture_data` VALUES('3','','0','','0','10000','','0','','{\"0\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/4\\/1.jpg\",\"alt\":\"\"},\"1\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/4\\/2.jpg\",\"alt\":\"\"},\"2\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/4\\/3.jpg\",\"alt\":\"\"}}','|0','1');
INSERT INTO `v9_picture_data` VALUES('4','','0','','0','10000','','0','','{\"0\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/5\\/1.jpg\",\"alt\":\"\"},\"1\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/5\\/2.jpg\",\"alt\":\"\"},\"2\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/5\\/3.jpg\",\"alt\":\"\"}}','|0','1');
INSERT INTO `v9_picture_data` VALUES('5','','0','','0','10000','','0','','{\"0\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/6\\/1.jpg\",\"alt\":\"\"},\"1\":{\"url\":\"\\/statics\\/huhangnet\\/pc\\/del\\/6\\/2.jpg\",\"alt\":\"\"}}','|0','1');

DROP TABLE IF EXISTS `v9_position`;
CREATE TABLE `v9_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `v9_position` VALUES('1','3','0','首页幻灯片','20','','0','1','');
INSERT INTO `v9_position` VALUES('2','3','0','首页头条','20','','0','1','');
INSERT INTO `v9_position` VALUES('3','3','0','首页栏目图片推荐','200','','0','1','');
INSERT INTO `v9_position` VALUES('4','3','0','首页右侧推荐','26','','0','1','');

DROP TABLE IF EXISTS `v9_position_data`;
CREATE TABLE `v9_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_position_data` VALUES('1','2','1','content','3','1','{\"title\":\"\\u90bb\\u5bb6\\u5973\\u5b69\\u751cAbby3\\u9165\\u80f8\\u7f8e\\u81c0\\u7c89\\u5ae9\\u53ef\\u7231\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/3.jpg\",\"inputtime\":\"1500828139\",\"style\":\"\"}','1','1','0','','0');
INSERT INTO `v9_position_data` VALUES('1','2','2','content','3','1','{\"title\":\"\\u90bb\\u5bb6\\u5973\\u5b69\\u751cAbby3\\u9165\\u80f8\\u7f8e\\u81c0\\u7c89\\u5ae9\\u53ef\\u7231\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/3.jpg\",\"inputtime\":\"1500828139\",\"style\":\"\"}','1','1','0','','0');
INSERT INTO `v9_position_data` VALUES('1','2','3','content','3','1','{\"title\":\"\\u90bb\\u5bb6\\u5973\\u5b69\\u751cAbby3\\u9165\\u80f8\\u7f8e\\u81c0\\u7c89\\u5ae9\\u53ef\\u7231\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/3.jpg\",\"inputtime\":\"1500828139\",\"style\":\"\"}','1','1','0','','0');
INSERT INTO `v9_position_data` VALUES('1','2','4','content','3','1','{\"title\":\"\\u90bb\\u5bb6\\u5973\\u5b69\\u751cAbby3\\u9165\\u80f8\\u7f8e\\u81c0\\u7c89\\u5ae9\\u53ef\\u7231\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/2\\/3.jpg\",\"inputtime\":\"1500828139\",\"style\":\"\"}','1','1','0','','0');
INSERT INTO `v9_position_data` VALUES('2','2','1','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u7f8e\\u5973Sukki\\u8c79\\u7eb9SM\\u79c0\\u767d\\u5ae9\\u7f8e\\u80f8\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/1.jpg\",\"inputtime\":\"1500828399\",\"style\":\"\"}','1','2','0','','0');
INSERT INTO `v9_position_data` VALUES('2','2','2','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u7f8e\\u5973Sukki\\u8c79\\u7eb9SM\\u79c0\\u767d\\u5ae9\\u7f8e\\u80f8\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/1.jpg\",\"inputtime\":\"1500828399\",\"style\":\"\"}','1','2','0','','0');
INSERT INTO `v9_position_data` VALUES('2','2','3','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u7f8e\\u5973Sukki\\u8c79\\u7eb9SM\\u79c0\\u767d\\u5ae9\\u7f8e\\u80f8\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/1.jpg\",\"inputtime\":\"1500828399\",\"style\":\"\"}','1','2','0','','0');
INSERT INTO `v9_position_data` VALUES('2','2','4','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u7f8e\\u5973Sukki\\u8c79\\u7eb9SM\\u79c0\\u767d\\u5ae9\\u7f8e\\u80f8\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/3\\/1.jpg\",\"inputtime\":\"1500828399\",\"style\":\"\"}','1','2','0','','0');
INSERT INTO `v9_position_data` VALUES('3','2','1','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u5c11\\u5973\\u5218\\u5955\\u5b81Lynn\\u9165\\u80f8\\u8986\\u767d\\u8272\\u5185\\u8863\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/4\\/1.jpg\",\"inputtime\":\"1500828569\",\"style\":\"\"}','1','3','0','','0');
INSERT INTO `v9_position_data` VALUES('3','2','2','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u5c11\\u5973\\u5218\\u5955\\u5b81Lynn\\u9165\\u80f8\\u8986\\u767d\\u8272\\u5185\\u8863\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/4\\/1.jpg\",\"inputtime\":\"1500828569\",\"style\":\"\"}','1','3','0','','0');
INSERT INTO `v9_position_data` VALUES('3','2','3','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u5c11\\u5973\\u5218\\u5955\\u5b81Lynn\\u9165\\u80f8\\u8986\\u767d\\u8272\\u5185\\u8863\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/4\\/1.jpg\",\"inputtime\":\"1500828569\",\"style\":\"\"}','1','3','0','','0');
INSERT INTO `v9_position_data` VALUES('3','2','4','content','3','1','{\"title\":\"\\u6e05\\u7eaf\\u5c11\\u5973\\u5218\\u5955\\u5b81Lynn\\u9165\\u80f8\\u8986\\u767d\\u8272\\u5185\\u8863\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/4\\/1.jpg\",\"inputtime\":\"1500828569\",\"style\":\"\"}','1','3','0','','0');
INSERT INTO `v9_position_data` VALUES('4','6','1','content','3','1','{\"title\":\"\\u5185\\u5730\\u827a\\u4eba\\u5218\\u96e8\\u6b23\\u6c14\\u8d28\\u9ad8\\u6e05\\u6742\\u5fd7\\u56fe\\u7247\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/5\\/1.jpg\",\"inputtime\":\"1500830824\"}','1','4','0','','0');
INSERT INTO `v9_position_data` VALUES('4','6','2','content','3','1','{\"title\":\"\\u5185\\u5730\\u827a\\u4eba\\u5218\\u96e8\\u6b23\\u6c14\\u8d28\\u9ad8\\u6e05\\u6742\\u5fd7\\u56fe\\u7247\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/5\\/1.jpg\",\"inputtime\":\"1500830824\"}','1','4','0','','0');
INSERT INTO `v9_position_data` VALUES('4','6','3','content','3','1','{\"title\":\"\\u5185\\u5730\\u827a\\u4eba\\u5218\\u96e8\\u6b23\\u6c14\\u8d28\\u9ad8\\u6e05\\u6742\\u5fd7\\u56fe\\u7247\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/5\\/1.jpg\",\"inputtime\":\"1500830824\"}','1','4','0','','0');
INSERT INTO `v9_position_data` VALUES('4','6','4','content','3','1','{\"title\":\"\\u5185\\u5730\\u827a\\u4eba\\u5218\\u96e8\\u6b23\\u6c14\\u8d28\\u9ad8\\u6e05\\u6742\\u5fd7\\u56fe\\u7247\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/5\\/1.jpg\",\"inputtime\":\"1500830824\"}','1','4','0','','0');
INSERT INTO `v9_position_data` VALUES('5','6','1','content','3','1','{\"title\":\"\\u73b0\\u4ee3\\u6f58\\u91d1\\u83b2\\u9f9a\\u73a5\\u83f2\\u6c14\\u8d28\\u5199\\u771f\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/6\\/2.jpg\",\"inputtime\":\"1500830935\"}','1','5','0','','0');
INSERT INTO `v9_position_data` VALUES('5','6','2','content','3','1','{\"title\":\"\\u73b0\\u4ee3\\u6f58\\u91d1\\u83b2\\u9f9a\\u73a5\\u83f2\\u6c14\\u8d28\\u5199\\u771f\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/6\\/2.jpg\",\"inputtime\":\"1500830935\"}','1','5','0','','0');
INSERT INTO `v9_position_data` VALUES('5','6','3','content','3','1','{\"title\":\"\\u73b0\\u4ee3\\u6f58\\u91d1\\u83b2\\u9f9a\\u73a5\\u83f2\\u6c14\\u8d28\\u5199\\u771f\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/6\\/2.jpg\",\"inputtime\":\"1500830935\"}','1','5','0','','0');
INSERT INTO `v9_position_data` VALUES('5','6','4','content','3','1','{\"title\":\"\\u73b0\\u4ee3\\u6f58\\u91d1\\u83b2\\u9f9a\\u73a5\\u83f2\\u6c14\\u8d28\\u5199\\u771f\",\"description\":\"\",\"thumb\":\"\\/statics\\/huhangnet\\/pc\\/del\\/6\\/2.jpg\",\"inputtime\":\"1500830935\"}','1','5','0','','0');

DROP TABLE IF EXISTS `v9_poster`;
CREATE TABLE `v9_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_poster` VALUES('1','1','广告一','1','images','{\"1\":{\"linkurl\":\"\",\"imageurl\":\"\\/statics\\/huhangnet\\/pc\\/image\\/baidu.jpg\",\"alt\":\"\"}}','1500831299','1503509699','1500831311','92','0','0','0');

DROP TABLE IF EXISTS `v9_poster_201706`;
CREATE TABLE `v9_poster_201706` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_poster_201707`;
CREATE TABLE `v9_poster_201707` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

INSERT INTO `v9_poster_201707` VALUES('1','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500831334','0');
INSERT INTO `v9_poster_201707` VALUES('2','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500831554','0');
INSERT INTO `v9_poster_201707` VALUES('3','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500831591','0');
INSERT INTO `v9_poster_201707` VALUES('4','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500831724','0');
INSERT INTO `v9_poster_201707` VALUES('5','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500831872','0');
INSERT INTO `v9_poster_201707` VALUES('6','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500831916','0');
INSERT INTO `v9_poster_201707` VALUES('7','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500832034','0');
INSERT INTO `v9_poster_201707` VALUES('8','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500832118','0');
INSERT INTO `v9_poster_201707` VALUES('9','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500832202','0');
INSERT INTO `v9_poster_201707` VALUES('10','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500832247','0');
INSERT INTO `v9_poster_201707` VALUES('11','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500832700','0');
INSERT INTO `v9_poster_201707` VALUES('12','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500832730','0');
INSERT INTO `v9_poster_201707` VALUES('13','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500832768','0');
INSERT INTO `v9_poster_201707` VALUES('14','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=5','1500832780','0');
INSERT INTO `v9_poster_201707` VALUES('15','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=4','1500832781','0');
INSERT INTO `v9_poster_201707` VALUES('16','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=3','1500832783','0');
INSERT INTO `v9_poster_201707` VALUES('17','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=3','1500832796','0');
INSERT INTO `v9_poster_201707` VALUES('18','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=3','1500832817','0');
INSERT INTO `v9_poster_201707` VALUES('19','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=3','1500832819','0');
INSERT INTO `v9_poster_201707` VALUES('20','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500832821','0');
INSERT INTO `v9_poster_201707` VALUES('21','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500832823','0');
INSERT INTO `v9_poster_201707` VALUES('22','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=3','1500832824','0');
INSERT INTO `v9_poster_201707` VALUES('23','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500832826','0');
INSERT INTO `v9_poster_201707` VALUES('24','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500852455','0');
INSERT INTO `v9_poster_201707` VALUES('25','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500852457','0');
INSERT INTO `v9_poster_201707` VALUES('26','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500852458','0');
INSERT INTO `v9_poster_201707` VALUES('27','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500852465','0');
INSERT INTO `v9_poster_201707` VALUES('28','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=3','1500852467','0');
INSERT INTO `v9_poster_201707` VALUES('29','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=4','1500852469','0');
INSERT INTO `v9_poster_201707` VALUES('30','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=5','1500852471','0');
INSERT INTO `v9_poster_201707` VALUES('31','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500852472','0');
INSERT INTO `v9_poster_201707` VALUES('32','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500852501','0');
INSERT INTO `v9_poster_201707` VALUES('33','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500852506','0');
INSERT INTO `v9_poster_201707` VALUES('34','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500852550','0');
INSERT INTO `v9_poster_201707` VALUES('35','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500853879','0');
INSERT INTO `v9_poster_201707` VALUES('36','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500853882','0');
INSERT INTO `v9_poster_201707` VALUES('37','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500854894','0');
INSERT INTO `v9_poster_201707` VALUES('38','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500855013','0');
INSERT INTO `v9_poster_201707` VALUES('39','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/m/index.php?m=content&c=index&a=lists&catid=2','1500858317','0');
INSERT INTO `v9_poster_201707` VALUES('40','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=tag&a=lists&tag=%E5%86%85%E8%A1%A3','1500858369','0');
INSERT INTO `v9_poster_201707` VALUES('41','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/m/index.php?m=content&c=index&a=lists&catid=1','1500860295','0');
INSERT INTO `v9_poster_201707` VALUES('42','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/m/index.php?m=content&c=index&a=lists&catid=2','1500860299','0');
INSERT INTO `v9_poster_201707` VALUES('43','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=tag&a=lists&tag=%E7%99%BD%E8%89%B2','1500865864','0');
INSERT INTO `v9_poster_201707` VALUES('44','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=tag&a=lists&tag=%E7%99%BD%E8%89%B2','1500865890','0');
INSERT INTO `v9_poster_201707` VALUES('45','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500866199','0');
INSERT INTO `v9_poster_201707` VALUES('46','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com//index.php','1500866212','0');
INSERT INTO `v9_poster_201707` VALUES('47','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com//index.php','1500866370','0');
INSERT INTO `v9_poster_201707` VALUES('48','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com//index.php','1500866428','0');
INSERT INTO `v9_poster_201707` VALUES('49','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com//index.php','1500866453','0');
INSERT INTO `v9_poster_201707` VALUES('50','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E5%A5%B3&imageField.x=0&imageField.y=0','1500866543','0');
INSERT INTO `v9_poster_201707` VALUES('51','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500866549','0');
INSERT INTO `v9_poster_201707` VALUES('52','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E7%BE%8E%E5%A5%B3&imageField.x=0&imageField.y=0','1500866684','0');
INSERT INTO `v9_poster_201707` VALUES('53','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E7%BE%8E%E5%A5%B3&imageField.x=0&imageField.y=0','1500866691','0');
INSERT INTO `v9_poster_201707` VALUES('54','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E7%BE%8E%E5%A5%B3&imageField.x=0&imageField.y=0','1500866709','0');
INSERT INTO `v9_poster_201707` VALUES('55','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E7%BE%8E%E5%A5%B3&imageField.x=0&imageField.y=0','1500866732','0');
INSERT INTO `v9_poster_201707` VALUES('56','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E7%BE%8E%E5%A5%B3&imageField.x=0&imageField.y=0','1500866754','0');
INSERT INTO `v9_poster_201707` VALUES('57','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E5%A5%B3&imageField.x=0&imageField.y=0','1500866757','0');
INSERT INTO `v9_poster_201707` VALUES('58','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E5%A5%B3&imageField.x=0&imageField.y=0','1500866768','0');
INSERT INTO `v9_poster_201707` VALUES('59','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500866848','0');
INSERT INTO `v9_poster_201707` VALUES('60','1','1','1','','IANA','42.156.251.205','http://s.2017.07.18mm.huhangnet.com/','1500867038','0');
INSERT INTO `v9_poster_201707` VALUES('61','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500869246','0');
INSERT INTO `v9_poster_201707` VALUES('62','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500869335','0');
INSERT INTO `v9_poster_201707` VALUES('63','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500876970','0');
INSERT INTO `v9_poster_201707` VALUES('64','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500876978','0');
INSERT INTO `v9_poster_201707` VALUES('65','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E7%8E%B0%E4%BB%A3&imageField.x=0&imageField.y=0','1500876986','0');
INSERT INTO `v9_poster_201707` VALUES('66','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/index.php?m=search&q=%E7%8E%B0%E4%BB%A3&imageField.x=0&imageField.y=0','1500877004','0');
INSERT INTO `v9_poster_201707` VALUES('67','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500877008','0');
INSERT INTO `v9_poster_201707` VALUES('68','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=3','1500877036','0');
INSERT INTO `v9_poster_201707` VALUES('69','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500877062','0');
INSERT INTO `v9_poster_201707` VALUES('70','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500877068','0');
INSERT INTO `v9_poster_201707` VALUES('71','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=1','1500877094','0');
INSERT INTO `v9_poster_201707` VALUES('72','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1500877096','0');
INSERT INTO `v9_poster_201707` VALUES('73','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500877304','0');
INSERT INTO `v9_poster_201707` VALUES('74','1','1','1','','美国','140.205.201.18','http://s.2017.07.18mm.huhangnet.com/','1500931756','0');
INSERT INTO `v9_poster_201707` VALUES('75','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500948383','0');
INSERT INTO `v9_poster_201707` VALUES('76','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=comment&c=index&a=init&commentid=content_6-5-1','1500948473','0');
INSERT INTO `v9_poster_201707` VALUES('77','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500948567','0');
INSERT INTO `v9_poster_201707` VALUES('78','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1500955044','0');
INSERT INTO `v9_poster_201707` VALUES('79','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1500974776','0');
INSERT INTO `v9_poster_201707` VALUES('80','1','1','1','','APNIC','121.58.217.54','http://s.2017.07.18mm.huhangnet.com/','1501136025','0');
INSERT INTO `v9_poster_201707` VALUES('81','1','1','1','','美国','8.28.16.254','','1501136145','0');
INSERT INTO `v9_poster_201707` VALUES('82','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/','1501469095','0');
INSERT INTO `v9_poster_201707` VALUES('83','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/list-1-1.html','1501469338','0');
INSERT INTO `v9_poster_201707` VALUES('84','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1501469343','0');
INSERT INTO `v9_poster_201707` VALUES('85','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/index.php?m=content&c=index&a=lists&catid=2','1501469362','0');
INSERT INTO `v9_poster_201707` VALUES('86','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/list-2-1.html','1501469364','0');
INSERT INTO `v9_poster_201707` VALUES('87','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/list-2-1.html','1501469438','0');
INSERT INTO `v9_poster_201707` VALUES('88','1','1','1','','LAN','127.0.0.1','http://s.2017.07.18mm.huhangnet.com/list-2-1.html','1501469468','0');
INSERT INTO `v9_poster_201707` VALUES('89','1','1','1','','LAN','127.0.0.1','http://m.2017.07.18mm.huhangnet.com/','1501470878','0');
INSERT INTO `v9_poster_201707` VALUES('90','1','1','1','','LAN','127.0.0.1','http://m.2017.07.18mm.huhangnet.com/','1501470996','0');
INSERT INTO `v9_poster_201707` VALUES('91','1','1','1','','LAN','127.0.0.1','http://wap.2017.07.18mm.huhangnet.com/index.php','1501471095','0');
INSERT INTO `v9_poster_201707` VALUES('92','1','1','1','','LAN','127.0.0.1','http://wap.2017.07.18mm.huhangnet.com/index.php','1501471408','0');

DROP TABLE IF EXISTS `v9_poster_space`;
CREATE TABLE `v9_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_poster_space` VALUES('1','1','首页右侧广告','banner','poster_js/1.js','234','60','{\"paddleft\":\"\",\"paddtop\":\"\"}','','1','0');

DROP TABLE IF EXISTS `v9_queue`;
CREATE TABLE `v9_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_release_point`;
CREATE TABLE `v9_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_search`;
CREATE TABLE `v9_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `v9_search` VALUES('1','3','1','1500828139','邻家女孩甜Abby3酥胸美臀粉嫩可爱 邻家 女孩 内衣 女孩 内衣 可爱','1');
INSERT INTO `v9_search` VALUES('2','3','2','1500828399','清纯美女Sukki豹纹SM秀白嫩美胸 豹纹 美女 内衣 美女 内衣 清纯','1');
INSERT INTO `v9_search` VALUES('3','3','3','1500828569','清纯少女刘奕宁Lynn酥胸覆白色内衣 白色 内衣 少女 内衣 少女 白色 清纯','1');
INSERT INTO `v9_search` VALUES('4','3','4','1500830824','内地艺人刘雨欣气质高清杂志图片 高清 艺人 气质 高清 气质 艺人 图片 杂志 内地','1');
INSERT INTO `v9_search` VALUES('5','3','5','1500830935','现代潘金莲龚玥菲气质写真 潘金莲 气质 龚玥菲 气质 写真 现代','1');

DROP TABLE IF EXISTS `v9_search_keyword`;
CREATE TABLE `v9_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_session`;
CREATE TABLE `v9_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

INSERT INTO `v9_session` VALUES('g8cfiectt2h25nseaclrhnc4a2','0','140.205.225.187','1501471642','0','0','attachment','attachments','swfupload_json','');
INSERT INTO `v9_session` VALUES('hehb18gfpd0dhv9tcp9g4v27m1','0','127.0.0.1','1501471428','0','0','','','','code|s:4:\"2pbr\";');
INSERT INTO `v9_session` VALUES('quvvgneemcuhnbn9o1230vuvi5','0','140.205.225.187','1501471411','0','0','member','index','register','');
INSERT INTO `v9_session` VALUES('8vdcnudldlcrs8oaecpru3q5g7','1','127.0.0.1','1501471055','1','0','admin','index','public_session_life','code|s:4:\"sv3y\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"bI8gXW\";lock_screen|i:0;');
INSERT INTO `v9_session` VALUES('vsidk4e3dh89arv0bi128a0r33','1','127.0.0.1','1501471677','1','0','admin','database','export','code|s:0:\"\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"o9v7uT\";lock_screen|i:0;');

DROP TABLE IF EXISTS `v9_site`;
CREATE TABLE `v9_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_site` VALUES('1','美女图片','','http://s.2017.07.18mm.huhangnet.com/','美女图片','美女图片','美女图片','','huhangnet','huhangnet','{\"upload_maxsize\":\"2048\",\"upload_allowext\":\"jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\",\"watermark_enable\":\"0\",\"watermark_minwidth\":\"300\",\"watermark_minheight\":\"300\",\"watermark_img\":\"statics\\/images\\/water\\/\\/mark.png\",\"watermark_pct\":\"85\",\"watermark_quality\":\"80\",\"watermark_pos\":\"9\"}','693b717c-2722-11e7-961b-00163e004142');

DROP TABLE IF EXISTS `v9_sms_report`;
CREATE TABLE `v9_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special`;
CREATE TABLE `v9_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special_c_data`;
CREATE TABLE `v9_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_special_content`;
CREATE TABLE `v9_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sphinx_counter`;
CREATE TABLE `v9_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_admin`;
CREATE TABLE `v9_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_admin` VALUES('1','admin','5bd67b7e573043356d8aff14900fded5','2b7b82','1','1492841649','127.0.0.1');

DROP TABLE IF EXISTS `v9_sso_applications`;
CREATE TABLE `v9_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_applications` VALUES('1','phpcms_v9','phpcms v9','http://s.hh.phpcms.huhangnet.com/','1z1gcRVcFWOvOgzniY96XVotqB695oDz','','api.php?op=phpsso','utf-8','1');

DROP TABLE IF EXISTS `v9_sso_members`;
CREATE TABLE `v9_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_messagequeue`;
CREATE TABLE `v9_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_session`;
CREATE TABLE `v9_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_sso_settings`;
CREATE TABLE `v9_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_sso_settings` VALUES('denyemail','');
INSERT INTO `v9_sso_settings` VALUES('denyusername','');
INSERT INTO `v9_sso_settings` VALUES('creditrate','');
INSERT INTO `v9_sso_settings` VALUES('sp4','');
INSERT INTO `v9_sso_settings` VALUES('ucenter','');

DROP TABLE IF EXISTS `v9_tag`;
CREATE TABLE `v9_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_template_bak`;
CREATE TABLE `v9_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_ticket`;
CREATE TABLE `v9_ticket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nocode` varchar(20) NOT NULL,
  `createdate` int(11) NOT NULL,
  `usedate` int(11) NOT NULL DEFAULT '0',
  `isuse` int(11) NOT NULL DEFAULT '0',
  `notice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nocode` (`nocode`)
) ENGINE=MyISAM AUTO_INCREMENT=1161 DEFAULT CHARSET=utf8;

INSERT INTO `v9_ticket` VALUES('1','xx4956853321','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('2','xx4956853322','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('3','xx4956853323','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('4','xx4956853324','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('5','xx4956853325','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('6','xx4956853326','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('7','xx4956853327','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('8','xx4956853328','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('9','xx4956853329','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('10','xx49568533210','1495685332','0','0','');
INSERT INTO `v9_ticket` VALUES('11','xx4956854761','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('12','xx4956854762','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('13','xx4956854763','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('14','xx4956854764','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('15','xx4956854765','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('16','xx4956854766','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('17','xx4956854767','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('18','xx4956854768','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('19','xx4956854769','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('20','xx49568547610','1495685476','0','0','');
INSERT INTO `v9_ticket` VALUES('21','xx4956855541','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('22','xx4956855542','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('23','xx4956855543','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('24','xx4956855544','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('25','xx4956855545','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('26','xx4956855546','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('27','xx4956855547','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('28','xx4956855548','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('29','xx4956855549','1495685554','0','0','');
INSERT INTO `v9_ticket` VALUES('1041','ee4956867511','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('31','wx4956855681','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('32','wx4956855682','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('33','wx4956855683','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('34','wx4956855684','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('35','wx4956855685','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('36','wx4956855686','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('37','wx4956855687','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('38','wx4956855688','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('39','wx4956855689','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('40','wx49568556810','1495685568','0','0','');
INSERT INTO `v9_ticket` VALUES('41','wx4956855861','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('42','wx4956855862','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('43','wx4956855863','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('44','wx4956855864','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('45','wx4956855865','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('46','wx4956855866','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('47','wx4956855867','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('48','wx4956855868','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('49','wx4956855869','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('50','wx49568558610','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('51','wx49568558611','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('52','wx49568558612','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('53','wx49568558613','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('54','wx49568558614','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('55','wx49568558615','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('56','wx49568558616','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('57','wx49568558617','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('58','wx49568558618','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('59','wx49568558619','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('60','wx49568558620','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('61','wx49568558621','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('62','wx49568558622','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('63','wx49568558623','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('64','wx49568558624','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('65','wx49568558625','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('66','wx49568558626','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('67','wx49568558627','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('68','wx49568558628','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('69','wx49568558629','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('70','wx49568558630','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('71','wx49568558631','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('72','wx49568558632','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('73','wx49568558633','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('74','wx49568558634','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('75','wx49568558635','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('76','wx49568558636','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('77','wx49568558637','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('78','wx49568558638','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('79','wx49568558639','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('80','wx49568558640','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('81','wx49568558641','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('82','wx49568558642','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('83','wx49568558643','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('84','wx49568558644','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('85','wx49568558645','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('86','wx49568558646','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('87','wx49568558647','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('88','wx49568558648','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('89','wx49568558649','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('90','wx49568558650','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('91','wx49568558651','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('92','wx49568558652','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('93','wx49568558653','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('94','wx49568558654','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('95','wx49568558655','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('96','wx49568558656','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('97','wx49568558657','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('98','wx49568558658','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('99','wx49568558659','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('100','wx49568558660','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('101','wx49568558661','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('102','wx49568558662','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('103','wx49568558663','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('104','wx49568558664','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('105','wx49568558665','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('106','wx49568558666','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('107','wx49568558667','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('108','wx49568558668','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('109','wx49568558669','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('110','wx49568558670','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('111','wx49568558671','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('112','wx49568558672','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('113','wx49568558673','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('114','wx49568558674','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('115','wx49568558675','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('116','wx49568558676','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('117','wx49568558677','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('118','wx49568558678','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('119','wx49568558679','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('120','wx49568558680','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('121','wx49568558681','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('122','wx49568558682','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('123','wx49568558683','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('124','wx49568558684','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('125','wx49568558685','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('126','wx49568558686','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('127','wx49568558687','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('128','wx49568558688','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('129','wx49568558689','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('130','wx49568558690','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('131','wx49568558691','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('132','wx49568558692','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('133','wx49568558693','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('134','wx49568558694','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('135','wx49568558695','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('136','wx49568558696','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('137','wx49568558697','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('138','wx49568558698','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('139','wx49568558699','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('140','wx495685586100','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('141','wx495685586101','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('142','wx495685586102','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('143','wx495685586103','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('144','wx495685586104','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('145','wx495685586105','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('146','wx495685586106','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('147','wx495685586107','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('148','wx495685586108','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('149','wx495685586109','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('150','wx495685586110','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('151','wx495685586111','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('152','wx495685586112','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('153','wx495685586113','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('154','wx495685586114','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('155','wx495685586115','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('156','wx495685586116','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('157','wx495685586117','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('158','wx495685586118','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('159','wx495685586119','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('160','wx495685586120','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('161','wx495685586121','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('162','wx495685586122','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('163','wx495685586123','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('164','wx495685586124','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('165','wx495685586125','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('166','wx495685586126','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('167','wx495685586127','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('168','wx495685586128','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('169','wx495685586129','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('170','wx495685586130','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('171','wx495685586131','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('172','wx495685586132','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('173','wx495685586133','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('174','wx495685586134','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('175','wx495685586135','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('176','wx495685586136','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('177','wx495685586137','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('178','wx495685586138','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('179','wx495685586139','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('180','wx495685586140','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('181','wx495685586141','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('182','wx495685586142','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('183','wx495685586143','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('184','wx495685586144','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('185','wx495685586145','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('186','wx495685586146','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('187','wx495685586147','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('188','wx495685586148','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('189','wx495685586149','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('190','wx495685586150','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('191','wx495685586151','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('192','wx495685586152','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('193','wx495685586153','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('194','wx495685586154','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('195','wx495685586155','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('196','wx495685586156','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('197','wx495685586157','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('198','wx495685586158','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('199','wx495685586159','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('200','wx495685586160','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('201','wx495685586161','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('202','wx495685586162','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('203','wx495685586163','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('204','wx495685586164','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('205','wx495685586165','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('206','wx495685586166','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('207','wx495685586167','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('208','wx495685586168','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('209','wx495685586169','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('210','wx495685586170','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('211','wx495685586171','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('212','wx495685586172','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('213','wx495685586173','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('214','wx495685586174','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('215','wx495685586175','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('216','wx495685586176','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('217','wx495685586177','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('218','wx495685586178','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('219','wx495685586179','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('220','wx495685586180','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('221','wx495685586181','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('222','wx495685586182','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('223','wx495685586183','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('224','wx495685586184','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('225','wx495685586185','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('226','wx495685586186','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('227','wx495685586187','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('228','wx495685586188','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('229','wx495685586189','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('230','wx495685586190','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('231','wx495685586191','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('232','wx495685586192','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('233','wx495685586193','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('234','wx495685586194','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('235','wx495685586195','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('236','wx495685586196','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('237','wx495685586197','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('238','wx495685586198','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('239','wx495685586199','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('240','wx495685586200','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('241','wx495685586201','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('242','wx495685586202','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('243','wx495685586203','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('244','wx495685586204','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('245','wx495685586205','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('246','wx495685586206','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('247','wx495685586207','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('248','wx495685586208','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('249','wx495685586209','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('250','wx495685586210','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('251','wx495685586211','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('252','wx495685586212','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('253','wx495685586213','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('254','wx495685586214','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('255','wx495685586215','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('256','wx495685586216','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('257','wx495685586217','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('258','wx495685586218','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('259','wx495685586219','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('260','wx495685586220','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('261','wx495685586221','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('262','wx495685586222','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('263','wx495685586223','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('264','wx495685586224','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('265','wx495685586225','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('266','wx495685586226','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('267','wx495685586227','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('268','wx495685586228','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('269','wx495685586229','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('270','wx495685586230','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('271','wx495685586231','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('272','wx495685586232','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('273','wx495685586233','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('274','wx495685586234','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('275','wx495685586235','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('276','wx495685586236','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('277','wx495685586237','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('278','wx495685586238','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('279','wx495685586239','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('280','wx495685586240','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('281','wx495685586241','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('282','wx495685586242','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('283','wx495685586243','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('284','wx495685586244','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('285','wx495685586245','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('286','wx495685586246','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('287','wx495685586247','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('288','wx495685586248','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('289','wx495685586249','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('290','wx495685586250','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('291','wx495685586251','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('292','wx495685586252','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('293','wx495685586253','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('294','wx495685586254','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('295','wx495685586255','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('296','wx495685586256','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('297','wx495685586257','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('298','wx495685586258','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('299','wx495685586259','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('300','wx495685586260','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('301','wx495685586261','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('302','wx495685586262','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('303','wx495685586263','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('304','wx495685586264','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('305','wx495685586265','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('306','wx495685586266','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('307','wx495685586267','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('308','wx495685586268','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('309','wx495685586269','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('310','wx495685586270','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('311','wx495685586271','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('312','wx495685586272','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('313','wx495685586273','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('314','wx495685586274','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('315','wx495685586275','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('316','wx495685586276','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('317','wx495685586277','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('318','wx495685586278','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('319','wx495685586279','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('320','wx495685586280','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('321','wx495685586281','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('322','wx495685586282','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('323','wx495685586283','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('324','wx495685586284','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('325','wx495685586285','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('326','wx495685586286','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('327','wx495685586287','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('328','wx495685586288','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('329','wx495685586289','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('330','wx495685586290','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('331','wx495685586291','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('332','wx495685586292','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('333','wx495685586293','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('334','wx495685586294','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('335','wx495685586295','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('336','wx495685586296','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('337','wx495685586297','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('338','wx495685586298','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('339','wx495685586299','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('340','wx495685586300','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('341','wx495685586301','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('342','wx495685586302','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('343','wx495685586303','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('344','wx495685586304','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('345','wx495685586305','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('346','wx495685586306','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('347','wx495685586307','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('348','wx495685586308','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('349','wx495685586309','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('350','wx495685586310','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('351','wx495685586311','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('352','wx495685586312','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('353','wx495685586313','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('354','wx495685586314','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('355','wx495685586315','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('356','wx495685586316','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('357','wx495685586317','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('358','wx495685586318','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('359','wx495685586319','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('360','wx495685586320','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('361','wx495685586321','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('362','wx495685586322','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('363','wx495685586323','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('364','wx495685586324','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('365','wx495685586325','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('366','wx495685586326','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('367','wx495685586327','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('368','wx495685586328','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('369','wx495685586329','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('370','wx495685586330','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('371','wx495685586331','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('372','wx495685586332','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('373','wx495685586333','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('374','wx495685586334','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('375','wx495685586335','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('376','wx495685586336','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('377','wx495685586337','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('378','wx495685586338','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('379','wx495685586339','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('380','wx495685586340','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('381','wx495685586341','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('382','wx495685586342','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('383','wx495685586343','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('384','wx495685586344','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('385','wx495685586345','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('386','wx495685586346','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('387','wx495685586347','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('388','wx495685586348','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('389','wx495685586349','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('390','wx495685586350','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('391','wx495685586351','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('392','wx495685586352','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('393','wx495685586353','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('394','wx495685586354','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('395','wx495685586355','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('396','wx495685586356','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('397','wx495685586357','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('398','wx495685586358','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('399','wx495685586359','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('400','wx495685586360','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('401','wx495685586361','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('402','wx495685586362','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('403','wx495685586363','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('404','wx495685586364','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('405','wx495685586365','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('406','wx495685586366','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('407','wx495685586367','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('408','wx495685586368','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('409','wx495685586369','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('410','wx495685586370','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('411','wx495685586371','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('412','wx495685586372','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('413','wx495685586373','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('414','wx495685586374','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('415','wx495685586375','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('416','wx495685586376','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('417','wx495685586377','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('418','wx495685586378','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('419','wx495685586379','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('420','wx495685586380','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('421','wx495685586381','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('422','wx495685586382','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('423','wx495685586383','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('424','wx495685586384','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('425','wx495685586385','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('426','wx495685586386','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('427','wx495685586387','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('428','wx495685586388','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('429','wx495685586389','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('430','wx495685586390','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('431','wx495685586391','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('432','wx495685586392','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('433','wx495685586393','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('434','wx495685586394','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('435','wx495685586395','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('436','wx495685586396','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('437','wx495685586397','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('438','wx495685586398','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('439','wx495685586399','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('440','wx495685586400','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('441','wx495685586401','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('442','wx495685586402','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('443','wx495685586403','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('444','wx495685586404','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('445','wx495685586405','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('446','wx495685586406','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('447','wx495685586407','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('448','wx495685586408','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('449','wx495685586409','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('450','wx495685586410','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('451','wx495685586411','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('452','wx495685586412','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('453','wx495685586413','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('454','wx495685586414','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('455','wx495685586415','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('456','wx495685586416','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('457','wx495685586417','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('458','wx495685586418','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('459','wx495685586419','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('460','wx495685586420','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('461','wx495685586421','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('462','wx495685586422','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('463','wx495685586423','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('464','wx495685586424','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('465','wx495685586425','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('466','wx495685586426','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('467','wx495685586427','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('468','wx495685586428','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('469','wx495685586429','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('470','wx495685586430','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('471','wx495685586431','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('472','wx495685586432','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('473','wx495685586433','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('474','wx495685586434','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('475','wx495685586435','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('476','wx495685586436','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('477','wx495685586437','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('478','wx495685586438','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('479','wx495685586439','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('480','wx495685586440','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('481','wx495685586441','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('482','wx495685586442','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('483','wx495685586443','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('484','wx495685586444','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('485','wx495685586445','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('486','wx495685586446','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('487','wx495685586447','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('488','wx495685586448','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('489','wx495685586449','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('490','wx495685586450','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('491','wx495685586451','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('492','wx495685586452','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('493','wx495685586453','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('494','wx495685586454','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('495','wx495685586455','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('496','wx495685586456','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('497','wx495685586457','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('498','wx495685586458','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('499','wx495685586459','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('500','wx495685586460','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('501','wx495685586461','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('502','wx495685586462','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('503','wx495685586463','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('504','wx495685586464','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('505','wx495685586465','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('506','wx495685586466','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('507','wx495685586467','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('508','wx495685586468','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('509','wx495685586469','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('510','wx495685586470','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('511','wx495685586471','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('512','wx495685586472','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('513','wx495685586473','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('514','wx495685586474','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('515','wx495685586475','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('516','wx495685586476','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('517','wx495685586477','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('518','wx495685586478','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('519','wx495685586479','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('520','wx495685586480','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('521','wx495685586481','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('522','wx495685586482','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('523','wx495685586483','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('524','wx495685586484','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('525','wx495685586485','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('526','wx495685586486','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('527','wx495685586487','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('528','wx495685586488','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('529','wx495685586489','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('530','wx495685586490','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('531','wx495685586491','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('532','wx495685586492','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('533','wx495685586493','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('534','wx495685586494','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('535','wx495685586495','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('536','wx495685586496','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('537','wx495685586497','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('538','wx495685586498','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('539','wx495685586499','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('540','wx495685586500','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('541','wx495685586501','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('542','wx495685586502','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('543','wx495685586503','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('544','wx495685586504','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('545','wx495685586505','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('546','wx495685586506','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('547','wx495685586507','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('548','wx495685586508','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('549','wx495685586509','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('550','wx495685586510','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('551','wx495685586511','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('552','wx495685586512','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('553','wx495685586513','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('554','wx495685586514','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('555','wx495685586515','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('556','wx495685586516','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('557','wx495685586517','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('558','wx495685586518','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('559','wx495685586519','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('560','wx495685586520','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('561','wx495685586521','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('562','wx495685586522','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('563','wx495685586523','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('564','wx495685586524','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('565','wx495685586525','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('566','wx495685586526','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('567','wx495685586527','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('568','wx495685586528','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('569','wx495685586529','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('570','wx495685586530','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('571','wx495685586531','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('572','wx495685586532','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('573','wx495685586533','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('574','wx495685586534','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('575','wx495685586535','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('576','wx495685586536','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('577','wx495685586537','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('578','wx495685586538','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('579','wx495685586539','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('580','wx495685586540','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('581','wx495685586541','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('582','wx495685586542','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('583','wx495685586543','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('584','wx495685586544','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('585','wx495685586545','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('586','wx495685586546','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('587','wx495685586547','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('588','wx495685586548','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('589','wx495685586549','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('590','wx495685586550','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('591','wx495685586551','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('592','wx495685586552','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('593','wx495685586553','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('594','wx495685586554','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('595','wx495685586555','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('596','wx495685586556','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('597','wx495685586557','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('598','wx495685586558','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('599','wx495685586559','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('600','wx495685586560','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('601','wx495685586561','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('602','wx495685586562','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('603','wx495685586563','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('604','wx495685586564','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('605','wx495685586565','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('606','wx495685586566','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('607','wx495685586567','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('608','wx495685586568','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('609','wx495685586569','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('610','wx495685586570','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('611','wx495685586571','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('612','wx495685586572','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('613','wx495685586573','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('614','wx495685586574','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('615','wx495685586575','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('616','wx495685586576','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('617','wx495685586577','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('618','wx495685586578','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('619','wx495685586579','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('620','wx495685586580','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('621','wx495685586581','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('622','wx495685586582','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('623','wx495685586583','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('624','wx495685586584','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('625','wx495685586585','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('626','wx495685586586','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('627','wx495685586587','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('628','wx495685586588','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('629','wx495685586589','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('630','wx495685586590','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('631','wx495685586591','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('632','wx495685586592','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('633','wx495685586593','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('634','wx495685586594','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('635','wx495685586595','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('636','wx495685586596','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('637','wx495685586597','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('638','wx495685586598','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('639','wx495685586599','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('640','wx495685586600','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('641','wx495685586601','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('642','wx495685586602','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('643','wx495685586603','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('644','wx495685586604','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('645','wx495685586605','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('646','wx495685586606','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('647','wx495685586607','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('648','wx495685586608','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('649','wx495685586609','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('650','wx495685586610','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('651','wx495685586611','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('652','wx495685586612','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('653','wx495685586613','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('654','wx495685586614','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('655','wx495685586615','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('656','wx495685586616','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('657','wx495685586617','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('658','wx495685586618','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('659','wx495685586619','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('660','wx495685586620','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('661','wx495685586621','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('662','wx495685586622','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('663','wx495685586623','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('664','wx495685586624','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('665','wx495685586625','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('666','wx495685586626','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('667','wx495685586627','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('668','wx495685586628','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('669','wx495685586629','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('670','wx495685586630','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('671','wx495685586631','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('672','wx495685586632','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('673','wx495685586633','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('674','wx495685586634','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('675','wx495685586635','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('676','wx495685586636','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('677','wx495685586637','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('678','wx495685586638','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('679','wx495685586639','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('680','wx495685586640','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('681','wx495685586641','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('682','wx495685586642','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('683','wx495685586643','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('684','wx495685586644','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('685','wx495685586645','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('686','wx495685586646','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('687','wx495685586647','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('688','wx495685586648','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('689','wx495685586649','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('690','wx495685586650','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('691','wx495685586651','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('692','wx495685586652','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('693','wx495685586653','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('694','wx495685586654','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('695','wx495685586655','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('696','wx495685586656','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('697','wx495685586657','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('698','wx495685586658','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('699','wx495685586659','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('700','wx495685586660','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('701','wx495685586661','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('702','wx495685586662','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('703','wx495685586663','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('704','wx495685586664','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('705','wx495685586665','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('706','wx495685586666','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('707','wx495685586667','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('708','wx495685586668','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('709','wx495685586669','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('710','wx495685586670','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('711','wx495685586671','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('712','wx495685586672','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('713','wx495685586673','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('714','wx495685586674','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('715','wx495685586675','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('716','wx495685586676','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('717','wx495685586677','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('718','wx495685586678','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('719','wx495685586679','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('720','wx495685586680','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('721','wx495685586681','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('722','wx495685586682','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('723','wx495685586683','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('724','wx495685586684','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('725','wx495685586685','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('726','wx495685586686','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('727','wx495685586687','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('728','wx495685586688','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('729','wx495685586689','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('730','wx495685586690','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('731','wx495685586691','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('732','wx495685586692','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('733','wx495685586693','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('734','wx495685586694','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('735','wx495685586695','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('736','wx495685586696','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('737','wx495685586697','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('738','wx495685586698','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('739','wx495685586699','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('740','wx495685586700','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('741','wx495685586701','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('742','wx495685586702','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('743','wx495685586703','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('744','wx495685586704','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('745','wx495685586705','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('746','wx495685586706','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('747','wx495685586707','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('748','wx495685586708','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('749','wx495685586709','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('750','wx495685586710','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('751','wx495685586711','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('752','wx495685586712','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('753','wx495685586713','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('754','wx495685586714','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('755','wx495685586715','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('756','wx495685586716','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('757','wx495685586717','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('758','wx495685586718','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('759','wx495685586719','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('760','wx495685586720','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('761','wx495685586721','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('762','wx495685586722','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('763','wx495685586723','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('764','wx495685586724','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('765','wx495685586725','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('766','wx495685586726','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('767','wx495685586727','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('768','wx495685586728','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('769','wx495685586729','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('770','wx495685586730','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('771','wx495685586731','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('772','wx495685586732','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('773','wx495685586733','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('774','wx495685586734','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('775','wx495685586735','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('776','wx495685586736','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('777','wx495685586737','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('778','wx495685586738','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('779','wx495685586739','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('780','wx495685586740','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('781','wx495685586741','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('782','wx495685586742','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('783','wx495685586743','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('784','wx495685586744','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('785','wx495685586745','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('786','wx495685586746','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('787','wx495685586747','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('788','wx495685586748','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('789','wx495685586749','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('790','wx495685586750','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('791','wx495685586751','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('792','wx495685586752','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('793','wx495685586753','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('794','wx495685586754','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('795','wx495685586755','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('796','wx495685586756','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('797','wx495685586757','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('798','wx495685586758','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('799','wx495685586759','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('800','wx495685586760','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('801','wx495685586761','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('802','wx495685586762','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('803','wx495685586763','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('804','wx495685586764','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('805','wx495685586765','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('806','wx495685586766','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('807','wx495685586767','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('808','wx495685586768','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('809','wx495685586769','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('810','wx495685586770','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('811','wx495685586771','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('812','wx495685586772','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('813','wx495685586773','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('814','wx495685586774','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('815','wx495685586775','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('816','wx495685586776','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('817','wx495685586777','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('818','wx495685586778','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('819','wx495685586779','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('820','wx495685586780','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('821','wx495685586781','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('822','wx495685586782','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('823','wx495685586783','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('824','wx495685586784','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('825','wx495685586785','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('826','wx495685586786','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('827','wx495685586787','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('828','wx495685586788','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('829','wx495685586789','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('830','wx495685586790','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('831','wx495685586791','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('832','wx495685586792','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('833','wx495685586793','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('834','wx495685586794','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('835','wx495685586795','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('836','wx495685586796','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('837','wx495685586797','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('838','wx495685586798','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('839','wx495685586799','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('840','wx495685586800','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('841','wx495685586801','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('842','wx495685586802','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('843','wx495685586803','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('844','wx495685586804','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('845','wx495685586805','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('846','wx495685586806','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('847','wx495685586807','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('848','wx495685586808','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('849','wx495685586809','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('850','wx495685586810','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('851','wx495685586811','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('852','wx495685586812','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('853','wx495685586813','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('854','wx495685586814','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('855','wx495685586815','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('856','wx495685586816','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('857','wx495685586817','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('858','wx495685586818','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('859','wx495685586819','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('860','wx495685586820','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('861','wx495685586821','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('862','wx495685586822','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('863','wx495685586823','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('864','wx495685586824','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('865','wx495685586825','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('866','wx495685586826','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('867','wx495685586827','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('868','wx495685586828','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('869','wx495685586829','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('870','wx495685586830','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('871','wx495685586831','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('872','wx495685586832','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('873','wx495685586833','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('874','wx495685586834','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('875','wx495685586835','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('876','wx495685586836','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('877','wx495685586837','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('878','wx495685586838','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('879','wx495685586839','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('880','wx495685586840','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('881','wx495685586841','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('882','wx495685586842','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('883','wx495685586843','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('884','wx495685586844','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('885','wx495685586845','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('886','wx495685586846','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('887','wx495685586847','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('888','wx495685586848','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('889','wx495685586849','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('890','wx495685586850','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('891','wx495685586851','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('892','wx495685586852','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('893','wx495685586853','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('894','wx495685586854','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('895','wx495685586855','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('896','wx495685586856','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('897','wx495685586857','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('898','wx495685586858','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('899','wx495685586859','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('900','wx495685586860','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('901','wx495685586861','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('902','wx495685586862','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('903','wx495685586863','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('904','wx495685586864','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('905','wx495685586865','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('906','wx495685586866','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('907','wx495685586867','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('908','wx495685586868','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('909','wx495685586869','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('910','wx495685586870','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('911','wx495685586871','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('912','wx495685586872','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('913','wx495685586873','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('914','wx495685586874','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('915','wx495685586875','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('916','wx495685586876','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('917','wx495685586877','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('918','wx495685586878','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('919','wx495685586879','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('920','wx495685586880','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('921','wx495685586881','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('922','wx495685586882','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('923','wx495685586883','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('924','wx495685586884','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('925','wx495685586885','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('926','wx495685586886','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('927','wx495685586887','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('928','wx495685586888','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('929','wx495685586889','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('930','wx495685586890','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('931','wx495685586891','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('932','wx495685586892','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('933','wx495685586893','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('934','wx495685586894','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('935','wx495685586895','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('936','wx495685586896','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('937','wx495685586897','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('938','wx495685586898','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('939','wx495685586899','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('940','wx495685586900','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('941','wx495685586901','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('942','wx495685586902','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('943','wx495685586903','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('944','wx495685586904','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('945','wx495685586905','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('946','wx495685586906','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('947','wx495685586907','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('948','wx495685586908','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('949','wx495685586909','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('950','wx495685586910','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('951','wx495685586911','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('952','wx495685586912','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('953','wx495685586913','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('954','wx495685586914','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('955','wx495685586915','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('956','wx495685586916','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('957','wx495685586917','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('958','wx495685586918','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('959','wx495685586919','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('960','wx495685586920','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('961','wx495685586921','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('962','wx495685586922','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('963','wx495685586923','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('964','wx495685586924','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('965','wx495685586925','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('966','wx495685586926','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('967','wx495685586927','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('968','wx495685586928','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('969','wx495685586929','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('970','wx495685586930','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('971','wx495685586931','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('972','wx495685586932','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('973','wx495685586933','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('974','wx495685586934','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('975','wx495685586935','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('976','wx495685586936','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('977','wx495685586937','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('978','wx495685586938','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('979','wx495685586939','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('980','wx495685586940','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('981','wx495685586941','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('982','wx495685586942','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('983','wx495685586943','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('984','wx495685586944','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('985','wx495685586945','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('986','wx495685586946','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('987','wx495685586947','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('988','wx495685586948','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('989','wx495685586949','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('990','wx495685586950','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('991','wx495685586951','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('992','wx495685586952','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('993','wx495685586953','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('994','wx495685586954','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('995','wx495685586955','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('996','wx495685586956','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('997','wx495685586957','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('998','wx495685586958','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('999','wx495685586959','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1000','wx495685586960','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1001','wx495685586961','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1002','wx495685586962','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1003','wx495685586963','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1004','wx495685586964','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1005','wx495685586965','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1006','wx495685586966','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1007','wx495685586967','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1008','wx495685586968','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1009','wx495685586969','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1010','wx495685586970','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1011','wx495685586971','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1012','wx495685586972','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1013','wx495685586973','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1014','wx495685586974','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1015','wx495685586975','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1016','wx495685586976','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1017','wx495685586977','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1018','wx495685586978','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1019','wx495685586979','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1020','wx495685586980','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1021','wx495685586981','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1022','wx495685586982','1495685586','1495686515','1','');
INSERT INTO `v9_ticket` VALUES('1023','wx495685586983','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1024','wx495685586984','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1025','wx495685586985','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1026','wx495685586986','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1027','wx495685586987','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1028','wx495685586988','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1029','wx495685586989','1495685586','1495686501','1','');
INSERT INTO `v9_ticket` VALUES('1030','wx495685586990','1495685586','1495686509','1','');
INSERT INTO `v9_ticket` VALUES('1031','wx495685586991','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1032','wx495685586992','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1033','wx495685586993','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1034','wx495685586994','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1035','wx495685586995','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1036','wx495685586996','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1037','wx495685586997','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1038','wx495685586998','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1039','wx495685586999','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1040','wx4956855861000','1495685586','0','0','');
INSERT INTO `v9_ticket` VALUES('1042','ee4956867512','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1043','ee4956867513','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1044','ee4956867514','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1045','ee4956867515','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1046','ee4956867516','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1047','ee4956867517','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1048','ee4956867518','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1049','ee4956867519','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1050','ee49568675110','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1051','ee49568675111','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1052','ee49568675112','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1053','ee49568675113','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1054','ee49568675114','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1055','ee49568675115','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1056','ee49568675116','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1057','ee49568675117','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1058','ee49568675118','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1059','ee49568675119','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1060','ee49568675120','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1061','ee49568675121','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1062','ee49568675122','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1063','ee49568675123','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1064','ee49568675124','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1065','ee49568675125','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1066','ee49568675126','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1067','ee49568675127','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1068','ee49568675128','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1069','ee49568675129','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1070','ee49568675130','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1071','ee49568675131','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1072','ee49568675132','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1073','ee49568675133','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1074','ee49568675134','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1075','ee49568675135','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1076','ee49568675136','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1077','ee49568675137','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1078','ee49568675138','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1079','ee49568675139','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1080','ee49568675140','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1081','ee49568675141','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1082','ee49568675142','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1083','ee49568675143','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1084','ee49568675144','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1085','ee49568675145','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1086','ee49568675146','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1087','ee49568675147','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1088','ee49568675148','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1089','ee49568675149','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1090','ee49568675150','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1091','ee49568675151','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1092','ee49568675152','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1093','ee49568675153','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1094','ee49568675154','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1095','ee49568675155','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1096','ee49568675156','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1097','ee49568675157','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1098','ee49568675158','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1099','ee49568675159','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1100','ee49568675160','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1101','ee49568675161','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1102','ee49568675162','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1103','ee49568675163','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1104','ee49568675164','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1105','ee49568675165','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1106','ee49568675166','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1107','ee49568675167','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1108','ee49568675168','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1109','ee49568675169','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1110','ee49568675170','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1111','ee49568675171','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1112','ee49568675172','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1113','ee49568675173','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1114','ee49568675174','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1115','ee49568675175','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1116','ee49568675176','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1117','ee49568675177','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1118','ee49568675178','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1119','ee49568675179','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1120','ee49568675180','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1121','ee49568675181','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1122','ee49568675182','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1123','ee49568675183','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1124','ee49568675184','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1125','ee49568675185','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1126','ee49568675186','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1127','ee49568675187','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1128','ee49568675188','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1129','ee49568675189','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1130','ee49568675190','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1131','ee49568675191','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1132','ee49568675192','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1133','ee49568675193','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1134','ee49568675194','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1135','ee49568675195','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1136','ee49568675196','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1137','ee49568675197','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1138','ee49568675198','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1139','ee49568675199','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1140','ee495686751100','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1141','ee495686751101','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1142','ee495686751102','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1143','ee495686751103','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1144','ee495686751104','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1145','ee495686751105','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1146','ee495686751106','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1147','ee495686751107','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1148','ee495686751108','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1149','ee495686751109','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1150','ee495686751110','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1151','ee495686751111','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1152','ee495686751112','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1153','ee495686751113','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1154','ee495686751114','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1155','ee495686751115','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1156','ee495686751116','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1157','ee495686751117','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1158','ee495686751118','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1159','ee495686751119','1495686751','0','0','');
INSERT INTO `v9_ticket` VALUES('1160','ee495686751120','1495686751','0','0','');

DROP TABLE IF EXISTS `v9_times`;
CREATE TABLE `v9_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_type`;
CREATE TABLE `v9_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

INSERT INTO `v9_type` VALUES('52','1','search','0','专题','0','special','','','4','专题');
INSERT INTO `v9_type` VALUES('1','1','search','1','新闻','0','','','','1','新闻模型搜索');
INSERT INTO `v9_type` VALUES('2','1','search','2','下载','0','','','','3','下载模型搜索');
INSERT INTO `v9_type` VALUES('3','1','search','3','图片','0','','','','2','图片模型搜索');

DROP TABLE IF EXISTS `v9_urlrule`;
CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

INSERT INTO `v9_urlrule` VALUES('1','content','category','1','{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html','news/china/1000.html');
INSERT INTO `v9_urlrule` VALUES('6','content','category','0','index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}','index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `v9_urlrule` VALUES('11','content','show','1','{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html','2010/catdir_0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('12','content','show','1','{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html','it/product/2010/0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES('16','content','show','0','index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}','index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `v9_urlrule` VALUES('17','content','show','0','show-{$catid}-{$id}-{$page}.html','show-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('18','content','show','0','content-{$catid}-{$id}-{$page}.html','content-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES('30','content','category','0','list-{$catid}-{$page}.html','list-1-1.html');

DROP TABLE IF EXISTS `v9_vote_data`;
CREATE TABLE `v9_vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_vote_option`;
CREATE TABLE `v9_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_vote_subject`;
CREATE TABLE `v9_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '0000-00-00',
  `todate` date NOT NULL DEFAULT '0000-00-00',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_wap`;
CREATE TABLE `v9_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `v9_wap` VALUES('1','PHPCMS手机门户','/statics/images/wap/wlogo.gif','','array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)','1');

DROP TABLE IF EXISTS `v9_wap_type`;
CREATE TABLE `v9_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `v9_workflow`;
CREATE TABLE `v9_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `v9_workflow` VALUES('1','1','1','一级审核','审核一次','','0');
INSERT INTO `v9_workflow` VALUES('2','1','2','二级审核','审核两次','','0');
INSERT INTO `v9_workflow` VALUES('3','1','3','三级审核','审核三次','','0');
INSERT INTO `v9_workflow` VALUES('4','1','4','四级审核','四级审核','','0');

