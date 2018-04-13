prompt PL/SQL Developer import file
prompt Created on 2017��5��7�� by hp
set feedback off
set define off
prompt Creating TB_SORTS...
create table TB_SORTS
(
  sortid   NUMBER(10) not null,
  sortname VARCHAR2(50) not null
)
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table TB_SORTS
  add primary key (SORTID)
  using index 
  tablespace EXAMPLE
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

prompt Creating TB_COMMODITY...
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
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table TB_COMMODITY
  add primary key (COMID)
  using index 
  tablespace EXAMPLE
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
  references TB_SORTS (SORTID) on delete cascade;

prompt Creating TB_USERINFO...
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
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  )
nologging;
alter table TB_USERINFO
  add primary key (USERID)
  using index 
  tablespace EXAMPLE
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

prompt Creating TB_COMMENT...
create table TB_COMMENT
(
  commentid  NUMBER(4) not null,
  content    VARCHAR2(200) not null,
  username   VARCHAR2(20) not null,
  createdate DATE not null,
  comid      NUMBER(4) not null,
  userid     NUMBER(4)
)
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table TB_COMMENT
  add primary key (COMMENTID)
  using index 
  tablespace EXAMPLE
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
  add constraint FK_COMMENT_COMID foreign key (COMID)
  references TB_COMMODITY (COMID);
alter table TB_COMMENT
  add constraint FK_COMMENT_USERID foreign key (USERID)
  references TB_USERINFO (USERID);

prompt Creating TB_SHIPADDRESS...
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
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  )
nologging;
alter table TB_SHIPADDRESS
  add primary key (ADDRESSID)
  using index 
  tablespace EXAMPLE
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

prompt Creating TB_ORDER...
create table TB_ORDER
(
  orderid     NUMBER(8) not null,
  transtime   DATE not null,
  userid      NUMBER(4) not null,
  orderstatus NUMBER(3) not null,
  userwords   VARCHAR2(100),
  addressid   NUMBER
)
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table TB_ORDER
  add primary key (ORDERID)
  using index 
  tablespace EXAMPLE
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

prompt Creating TB_ORDERDETAIL...
create table TB_ORDERDETAIL
(
  detailid NUMBER(4) not null,
  orderid  NUMBER(8) not null,
  comid    NUMBER(4) not null,
  comcount NUMBER(3) not null
)
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
alter table TB_ORDERDETAIL
  add primary key (DETAILID)
  using index 
  tablespace EXAMPLE
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

