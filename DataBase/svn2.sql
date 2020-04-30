----------------------------------------------------
-- Export file for user HPSTUDENT                 --
-- Created by EAfonasyev on 30-Apr-20, 8:56:33 AM --
----------------------------------------------------

set define off
spool svn2.log

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
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HPSTUDENT.REVIEW
  add constraint REVIEW_PK primary key (ID)
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
alter table HPSTUDENT.REVIEW
  add constraint REVIEW_COURSES_FK foreign key (COURSES_ID)
  references HPSTUDENT.COURCES (ID);

prompt
prompt Creating sequence REVIEW_SEQ
prompt ============================
prompt
create sequence HPSTUDENT.REVIEW_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 21
increment by 1
cache 20;


spool off
