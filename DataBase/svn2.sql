----------------------------------------------------
-- Export file for user HPSTUDENT                 --
-- Created by EAfonasyev on 29-Apr-20, 8:50:34 PM --
----------------------------------------------------

set define off
spool svn2.log

prompt
prompt Creating table INSTRACTOR_DETAIL
prompt ================================
prompt
create table HPSTUDENT.INSTRACTOR_DETAIL
(
  id      NUMBER default "HPSTUDENT"."INSTRUCTOR__DETAIL_SEQ"."NEXTVAL" not null,
  hobby   VARCHAR2(200),
  youtube VARCHAR2(500)
)
tablespace USERS
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
alter table HPSTUDENT.INSTRACTOR_DETAIL
  add constraint INSTRACTOR_ID_FK primary key (ID)
  using index 
  tablespace USERS
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

prompt
prompt Creating table INSTRACTOR
prompt =========================
prompt
create table HPSTUDENT.INSTRACTOR
(
  id                   NUMBER default "HPSTUDENT"."INSTRACTOR_SEQ"."NEXTVAL" not null,
  first_name           VARCHAR2(100),
  last_name            VARCHAR2(100),
  email                VARCHAR2(100),
  instractor_detail_id NUMBER
)
tablespace USERS
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
alter table HPSTUDENT.INSTRACTOR
  add constraint INSTRACTOR_PK primary key (ID)
  using index 
  tablespace USERS
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
alter table HPSTUDENT.INSTRACTOR
  add constraint INSTRACTOR_DET_FK foreign key (INSTRACTOR_DETAIL_ID)
  references HPSTUDENT.INSTRACTOR_DETAIL (ID);

prompt
prompt Creating table COURCES
prompt ======================
prompt
create table HPSTUDENT.COURCES
(
  id            NUMBER default "HPSTUDENT"."COURSE_SEQ"."NEXTVAL" not null,
  title         VARCHAR2(200),
  instractor_id NUMBER
)
tablespace USERS
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
alter table HPSTUDENT.COURCES
  add constraint COURSES_ID_PK primary key (ID)
  using index 
  tablespace USERS
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
alter table HPSTUDENT.COURCES
  add constraint COURCES_TITLE unique (TITLE)
  using index 
  tablespace USERS
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
alter table HPSTUDENT.COURCES
  add constraint COURSE_INSTRACTOR_FK foreign key (INSTRACTOR_ID)
  references HPSTUDENT.INSTRACTOR (ID);

prompt
prompt Creating table REVIEW
prompt =====================
prompt
create table HPSTUDENT.REVIEW
(
  id         NUMBER default "HPSTUDENT"."REVIEW_SEQ"."NEXTVAL" not null,
  comments   VARCHAR2(1000),
  courses_id NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HPSTUDENT.REVIEW
  add constraint REVIEW_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HPSTUDENT.REVIEW
  add constraint REVIEW_COURSES_FK foreign key (COURSES_ID)
  references HPSTUDENT.COURCES (ID);

prompt
prompt Creating table STUDENT
prompt ======================
prompt
create table HPSTUDENT.STUDENT
(
  id         NUMBER default "HPSTUDENT"."ISEQ$$_140772".nextval not null,
  first_name VARCHAR2(45),
  last_name  VARCHAR2(45),
  email      VARCHAR2(45)
)
tablespace USERS
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
alter table HPSTUDENT.STUDENT
  add primary key (ID)
  using index 
  tablespace USERS
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

prompt
prompt Creating sequence COURSE_SEQ
prompt ============================
prompt
create sequence HPSTUDENT.COURSE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence INSTRACTOR_SEQ
prompt ================================
prompt
create sequence HPSTUDENT.INSTRACTOR_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence INSTRUCTOR__DETAIL_SEQ
prompt ========================================
prompt
create sequence HPSTUDENT.INSTRUCTOR__DETAIL_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence ISEQ$$_140772
prompt ===============================
prompt
create sequence HPSTUDENT.ISEQ$$_140772
minvalue 1
maxvalue 9999999999999999999999999999
start with 37
increment by 1
cache 20;

prompt
prompt Creating sequence REVIEW_SEQ
prompt ============================
prompt
create sequence HPSTUDENT.REVIEW_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;


spool off
