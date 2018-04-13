CREATE TABLE IF NOT EXISTS `TB_SORTS`(
   `sortid` CHAR(10) UNSIGNED AUTO_INCREMENT,
   `sortname` VARCHAR(10) NOT NULL,
   PRIMARY KEY ( `sortid` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



create table TB_COMMODITY
(
  comid     NUMBER(4) not null,
  comname   VARCHAR2(50) not null,
  price     NUMBER(10) not null,
  inventory NUMBER(10) not null,
  picture   VARCHAR2(200),
  describe  VARCHAR2(200),
  sortid    NUMBER(4) not null
)


alter table TB_COMMODITY
  add primary key (COMID)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );



alter table TB_COMMODITY
  add constraint FK_SORTID foreign key (SORTID)
  references TB_SORTS (SORTID);

create table TB_USERINFO
(
  userid    NUMBER(4) not null,
  password  VARCHAR2(10) not null,
  sign      NUMBER(3) not null,
  email     VARCHAR2(20) not null,
  realname  VARCHAR2(10),
  nickname  VARCHAR2(10),
  idnumber  VARCHAR2(18),
  sex       VARCHAR2(8),
  telephone VARCHAR2(13),
  birthday  DATE
)

alter table TB_USERINFO
  add primary key (USERID)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );


create table TB_COMMENT
(
  commentid  NUMBER(4) not null,
  content    VARCHAR2(200) not null,
  username   VARCHAR2(20) not null,
  createdate DATE not null,
  comid      NUMBER(4) not null,
  userid     NUMBER(4)
)


alter table TB_COMMENT
  add primary key (COMMENTID)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TB_COMMENT
  add constraint FK_COMID foreign key (COMID)
  references TB_COMMODITY (COMID);
alter table TB_COMMENT
  add constraint FK_COMMENT_USERID foreign key (USERID)
  references TB_USERINFO (USERID);

create table TB_SHIPADDRESS
(
  addressid      NUMBER not null,
  userid         NUMBER(4) not null,
  receiverperson VARCHAR2(10) not null,
  shiptelephone  VARCHAR2(200),
  location       VARCHAR2(200),
  detailaddress  VARCHAR2(200),
  sign           NUMBER(4)
)


alter table TB_SHIPADDRESS
  add primary key (ADDRESSID)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TB_SHIPADDRESS
  add constraint FK_USERID foreign key (USERID)
  references TB_USERINFO (USERID);


create table TB_ORDER
(
  orderid     NUMBER(8) not null,
  transtime   DATE not null,
  userid      NUMBER(4) not null,
  orderstatus NUMBER(3) not null,
  userwords   VARCHAR2(100),
  ordercount  NUMBER(4) not null,
  addressid   NUMBER
)


alter table TB_ORDER
  add primary key (ORDERID)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TB_ORDER
  add constraint FK_ORDER_ADDRESSID foreign key (ADDRESSID)
  references TB_SHIPADDRESS (ADDRESSID);
alter table TB_ORDER
  add constraint FK_ORDER_USERID foreign key (USERID)
  references TB_USERINFO (USERID);


create table TB_ORDERDETAIL
(
  detailid NUMBER(4) not null,
  orderid  NUMBER(8) not null,
  comid    NUMBER(4) not null,
  comcount NUMBER(3) not null
)


alter table TB_ORDERDETAIL
  add primary key (DETAILID)
  using index 
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TB_ORDERDETAIL
  add constraint FK_DETAIL_COMID foreign key (COMID)
  references TB_COMMODITY (COMID);
alter table TB_ORDERDETAIL
  add constraint FK_ORDERID foreign key (ORDERID)
  references TB_ORDER (ORDERID);

create table TB_SHOPCART
(
  shopcartid NUMBER(3) not null,
  comid      NUMBER(4) not null,
  comcount   NUMBER(4) not null,
  userid     NUMBER(4) not null
)
tablespace NEOSOFT_DEMO01
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TB_SHOPCART
  add primary key (SHOPCARTID)
  using index 
  tablespace NEOSOFT_DEMO01
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TB_SHOPCART
  add constraint FK_SHOPCART_COMID foreign key (COMID)
  references TB_COMMODITY (COMID);