prompt Creating TB_SHOPCART...
create table TB_SHOPCART
(
  shopcartid NUMBER(3) not null,
  comid      NUMBER(4) not null,
  comcount   NUMBER(4) not null,
  userid     NUMBER(4) not null
)
tablespace EXAMPLE
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  )
nologging;
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
alter table TB_COMMENT disable constraint FK_COMMENT_COMID;
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
values (21, '������');
insert into TB_SORTS (sortid, sortname)
values (10, '���');
insert into TB_SORTS (sortid, sortname)
values (24, '������Ʒ');
insert into TB_SORTS (sortid, sortname)
values (41, '������Ʒ');
insert into TB_SORTS (sortid, sortname)
values (22, '�绰');
insert into TB_SORTS (sortid, sortname)
values (23, '������');
commit;
prompt 6 records loaded
prompt Loading TB_COMMODITY...
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (64, 'ES6��׼����', 32, 1, '/image/1494128845687.jpg', '����ͼ�飬�ʺ�ǰ�˳�ѧ��ʹ�ã��ų��£��۸���ʣ�ͯ������', 23);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (65, '��ѧ֮��', 50, 1, '/image/1494130283454.jpg', '������ѧ֮�����Ȿ����ֵ��ӵ��', 23);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (66, 'CSSȨ��ָ��', 49, 1, '/image/1494130642769.jpg', 'CSSȨ��ָ�ϣ����ES6����ָ��ʹ�ã�ѧ��ǰ�˲�������', 23);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (67, '������', 30, 2, '/image/1494130761132.jpg', 'ʹ��������Զ������⣬����һ�������', 41);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (68, '���ɱ�����', 39, 1, '/image/1494130858132.jpg', '����������������������', 41);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (69, '����', 20, 2, '/image/1494131003894.jpg', '����������ã���ֵ��ӵ��', 41);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (63, '��׿Ӧ�ÿ�����', 30, 1, '/image/1494128671229.jpg', 'д����ҿ��İ�׿Ӧ�ÿ���������', 23);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (23, 'ȸ�����ȱ���', 10, 1, null, '�ų���,û��ʹ�ù�', 24);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (43, '��ë����', 50, 1, '/image/1493971283645.jpg', '�����ֹ����汸���ʺϳ�ѧ��ӫ��Ⱥ�', 41);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (24, 'ʵ���������', 15, 5, '/image/1493803543041.jpg', '������̿����õ��Ľ̲�', 23);
insert into TB_COMMODITY (comid, comname, price, inventory, picture, describe, sortid)
values (42, 'Ų����ɭ��', 20, 2, '/image/1493803543047.jpg', 'asdasd', 23);
commit;
prompt 11 records loaded
prompt Loading TB_USERINFO...
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (66, '123321', 0, 'test@qq.com', 'ɵ��', 'haha', null, 'male', '13480513695', to_date('03-04-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (67, 'asd123', 0, 'asdasd3@163.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (68, 'asdasd', 0, 'a123@163.com', 'asdasd', 'asdasd', null, 'male', '123123123', to_date('04-04-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (21, '8888', 0, '@qq.com', '��ҵǬ', '�ִ��', '44132319950625003x', '��', '13480513695', to_date('25-10-1995 15:16:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (22, '7758', 0, '321@qq.com', '��ҵǬ', '����', '44132319950625003x', '��', '13480512222', to_date('25-06-2017', 'dd-mm-yyyy'));
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
values (1, 'asd123', 0, '123456@qq.com', null, '��¹', null, '��', '13480513695', to_date('04-04-2017', 'dd-mm-yyyy'));
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (61, 'asd123', 0, 'asdasd@163.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (62, '123', 0, '131313@qq.com', null, null, null, null, null, null);
insert into TB_USERINFO (userid, password, sign, email, realname, nickname, idnumber, sex, telephone, birthday)
values (2333, 'asd123', 1, 'QAQ@TAT.com', '����½', 'admin', '123456789012345678', '��', '12345678901', to_date('25-10-1995 15:16:25', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 22 records loaded
prompt Loading TB_COMMENT...
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (25, '��������', '��¹', to_date('04-05-2017 10:02:40', 'dd-mm-yyyy hh24:mi:ss'), 42, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (26, '��������2', '��¹', to_date('04-05-2017 10:08:05', 'dd-mm-yyyy hh24:mi:ss'), 42, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (27, '��������3', '��¹', to_date('04-05-2017 10:09:10', 'dd-mm-yyyy hh24:mi:ss'), 42, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (28, '����', '��¹', to_date('04-05-2017 10:10:57', 'dd-mm-yyyy hh24:mi:ss'), 42, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (29, '�ܺ�', '��¹', to_date('04-05-2017 10:15:37', 'dd-mm-yyyy hh24:mi:ss'), 42, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (30, '�ܺ�', '��¹', to_date('04-05-2017 10:18:11', 'dd-mm-yyyy hh24:mi:ss'), 42, 1);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (21, '��ܺ�,����,û��̫��ĥ��,��ϲ��,�ܱ����´λ�����', '��¹', to_date('02-05-2017 19:19:11', 'dd-mm-yyyy hh24:mi:ss'), 24, 2333);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (22, '��ܺ�,����,û��̫��ĥ��,��ϲ��,�ܱ����´λ�����', '��¹', to_date('02-05-2017 19:19:11', 'dd-mm-yyyy hh24:mi:ss'), 24, 2333);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (23, '��ܺ�,����,û��̫��ĥ��,��ϲ��,�ܱ����´λ�����', '��¹', to_date('02-05-2017 19:19:11', 'dd-mm-yyyy hh24:mi:ss'), 24, 2333);
insert into TB_COMMENT (commentid, content, username, createdate, comid, userid)
values (24, '��ܺ�,����,û��̫��ĥ��,��ϲ��,�ܱ����´λ�����', '��¹', to_date('02-05-2017 19:19:11', 'dd-mm-yyyy hh24:mi:ss'), 24, 2333);
commit;
prompt 10 records loaded
prompt Loading TB_SHIPADDRESS...
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (3, 1, '��ɵ��', '23333333333', '����ʡ ʮ����', '��֪�������ﰡ', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (50, 65, '1231', '123132', '����ʡ ������', '1231', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (51, 68, 'asdasd', '12312312321', '����ʡ �Ϸ���', 'asdasdasd', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (2, 1, 'jack', '13313313313', '�㶫ʡ ������', '�ܸڵĶ�����ð�', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (45, 1, 'sb', '23123', 'ɽ��ʡ ������', 'ʯ��ɽС��????', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (47, 63, 'asd', '12312312321', '����� ������', 'asdasdads', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (48, 63, 'asdasd', '12312312321', '����ʡ ������', 'asdasd', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (46, 62, '��ҵǰ', '123', '�ӱ�ʡ �ػʵ���', '12312', 0);
insert into TB_SHIPADDRESS (addressid, userid, receiverperson, shiptelephone, location, detailaddress, sign)
values (1, 1, 'YIN', '12312312312', '�㶫ʡ ��ݸ��', 'ѧ2����2A525', 1);
commit;
prompt 9 records loaded
prompt Loading TB_ORDER...
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (8173500, to_date('02-05-2017', 'dd-mm-yyyy'), 1, 1, null, 1);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (17041400, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (10060300, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (10112900, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (12455800, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (12484901, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (3003507, to_date('15-04-2017', 'dd-mm-yyyy'), 65, 1, 'dfsdfsdf', 50);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (3154200, to_date('15-04-2017', 'dd-mm-yyyy'), 68, 1, null, 51);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (88688690, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, 'zfasfd', 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (10162300, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, '�ٷ�����Ҫ��', 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2373900, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2394901, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2420602, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2431603, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2440204, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2441705, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2463306, to_date('15-04-2017', 'dd-mm-yyyy'), 63, 1, null, 47);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (88688694, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '�������', 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (88688693, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '���Ŷ���', 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (88688692, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '�廨��', 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (88688691, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '�ع���', 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (88688695, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '�����', 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (88688696, to_date('10-04-2017 16:13:39', 'dd-mm-yyyy hh24:mi:ss'), 1, 5, '����', 2);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (10165100, to_date('14-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (1495900, to_date('15-04-2017', 'dd-mm-yyyy'), 62, 1, null, 46);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2082501, to_date('15-04-2017', 'dd-mm-yyyy'), 62, 1, '��', 46);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2142202, to_date('15-04-2017', 'dd-mm-yyyy'), 62, 1, null, 46);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (2342100, to_date('15-04-2017', 'dd-mm-yyyy'), 1, 1, null, 3);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (5185400, to_date('05-05-2017', 'dd-mm-yyyy'), 1, 1, null, 45);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (5191101, to_date('05-05-2017', 'dd-mm-yyyy'), 1, 1, null, 45);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (5193702, to_date('05-05-2017', 'dd-mm-yyyy'), 1, 1, null, 1);
insert into TB_ORDER (orderid, transtime, userid, orderstatus, userwords, addressid)
values (7303400, to_date('03-05-2017', 'dd-mm-yyyy'), 1, 1, null, 1);
commit;
prompt 32 records loaded
prompt Loading TB_ORDERDETAIL...
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (43, 8173500, 24, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (45, 5185400, 42, 2);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (46, 5185400, 43, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (47, 5191101, 42, 2);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (48, 5191101, 43, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (49, 5193702, 43, 1);
insert into TB_ORDERDETAIL (detailid, orderid, comid, comcount)
values (44, 7303400, 42, 1);
commit;
prompt 7 records loaded
prompt Loading TB_SHOPCART...
prompt Table is empty
prompt Enabling foreign key constraints for TB_COMMODITY...
alter table TB_COMMODITY enable constraint FK_SORTID;
prompt Enabling foreign key constraints for TB_COMMENT...
alter table TB_COMMENT enable constraint FK_COMMENT_COMID;
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
