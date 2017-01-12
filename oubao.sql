/*
Navicat MySQL Data Transfer

Source Server         : web
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : oubao

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-11-18 15:09:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tp_action
-- ----------------------------
DROP TABLE IF EXISTS `tp_action`;
CREATE TABLE `tp_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of tp_action
-- ----------------------------
INSERT INTO `tp_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `tp_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `tp_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `tp_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `tp_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `tp_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `tp_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `tp_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `tp_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `tp_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1476946213');
INSERT INTO `tp_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1476842786');

-- ----------------------------
-- Table structure for tp_action_log
-- ----------------------------
DROP TABLE IF EXISTS `tp_action_log`;
CREATE TABLE `tp_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=231 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- ----------------------------
-- Records of tp_action_log
-- ----------------------------
INSERT INTO `tp_action_log` VALUES ('8', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-04 16:00登录了后台', '1', '1472976001');
INSERT INTO `tp_action_log` VALUES ('9', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-04 16:02登录了后台', '1', '1472976167');
INSERT INTO `tp_action_log` VALUES ('10', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-04 16:04登录了后台', '1', '1472976290');
INSERT INTO `tp_action_log` VALUES ('11', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-04 16:06登录了后台', '1', '1472976383');
INSERT INTO `tp_action_log` VALUES ('12', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-04 16:07登录了后台', '1', '1472976473');
INSERT INTO `tp_action_log` VALUES ('13', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-04 18:31登录了后台', '1', '1472985111');
INSERT INTO `tp_action_log` VALUES ('14', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-13 09:56登录了后台', '1', '1473731786');
INSERT INTO `tp_action_log` VALUES ('15', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-13 09:57登录了后台', '1', '1473731828');
INSERT INTO `tp_action_log` VALUES ('16', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-13 09:57登录了后台', '1', '1473731879');
INSERT INTO `tp_action_log` VALUES ('17', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-13 09:58登录了后台', '1', '1473731912');
INSERT INTO `tp_action_log` VALUES ('18', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-13 10:00登录了后台', '1', '1473732046');
INSERT INTO `tp_action_log` VALUES ('19', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-14 09:12登录了后台', '1', '1473815546');
INSERT INTO `tp_action_log` VALUES ('20', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-21 10:03登录了后台', '1', '1474423398');
INSERT INTO `tp_action_log` VALUES ('21', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/add.html', '1', '1474446087');
INSERT INTO `tp_action_log` VALUES ('22', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-22 08:51登录了后台', '1', '1474505484');
INSERT INTO `tp_action_log` VALUES ('23', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-22 09:35登录了后台', '1', '1474508100');
INSERT INTO `tp_action_log` VALUES ('24', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/add.html', '1', '1474511979');
INSERT INTO `tp_action_log` VALUES ('25', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474512050');
INSERT INTO `tp_action_log` VALUES ('26', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/add.html', '1', '1474512063');
INSERT INTO `tp_action_log` VALUES ('27', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474512605');
INSERT INTO `tp_action_log` VALUES ('28', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474512722');
INSERT INTO `tp_action_log` VALUES ('29', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474512733');
INSERT INTO `tp_action_log` VALUES ('30', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474513628');
INSERT INTO `tp_action_log` VALUES ('31', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474513639');
INSERT INTO `tp_action_log` VALUES ('32', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474513685');
INSERT INTO `tp_action_log` VALUES ('33', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474513782');
INSERT INTO `tp_action_log` VALUES ('34', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474513897');
INSERT INTO `tp_action_log` VALUES ('35', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474513913');
INSERT INTO `tp_action_log` VALUES ('36', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474515125');
INSERT INTO `tp_action_log` VALUES ('37', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474515336');
INSERT INTO `tp_action_log` VALUES ('38', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474515678');
INSERT INTO `tp_action_log` VALUES ('39', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474515689');
INSERT INTO `tp_action_log` VALUES ('40', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474516244');
INSERT INTO `tp_action_log` VALUES ('41', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474516266');
INSERT INTO `tp_action_log` VALUES ('42', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474518839');
INSERT INTO `tp_action_log` VALUES ('43', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474519434');
INSERT INTO `tp_action_log` VALUES ('44', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474522128');
INSERT INTO `tp_action_log` VALUES ('45', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474523589');
INSERT INTO `tp_action_log` VALUES ('46', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474523608');
INSERT INTO `tp_action_log` VALUES ('47', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/add.html', '1', '1474523649');
INSERT INTO `tp_action_log` VALUES ('48', '11', '1', '2130706433', 'category', '2', '操作url：/admin.php?s=/Category/add.html', '1', '1474523655');
INSERT INTO `tp_action_log` VALUES ('49', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1474523904');
INSERT INTO `tp_action_log` VALUES ('50', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/edit.html', '1', '1474523922');
INSERT INTO `tp_action_log` VALUES ('51', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/edit.html', '1', '1474523949');
INSERT INTO `tp_action_log` VALUES ('52', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/add.html', '1', '1474524627');
INSERT INTO `tp_action_log` VALUES ('53', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474524632');
INSERT INTO `tp_action_log` VALUES ('54', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474524647');
INSERT INTO `tp_action_log` VALUES ('55', '11', '1', '2130706433', 'category', '1', '操作url：/admin.php?s=/Category/remove/id/1', '1', '1474524659');
INSERT INTO `tp_action_log` VALUES ('56', '11', '1', '2130706433', 'category', '39', '操作url：/admin.php?s=/Category/remove/id/39', '1', '1474524667');
INSERT INTO `tp_action_log` VALUES ('57', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/add.html', '1', '1474524724');
INSERT INTO `tp_action_log` VALUES ('58', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474524742');
INSERT INTO `tp_action_log` VALUES ('59', '11', '1', '2130706433', 'category', '42', '操作url：/admin.php?s=/Category/add.html', '1', '1474526797');
INSERT INTO `tp_action_log` VALUES ('60', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/add.html', '1', '1474526885');
INSERT INTO `tp_action_log` VALUES ('61', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/add.html', '1', '1474527014');
INSERT INTO `tp_action_log` VALUES ('62', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474527552');
INSERT INTO `tp_action_log` VALUES ('63', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1474528055');
INSERT INTO `tp_action_log` VALUES ('64', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474529260');
INSERT INTO `tp_action_log` VALUES ('65', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474529277');
INSERT INTO `tp_action_log` VALUES ('66', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474535715');
INSERT INTO `tp_action_log` VALUES ('67', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474535784');
INSERT INTO `tp_action_log` VALUES ('68', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474536312');
INSERT INTO `tp_action_log` VALUES ('69', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474536587');
INSERT INTO `tp_action_log` VALUES ('70', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1474536836');
INSERT INTO `tp_action_log` VALUES ('71', '1', '1', '2130706433', 'member', '1', 'admin在2016-09-23 09:25登录了后台', '1', '1474593954');
INSERT INTO `tp_action_log` VALUES ('72', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1474594340');
INSERT INTO `tp_action_log` VALUES ('73', '7', '1', '2130706433', 'model', '2', '操作url：/admin.php?s=/Model/update.html', '1', '1475984788');
INSERT INTO `tp_action_log` VALUES ('74', '6', '1', '2130706433', 'config', '35', '操作url：/admin.php?s=/Config/edit.html', '1', '1476002742');
INSERT INTO `tp_action_log` VALUES ('75', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-10 09:08登录了后台', '1', '1476061685');
INSERT INTO `tp_action_log` VALUES ('76', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-11 09:07登录了后台', '1', '1476148048');
INSERT INTO `tp_action_log` VALUES ('77', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-12 09:13登录了后台', '1', '1476234783');
INSERT INTO `tp_action_log` VALUES ('78', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-12 16:04登录了后台', '1', '1476259451');
INSERT INTO `tp_action_log` VALUES ('79', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-13 09:06登录了后台', '1', '1476320780');
INSERT INTO `tp_action_log` VALUES ('80', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-14 08:56登录了后台', '1', '1476406570');
INSERT INTO `tp_action_log` VALUES ('81', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-17 09:17登录了后台', '1', '1476667027');
INSERT INTO `tp_action_log` VALUES ('82', '7', '1', '2130706433', 'model', '1', '操作url：/admin.php?s=/Model/update.html', '1', '1476667488');
INSERT INTO `tp_action_log` VALUES ('83', '8', '1', '2130706433', 'attribute', '17', '操作url：/admin.php?s=/Attribute/update.html', '1', '1476671041');
INSERT INTO `tp_action_log` VALUES ('84', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-18 09:15登录了后台', '1', '1476753305');
INSERT INTO `tp_action_log` VALUES ('85', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1476760577');
INSERT INTO `tp_action_log` VALUES ('86', '11', '1', '2130706433', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1476760586');
INSERT INTO `tp_action_log` VALUES ('87', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/edit.html', '1', '1476760592');
INSERT INTO `tp_action_log` VALUES ('88', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-19 09:14登录了后台', '1', '1476839661');
INSERT INTO `tp_action_log` VALUES ('89', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-20 08:54登录了后台', '1', '1476924859');
INSERT INTO `tp_action_log` VALUES ('90', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1476928026');
INSERT INTO `tp_action_log` VALUES ('91', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/edit.html', '1', '1476944190');
INSERT INTO `tp_action_log` VALUES ('92', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1476951190');
INSERT INTO `tp_action_log` VALUES ('93', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-20 16:30登录了后台', '1', '1476952247');
INSERT INTO `tp_action_log` VALUES ('94', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-20 16:35登录了后台', '1', '1476952509');
INSERT INTO `tp_action_log` VALUES ('95', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-24 09:01登录了后台', '1', '1477270904');
INSERT INTO `tp_action_log` VALUES ('96', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin.php?s=/Menu/edit.html', '1', '1477287978');
INSERT INTO `tp_action_log` VALUES ('97', '10', '1', '2130706433', 'Menu', '0', '操作url：/admin.php?s=/Menu/del.html', '1', '1477289875');
INSERT INTO `tp_action_log` VALUES ('98', '10', '1', '2130706433', 'Menu', '1', '操作url：/admin.php?s=/Menu/edit.html', '1', '1477291876');
INSERT INTO `tp_action_log` VALUES ('99', '10', '1', '2130706433', 'Menu', '2', '操作url：/admin.php?s=/Menu/edit.html', '1', '1477291901');
INSERT INTO `tp_action_log` VALUES ('100', '10', '1', '2130706433', 'Menu', '16', '操作url：/admin.php?s=/Menu/edit.html', '1', '1477291920');
INSERT INTO `tp_action_log` VALUES ('101', '10', '1', '2130706433', 'Menu', '68', '操作url：/admin.php?s=/Menu/edit.html', '1', '1477291939');
INSERT INTO `tp_action_log` VALUES ('102', '10', '1', '2130706433', 'Menu', '93', '操作url：/admin.php?s=/Menu/edit.html', '1', '1477292009');
INSERT INTO `tp_action_log` VALUES ('103', '10', '1', '2130706433', 'Menu', '125', '操作url：/admin.php?s=/Menu/edit.html', '1', '1477292128');
INSERT INTO `tp_action_log` VALUES ('104', '10', '1', '2130706433', 'Menu', '126', '操作url：/admin.php?s=/Menu/add.html', '1', '1477292211');
INSERT INTO `tp_action_log` VALUES ('105', '10', '1', '2130706433', 'Menu', '127', '操作url：/admin.php?s=/Menu/add.html', '1', '1477292260');
INSERT INTO `tp_action_log` VALUES ('106', '10', '1', '2130706433', 'Menu', '128', '操作url：/admin.php?s=/Menu/add.html', '1', '1477292290');
INSERT INTO `tp_action_log` VALUES ('107', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-25 08:52登录了后台', '1', '1477356769');
INSERT INTO `tp_action_log` VALUES ('108', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477365553');
INSERT INTO `tp_action_log` VALUES ('109', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477370265');
INSERT INTO `tp_action_log` VALUES ('110', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1477370277');
INSERT INTO `tp_action_log` VALUES ('111', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1477371157');
INSERT INTO `tp_action_log` VALUES ('112', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/edit.html', '1', '1477373559');
INSERT INTO `tp_action_log` VALUES ('113', '11', '1', '2130706433', 'category', '42', '操作url：/admin.php?s=/Category/edit.html', '1', '1477373577');
INSERT INTO `tp_action_log` VALUES ('114', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/edit.html', '1', '1477373592');
INSERT INTO `tp_action_log` VALUES ('115', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477453387');
INSERT INTO `tp_action_log` VALUES ('116', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin.php?s=/Attribute/update.html', '1', '1477468694');
INSERT INTO `tp_action_log` VALUES ('117', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1477469194');
INSERT INTO `tp_action_log` VALUES ('118', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1477469212');
INSERT INTO `tp_action_log` VALUES ('119', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1477469243');
INSERT INTO `tp_action_log` VALUES ('120', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1477469283');
INSERT INTO `tp_action_log` VALUES ('121', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1477469331');
INSERT INTO `tp_action_log` VALUES ('122', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/edit.html', '1', '1477469616');
INSERT INTO `tp_action_log` VALUES ('123', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/edit.html', '1', '1477469676');
INSERT INTO `tp_action_log` VALUES ('124', '1', '1', '2130706433', 'member', '1', 'admin在2016-10-27 09:12登录了后台', '1', '1477530747');
INSERT INTO `tp_action_log` VALUES ('125', '11', '1', '2130706433', 'category', '45', '操作url：/admin.php?s=/Category/add.html', '1', '1477639246');
INSERT INTO `tp_action_log` VALUES ('126', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477639344');
INSERT INTO `tp_action_log` VALUES ('127', '11', '1', '2130706433', 'category', '43', '操作url：/admin.php?s=/Category/remove/id/43', '1', '1477639581');
INSERT INTO `tp_action_log` VALUES ('128', '11', '1', '2130706433', 'category', '44', '操作url：/admin.php?s=/Category/edit.html', '1', '1477639698');
INSERT INTO `tp_action_log` VALUES ('129', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/add.html', '1', '1477639810');
INSERT INTO `tp_action_log` VALUES ('130', '11', '1', '2130706433', 'category', '47', '操作url：/admin.php?s=/Category/add.html', '1', '1477639925');
INSERT INTO `tp_action_log` VALUES ('131', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/add.html', '1', '1477640096');
INSERT INTO `tp_action_log` VALUES ('132', '11', '1', '2130706433', 'category', '49', '操作url：/admin.php?s=/Category/add.html', '1', '1477640148');
INSERT INTO `tp_action_log` VALUES ('133', '11', '1', '2130706433', 'category', '50', '操作url：/admin.php?s=/Category/add.html', '1', '1477640281');
INSERT INTO `tp_action_log` VALUES ('134', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/add.html', '1', '1477640525');
INSERT INTO `tp_action_log` VALUES ('135', '11', '1', '2130706433', 'category', '52', '操作url：/admin.php?s=/Category/add.html', '1', '1477640903');
INSERT INTO `tp_action_log` VALUES ('136', '11', '1', '2130706433', 'category', '53', '操作url：/admin.php?s=/Category/add.html', '1', '1477641011');
INSERT INTO `tp_action_log` VALUES ('137', '11', '1', '2130706433', 'category', '54', '操作url：/admin.php?s=/Category/add.html', '1', '1477642122');
INSERT INTO `tp_action_log` VALUES ('138', '11', '1', '2130706433', 'category', '55', '操作url：/admin.php?s=/Category/add.html', '1', '1477642250');
INSERT INTO `tp_action_log` VALUES ('139', '11', '1', '2130706433', 'category', '56', '操作url：/admin.php?s=/Category/add.html', '1', '1477642302');
INSERT INTO `tp_action_log` VALUES ('140', '11', '1', '2130706433', 'category', '57', '操作url：/admin.php?s=/Category/add.html', '1', '1477642366');
INSERT INTO `tp_action_log` VALUES ('141', '11', '1', '2130706433', 'category', '45', '操作url：/admin.php?s=/Category/remove/id/45', '1', '1477642684');
INSERT INTO `tp_action_log` VALUES ('142', '11', '1', '2130706433', 'category', '58', '操作url：/admin.php?s=/Category/add.html', '1', '1477643148');
INSERT INTO `tp_action_log` VALUES ('143', '11', '1', '2130706433', 'category', '58', '操作url：/admin.php?s=/Category/remove/id/58.html', '1', '1477643159');
INSERT INTO `tp_action_log` VALUES ('144', '11', '1', '2130706433', 'category', '59', '操作url：/admin.php?s=/Category/add.html', '1', '1477891966');
INSERT INTO `tp_action_log` VALUES ('145', '11', '1', '2130706433', 'category', '60', '操作url：/admin.php?s=/Category/add.html', '1', '1477892194');
INSERT INTO `tp_action_log` VALUES ('146', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477893199');
INSERT INTO `tp_action_log` VALUES ('147', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477893225');
INSERT INTO `tp_action_log` VALUES ('148', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477893779');
INSERT INTO `tp_action_log` VALUES ('149', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477899641');
INSERT INTO `tp_action_log` VALUES ('150', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477899681');
INSERT INTO `tp_action_log` VALUES ('151', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477899693');
INSERT INTO `tp_action_log` VALUES ('152', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1477899950');
INSERT INTO `tp_action_log` VALUES ('153', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1477901141');
INSERT INTO `tp_action_log` VALUES ('154', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/edit.html', '1', '1477901647');
INSERT INTO `tp_action_log` VALUES ('155', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/edit.html', '1', '1477902508');
INSERT INTO `tp_action_log` VALUES ('156', '11', '1', '2130706433', 'category', '61', '操作url：/admin.php?s=/Category/add.html', '1', '1477903528');
INSERT INTO `tp_action_log` VALUES ('157', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/add.html', '1', '1477903590');
INSERT INTO `tp_action_log` VALUES ('158', '11', '1', '2130706433', 'category', '63', '操作url：/admin.php?s=/Category/add.html', '1', '1477903685');
INSERT INTO `tp_action_log` VALUES ('159', '11', '1', '2130706433', 'category', '54', '操作url：/admin.php?s=/Category/edit.html', '1', '1477905409');
INSERT INTO `tp_action_log` VALUES ('160', '11', '1', '2130706433', 'category', '55', '操作url：/admin.php?s=/Category/edit.html', '1', '1477905705');
INSERT INTO `tp_action_log` VALUES ('161', '11', '1', '2130706433', 'category', '60', '操作url：/admin.php?s=/Category/removeall.html', '1', '1477907034');
INSERT INTO `tp_action_log` VALUES ('162', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-01 08:55登录了后台', '1', '1477961714');
INSERT INTO `tp_action_log` VALUES ('163', '11', '1', '2130706433', 'category', '64', '操作url：/admin.php?s=/Category/add.html', '1', '1477981529');
INSERT INTO `tp_action_log` VALUES ('164', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478050410');
INSERT INTO `tp_action_log` VALUES ('165', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478050477');
INSERT INTO `tp_action_log` VALUES ('166', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478050518');
INSERT INTO `tp_action_log` VALUES ('167', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478050528');
INSERT INTO `tp_action_log` VALUES ('168', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478050786');
INSERT INTO `tp_action_log` VALUES ('169', '11', '1', '2130706433', 'category', '63', '操作url：/admin.php?s=/Category/edit.html', '1', '1478056230');
INSERT INTO `tp_action_log` VALUES ('170', '11', '1', '2130706433', 'category', '64', '操作url：/admin.php?s=/Category/edit.html', '1', '1478056242');
INSERT INTO `tp_action_log` VALUES ('171', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478065987');
INSERT INTO `tp_action_log` VALUES ('172', '11', '1', '2130706433', 'category', '57', '操作url：/admin.php?s=/Category/removeall.html', '1', '1478071313');
INSERT INTO `tp_action_log` VALUES ('173', '11', '1', '2130706433', 'category', '56', '操作url：/admin.php?s=/Category/removeall.html', '1', '1478071318');
INSERT INTO `tp_action_log` VALUES ('174', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-03 09:00登录了后台', '1', '1478134810');
INSERT INTO `tp_action_log` VALUES ('175', '11', '1', '2130706433', 'category', '55', '操作url：/admin.php?s=/Category/edit.html', '1', '1478138427');
INSERT INTO `tp_action_log` VALUES ('176', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/edit.html', '1', '1478140679');
INSERT INTO `tp_action_log` VALUES ('177', '11', '1', '2130706433', 'category', '51', '操作url：/admin.php?s=/Category/edit.html', '1', '1478152544');
INSERT INTO `tp_action_log` VALUES ('188', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin.php?s=/Attribute/update.html', '1', '1478435472');
INSERT INTO `tp_action_log` VALUES ('189', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin.php?s=/Attribute/update.html', '1', '1478436041');
INSERT INTO `tp_action_log` VALUES ('190', '8', '1', '2130706433', 'attribute', '33', '操作url：/admin.php?s=/Attribute/update.html', '1', '1478436485');
INSERT INTO `tp_action_log` VALUES ('191', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin.php?s=/Attribute/update.html', '1', '1478436914');
INSERT INTO `tp_action_log` VALUES ('192', '8', '1', '2130706433', 'attribute', '34', '操作url：/admin.php?s=/Attribute/update.html', '1', '1478437140');
INSERT INTO `tp_action_log` VALUES ('193', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1478437733');
INSERT INTO `tp_action_log` VALUES ('194', '7', '1', '2130706433', 'model', '4', '操作url：/admin.php?s=/Model/update.html', '1', '1478437957');
INSERT INTO `tp_action_log` VALUES ('195', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-06 21:26登录了后台', '1', '1478438814');
INSERT INTO `tp_action_log` VALUES ('196', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-09 15:58登录了后台', '1', '1478678316');
INSERT INTO `tp_action_log` VALUES ('197', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-10 10:02登录了后台', '1', '1478743366');
INSERT INTO `tp_action_log` VALUES ('198', '11', '1', '2130706433', 'category', '61', '操作url：/admin.php?s=/Category/edit.html', '1', '1478743412');
INSERT INTO `tp_action_log` VALUES ('199', '11', '1', '2130706433', 'category', '61', '操作url：/admin.php?s=/Category/edit.html', '1', '1478743576');
INSERT INTO `tp_action_log` VALUES ('200', '11', '1', '2130706433', 'category', '61', '操作url：/admin.php?s=/Category/edit.html', '1', '1478743940');
INSERT INTO `tp_action_log` VALUES ('201', '11', '1', '2130706433', 'category', '61', '操作url：/admin.php?s=/Category/edit.html', '1', '1478749515');
INSERT INTO `tp_action_log` VALUES ('202', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478749634');
INSERT INTO `tp_action_log` VALUES ('203', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478749656');
INSERT INTO `tp_action_log` VALUES ('204', '11', '1', '2130706433', 'category', '61', '操作url：/admin.php?s=/Category/edit.html', '1', '1478751747');
INSERT INTO `tp_action_log` VALUES ('205', '11', '1', '2130706433', 'category', '61', '操作url：/admin.php?s=/Category/edit.html', '1', '1478752177');
INSERT INTO `tp_action_log` VALUES ('206', '11', '1', '2130706433', 'category', '62', '操作url：/admin.php?s=/Category/edit.html', '1', '1478752191');
INSERT INTO `tp_action_log` VALUES ('207', '11', '1', '2130706433', 'category', '52', '操作url：/admin.php?s=/Category/edit.html', '1', '1478756085');
INSERT INTO `tp_action_log` VALUES ('208', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/edit.html', '1', '1478758580');
INSERT INTO `tp_action_log` VALUES ('209', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/edit.html', '1', '1478758664');
INSERT INTO `tp_action_log` VALUES ('210', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1478760254');
INSERT INTO `tp_action_log` VALUES ('211', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1478762187');
INSERT INTO `tp_action_log` VALUES ('212', '11', '1', '2130706433', 'category', '41', '操作url：/admin.php?s=/Category/edit.html', '1', '1478762419');
INSERT INTO `tp_action_log` VALUES ('213', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-10 17:17登录了后台', '1', '1478769452');
INSERT INTO `tp_action_log` VALUES ('214', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-14 14:35登录了后台', '1', '1479105322');
INSERT INTO `tp_action_log` VALUES ('215', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-16 13:47登录了后台', '1', '1479275232');
INSERT INTO `tp_action_log` VALUES ('216', '11', '1', '2130706433', 'category', '40', '操作url：/admin.php?s=/Category/edit.html', '1', '1479276194');
INSERT INTO `tp_action_log` VALUES ('217', '11', '1', '2130706433', 'category', '65', '操作url：/admin.php?s=/Category/add.html', '1', '1479276282');
INSERT INTO `tp_action_log` VALUES ('218', '11', '1', '2130706433', 'category', '65', '操作url：/admin.php?s=/Category/removeall.html', '1', '1479276297');
INSERT INTO `tp_action_log` VALUES ('219', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-17 14:25登录了后台', '1', '1479363920');
INSERT INTO `tp_action_log` VALUES ('220', '11', '1', '2130706433', 'category', '66', '操作url：/admin.php?s=/Category/add.html', '1', '1479368471');
INSERT INTO `tp_action_log` VALUES ('221', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1479371927');
INSERT INTO `tp_action_log` VALUES ('222', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1479371985');
INSERT INTO `tp_action_log` VALUES ('223', '11', '1', '2130706433', 'category', '67', '操作url：/admin.php?s=/Category/add.html', '1', '1479372378');
INSERT INTO `tp_action_log` VALUES ('224', '11', '1', '2130706433', 'category', '68', '操作url：/admin.php?s=/Category/add.html', '1', '1479372450');
INSERT INTO `tp_action_log` VALUES ('225', '11', '1', '2130706433', 'category', '68', '操作url：/admin.php?s=/Category/edit.html', '1', '1479372546');
INSERT INTO `tp_action_log` VALUES ('226', '11', '1', '2130706433', 'category', '68', '操作url：/admin.php?s=/Category/edit.html', '1', '1479372583');
INSERT INTO `tp_action_log` VALUES ('227', '1', '1', '2130706433', 'member', '1', 'admin在2016-11-18 08:58登录了后台', '1', '1479430700');
INSERT INTO `tp_action_log` VALUES ('228', '11', '1', '2130706433', 'category', '52', '操作url：/admin.php?s=/Category/edit.html', '1', '1479435346');
INSERT INTO `tp_action_log` VALUES ('229', '11', '1', '2130706433', 'category', '48', '操作url：/admin.php?s=/Category/edit.html', '1', '1479435399');
INSERT INTO `tp_action_log` VALUES ('230', '11', '1', '2130706433', 'category', '46', '操作url：/admin.php?s=/Category/edit.html', '1', '1479438405');

-- ----------------------------
-- Table structure for tp_addons
-- ----------------------------
DROP TABLE IF EXISTS `tp_addons`;
CREATE TABLE `tp_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of tp_addons
-- ----------------------------
INSERT INTO `tp_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `tp_addons` VALUES ('31', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"\\u5f00\\u53d1\\u56e2\\u961f\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1477549346', '0');
INSERT INTO `tp_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"4\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `tp_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `tp_addons` VALUES ('25', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"90040\",\"comment_short_name_duoshuo\":\"\",\"comment_form_pos_duoshuo\":\"buttom\",\"comment_data_list_duoshuo\":\"10\",\"comment_data_order_duoshuo\":\"asc\"}', 'thinkphp', '0.1', '1476150605', '0');
INSERT INTO `tp_addons` VALUES ('30', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7ad9\\u70b9\\u7edf\\u8ba1\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1477549343', '0');
INSERT INTO `tp_addons` VALUES ('28', 'Example', '示列', '这是一个临时描述', '0', '{\"random\":\"1\"}', '无名', '0.1', '1476253306', '1');
INSERT INTO `tp_addons` VALUES ('29', 'addons', '插件测试', '这是一个临时描述', '1', '{\"random\":\"1\"}', 'qxn', '0.1', '1476253547', '1');
INSERT INTO `tp_addons` VALUES ('33', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1477549575', '1');

-- ----------------------------
-- Table structure for tp_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tp_attachment`;
CREATE TABLE `tp_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of tp_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for tp_attribute
-- ----------------------------
DROP TABLE IF EXISTS `tp_attribute`;
CREATE TABLE `tp_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- ----------------------------
-- Records of tp_attribute
-- ----------------------------
INSERT INTO `tp_attribute` VALUES ('1', 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1384508362', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('2', 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', '1', '', '1', '0', '1', '1383894743', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('3', 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', '1', '', '1', '0', '1', '1383894778', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('4', 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', '0', '', '1', '0', '1', '1384508336', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('5', 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', '1', '', '1', '0', '1', '1383894927', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('6', 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', '0', '', '1', '0', '1', '1384508323', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('7', 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', '0', '', '1', '0', '1', '1384508543', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('8', 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', '0', '', '1', '0', '1', '1384508350', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('9', 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', '1', '1:目录\r\n2:主题\r\n3:段落', '1', '0', '1', '1384511157', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('10', 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', '1', '[DOCUMENT_POSITION]', '1', '0', '1', '1383895640', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('11', 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', '1', '', '1', '0', '1', '1383895757', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('12', 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', '1', '', '1', '0', '1', '1384147827', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('13', 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', '1', '0:不可见\r\n1:所有人可见', '1', '0', '1', '1386662271', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `tp_attribute` VALUES ('14', 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', '1', '', '1', '0', '1', '1387163248', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `tp_attribute` VALUES ('15', 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', '0', '', '1', '0', '1', '1387260355', '1383891233', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `tp_attribute` VALUES ('16', 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1383895835', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('17', 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '1', '0', '1', '1476671041', '1383891233', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `tp_attribute` VALUES ('18', 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', '0', '', '1', '0', '1', '1384508264', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('19', 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', '1', '', '1', '0', '1', '1383895894', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('20', 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '1', '', '1', '0', '1', '1383895903', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('21', 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', '0', '', '1', '0', '1', '1384508277', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('22', 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', '0', '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', '1', '0', '1', '1384508496', '1383891233', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('23', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '2', '0', '1', '1384511049', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('24', 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', '1', '', '2', '0', '1', '1383896225', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('25', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', '1', '', '2', '0', '1', '1383896190', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('26', 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '2', '0', '1', '1383896103', '1383891243', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('27', 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', '0', '0:html\r\n1:ubb\r\n2:markdown', '3', '0', '1', '1387260461', '1383891252', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `tp_attribute` VALUES ('28', 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', '1', '', '3', '0', '1', '1383896438', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('29', 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', '1', '', '3', '0', '1', '1383896429', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('30', 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', '1', '', '3', '0', '1', '1383896415', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('31', 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', '1', '', '3', '0', '1', '1383896380', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('32', 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', '1', '', '3', '0', '1', '1383896371', '1383891252', '', '0', '', '', '', '0', '');
INSERT INTO `tp_attribute` VALUES ('33', 'character', '产品特点', 'text NOT NULL', 'editor', '', '', '1', '0:html\r\n1:ubb\r\n2:markdown', '4', '0', '1', '1478436486', '1477468694', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `tp_attribute` VALUES ('34', 'instruction', '说明书', 'text NOT NULL', 'editor', '', '', '1', '0:html\r\n1:ubb\r\n2:markdown', '4', '0', '1', '1478437141', '1478436916', '', '3', '', 'regex', '', '3', 'function');

-- ----------------------------
-- Table structure for tp_auth_extend
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_extend`;
CREATE TABLE `tp_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- ----------------------------
-- Records of tp_auth_extend
-- ----------------------------
INSERT INTO `tp_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `tp_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `tp_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `tp_auth_extend` VALUES ('1', '40', '1');
INSERT INTO `tp_auth_extend` VALUES ('1', '41', '1');
INSERT INTO `tp_auth_extend` VALUES ('1', '42', '1');
INSERT INTO `tp_auth_extend` VALUES ('1', '43', '1');
INSERT INTO `tp_auth_extend` VALUES ('1', '44', '1');
INSERT INTO `tp_auth_extend` VALUES ('3', '40', '1');
INSERT INTO `tp_auth_extend` VALUES ('3', '41', '1');
INSERT INTO `tp_auth_extend` VALUES ('3', '42', '1');
INSERT INTO `tp_auth_extend` VALUES ('3', '43', '1');
INSERT INTO `tp_auth_extend` VALUES ('3', '44', '1');

-- ----------------------------
-- Table structure for tp_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group`;
CREATE TABLE `tp_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_auth_group
-- ----------------------------
INSERT INTO `tp_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '默认用户组', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `tp_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');
INSERT INTO `tp_auth_group` VALUES ('3', 'admin', '1', '测试1', '测试1 ', '1', '');

-- ----------------------------
-- Table structure for tp_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_group_access`;
CREATE TABLE `tp_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_auth_group_access
-- ----------------------------
INSERT INTO `tp_auth_group_access` VALUES ('2', '1');
INSERT INTO `tp_auth_group_access` VALUES ('2', '2');
INSERT INTO `tp_auth_group_access` VALUES ('2', '3');
INSERT INTO `tp_auth_group_access` VALUES ('3', '1');
INSERT INTO `tp_auth_group_access` VALUES ('3', '2');

-- ----------------------------
-- Table structure for tp_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `tp_auth_rule`;
CREATE TABLE `tp_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_auth_rule
-- ----------------------------
INSERT INTO `tp_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '控制台', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/index', '内容管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '管理员管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '设置', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('17', 'admin', '1', 'Admin/Article/examine', '审核列表', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('121', 'admin', '2', 'Admin/Article/recycle', '回收站', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `tp_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('217', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('218', 'admin', '1', 'Admin/think/lists', '数据列表', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('219', 'admin', '2', 'Admin/Category', '栏目管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('220', 'admin', '2', 'Admin/Model', '频道管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('221', 'admin', '2', 'Admin/User', '行为管理', '1', '');
INSERT INTO `tp_auth_rule` VALUES ('222', 'admin', '2', 'Admin/Database', '数据备份', '1', '');

-- ----------------------------
-- Table structure for tp_category
-- ----------------------------
DROP TABLE IF EXISTS `tp_category`;
CREATE TABLE `tp_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` varchar(255) NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- ----------------------------
-- Records of tp_category
-- ----------------------------
INSERT INTO `tp_category` VALUES ('42', 'anfang', '安防类', '41', '3', '10', '', '安防类', '安防类', '', '', 'detail_products', '', '4', '4', '2,1,3', '0', '2', '1', '0', '1', '', '', '1474526797', '1478223913', '1', '24', '安防类');
INSERT INTO `tp_category` VALUES ('41', 'products', '产品展示', '0', '2', '8', '', '产品展示', '产品展示', '', 'lists_products', '', '', '4', '4', '2,1,3', '0', '2', '1', '0', '1', '', '', '1474524724', '1478762419', '1', '22', '产品展示');
INSERT INTO `tp_category` VALUES ('40', 'solution', '解决方案', '0', '1', '10', '', '解决方案', '解决方案', '', 'lists_solution', '', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', '', '1474524627', '1479276194', '1', '21', '解决方案');
INSERT INTO `tp_category` VALUES ('46', 'home', '家居类', '41', '0', '8', '', '家居类', '家居类', '', '', 'detail_products', '', '4', '4', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477639810', '1479438405', '1', '', '家居类');
INSERT INTO `tp_category` VALUES ('47', 'download', '应用下载', '0', '3', '10', '', '应用下载', '应用下载', '', 'lists_download', '', '', '3', '3', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477639925', '1478156088', '1', '', '应用下载');
INSERT INTO `tp_category` VALUES ('44', 'hospital', '医疗类', '41', '4', '10', '', '医疗类', '医疗类', '', '', 'detail_products', '', '4', '4', '2,1,3', '0', '2', '1', '0', '1', '', '', '1474527014', '1478223925', '1', '25', '空调|电视|机顶盒');
INSERT INTO `tp_category` VALUES ('48', 'specification', '说明书下载', '47', '0', '8', '', '说明书下载', '说明书下载', '', '', '', '', '3', '3', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477640096', '1479435399', '1', '', '说明书下载');
INSERT INTO `tp_category` VALUES ('49', 'APP', 'APP下载', '47', '0', '10', '', 'APP下载', 'APP下载', '', '', '', '', '3', '3', '2,1,3', '0', '2', '1', '0', '0', '', null, '1477640148', '1477640148', '1', '', 'APP下载');
INSERT INTO `tp_category` VALUES ('50', 'album', '画册下载', '47', '0', '10', '', '画册下载', '画册下载', '', '', '', '', '3', '3', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477640281', '1477640281', '1', '', '画册下载');
INSERT INTO `tp_category` VALUES ('51', 'support', '服务支持', '0', '4', '10', '', '服务支持', '服务支持', '', 'lists_help', '', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477640525', '1478152544', '1', '', '服务支持');
INSERT INTO `tp_category` VALUES ('52', 'after-sale', '售后服务', '51', '52', '5', '', '售后服务', '售后服务', '', '', 'detail_help', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477640903', '1479435346', '1', '', '售后服务');
INSERT INTO `tp_category` VALUES ('53', 'problem', '常见问题', '51', '53', '10', '', '常见问题', '常见问题', '', '', 'detail_help', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477641011', '1478154284', '1', '', '常见问题');
INSERT INTO `tp_category` VALUES ('54', 'join', '代理加盟', '0', '5', '10', '', '代理加盟', '代理加盟', '', 'lists_join', '', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477642122', '1477905409', '1', '', '代理加盟');
INSERT INTO `tp_category` VALUES ('55', 'about_us', '关于我们', '0', '7', '10', '', '关于我们', '关于我们', '', 'lists_join', '', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477642250', '1478138427', '1', '', '关于我们');
INSERT INTO `tp_category` VALUES ('61', 'news', '新闻资讯', '0', '6', '10', '', '', '', '', 'lists_news', '', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477903528', '1478752177', '1', '', '新闻资讯');
INSERT INTO `tp_category` VALUES ('62', 'company_news', '公司新闻', '61', '0', '2', '', '', '', '', 'lists_news', 'detail', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477903590', '1478752191', '1', '', '公司新闻');
INSERT INTO `tp_category` VALUES ('63', 'profession_news', '行业新闻', '61', '0', '10', '', '', '', '', '', 'detail', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477903685', '1478056230', '1', '', '行业新闻');
INSERT INTO `tp_category` VALUES ('64', 'activity', '活动专题', '61', '0', '10', '', '', '', '', '', 'detail', '', '2', '2', '2,1,3', '0', '2', '1', '0', '1', '', null, '1477981529', '1478056242', '1', '', '活动专题');
INSERT INTO `tp_category` VALUES ('66', 'remote', '智能遥控', '46', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '0', '1', '0', '0', '', null, '1479368471', '1479368471', '1', '', '');
INSERT INTO `tp_category` VALUES ('67', 'Opener', '平移窗', '46', '0', '10', '', '', '', '', '', '', '', '', '', '', '0', '0', '1', '0', '0', '', null, '1479372378', '1479372378', '1', '', '');
INSERT INTO `tp_category` VALUES ('68', 'forum', '论坛', '0', '7', '10', '', '', '', '', 'lists_solution', '', '', '2', '2', '2,1,3', '0', '2', '1', '0', '0', '', null, '1479372450', '1479372583', '1', '', '');

-- ----------------------------
-- Table structure for tp_channel
-- ----------------------------
DROP TABLE IF EXISTS `tp_channel`;
CREATE TABLE `tp_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_channel
-- ----------------------------
INSERT INTO `tp_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `tp_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `tp_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- ----------------------------
-- Table structure for tp_config
-- ----------------------------
DROP TABLE IF EXISTS `tp_config`;
CREATE TABLE `tp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_config
-- ----------------------------
INSERT INTO `tp_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `tp_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `tp_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `tp_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `tp_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `tp_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `tp_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表推荐\r\n2:频道推荐\r\n4:首页推荐', '3');
INSERT INTO `tp_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `tp_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `tp_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `tp_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `tp_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `tp_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `tp_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `tp_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `tp_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `tp_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `tp_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `tp_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `tp_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `tp_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `tp_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `tp_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `tp_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `tp_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1476002742', '1', '10', '0');
INSERT INTO `tp_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `tp_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- ----------------------------
-- Table structure for tp_document
-- ----------------------------
DROP TABLE IF EXISTS `tp_document`;
CREATE TABLE `tp_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

-- ----------------------------
-- Records of tp_document
-- ----------------------------
INSERT INTO `tp_document` VALUES ('1', '1', '', 'OneThink1.1开发版发布', '40', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001360', '1476955723', '-1');
INSERT INTO `tp_document` VALUES ('2', '1', '', 'OneThink1.1开发版发布', '40', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001360', '1476773441', '-1');
INSERT INTO `tp_document` VALUES ('3', '1', '', '文章管理3', '41', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '1546300800', '0', '8', '0', '0', '0', '1401854160', '1477457230', '-1');
INSERT INTO `tp_document` VALUES ('4', '1', '', 'OneThink1.1开发版发布', '40', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001413', '1406001413', '-1');
INSERT INTO `tp_document` VALUES ('5', '1', '', 'OneThink1.1开发版发布', '40', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001360', '1406001413', '-1');
INSERT INTO `tp_document` VALUES ('6', '1', '', 'OneThink1.1开发版发布', '42', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001413', '1406001413', '-1');
INSERT INTO `tp_document` VALUES ('16', '1', '', '智能家庭', '40', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1477907280', '1477966528', '1');
INSERT INTO `tp_document` VALUES ('8', '1', '', 'OneThink1.1开发版发布', '40', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001413', '1406001413', '-1');
INSERT INTO `tp_document` VALUES ('9', '1', '', 'OneThink1.1开发版发布', '44', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001413', '1406001413', '-1');
INSERT INTO `tp_document` VALUES ('10', '1', '', 'OneThink1.1开发版发布', '40', '0', '期待已久的OneThink最新版发布', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '8', '0', '0', '0', '1406001413', '1406001413', '-1');
INSERT INTO `tp_document` VALUES ('11', '1', '', '上传文件测试', '40', '0', '', '0', '0', '3', '2', '0', '0', '26', '1', '0', '0', '0', '0', '0', '0', '1477452960', '1477462427', '-1');
INSERT INTO `tp_document` VALUES ('12', '1', '', '下载测试2', '40', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1477462687', '1477462687', '3');
INSERT INTO `tp_document` VALUES ('13', '1', '', '下载测试2', '40', '0', '', '0', '0', '3', '2', '0', '0', '27', '1', '0', '0', '0', '0', '0', '0', '1477462800', '1477467476', '-1');
INSERT INTO `tp_document` VALUES ('14', '1', 'hospital', '医疗', '44', '0', '', '0', '0', '4', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1477469520', '1477469552', '-1');
INSERT INTO `tp_document` VALUES ('15', '1', 'hospital1', 'hospital1', '44', '0', '', '0', '0', '4', '2', '0', '0', '28', '1', '0', '0', '1', '0', '0', '0', '1477469640', '1478166748', '-1');
INSERT INTO `tp_document` VALUES ('17', '1', '', '智能酒店', '40', '0', '', '0', '0', '2', '3', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1477907400', '1477966512', '1');
INSERT INTO `tp_document` VALUES ('18', '1', '', '智能办公', '40', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', '1477907460', '1477966498', '1');
INSERT INTO `tp_document` VALUES ('19', '1', '', '瓯宝公司:研发投入出成效 智能家居进军市场', '62', '0', '11月25日，在瓯宝会议大厅隆重举行了智能家居新品发布盛典。\r\n    会议大厅现场签约伙伴就有30多家。苏宁温州大区域总经理卢厚飞看中商机，会上卢总便邀请公司智能家居新品入驻温州电器城,并将在28日温州苏宁一年一度的品牌推介会上展示。陈董事长幽默的说：“瓯宝有望成为第二个‘阿里', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '286', '0', '0', '0', '1477971883', '1477971883', '1');
INSERT INTO `tp_document` VALUES ('20', '1', '', '迎“三·八”瓯宝举行第四届“和谐瓯宝•魅力女性”趣味运动会', '62', '0', '阳春三月，人面桃花相映红！春风扑面，瓯宝巾帼显英雄！在第106个三八国际妇女节来临之际，公司以趣味运动会的方式为广大女性同胞们进行庆祝。', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '117', '0', '0', '0', '1477972128', '1477972128', '1');
INSERT INTO `tp_document` VALUES ('21', '1', '', '凝心聚力 稳定质量 开拓市场 —暨2015年工作总结表彰和动员大会圆满召开', '63', '0', '2016年2月27日下午，瓯宝一年一度的总结表彰暨工作动员大会在四号楼四楼会议室顺利召开。公司创始人陈恩弟先生、董事长陈晓建、常务副总张洁信、生产副总张献国技术副总姜雷、外贸副总陈谧和行政副总周海潮在主席台就座', '0', '0', '2', '2', '1', '0', '0', '1', '0', '0', '53', '0', '0', '0', '1477984980', '1478435552', '1');
INSERT INTO `tp_document` VALUES ('22', '1', '', '瓯宝指纹锁重庆聚信名家汇直营店盛大开业', '62', '0', '2015年12月22日，瓯宝又一专卖店强势登陆重庆，相信随着瓯宝指纹锁重庆聚信名家汇直营店的开业，将会有更多的客户了解瓯宝指纹锁，用上瓯宝指纹锁，爱上瓯宝指纹锁，让更多人过上不用带钥匙就能开门的时尚生活。', '0', '0', '2', '2', '1', '0', '0', '1', '0', '0', '35', '0', '0', '0', '1477985040', '1478435531', '1');
INSERT INTO `tp_document` VALUES ('23', '1', '', '公司介绍', '55', '0', '', '0', '0', '2', '2', '4', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1478138280', '1478251111', '1');
INSERT INTO `tp_document` VALUES ('24', '1', '', '荣誉奖项', '55', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1478139757', '1478139757', '1');
INSERT INTO `tp_document` VALUES ('26', '1', '', '保障期', '52', '0', '保障期', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '9', '0', '0', '0', '1478151725', '1478151725', '1');
INSERT INTO `tp_document` VALUES ('27', '1', '', '指纹识别传感器', '52', '0', '目前应用于民用市场主要有三种类型的指纹传感器，即：光学传感器、半导体传感器、射频传感器。 光学指纹识别传感器是通过在光学镜头上进行物体挤压或是手指滚动获得指纹图片。传感器屏幕一般是由工业金刚石制作而成。 半导体指纹识别传感器是由手指对传感器产生的压力或者热冲击，使电荷产生变化后通', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '20', '0', '0', '0', '1478152448', '1478152448', '1');
INSERT INTO `tp_document` VALUES ('28', '1', '', '智能遥控', '40', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1478157000', '1478157072', '-1');
INSERT INTO `tp_document` VALUES ('32', '1', '', '七彩灯', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', '1478157420', '1478161590', '1');
INSERT INTO `tp_document` VALUES ('33', '1', '', '智能遥控', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '4', '0', '0', '0', '1478160060', '1478161732', '1');
INSERT INTO `tp_document` VALUES ('34', '1', '', '闭门器', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1478161740', '1478162106', '1');
INSERT INTO `tp_document` VALUES ('35', '1', '', '单火触摸开关', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1478162790', '1478162790', '1');
INSERT INTO `tp_document` VALUES ('36', '1', '', '红外人体感应', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1478163601', '1478163601', '1');
INSERT INTO `tp_document` VALUES ('37', '1', '', '招商政策', '54', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1478164306', '1478164306', '1');
INSERT INTO `tp_document` VALUES ('39', '1', '', '加盟优势', '54', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1478164362', '1478164362', '1');
INSERT INTO `tp_document` VALUES ('40', '1', '', '煤气报警器', '42', '0', '', '0', '0', '4', '2', '0', '0', '29', '1', '0', '0', '26', '0', '0', '0', '1478222580', '1478222636', '1');
INSERT INTO `tp_document` VALUES ('41', '1', '', '水浸报警器', '42', '0', '', '0', '0', '4', '1', '0', '0', '30', '1', '0', '0', '19', '0', '0', '0', '1478222819', '1478222819', '1');
INSERT INTO `tp_document` VALUES ('42', '1', '', '移动插座', '46', '0', '', '0', '0', '4', '2', '0', '0', '31', '1', '0', '0', '43', '0', '0', '0', '1478222868', '1478222868', '1');
INSERT INTO `tp_document` VALUES ('43', '1', '', '智能插座', '46', '0', '', '0', '0', '4', '2', '0', '0', '32', '1', '0', '0', '12', '0', '0', '0', '1478222909', '1478222909', '1');
INSERT INTO `tp_document` VALUES ('44', '1', '', '智能遥控', '46', '0', '', '0', '0', '4', '2', '0', '0', '33', '1', '0', '0', '9', '0', '0', '0', '1478222944', '1478222944', '1');
INSERT INTO `tp_document` VALUES ('45', '1', '', '触摸开关', '46', '0', '', '0', '0', '4', '2', '0', '0', '34', '1', '0', '0', '10', '0', '0', '0', '1478222989', '1478222989', '1');
INSERT INTO `tp_document` VALUES ('46', '1', '', '平移窗', '46', '0', '', '0', '0', '4', '2', '0', '0', '35', '1', '0', '0', '11', '0', '0', '0', '1478223000', '1478437903', '-1');
INSERT INTO `tp_document` VALUES ('47', '1', '', '空调默认温度设置', '52', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1478755980', '1478756030', '1');
INSERT INTO `tp_document` VALUES ('48', '1', '', '凝心聚力 稳定质量 开拓市场 —暨2015年工作总结表彰和动员大会圆满召开', '63', '0', '2016年2月27日下午，瓯宝一年一度的总结表彰暨工作动员大会在四号楼四楼会议室顺利召开。公司创始人陈恩弟先生、董事长陈晓建、常务副总张洁信、生产副总张献国技术副总姜雷、外贸副总陈谧和行政副总周海潮在主席台就座', '0', '0', '2', '2', '1', '0', '0', '1', '0', '0', '57', '0', '0', '0', '1479433745', '1479433745', '1');
INSERT INTO `tp_document` VALUES ('49', '1', '', '空调默认温度设置', '52', '0', '', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '2', '0', '0', '0', '1479435323', '1479435323', '1');
INSERT INTO `tp_document` VALUES ('50', '1', '', '指纹识别传感器', '52', '0', '目前应用于民用市场主要有三种类型的指纹传感器，即：光学传感器、半导体传感器、射频传感器。 光学指纹识别传感器是通过在光学镜头上进行物体挤压或是手指滚动获得指纹图片。传感器屏幕一般是由工业金刚石制作而成。 半导体指纹识别传感器是由手指对传感器产生的压力或者热冲击，使电荷产生变化后通', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '20', '0', '0', '0', '1479435323', '1479435323', '1');
INSERT INTO `tp_document` VALUES ('51', '1', '', '保障期', '52', '0', '保障期', '0', '0', '2', '2', '0', '0', '0', '1', '0', '0', '9', '0', '0', '0', '1479435323', '1479435323', '1');
INSERT INTO `tp_document` VALUES ('52', '1', '', '红外人体感应', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1479435383', '1479435383', '1');
INSERT INTO `tp_document` VALUES ('53', '1', '', '单火触摸开关', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '1479435383', '1479435383', '1');
INSERT INTO `tp_document` VALUES ('54', '1', '', '闭门器', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '1479435383', '1479435383', '1');
INSERT INTO `tp_document` VALUES ('55', '1', '', '智能遥控', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '4', '0', '0', '0', '1479435383', '1479435383', '1');
INSERT INTO `tp_document` VALUES ('56', '1', '', '七彩灯', '48', '0', '', '0', '0', '3', '2', '0', '0', '0', '1', '0', '0', '3', '0', '0', '0', '1479435383', '1479435383', '1');
INSERT INTO `tp_document` VALUES ('57', '1', '', '平移窗', '46', '0', '', '0', '0', '4', '2', '0', '0', '35', '1', '0', '0', '11', '0', '0', '0', '1479438222', '1479438222', '1');
INSERT INTO `tp_document` VALUES ('58', '1', '', '平移窗', '46', '0', '', '0', '0', '4', '2', '0', '0', '35', '1', '0', '0', '11', '0', '0', '0', '1479438233', '1479438233', '1');
INSERT INTO `tp_document` VALUES ('61', '1', '', '平移窗', '46', '0', '', '0', '0', '4', '2', '0', '0', '35', '1', '0', '0', '11', '0', '0', '0', '1479438378', '1479438378', '1');
INSERT INTO `tp_document` VALUES ('62', '1', '', '触摸开关', '46', '0', '', '0', '0', '4', '2', '0', '0', '34', '1', '0', '0', '10', '0', '0', '0', '1479438378', '1479438378', '1');
INSERT INTO `tp_document` VALUES ('63', '1', '', '智能遥控', '46', '0', '', '0', '0', '4', '2', '0', '0', '33', '1', '0', '0', '9', '0', '0', '0', '1479438378', '1479438378', '1');
INSERT INTO `tp_document` VALUES ('64', '1', '', '智能插座', '46', '0', '', '0', '0', '4', '2', '0', '0', '32', '1', '0', '0', '12', '0', '0', '0', '1479438378', '1479438378', '1');
INSERT INTO `tp_document` VALUES ('65', '1', '', '移动插座', '46', '0', '', '0', '0', '4', '2', '0', '0', '31', '1', '0', '0', '43', '0', '0', '0', '1479438378', '1479438378', '1');
INSERT INTO `tp_document` VALUES ('66', '1', '', '平移窗', '46', '0', '', '0', '0', '4', '2', '0', '0', '35', '1', '0', '0', '11', '0', '0', '0', '1479438532', '1479438532', '1');
INSERT INTO `tp_document` VALUES ('67', '1', '', '触摸开关', '46', '0', '', '0', '0', '4', '2', '0', '0', '34', '1', '0', '0', '10', '0', '0', '0', '1479438532', '1479438532', '1');

-- ----------------------------
-- Table structure for tp_document_article
-- ----------------------------
DROP TABLE IF EXISTS `tp_document_article`;
CREATE TABLE `tp_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- ----------------------------
-- Records of tp_document_article
-- ----------------------------
INSERT INTO `tp_document_article` VALUES ('3', '0', '<img src=\"/Public/static/kindeditor/plugins/emoticons/images/10.gif\" alt=\"\" border=\"0\" /> \r\n<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<img src=\"/Public/static/kindeditor/plugins/emoticons/images/10.gif\" alt=\"\" border=\"0\" /> \r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原11\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('2', '0', '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013~2014</strong> \r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('16', '0', '<h3>\r\n	用户需求-&gt;智能家庭\r\n</h3>\r\n<p>\r\n	随着物联网的快速发展和生活水平的提高，人们对家居的要求已经不再满足于传统需求，更希望拥有先进的通讯设备和智能化的家用电器营造的安全、便捷、舒适的生活环境。根据市场需求，公司迎着物联网之风扬帆起航，设计生产出一系列适用于智能家居的产品设备。\r\n</p>\r\n<h3>\r\n	方案详情：\r\n</h3>\r\n<p>\r\n	瓯宝智能家居包括智能生活和智能安防两大类，产品融合了网络通信、安全防范、自动控制、音视频等技术。可通过手机或平板电脑远程控制，全方位满足用户对安全、便捷、自动、智能、舒适生活的需求，精心为客户打造健康、节能、高端的居住空间。\r\n</p>\r\n<h3>\r\n	方案特性：\r\n</h3>\r\n<p>\r\n	通过智能手机或平板电脑即可实现对设备的远程操控、实时查看设备运行状态……还可根据需求设置个性化情景模式。\r\n</p>\r\n<h3>\r\n	应用详情：\r\n</h3>\r\n<span>1.	网络摄像头: 内置麦克风和扬声器，观看视频的同时还可语音对讲。内置WIFI装置，无需连接电脑即可实现远程操控。</span><br />\r\n<span>2.	智能门窗</span><br />\r\n<span>（1）智能锁:指纹锁被打开时会及时向手机反馈开锁信息，还可通过手机实现远程开锁。</span><br />\r\n<span>（2）闭门器:开门五秒钟会自动闭合，贴心的防夹伤设计，只要轻轻一挡，便会自动停止。</span><br />\r\n<span>（3）电动平移窗：可远程控制窗户的闭合，实时反馈窗户运作状态，保障家庭安全。</span><br />\r\n<span>3.智能报警器</span><br />\r\n<span>（1）水浸报警器：当探测到有水灾险情时，报警器会发出警报并自动关闭阀门，并将处理结果反馈至手机。</span><br />\r\n<span>（2）煤气报警器：当探测到有气体泄漏时，报警器会发出警报并自动关闭阀门，并将处理结果反馈至手机。</span><br />\r\n<h3>\r\n	方案价值：\r\n</h3>\r\n<p>\r\n	瓯宝智能家居解决方案，通过集中管理、远程管理和场景管理，运用智能平台联合设备，帮用户营造便捷安全、温馨舒适的家居环境。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('17', '0', '<h3>\r\n	用户需求-&gt;智能酒店\r\n</h3>\r\n<p>\r\n	随着物联网的快速发展和生活水平的提高，人们对家居的要求已经不再满足于传统需求，更希望拥有先进的通讯设备和智能化的家用电器营造的安全、便捷、舒适的生活环境。根据市场需求，公司迎着物联网之风扬帆起航，设计生产出一系列适用于智能家居的产品设备。\r\n</p>\r\n<h3>\r\n	方案详情：\r\n</h3>\r\n<p>\r\n	瓯宝智能家居包括智能生活和智能安防两大类，产品融合了网络通信、安全防范、自动控制、音视频等技术。可通过手机或平板电脑远程控制，全方位满足用户对安全、便捷、自动、智能、舒适生活的需求，精心为客户打造健康、节能、高端的居住空间。\r\n</p>\r\n<h3>\r\n	方案特性：\r\n</h3>\r\n<p>\r\n	通过智能手机或平板电脑即可实现对设备的远程操控、实时查看设备运行状态……还可根据需求设置个性化情景模式。\r\n</p>\r\n<h3>\r\n	应用详情：\r\n</h3>\r\n<span>1.	网络摄像头: 内置麦克风和扬声器，观看视频的同时还可语音对讲。内置WIFI装置，无需连接电脑即可实现远程操控。</span><br />\r\n<span>2.	智能门窗</span><br />\r\n<span>（1）智能锁:指纹锁被打开时会及时向手机反馈开锁信息，还可通过手机实现远程开锁。</span><br />\r\n<span>（2）闭门器:开门五秒钟会自动闭合，贴心的防夹伤设计，只要轻轻一挡，便会自动停止。</span><br />\r\n<span>（3）电动平移窗：可远程控制窗户的闭合，实时反馈窗户运作状态，保障家庭安全。</span><br />\r\n<span>3.智能报警器</span><br />\r\n<span>（1）水浸报警器：当探测到有水灾险情时，报警器会发出警报并自动关闭阀门，并将处理结果反馈至手机。</span><br />\r\n<span>（2）煤气报警器：当探测到有气体泄漏时，报警器会发出警报并自动关闭阀门，并将处理结果反馈至手机。</span><br />\r\n<h3>\r\n	方案价值：\r\n</h3>\r\n<p>\r\n	瓯宝智能家居解决方案，通过集中管理、远程管理和场景管理，运用智能平台联合设备，帮用户营造便捷安全、温馨舒适的家居环境。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('18', '0', '<h3>\r\n	用户需求-&gt;智能办公\r\n</h3>\r\n<p>\r\n	随着物联网的快速发展和生活水平的提高，人们对家居的要求已经不再满足于传统需求，更希望拥有先进的通讯设备和智能化的家用电器营造的安全、便捷、舒适的生活环境。根据市场需求，公司迎着物联网之风扬帆起航，设计生产出一系列适用于智能家居的产品设备。\r\n</p>\r\n<h3>\r\n	方案详情：\r\n</h3>\r\n<p>\r\n	瓯宝智能家居包括智能生活和智能安防两大类，产品融合了网络通信、安全防范、自动控制、音视频等技术。可通过手机或平板电脑远程控制，全方位满足用户对安全、便捷、自动、智能、舒适生活的需求，精心为客户打造健康、节能、高端的居住空间。\r\n</p>\r\n<h3>\r\n	方案特性：\r\n</h3>\r\n<p>\r\n	通过智能手机或平板电脑即可实现对设备的远程操控、实时查看设备运行状态……还可根据需求设置个性化情景模式。\r\n</p>\r\n<h3>\r\n	应用详情：\r\n</h3>\r\n<span>1.	网络摄像头: 内置麦克风和扬声器，观看视频的同时还可语音对讲。内置WIFI装置，无需连接电脑即可实现远程操控。</span><br />\r\n<span>2.	智能门窗</span><br />\r\n<span>（1）智能锁:指纹锁被打开时会及时向手机反馈开锁信息，还可通过手机实现远程开锁。</span><br />\r\n<span>（2）闭门器:开门五秒钟会自动闭合，贴心的防夹伤设计，只要轻轻一挡，便会自动停止。</span><br />\r\n<span>（3）电动平移窗：可远程控制窗户的闭合，实时反馈窗户运作状态，保障家庭安全。</span><br />\r\n<span>3.智能报警器</span><br />\r\n<span>（1）水浸报警器：当探测到有水灾险情时，报警器会发出警报并自动关闭阀门，并将处理结果反馈至手机。</span><br />\r\n<span>（2）煤气报警器：当探测到有气体泄漏时，报警器会发出警报并自动关闭阀门，并将处理结果反馈至手机。</span><br />\r\n<h3>\r\n	方案价值：\r\n</h3>\r\n<p>\r\n	瓯宝智能家居解决方案，通过集中管理、远程管理和场景管理，运用智能平台联合设备，帮用户营造便捷安全、温馨舒适的家居环境。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('19', '0', '<p>\r\n	阳春三月，人面桃花相映红！春风扑面，瓯宝巾帼显英雄！在第106个三八国际妇女节来临之际，公司以趣味运动会的方式为广大女性同胞们进行庆祝。\r\n</p>\r\n<p>\r\n	3月8日晚，公司党委、工会、团总支、女工委组织邀请了公司全体女职工在公司行政楼4楼，参加瓯宝公司庆祝“三八”国际劳动妇女节，暨第四届“和谐瓯宝·魅力女性”趣味运动会。构建和谐向上的企业发展环境，进一步活跃节日氛围，公司工会主席、行政副总周海潮，生产副总张献国，采购副总鲁世勇在主席台就坐，并担任本次活动的裁判组。公司工会主席周海潮在比赛前发表讲话，感谢女职工对公司的敬业付出，瓯宝的发展有你们的汗水、瓯宝的业绩有你们的功勋，150余名女性职工为公司的发展贡献自己的力量，撑起半边天。并代表公司为每一位女职工送上一份精美的礼品。\r\n</p>\r\n<p>\r\n	此次比赛共设了5个项目：急速呼啦圈、双人跳绳、速运密封圈、拍篮球绕障碍接力、踩气球；简单却趣味横生。虽说个个都是女性，但是个个不甘示弱，斗志昂扬。现场气氛热烈，笑声不断。比如牡丹队检验科的袁兰兰和周赛宏的双人跳绳，跳绳如轻盈的燕子就像是脚上装了弹簧一样，在没有预先练习配合的情况下，一分钟的时间里跳了120多次，相当于一秒钟跳了2次！现场的队友和观众都为之惊叹。当然让大家大笑不止的项目也有，比如拍篮球绕障碍接力比赛，由于女职工对拍篮球相对来说要陌生很多，面对弹起的篮球真是束手无策，时不时的砸到脚上，篮球就搜的一下滚了出去，要不就是用力拍几下就飞过头顶，撞到障碍物上了，要么就追着裁判到处跑，惹得大家捧腹大笑；最后的踩气球项目，是本次比赛的最大看点，2队正面PK，5对5精彩对决！各队背负着本队的荣耀，脚上绑着鼓起的气球，冲向对面开始猛踩！砰！砰！砰！一场别开生面的“摔跤”比赛开始了，一个个抓着对方的手臂、肩膀，脚下一顿乱踩，也不知道踩的是队友的气球还是对方的气球。比赛的人满脸通红，聚精会神一边想法去踩气球、一边小心保护自己的气球，看的人满面笑容、捶胸顿足的，一边叫喊着加油！一边拿着手机拍视频、拍照片，留下美好的瞬间和欢乐的笑点。\r\n</p>\r\n<p>\r\n	整个赛场上没有参赛的女同胞也为选手们加油喝彩，比赛不是一个人在完成，也不是只有参赛者在完成，而是整个团队。赛场上口号无比响亮，掌声此起彼伏，热闹非凡。通过轻松有趣的比赛活动，使女员工在紧张忙碌的工作中身心得以放松，提高公司的凝聚力，加强员工之间的相互帮忙、相互合作的精神。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('20', '0', '<p>\r\n	阳春三月，人面桃花相映红！春风扑面，瓯宝巾帼显英雄！在第106个三八国际妇女节来临之际，公司以趣味运动会的方式为广大女性同胞们进行庆祝。\r\n</p>\r\n<p>\r\n	3月8日晚，公司党委、工会、团总支、女工委组织邀请了公司全体女职工在公司行政楼4楼，参加瓯宝公司庆祝“三八”国际劳动妇女节，暨第四届“和谐瓯宝·魅力女性”趣味运动会。构建和谐向上的企业发展环境，进一步活跃节日氛围，公司工会主席、行政副总周海潮，生产副总张献国，采购副总鲁世勇在主席台就坐，并担任本次活动的裁判组。公司工会主席周海潮在比赛前发表讲话，感谢女职工对公司的敬业付出，瓯宝的发展有你们的汗水、瓯宝的业绩有你们的功勋，150余名女性职工为公司的发展贡献自己的力量，撑起半边天。并代表公司为每一位女职工送上一份精美的礼品。\r\n</p>\r\n<p>\r\n	此次比赛共设了5个项目：急速呼啦圈、双人跳绳、速运密封圈、拍篮球绕障碍接力、踩气球；简单却趣味横生。虽说个个都是女性，但是个个不甘示弱，斗志昂扬。现场气氛热烈，笑声不断。比如牡丹队检验科的袁兰兰和周赛宏的双人跳绳，跳绳如轻盈的燕子就像是脚上装了弹簧一样，在没有预先练习配合的情况下，一分钟的时间里跳了120多次，相当于一秒钟跳了2次！现场的队友和观众都为之惊叹。当然让大家大笑不止的项目也有，比如拍篮球绕障碍接力比赛，由于女职工对拍篮球相对来说要陌生很多，面对弹起的篮球真是束手无策，时不时的砸到脚上，篮球就搜的一下滚了出去，要不就是用力拍几下就飞过头顶，撞到障碍物上了，要么就追着裁判到处跑，惹得大家捧腹大笑；最后的踩气球项目，是本次比赛的最大看点，2队正面PK，5对5精彩对决！各队背负着本队的荣耀，脚上绑着鼓起的气球，冲向对面开始猛踩！砰！砰！砰！一场别开生面的“摔跤”比赛开始了，一个个抓着对方的手臂、肩膀，脚下一顿乱踩，也不知道踩的是队友的气球还是对方的气球。比赛的人满脸通红，聚精会神一边想法去踩气球、一边小心保护自己的气球，看的人满面笑容、捶胸顿足的，一边叫喊着加油！一边拿着手机拍视频、拍照片，留下美好的瞬间和欢乐的笑点。\r\n</p>\r\n<p>\r\n	整个赛场上没有参赛的女同胞也为选手们加油喝彩，比赛不是一个人在完成，也不是只有参赛者在完成，而是整个团队。赛场上口号无比响亮，掌声此起彼伏，热闹非凡。通过轻松有趣的比赛活动，使女员工在紧张忙碌的工作中身心得以放松，提高公司的凝聚力，加强员工之间的相互帮忙、相互合作的精神。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('21', '0', '<p>\r\n	阳春三月，人面桃花相映红！春风扑面，瓯宝巾帼显英雄！在第106个三八国际妇女节来临之际，公司以趣味运动会的方式为广大女性同胞们进行庆祝。\r\n</p>\r\n<p>\r\n	3月8日晚，公司党委、工会、团总支、女工委组织邀请了公司全体女职工在公司行政楼4楼，参加瓯宝公司庆祝“三八”国际劳动妇女节，暨第四届“和谐瓯宝·魅力女性”趣味运动会。构建和谐向上的企业发展环境，进一步活跃节日氛围，公司工会主席、行政副总周海潮，生产副总张献国，采购副总鲁世勇在主席台就坐，并担任本次活动的裁判组。公司工会主席周海潮在比赛前发表讲话，感谢女职工对公司的敬业付出，瓯宝的发展有你们的汗水、瓯宝的业绩有你们的功勋，150余名女性职工为公司的发展贡献自己的力量，撑起半边天。并代表公司为每一位女职工送上一份精美的礼品。\r\n</p>\r\n<p>\r\n	此次比赛共设了5个项目：急速呼啦圈、双人跳绳、速运密封圈、拍篮球绕障碍接力、踩气球；简单却趣味横生。虽说个个都是女性，但是个个不甘示弱，斗志昂扬。现场气氛热烈，笑声不断。比如牡丹队检验科的袁兰兰和周赛宏的双人跳绳，跳绳如轻盈的燕子就像是脚上装了弹簧一样，在没有预先练习配合的情况下，一分钟的时间里跳了120多次，相当于一秒钟跳了2次！现场的队友和观众都为之惊叹。当然让大家大笑不止的项目也有，比如拍篮球绕障碍接力比赛，由于女职工对拍篮球相对来说要陌生很多，面对弹起的篮球真是束手无策，时不时的砸到脚上，篮球就搜的一下滚了出去，要不就是用力拍几下就飞过头顶，撞到障碍物上了，要么就追着裁判到处跑，惹得大家捧腹大笑；最后的踩气球项目，是本次比赛的最大看点，2队正面PK，5对5精彩对决！各队背负着本队的荣耀，脚上绑着鼓起的气球，冲向对面开始猛踩！砰！砰！砰！一场别开生面的“摔跤”比赛开始了，一个个抓着对方的手臂、肩膀，脚下一顿乱踩，也不知道踩的是队友的气球还是对方的气球。比赛的人满脸通红，聚精会神一边想法去踩气球、一边小心保护自己的气球，看的人满面笑容、捶胸顿足的，一边叫喊着加油！一边拿着手机拍视频、拍照片，留下美好的瞬间和欢乐的笑点。\r\n</p>\r\n<p>\r\n	整个赛场上没有参赛的女同胞也为选手们加油喝彩，比赛不是一个人在完成，也不是只有参赛者在完成，而是整个团队。赛场上口号无比响亮，掌声此起彼伏，热闹非凡。通过轻松有趣的比赛活动，使女员工在紧张忙碌的工作中身心得以放松，提高公司的凝聚力，加强员工之间的相互帮忙、相互合作的精神。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('22', '0', '<p>\r\n	阳春三月，人面桃花相映红！春风扑面，瓯宝巾帼显英雄！在第106个三八国际妇女节来临之际，公司以趣味运动会的方式为广大女性同胞们进行庆祝。\r\n</p>\r\n<p>\r\n	3月8日晚，公司党委、工会、团总支、女工委组织邀请了公司全体女职工在公司行政楼4楼，参加瓯宝公司庆祝“三八”国际劳动妇女节，暨第四届“和谐瓯宝·魅力女性”趣味运动会。构建和谐向上的企业发展环境，进一步活跃节日氛围，公司工会主席、行政副总周海潮，生产副总张献国，采购副总鲁世勇在主席台就坐，并担任本次活动的裁判组。公司工会主席周海潮在比赛前发表讲话，感谢女职工对公司的敬业付出，瓯宝的发展有你们的汗水、瓯宝的业绩有你们的功勋，150余名女性职工为公司的发展贡献自己的力量，撑起半边天。并代表公司为每一位女职工送上一份精美的礼品。\r\n</p>\r\n<p>\r\n	此次比赛共设了5个项目：急速呼啦圈、双人跳绳、速运密封圈、拍篮球绕障碍接力、踩气球；简单却趣味横生。虽说个个都是女性，但是个个不甘示弱，斗志昂扬。现场气氛热烈，笑声不断。比如牡丹队检验科的袁兰兰和周赛宏的双人跳绳，跳绳如轻盈的燕子就像是脚上装了弹簧一样，在没有预先练习配合的情况下，一分钟的时间里跳了120多次，相当于一秒钟跳了2次！现场的队友和观众都为之惊叹。当然让大家大笑不止的项目也有，比如拍篮球绕障碍接力比赛，由于女职工对拍篮球相对来说要陌生很多，面对弹起的篮球真是束手无策，时不时的砸到脚上，篮球就搜的一下滚了出去，要不就是用力拍几下就飞过头顶，撞到障碍物上了，要么就追着裁判到处跑，惹得大家捧腹大笑；最后的踩气球项目，是本次比赛的最大看点，2队正面PK，5对5精彩对决！各队背负着本队的荣耀，脚上绑着鼓起的气球，冲向对面开始猛踩！砰！砰！砰！一场别开生面的“摔跤”比赛开始了，一个个抓着对方的手臂、肩膀，脚下一顿乱踩，也不知道踩的是队友的气球还是对方的气球。比赛的人满脸通红，聚精会神一边想法去踩气球、一边小心保护自己的气球，看的人满面笑容、捶胸顿足的，一边叫喊着加油！一边拿着手机拍视频、拍照片，留下美好的瞬间和欢乐的笑点。\r\n</p>\r\n<p>\r\n	整个赛场上没有参赛的女同胞也为选手们加油喝彩，比赛不是一个人在完成，也不是只有参赛者在完成，而是整个团队。赛场上口号无比响亮，掌声此起彼伏，热闹非凡。通过轻松有趣的比赛活动，使女员工在紧张忙碌的工作中身心得以放松，提高公司的凝聚力，加强员工之间的相互帮忙、相互合作的精神。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('23', '0', '<h3>\r\n	智能门控产品及行业解决方案提供商\r\n</h3>\r\n<p>\r\n	瓯宝安防科技股份有限公司，始创于1987年，致力于不断提升智能化处理技术和生物识别技术在门控行业的应用，面向全球提供智能门控、专业的行业解决方案与优质的服务，为客户持续创造更大价值。\r\n</p>\r\n<h3>\r\n	在国内安防行业率先建立了智能门控产品研发中心\r\n</h3>\r\n<p>\r\n	公司以智能化处理技术及生物识别技术为核心，在国内安防行业率先建立了智能门控产品研发中心，中心汇集了国内光学、机电、指纹算法、工业设计等方面的众多精英。研发中心创立之初，就十分注重自主知识产权的维护，目前已拥有发明专利、实用新型专利、软件著作权专利、外观专利等专利几十余项。瓯宝在创立并保护自主知识产权方面走在了智能门控行业的前沿。\r\n</p>\r\n<h3>\r\n	拥有完善的自主核心技术和可持续研发能力\r\n</h3>\r\n<p>\r\n	瓯宝拥有完善的自主核心技术和可持续研发能力，提供指纹锁、闭门器、电动闭门器、密码锁、智能锁、防尾随联动互锁系统、门禁系统等门控产品，并针对金融、公安、电讯、交通、司法、教育、电力、水利、军队等众多行业提供合适的细分产品与专业的行业解决方案。这些产品和方案面向全球100多个国家和地区，在北京人民大会堂、北京奥运会、北京大学、上海海洋馆、广东电视台等重大项目中得到广泛应用。\r\n</p>\r\n<h3>\r\n	营销及服务网络遍及全球\r\n</h3>\r\n<p>\r\n	瓯宝公司的营销及服务网络覆盖全球，瓯宝产品 80% 出口欧美发达国家及地区。在全球八十多个国家和地区均有销售渠道，国内各省、市均设有销售（服务）网络。\r\n</p>\r\n<h3>\r\n	矢志成为受人尊敬的、全球卓著的智能门控行业的领跑者\r\n</h3>\r\n<p>\r\n	持续快速发展的瓯宝，已获得了行业内外的普遍认可。 2010 年瓯宝连续获得国家高新技术企业，浙江省省级技术中心，浙江省最具投资价值100强成长企业等殊荣。“专业、诚信、持续创新”的瓯宝，以人人轻松享有安全智能的品质生活为愿景，矢志成为受人尊敬的、全球卓著的专业公司和智能门控行业的领跑者。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('24', '0', '<h3>\r\n	荣誉奖项\r\n</h3>\r\n<p>\r\n	瓯宝安防科技股份有限公司，始创于1987年，致力于不断提升智能化处理技术和生物识别技术在门控行业的应用，面向全球提供智能门控、专业的行业解决方案与优质的服务，为客户持续创造更大价值。\r\n</p>\r\n<h3>\r\n	在国内安防行业率先建立了智能门控产品研发中心\r\n</h3>\r\n<p>\r\n	公司以智能化处理技术及生物识别技术为核心，在国内安防行业率先建立了智能门控产品研发中心，中心汇集了国内光学、机电、指纹算法、工业设计等方面的众多精英。研发中心创立之初，就十分注重自主知识产权的维护，目前已拥有发明专利、实用新型专利、软件著作权专利、外观专利等专利几十余项。瓯宝在创立并保护自主知识产权方面走在了智能门控行业的前沿。\r\n</p>\r\n<h3>\r\n	拥有完善的自主核心技术和可持续研发能力\r\n</h3>\r\n<p>\r\n	瓯宝拥有完善的自主核心技术和可持续研发能力，提供指纹锁、闭门器、电动闭门器、密码锁、智能锁、防尾随联动互锁系统、门禁系统等门控产品，并针对金融、公安、电讯、交通、司法、教育、电力、水利、军队等众多行业提供合适的细分产品与专业的行业解决方案。这些产品和方案面向全球100多个国家和地区，在北京人民大会堂、北京奥运会、北京大学、上海海洋馆、广东电视台等重大项目中得到广泛应用。\r\n</p>\r\n<h3>\r\n	营销及服务网络遍及全球\r\n</h3>\r\n<p>\r\n	瓯宝公司的营销及服务网络覆盖全球，瓯宝产品 80% 出口欧美发达国家及地区。在全球八十多个国家和地区均有销售渠道，国内各省、市均设有销售（服务）网络。\r\n</p>\r\n<h3>\r\n	矢志成为受人尊敬的、全球卓著的智能门控行业的领跑者\r\n</h3>\r\n<p>\r\n	持续快速发展的瓯宝，已获得了行业内外的普遍认可。 2010 年瓯宝连续获得国家高新技术企业，浙江省省级技术中心，浙江省最具投资价值100强成长企业等殊荣。“专业、诚信、持续创新”的瓯宝，以人人轻松享有安全智能的品质生活为愿景，矢志成为受人尊敬的、全球卓著的专业公司和智能门控行业的领跑者。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('26', '0', '保障期', '', '0');
INSERT INTO `tp_document_article` VALUES ('27', '0', '<p>\r\n	目前应用于民用市场主要有三种类型的指纹传感器，即：光学传感器、半导体传感器、射频传感器。 光学指纹识别传感器是通过在光学镜头上进行物体挤压或是手指滚动获得指纹图片。传感器屏幕一般是由工业金刚石制作而成。 半导体指纹识别传感器是由手指对传感器产生的压力或者热冲击，使电荷产生变化后通过识读电荷变化获取图像，这类传感器的屏幕是一块薄薄的胶片。 射频指纹识别传感器是利用由传感器发出一段电磁场或超声波，碰到阻碍物后换回，通过试读返回的电波的所携带的信号而转换成图像。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('37', '0', '<h3>\r\n	瓯宝智能家居产品招商模式\r\n</h3>\r\n<p>\r\n	瓯宝智能家居，以简单、方便、独特为载体，开启了国内智能市场先河。率先进入市场销售，从研发到生产再到销售，形成一条龙的自主智能新产品，从功能到应用再到系统，是引领智能家居的全新产品。\r\n</p>\r\n<p>\r\n	1、产品无需布线，安装方便快捷；\r\n</p>\r\n<p>\r\n	2、手机智能操作，使用简单易学；\r\n</p>\r\n<p>\r\n	3、多模式选择，一键式操作；\r\n</p>\r\n<p>\r\n	4、3年质保保修承诺；\r\n</p>\r\n<h3>\r\n	政策支持\r\n</h3>\r\n<span>营销费用</span> \r\n<p>\r\n	返利：每季超额销售额以10%返利，每季度进行返利结算，用于货款抵扣；\r\n</p>\r\n<p>\r\n	累计销额每超过100万，公司提取5%做为区域营销经费支持，由公司协助进行市场推广和消费者活动。\r\n</p>\r\n<h3>\r\n	营销渠道\r\n</h3>\r\n<span>电商合作</span> \r\n<p>\r\n	公司与苏宁、天猫等合作，所在区域的经销商负责配送、安装、维修，管理费用按照销额的8%提取；\r\n</p>\r\n<p>\r\n	经销商直接与苏宁等合作，由经销商承担营运成本，负责产品的供应、安装、维护，经销商享受全部营销成果。\r\n</p>\r\n<span>工程项目</span> \r\n<p>\r\n	由经销商洽谈的工程项目，销售价格和出厂价格经公司核准后，由经销商负责维护安装，并由经销商享受两者的差额；\r\n</p>\r\n<p>\r\n	工程项目由公司直管，由当地/就近的经销商负责安装、维护，管理费用依据实际销额进行协商。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('39', '0', '<p>\r\n	加盟优势\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('47', '0', '<p>\r\n	1、登陆APP，进入“管理平台”，选择“我的设备”，点击空调类设备如“会议室空调”进入“编辑”界面，设置空调默认温度，如“模式：制冷25℃”后保存。\r\n</p>\r\n<p>\r\n	2、可根据需要，在“我的模式”或者“添加模式”中设置相应模式，如在“设备开”中勾选“会议室空调”，在“我的时间”或者“添加时间”添加定时功能，如勾选“会议室空调”并设置“设备状态”为开后保存，退出管理平台，在APP设置界面点击“更新模式信息”和“更新设备信息”，或者点击一键更新。\r\n</p>\r\n<p>\r\n	3、当设定的场景模式或定时功能启用时，”会议室空调“的温度即为默认温度值：25℃。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('48', '0', '<p>\r\n	阳春三月，人面桃花相映红！春风扑面，瓯宝巾帼显英雄！在第106个三八国际妇女节来临之际，公司以趣味运动会的方式为广大女性同胞们进行庆祝。\r\n</p>\r\n<p>\r\n	3月8日晚，公司党委、工会、团总支、女工委组织邀请了公司全体女职工在公司行政楼4楼，参加瓯宝公司庆祝“三八”国际劳动妇女节，暨第四届“和谐瓯宝·魅力女性”趣味运动会。构建和谐向上的企业发展环境，进一步活跃节日氛围，公司工会主席、行政副总周海潮，生产副总张献国，采购副总鲁世勇在主席台就坐，并担任本次活动的裁判组。公司工会主席周海潮在比赛前发表讲话，感谢女职工对公司的敬业付出，瓯宝的发展有你们的汗水、瓯宝的业绩有你们的功勋，150余名女性职工为公司的发展贡献自己的力量，撑起半边天。并代表公司为每一位女职工送上一份精美的礼品。\r\n</p>\r\n<p>\r\n	此次比赛共设了5个项目：急速呼啦圈、双人跳绳、速运密封圈、拍篮球绕障碍接力、踩气球；简单却趣味横生。虽说个个都是女性，但是个个不甘示弱，斗志昂扬。现场气氛热烈，笑声不断。比如牡丹队检验科的袁兰兰和周赛宏的双人跳绳，跳绳如轻盈的燕子就像是脚上装了弹簧一样，在没有预先练习配合的情况下，一分钟的时间里跳了120多次，相当于一秒钟跳了2次！现场的队友和观众都为之惊叹。当然让大家大笑不止的项目也有，比如拍篮球绕障碍接力比赛，由于女职工对拍篮球相对来说要陌生很多，面对弹起的篮球真是束手无策，时不时的砸到脚上，篮球就搜的一下滚了出去，要不就是用力拍几下就飞过头顶，撞到障碍物上了，要么就追着裁判到处跑，惹得大家捧腹大笑；最后的踩气球项目，是本次比赛的最大看点，2队正面PK，5对5精彩对决！各队背负着本队的荣耀，脚上绑着鼓起的气球，冲向对面开始猛踩！砰！砰！砰！一场别开生面的“摔跤”比赛开始了，一个个抓着对方的手臂、肩膀，脚下一顿乱踩，也不知道踩的是队友的气球还是对方的气球。比赛的人满脸通红，聚精会神一边想法去踩气球、一边小心保护自己的气球，看的人满面笑容、捶胸顿足的，一边叫喊着加油！一边拿着手机拍视频、拍照片，留下美好的瞬间和欢乐的笑点。\r\n</p>\r\n<p>\r\n	整个赛场上没有参赛的女同胞也为选手们加油喝彩，比赛不是一个人在完成，也不是只有参赛者在完成，而是整个团队。赛场上口号无比响亮，掌声此起彼伏，热闹非凡。通过轻松有趣的比赛活动，使女员工在紧张忙碌的工作中身心得以放松，提高公司的凝聚力，加强员工之间的相互帮忙、相互合作的精神。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('49', '0', '<p>\r\n	1、登陆APP，进入“管理平台”，选择“我的设备”，点击空调类设备如“会议室空调”进入“编辑”界面，设置空调默认温度，如“模式：制冷25℃”后保存。\r\n</p>\r\n<p>\r\n	2、可根据需要，在“我的模式”或者“添加模式”中设置相应模式，如在“设备开”中勾选“会议室空调”，在“我的时间”或者“添加时间”添加定时功能，如勾选“会议室空调”并设置“设备状态”为开后保存，退出管理平台，在APP设置界面点击“更新模式信息”和“更新设备信息”，或者点击一键更新。\r\n</p>\r\n<p>\r\n	3、当设定的场景模式或定时功能启用时，”会议室空调“的温度即为默认温度值：25℃。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('50', '0', '<p>\r\n	目前应用于民用市场主要有三种类型的指纹传感器，即：光学传感器、半导体传感器、射频传感器。 光学指纹识别传感器是通过在光学镜头上进行物体挤压或是手指滚动获得指纹图片。传感器屏幕一般是由工业金刚石制作而成。 半导体指纹识别传感器是由手指对传感器产生的压力或者热冲击，使电荷产生变化后通过识读电荷变化获取图像，这类传感器的屏幕是一块薄薄的胶片。 射频指纹识别传感器是利用由传感器发出一段电磁场或超声波，碰到阻碍物后换回，通过试读返回的电波的所携带的信号而转换成图像。\r\n</p>', '', '0');
INSERT INTO `tp_document_article` VALUES ('51', '0', '保障期', '', '0');

-- ----------------------------
-- Table structure for tp_document_download
-- ----------------------------
DROP TABLE IF EXISTS `tp_document_download`;
CREATE TABLE `tp_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- ----------------------------
-- Records of tp_document_download
-- ----------------------------
INSERT INTO `tp_document_download` VALUES ('11', '0', '上传文件测试', '', '19', '0', '1260440');
INSERT INTO `tp_document_download` VALUES ('12', '0', '', '', '0', '0', '0');
INSERT INTO `tp_document_download` VALUES ('13', '0', '下载测试2', '', '25', '0', '1142954');
INSERT INTO `tp_document_download` VALUES ('28', '0', '', '', '26', '0', '1156631');
INSERT INTO `tp_document_download` VALUES ('32', '0', '七彩灯', '', '29', '24', '1560388');
INSERT INTO `tp_document_download` VALUES ('33', '0', '', '', '32', '1', '2134146');
INSERT INTO `tp_document_download` VALUES ('34', '0', '', '', '33', '5', '1358753');
INSERT INTO `tp_document_download` VALUES ('35', '0', '', '', '34', '7', '1684030');
INSERT INTO `tp_document_download` VALUES ('36', '0', '', '', '35', '2', '1876741');
INSERT INTO `tp_document_download` VALUES ('52', '0', '', '', '35', '2', '1876741');
INSERT INTO `tp_document_download` VALUES ('53', '0', '', '', '34', '7', '1684030');
INSERT INTO `tp_document_download` VALUES ('54', '0', '', '', '33', '5', '1358753');
INSERT INTO `tp_document_download` VALUES ('55', '0', '', '', '32', '1', '2134146');
INSERT INTO `tp_document_download` VALUES ('56', '0', '七彩灯', '', '29', '24', '1560388');

-- ----------------------------
-- Table structure for tp_document_goods
-- ----------------------------
DROP TABLE IF EXISTS `tp_document_goods`;
CREATE TABLE `tp_document_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` int(10) unsigned NOT NULL COMMENT 'code总数',
  `character` text NOT NULL COMMENT '产品特点',
  `instruction` text NOT NULL COMMENT '说明书',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tp_document_goods
-- ----------------------------
INSERT INTO `tp_document_goods` VALUES ('14', '0', '医疗', '');
INSERT INTO `tp_document_goods` VALUES ('15', '0', 'hospital1', '');
INSERT INTO `tp_document_goods` VALUES ('40', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('41', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('42', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('43', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('44', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('45', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('46', '0', '', '说明书');
INSERT INTO `tp_document_goods` VALUES ('61', '0', '', '说明书');
INSERT INTO `tp_document_goods` VALUES ('62', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('63', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('64', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('65', '0', '', '');
INSERT INTO `tp_document_goods` VALUES ('66', '0', '', '说明书');
INSERT INTO `tp_document_goods` VALUES ('67', '0', '', '');

-- ----------------------------
-- Table structure for tp_file
-- ----------------------------
DROP TABLE IF EXISTS `tp_file`;
CREATE TABLE `tp_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `uk_md5` (`md5`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of tp_file
-- ----------------------------
INSERT INTO `tp_file` VALUES ('1', '3年单域名.pdf', '581022d29a296.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477452498');
INSERT INTO `tp_file` VALUES ('2', '3年单域名.pdf', '5810245c12c96.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477452892');
INSERT INTO `tp_file` VALUES ('3', '3年单域名.pdf', '581024cba9c26.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477453003');
INSERT INTO `tp_file` VALUES ('4', 'img-151110111301.pdf', '581024d7a7bac.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1260440', 'bd52b16345e4d2136643a28051705002', 'b54aefd136d0a6fe2a0792bd1d599d28c8cb50b8', '0', '', '1477453015');
INSERT INTO `tp_file` VALUES ('5', 'img-151110111301.pdf', '581024efa4a58.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1260440', 'bd52b16345e4d2136643a28051705002', 'b54aefd136d0a6fe2a0792bd1d599d28c8cb50b8', '0', '', '1477453039');
INSERT INTO `tp_file` VALUES ('6', 'SSL证书购买合同1.1.pdf', '581043906027f.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '160225', '268435e6cc9737778df67c99854d8b12', '9f1f448e3295a523ae47046007f6dd1841c9c573', '0', '', '1477460880');
INSERT INTO `tp_file` VALUES ('7', 'SSL证书购买合同1.2.pdf', '581043b81e8c8.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '161725', '6ac35ff24c7b4e25bc196d42fd6143ab', 'd610e12efeec386795f9e118aef70e5879608c6b', '0', '', '1477460920');
INSERT INTO `tp_file` VALUES ('8', '3年单域名.pdf', '581043fc6b2fb.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477460988');
INSERT INTO `tp_file` VALUES ('9', '3年单域名.pdf', '58104417359af.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477461015');
INSERT INTO `tp_file` VALUES ('10', 'SSL证书购买合同1.1.pdf', '5810458c798fd.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '160225', '268435e6cc9737778df67c99854d8b12', '9f1f448e3295a523ae47046007f6dd1841c9c573', '0', '', '1477461388');
INSERT INTO `tp_file` VALUES ('11', 'SSL证书购买合同1.1.pdf', '581045ed07eb7.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '160225', '268435e6cc9737778df67c99854d8b12', '9f1f448e3295a523ae47046007f6dd1841c9c573', '0', '', '1477461484');
INSERT INTO `tp_file` VALUES ('12', '3年单域名.pdf', '581046210e816.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477461537');
INSERT INTO `tp_file` VALUES ('13', 'SSL证书购买合同1.1.pdf', '581046ac55c95.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '160225', '268435e6cc9737778df67c99854d8b12', '9f1f448e3295a523ae47046007f6dd1841c9c573', '0', '', '1477461676');
INSERT INTO `tp_file` VALUES ('14', '3年单域名.pdf', '581046e8ab1a1.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477461736');
INSERT INTO `tp_file` VALUES ('15', '3年单域名.pdf', '581046f5be53d.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477461749');
INSERT INTO `tp_file` VALUES ('16', '3年单域名.pdf', '58104851827c8.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477462097');
INSERT INTO `tp_file` VALUES ('17', '3年单域名.pdf', '581048bcad3e2.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477462204');
INSERT INTO `tp_file` VALUES ('18', '3年单域名.pdf', '581048e63287f.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '155234', '1c37f3a9d7ebeb66df46f6d89c419245', 'ae7b833b7474631e454347dacc4131fb826b4e72', '0', '', '1477462246');
INSERT INTO `tp_file` VALUES ('19', 'img-151110111301.pdf', '5810499811dbd.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1260440', 'bd52b16345e4d2136643a28051705002', 'b54aefd136d0a6fe2a0792bd1d599d28c8cb50b8', '0', '', '1477462424');
INSERT INTO `tp_file` VALUES ('20', '闭门器.pdf', '58104aff20a36.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1403429', '19bffd6e7e38295ff217fc2774a86835', '2f4f8b6624e4e5430c71a5cc80cf91e42f7fe0b7', '0', '', '1477462783');
INSERT INTO `tp_file` VALUES ('21', '单火触摸开关.pdf', '58104b20d8b40.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1493100', 'b546155e6368a4654d21e41c1e63446b', '863cfd8b427104c87981a0d49f7e474ffb4ea035', '0', '', '1477462816');
INSERT INTO `tp_file` VALUES ('22', '闭门器.pdf', '58104b92b56d8.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1403429', '19bffd6e7e38295ff217fc2774a86835', '2f4f8b6624e4e5430c71a5cc80cf91e42f7fe0b7', '0', '', '1477462930');
INSERT INTO `tp_file` VALUES ('23', '七彩灯.pdf', '58104dd9ea017.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1603194', 'c5e77da19898bf82d1625b4518507a0c', '8b2601184af152370b0e9c138d171626c1db1272', '0', '', '1477463513');
INSERT INTO `tp_file` VALUES ('24', '水浸报警.pdf', '58104e54e5219.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1864265', '68231b52c93aa3812d8236a2d1cbd1b9', '44ada7f2fe9ee2713726783180c23f9cdcab9663', '0', '', '1477463636');
INSERT INTO `tp_file` VALUES ('25', '智能插座（万能）.pdf', '58104f3f11500.pdf', '2016-10-26/', 'pdf', 'application/octet-stream', '1142954', 'aa14e306f05ab1d1e3a14c5a24311499', '3191b60bc95ababbf2248010db4592458f543e24', '0', '', '1477463871');
INSERT INTO `tp_file` VALUES ('26', '移动插座.pdf', '581ae2dcebfb5.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '1156631', '32720f6f35b21ea6ad46faffebf705b4', '4ae88d4f856a3f3fc325cac8203228408f13c073', '0', '', '1478157020');
INSERT INTO `tp_file` VALUES ('27', '七彩灯.pdf', '581ae37bb1686.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '1560388', '55ac1e5f40c7e62a85cdf730800ed24d', 'f050f6ab94c9a17985c71045101cea7327af3df5', '0', '', '1478157179');
INSERT INTO `tp_file` VALUES ('28', '七彩灯.pdf', '581ae38c5cadf.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '1560388', '55ac1e5f40c7e62a85cdf730800ed24d', 'f050f6ab94c9a17985c71045101cea7327af3df5', '0', '', '1478157196');
INSERT INTO `tp_file` VALUES ('29', '七彩灯.pdf', '581ae3d976a89.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '1560388', '55ac1e5f40c7e62a85cdf730800ed24d', 'f050f6ab94c9a17985c71045101cea7327af3df5', '0', '', '1478157273');
INSERT INTO `tp_file` VALUES ('30', '智能遥控.pdf', '581aeeb20a753.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '2134146', 'f2c6f850c1fd816894fd79992f483fc7', '5a9eb477a5b02cb776951786081d99f91d46b0fe', '0', '', '1478160049');
INSERT INTO `tp_file` VALUES ('31', '智能遥控.pdf', '581aef3988212.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '2134146', 'f2c6f850c1fd816894fd79992f483fc7', '5a9eb477a5b02cb776951786081d99f91d46b0fe', '0', '', '1478160185');
INSERT INTO `tp_file` VALUES ('32', '智能遥控.pdf', '581af473e48c9.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '2134146', 'f2c6f850c1fd816894fd79992f483fc7', '5a9eb477a5b02cb776951786081d99f91d46b0fe', '0', '', '1478161523');
INSERT INTO `tp_file` VALUES ('33', '闭门器.pdf', '581af556c21e8.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '1358753', '2c2d987e7795ccedc743aae1746d55d7', 'ee5f9dd994cc81075980ce925ac61fbd111e6635', '0', '', '1478161750');
INSERT INTO `tp_file` VALUES ('34', '单火触摸开关.pdf', '581af95698438.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '1684030', '4ff81b5e7dcaaa2687720af596aa88c8', '142c04f5462edd6b659b84884c13da2f4663e270', '0', '', '1478162774');
INSERT INTO `tp_file` VALUES ('35', '红外人体感应.pdf', '581afc862cc17.pdf', '2016-11-03/', 'pdf', 'application/octet-stream', '1876741', '4d1e630668bb7e8350de17768fb283f9', 'fec16a5db527ff5e3300c5a0915ae4b4abe054fc', '0', '', '1478163590');

-- ----------------------------
-- Table structure for tp_hooks
-- ----------------------------
DROP TABLE IF EXISTS `tp_hooks`;
CREATE TABLE `tp_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_hooks
-- ----------------------------
INSERT INTO `tp_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '1476066523', '', '1');
INSERT INTO `tp_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop', '1');
INSERT INTO `tp_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '1476066302', 'addons,Attachment', '1');
INSERT INTO `tp_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '1476087527', 'SocialComment,addons,Attachment', '1');
INSERT INTO `tp_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '', '1');
INSERT INTO `tp_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment', '1');
INSERT INTO `tp_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '1476066833', 'Editor', '1');
INSERT INTO `tp_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1476671282', 'EditorForAdmin', '1');
INSERT INTO `tp_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SystemInfo,SiteStat,DevTeam', '1');
INSERT INTO `tp_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1476066251', 'Editor', '1');
INSERT INTO `tp_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1476066018', '', '1');
INSERT INTO `tp_hooks` VALUES ('17', 'look_header', 'header测试', '1', '1476071371', '', '1');

-- ----------------------------
-- Table structure for tp_member
-- ----------------------------
DROP TABLE IF EXISTS `tp_member`;
CREATE TABLE `tp_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of tp_member
-- ----------------------------
INSERT INTO `tp_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '170', '51', '0', '1472733337', '2130706433', '1479430700', '1');
INSERT INTO `tp_member` VALUES ('2', 'qinxuening', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1');
INSERT INTO `tp_member` VALUES ('3', 'cym', '0', '0000-00-00', '', '0', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for tp_menu
-- ----------------------------
DROP TABLE IF EXISTS `tp_menu`;
CREATE TABLE `tp_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_menu
-- ----------------------------
INSERT INTO `tp_menu` VALUES ('1', '控制台', '0', '1', 'Index/index', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('2', '内容管理', '0', '2', 'Article/index', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0', '1');
INSERT INTO `tp_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0', '1');
INSERT INTO `tp_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('16', '管理员管理', '0', '7', 'User/index', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0', '1');
INSERT INTO `tp_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0', '1');
INSERT INTO `tp_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0', '1');
INSERT INTO `tp_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('43', '扩展', '0', '10', 'Addons/index', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0', '1');
INSERT INTO `tp_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0', '1');
INSERT INTO `tp_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0', '1');
INSERT INTO `tp_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('68', '设置', '0', '9', 'Config/group', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0', '1');
INSERT INTO `tp_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0', '1');
INSERT INTO `tp_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0', '1');
INSERT INTO `tp_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0', '1');
INSERT INTO `tp_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0', '1');
INSERT INTO `tp_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0', '1');
INSERT INTO `tp_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0', '1');
INSERT INTO `tp_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('93', '回收站', '0', '8', 'Article/recycle', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0', '1');
INSERT INTO `tp_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0', '1');
INSERT INTO `tp_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('122', '数据列表', '58', '0', 'think/lists', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('123', '审核列表', '3', '0', 'Article/examine', '1', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('125', '行为管理', '0', '6', 'User', '0', '', '', '0', '0');
INSERT INTO `tp_menu` VALUES ('126', '栏目管理', '0', '2', 'Category', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('127', '数据备份', '0', '6', 'Database', '0', '', '', '0', '1');
INSERT INTO `tp_menu` VALUES ('128', '频道管理', '0', '4', 'Model', '0', '', '', '0', '1');

-- ----------------------------
-- Table structure for tp_model
-- ----------------------------
DROP TABLE IF EXISTS `tp_model`;
CREATE TABLE `tp_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- ----------------------------
-- Records of tp_model
-- ----------------------------
INSERT INTO `tp_model` VALUES ('1', 'document', '基础文档', '0', '', '1', '{\"1\":[\"2\",\"3\",\"5\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"16\",\"17\",\"19\",\"20\"]}', '1:基础', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891233', '1476667488', '1', 'MyISAM');
INSERT INTO `tp_model` VALUES ('2', 'article', '文章', '1', '', '1', '{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891243', '1475984788', '1', 'MyISAM');
INSERT INTO `tp_model` VALUES ('3', 'download', '下载', '1', '', '1', '{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '0', '', '', '1383891252', '1387260449', '1', 'MyISAM');
INSERT INTO `tp_model` VALUES ('4', 'goods', '产品', '1', '', '1', '{\"1\":[\"2\",\"3\",\"33\",\"5\"],\"2\":[\"9\",\"16\",\"14\",\"13\",\"34\",\"17\",\"20\",\"19\",\"12\",\"11\",\"10\"]}', '1:基础,2:扩展', '', '', '', '', '', 'id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', '10', '', '', '1457341183', '1478437957', '1', 'MyISAM');

-- ----------------------------
-- Table structure for tp_picture
-- ----------------------------
DROP TABLE IF EXISTS `tp_picture`;
CREATE TABLE `tp_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_picture
-- ----------------------------
INSERT INTO `tp_picture` VALUES ('3', '/Uploads/Picture/2016-09-22/57e39ebedbe29.png', '', '322cc2f79b4b483426af0d5318a6f5d5', '03426e18e8e2a1ae113c799924825a0c2208508e', '1', '1474535102');
INSERT INTO `tp_picture` VALUES ('4', '/Uploads/Picture/2016-10-25/580eb0d4bad24.jpg', '', 'ddc0b01aec0318befc07f011016330be', '213c78c54c3e84b3f9b70b8f9f56267c03438a39', '1', '1477357780');
INSERT INTO `tp_picture` VALUES ('7', '/Uploads/Picture/2016-10-25/580ec56147cd9.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477363041');
INSERT INTO `tp_picture` VALUES ('6', '/Uploads/Picture/2016-10-25/580ec4bdb93df.png', '', 'e568e50d93351fa81f36c1b7efe2eb0a', '75386ac375cdb096a3574c03d3aac6033795631d', '1', '1477362877');
INSERT INTO `tp_picture` VALUES ('8', '/Uploads/Picture/2016-10-25/580ec58854ccb.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477363080');
INSERT INTO `tp_picture` VALUES ('9', '/Uploads/Picture/2016-10-25/580ecdf599be0.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477365237');
INSERT INTO `tp_picture` VALUES ('10', '/Uploads/Picture/2016-10-25/580ece3742c4b.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477365303');
INSERT INTO `tp_picture` VALUES ('11', '/Uploads/Picture/2016-10-25/580ece439ad4e.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477365315');
INSERT INTO `tp_picture` VALUES ('12', '/Uploads/Picture/2016-10-25/580ece4f52f93.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477365327');
INSERT INTO `tp_picture` VALUES ('13', '/Uploads/Picture/2016-10-25/580ece5ae9c54.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477365338');
INSERT INTO `tp_picture` VALUES ('14', '/Uploads/Picture/2016-10-25/580ed069073ad.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477365864');
INSERT INTO `tp_picture` VALUES ('15', '/Uploads/Picture/2016-10-25/580ed63ec40ec.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477367358');
INSERT INTO `tp_picture` VALUES ('16', '/Uploads/Picture/2016-10-25/580ed6fe3c0f2.jpg', '', '58b429a1f3c97d9aa665aa224590c9dd', '1ffe168580844219441f559ff52bbb39e7155302', '1', '1477367550');
INSERT INTO `tp_picture` VALUES ('17', '/Uploads/Picture/2016-10-25/580ee0e5b5288.jpg', '', 'ddc0b01aec0318befc07f011016330be', '213c78c54c3e84b3f9b70b8f9f56267c03438a39', '1', '1477370085');
INSERT INTO `tp_picture` VALUES ('18', '/Uploads/Picture/2016-10-25/580ee11181091.jpg', '', '292c629b99901693c8b9a419e4c47b29', '459c91a4c4d7b7f5a7c7682435a3d33017776f80', '1', '1477370129');
INSERT INTO `tp_picture` VALUES ('19', '/Uploads/Picture/2016-10-25/580ee13443054.jpg', '', '292c629b99901693c8b9a419e4c47b29', '459c91a4c4d7b7f5a7c7682435a3d33017776f80', '1', '1477370164');
INSERT INTO `tp_picture` VALUES ('20', '/Uploads/Picture/2016-10-25/580ee151242c8.jpg', '', '292c629b99901693c8b9a419e4c47b29', '459c91a4c4d7b7f5a7c7682435a3d33017776f80', '1', '1477370193');
INSERT INTO `tp_picture` VALUES ('21', '/Uploads/Picture/2016-10-25/580ee197680cb.jpg', '', '292c629b99901693c8b9a419e4c47b29', '459c91a4c4d7b7f5a7c7682435a3d33017776f80', '1', '1477370263');
INSERT INTO `tp_picture` VALUES ('22', '/Uploads/Picture/2016-10-25/580ee1a436e97.jpg', '', 'ddc0b01aec0318befc07f011016330be', '213c78c54c3e84b3f9b70b8f9f56267c03438a39', '1', '1477370276');
INSERT INTO `tp_picture` VALUES ('23', '/Uploads/Picture/2016-10-25/580eee718bbd5.jpg', '', 'ec569042ce9fe24d81f40f03576f5d3a', '69edea809a62c054978d1e57053c7f9aad7cb46a', '1', '1477373553');
INSERT INTO `tp_picture` VALUES ('24', '/Uploads/Picture/2016-10-25/580eee881c3ce.jpg', '', '3c24b48dd381b368dfeba5e8638b257c', 'd1bb5705d3ff8cbfacea94d068cb9660d5d90e3c', '1', '1477373576');
INSERT INTO `tp_picture` VALUES ('25', '/Uploads/Picture/2016-10-25/580eee95d0d98.jpg', '', '3c8a8cf7bb02ed9baabba9c1b01b76d9', 'cb929ec7fb65ff4f8a7e1063f1975aff78660d89', '1', '1477373589');
INSERT INTO `tp_picture` VALUES ('26', '/Uploads/Picture/2016-10-26/58102544079f1.png', '', 'a191f5c64b72e44189fef81a3475c7b7', '869b44e45b31203817c6fd31c789a9c422e53a85', '1', '1477453123');
INSERT INTO `tp_picture` VALUES ('27', '/Uploads/Picture/2016-10-26/58105d4a7070d.png', '', '0090d59754d7f0ee15dc11d9041c2475', '62a5dc233cb3645362c006cc0d9f0143bded4ee7', '1', '1477467466');
INSERT INTO `tp_picture` VALUES ('28', '/Uploads/Picture/2016-11-03/581b08d9980d0.png', '', 'a8257d6eb86a9f32a537afe4f30ba032', '4d3ad28d8c66a6666eabd0f9aa6c688c724a9b93', '1', '1478166745');
INSERT INTO `tp_picture` VALUES ('29', '/Uploads/Picture/2016-11-04/581be2fda800e.png', '', '897baea68f0c9cc480d9211074293d35', '10281922ec2583d86b4d80eff91d2fba0776d5ad', '1', '1478222589');
INSERT INTO `tp_picture` VALUES ('30', '/Uploads/Picture/2016-11-04/581be35a6b497.png', '', '704a017b84c8fc22dce86380a89cc1cd', '6034aec268028215b7b97f47c21387e181e8d928', '1', '1478222682');
INSERT INTO `tp_picture` VALUES ('31', '/Uploads/Picture/2016-11-04/581be409729d2.png', '', '5dbcac24fd93ad9268e8fab8f615fa2d', '11c1e44f7ded968f41bc04c2459e674d5db718e8', '1', '1478222857');
INSERT INTO `tp_picture` VALUES ('32', '/Uploads/Picture/2016-11-04/581be42d889a2.png', '', '831472ba173840ca4398a23d85900d18', 'fdef619134d882cd39a96a1c9be656895576f191', '1', '1478222893');
INSERT INTO `tp_picture` VALUES ('33', '/Uploads/Picture/2016-11-04/581be45587352.png', '', '46be5332a140b2a88ee71630ab579836', 'b1c22e3d6f2fe85cf9cf657d6e3ca2a5bd515a97', '1', '1478222933');
INSERT INTO `tp_picture` VALUES ('34', '/Uploads/Picture/2016-11-04/581be4701c669.png', '', '28f14bb64d59f03f98d618e90b476928', 'fd4ca886227087ca63c7339c64555633c6c1e4b9', '1', '1478222960');
INSERT INTO `tp_picture` VALUES ('35', '/Uploads/Picture/2016-11-04/581be4a4160be.png', '', '6bc1dfe8ca8dee438cac3a511d9e744b', '59d0b6a0f0971f4230118074327110b24e9032c2', '1', '1478223012');

-- ----------------------------
-- Table structure for tp_ucenter_admin
-- ----------------------------
DROP TABLE IF EXISTS `tp_ucenter_admin`;
CREATE TABLE `tp_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of tp_ucenter_admin
-- ----------------------------

-- ----------------------------
-- Table structure for tp_ucenter_app
-- ----------------------------
DROP TABLE IF EXISTS `tp_ucenter_app`;
CREATE TABLE `tp_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

-- ----------------------------
-- Records of tp_ucenter_app
-- ----------------------------

-- ----------------------------
-- Table structure for tp_ucenter_member
-- ----------------------------
DROP TABLE IF EXISTS `tp_ucenter_member`;
CREATE TABLE `tp_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of tp_ucenter_member
-- ----------------------------
INSERT INTO `tp_ucenter_member` VALUES ('1', 'admin', 'fb518d9f15415f3694db0d14979a8239', '2423859713@qq.com', '', '1472733337', '2130706433', '1479430700', '2130706433', '1472733337', '1');
INSERT INTO `tp_ucenter_member` VALUES ('2', 'qinxuening', '7c611e8fef136e9ae52abaeaca48f5c1', '2423859712@qq.com', '', '1476265461', '2130706433', '0', '0', '1476265461', '1');
INSERT INTO `tp_ucenter_member` VALUES ('3', 'cym', '7c611e8fef136e9ae52abaeaca48f5c1', '24238597134@qq.com', '', '1476412989', '2130706433', '0', '0', '1476412989', '1');

-- ----------------------------
-- Table structure for tp_ucenter_setting
-- ----------------------------
DROP TABLE IF EXISTS `tp_ucenter_setting`;
CREATE TABLE `tp_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

-- ----------------------------
-- Records of tp_ucenter_setting
-- ----------------------------

-- ----------------------------
-- Table structure for tp_url
-- ----------------------------
DROP TABLE IF EXISTS `tp_url`;
CREATE TABLE `tp_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

-- ----------------------------
-- Records of tp_url
-- ----------------------------

-- ----------------------------
-- Table structure for tp_userdata
-- ----------------------------
DROP TABLE IF EXISTS `tp_userdata`;
CREATE TABLE `tp_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_userdata
-- ----------------------------