alter table TB_SHOPCART
  add constraint FK_SHOPCART_USERID foreign key (USERID)
  references TB_USERINFO (USERID);

prompt Disabling triggers for TB_SORTS...
alter table TB_SORTS disable all triggers;
prompt Disabling triggers for TB_COMMODITY...
alter table TB_COMMODITY disable all triggers;
prompt Disabling triggers for TB_USERINFO...
alter table TB_USERINFO disable all triggers;
prompt Disabling triggers for TB_COMMENT...
alter table TB_COMMENT disable all triggers;
prompt Disabling triggers for TB_SHIPADDRESS...
alter table TB_SHIPADDRESS disable all triggers;
prompt Disabling triggers for TB_ORDER...
alter table TB_ORDER disable all triggers;
prompt Disabling triggers for TB_ORDERDETAIL...
alter table TB_ORDERDETAIL disable all triggers;
prompt Disabling triggers for TB_SHOPCART...
alter table TB_SHOPCART disable all triggers;
prompt Disabling foreign key constraints for TB_COMMODITY...
alter table TB_COMMODITY disable constraint FK_SORTID;
prompt Disabling foreign key constraints for TB_COMMENT...
alter table TB_COMMENT disable constraint FK_COMID;
alter table TB_COMMENT disable constraint FK_COMMENT_USERID;
prompt Disabling foreign key constraints for TB_SHIPADDRESS...
alter table TB_SHIPADDRESS disable constraint FK_USERID;
prompt Disabling foreign key constraints for TB_ORDER...
alter table TB_ORDER disable constraint FK_ORDER_ADDRESSID;
alter table TB_ORDER disable constraint FK_ORDER_USERID;
prompt Disabling foreign key constraints for TB_ORDERDETAIL...
alter table TB_ORDERDETAIL disable constraint FK_DETAIL_COMID;
alter table TB_ORDERDETAIL disable constraint FK_ORDERID;
prompt Disabling foreign key constraints for TB_SHOPCART...
alter table TB_SHOPCART disable constraint FK_SHOPCART_COMID;
alter table TB_SHOPCART disable constraint FK_SHOPCART_USERID;
prompt Loading TB_SORTS...
insert into TB_SORTS (sortid, sortname)
values (1, '咖啡');
insert into TB_SORTS (sortid, sortname)
values (2, '碳酸饮料');
insert into TB_SORTS (sortid, sortname)
values (3, '电解质');
insert into TB_SORTS (sortid, sortname)
values (4, '牛奶');
insert into TB_SORTS (sortid, sortname)
values (5, '啤酒');
insert into TB_SORTS (sortid, sortname)
values (6, '红酒');
insert into TB_SORTS (sortid, sortname)
values (7, '洋酒');
insert into TB_SORTS (sortid, sortname)
values (41, 'asdasd');
insert into TB_SORTS (sortid, sortname)
values (21, '锅包肉');
insert into TB_SORTS (sortid, sortname)
values (9, '达利园');
insert into TB_SORTS (sortid, sortname)
values (10, '洋酒');
commit;
prompt 11 records loaded
prompt Loading TB_COMMODITY...
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (1, '卡布奇诺', 12, 553, 'stupid', '好喝', 1);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (2, '摩卡', 33, 66, 'images/mokacoffee.jpg', '好喝', 1);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (3, '拿铁', 33, 66, null, '好喝', 1);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (4, '白咖啡', 33, 66, null, '好喝', 1);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (5, '星冰乐草莓', 33, 66, null, '好喝', 1);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (6, '豆浆', 33, 66, null, '好喝', 1);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (10, '可口可乐', 3, 20, null, '可口可乐公司', 2);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (11, '雪碧', 3, 20, null, '可口可乐公司', 2);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (13, '醒目', 3, 20, null, '可口可乐公司', 2);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (14, '美汁源果粒橙', 3, 20, null, '可口可乐公司', 2);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (8, '樱桃', 50, 100, null, null, 1);
commit;
prompt 11 records loaded
prompt Loading TB_USERINFO...
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (66, '123321', 0, 'test@qq.com', '傻逼', 'haha', null, 'male', '13480513695', to_date('03-04-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (67, 'asd123', 0, 'asdasd3@163.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (68, 'asdasd', 0, 'a123@163.com', 'asdasd', 'asdasd', null, 'male', '123123123', to_date('04-04-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (21, '8888', 0, '@qq.com', '林业乾', '林大哥', '44132319950625003x', '男', '13480513695', to_date('25-10-1995 15:16:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (22, '7758', 0, '321@qq.com', '林业乾', '哈哈', '44132319950625003x', '男', '13480512222', to_date('25-06-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (63, 'asd123', 0, '123123@163.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (64, '123', 0, '56465@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (65, '123456', 0, 'qaz@qq.com', 'asd', 'asfdasd', null, null, '1231213123', to_date('19-04-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (29, '123456', 0, '123654@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (30, '123', 0, 'qwer@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (31, '123', 0, 'qwewqeqweqw@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (32, '123', 0, '1231231@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (33, '123', 0, '123123@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (36, 'lyq123321', 0, '13470212@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (37, '123321', 0, '134702123@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (38, '123321', 0, '134702132@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (39, '123321', 0, '134702132@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (42, '123321', 0, '1347022123@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (1, 'asd123', 0, '123456@qq.com', null, '阿鹿', null, '男', '13480513695', to_date('04-04-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (61, 'asd123', 0, 'asdasd@163.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (62, '123', 0, '131313@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (2333, 'asd123', 1, 'QAQ@TAT.com', '曾海陆', 'admin', '123456789012345678', '男', '12345678901', to_date('25-10-1995 15:16:25', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 22 records loaded
prompt Loading TB_COMMENT...
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (26, '物流非常快,东西很不错,很好喝', '阿鹿', to_date('01-01-2017', 'dd-mm-yyyy'), 2, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (27, '物流非常快,东西很不错,很好喝', '阿鹿', to_date('01-01-2017', 'dd-mm-yyyy'), 3, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (28, '物流非常快,东西很不错,很好喝', '阿鹿', to_date('01-01-2017', 'dd-mm-yyyy'), 4, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (29, '物流非常快,东西很不错,很好喝', '阿鹿', to_date('01-01-2017', 'dd-mm-yyyy'), 5, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (30, '物流非常快,东西很不错,很好喝', '阿鹿', to_date('01-01-2017', 'dd-mm-yyyy'), 6, 1);
commit;
prompt 5 records loaded
prompt Loading TB_SHIPADDRESS...
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (3, 1, '林傻逼', '23333333333', '湖北省 十堰市', '鬼知道在哪里啊', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (50, 65, '1231', '123132', '福建省 三明市', '1231', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (51, 68, 'asdasd', '12312312321', '安徽省 合肥市', 'asdasdasd', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (2, 1, 'jack', '13313313313', '广东省 广州市', '萝岗的东软大厦啊', 1);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (45, 1, 'sb', '23123', '山东省 济宁市', '石景山小区????', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (47, 63, 'asd', '12312312321', '天津市 河西区', 'asdasdads', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (48, 63, 'asdasd', '12312312321', '河南省 洛阳市', 'asdasd', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (46, 62, '林业前', '123', '河北省 秦皇岛市', '12312', 0);
commit;
prompt 8 records loaded
prompt Loading TB_ORDER...
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (17041400, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (10060300, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (10112900, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (12455800, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (12484901, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (3003507, to_date('15-04-2017', 'dd-mm-yyyy'), 65, 1, 'dfsdfsdf', 0, 50);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (3154200, to_date('15-04-2017', 'dd-mm-yyyy'), 68, 1, null, 0, 51);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688690, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, 'zfasfd', 5, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688688, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 0, '锅包肉', 3, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (10162300, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, '少放辣不要麻', 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2373900, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2394901, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2420602, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2431603, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2440204, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2441705, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2463306, to_date('15-04-2017', 'dd-mm-yyyy'), 63, 1, null, 0, 47);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688694, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '麻辣香锅', 2, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688693, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '麻婆豆腐', 5, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688692, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '五花肉', 4, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688691, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '回锅肉', 1, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688695, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '酸菜鱼', 3, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (88688696, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '发送', 3, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (10165100, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (1495900, to_date('15-04-2017', 'dd-mm-yyyy'), 62, 1, null, 0, 46);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2082501, to_date('15-04-2017', 'dd-mm-yyyy'), 62, 1, '啊', 0, 46);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2142202, to_date('15-04-2017', 'dd-mm-yyyy'), 62, 1, null, 0, 46);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, ordercount, addressid)
values (2342100, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 0, 3);
commit;
prompt 28 records loaded
prompt Loading TB_ORDERDETAIL...
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (21, 10060300, 1, 2);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (23, 12455800, 1, 2);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (24, 12484901, 1, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (38, 3003507, 2, 3);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (39, 3154200, 1, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (3, 88688688, 1, 3);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (25, 10162300, 1, 4);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (26, 10162300, 3, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (31, 2373900, 2, 3);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (32, 2394901, 4, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (33, 2420602, 4, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (34, 2431603, 3, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (35, 2440204, 3, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (36, 2441705, 8, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (37, 2463306, 1, 4);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (22, 10165100, 1, 2);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (2758, 88688688, 2, 2);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (27, 1495900, 1, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (28, 2082501, 1, 3);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (29, 2142202, 1, 5);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (30, 2342100, 1, 4);
commit;
prompt 21 records loaded
prompt Loading TB_SHOPCART...
insert into TB_SHOPCART (shopcartid, comid, comcount, userid)
values (55, 3, 1, 66);
insert into TB_SHOPCART (shopcartid, comid, comcount, userid)
values (54, 1, 2, 66);
insert into TB_SHOPCART (shopcartid, comid, comcount, userid)
values (31, 1, 18, 21);
insert into TB_SHOPCART (shopcartid, comid, comcount, userid)
values (32, 2, 3, 21);
insert into TB_SHOPCART (shopcartid, comid, comcount, userid)
values (33, 3, 1, 21);
commit;
prompt 5 records loaded
prompt Enabling foreign key constraints for TB_COMMODITY...
alter table TB_COMMODITY enable constraint FK_SORTID;
prompt Enabling foreign key constraints for TB_COMMENT...
alter table TB_COMMENT enable constraint FK_COMID;
alter table TB_COMMENT enable constraint FK_COMMENT_USERID;
prompt Enabling foreign key constraints for TB_SHIPADDRESS...
alter table TB_SHIPADDRESS enable constraint FK_USERID;
prompt Enabling foreign key constraints for TB_ORDER...
alter table TB_ORDER enable constraint FK_ORDER_ADDRESSID;
alter table TB_ORDER enable constraint FK_ORDER_USERID;
prompt Enabling foreign key constraints for TB_ORDERDETAIL...
alter table TB_ORDERDETAIL enable constraint FK_DETAIL_COMID;
alter table TB_ORDERDETAIL enable constraint FK_ORDERID;
prompt Enabling foreign key constraints for TB_SHOPCART...
alter table TB_SHOPCART enable constraint FK_SHOPCART_COMID;
alter table TB_SHOPCART enable constraint FK_SHOPCART_USERID;
prompt Enabling triggers for TB_SORTS...
alter table TB_SORTS enable all triggers;
prompt Enabling triggers for TB_COMMODITY...
alter table TB_COMMODITY enable all triggers;
prompt Enabling triggers for TB_USERINFO...
alter table TB_USERINFO enable all triggers;
prompt Enabling triggers for TB_COMMENT...
alter table TB_COMMENT enable all triggers;
prompt Enabling triggers for TB_SHIPADDRESS...
alter table TB_SHIPADDRESS enable all triggers;
prompt Enabling triggers for TB_ORDER...
alter table TB_ORDER enable all triggers;
prompt Enabling triggers for TB_ORDERDETAIL...
alter table TB_ORDERDETAIL enable all triggers;
prompt Enabling triggers for TB_SHOPCART...
alter table TB_SHOPCART enable all triggers;
set feedback on
set define on
prompt Done.
