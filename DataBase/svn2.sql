----------------------------------------------------
-- Export file for user HPSTUDENT                 --
-- Created by EAfonasyev on 30-Apr-20, 9:24:07 PM --
----------------------------------------------------

set define off
spool svn2.log

prompt
prompt Creating table COURSE_4_STUDENT
prompt ===============================
prompt
create table HPSTUDENT.COURSE_4_STUDENT
(
  course_id  NUMBER not null,
  student_id NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
alter table HPSTUDENT.COURSE_4_STUDENT
  add constraint CORSE_4_STUDENT_PK primary key (COURSE_ID, STUDENT_ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
alter table HPSTUDENT.COURSE_4_STUDENT
  add constraint COURSE_ID_FK foreign key (COURSE_ID)
  references HPSTUDENT.COURCES (ID);
alter table HPSTUDENT.COURSE_4_STUDENT
  add constraint STUDENT_ID_FK foreign key (STUDENT_ID)
  references HPSTUDENT.STUDENT (ID);


spool off
