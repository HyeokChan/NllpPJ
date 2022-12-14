drop table tb_user_info;
create table tb_user_info(
    user_key char(11) not null,
    user_id varchar(50) not null,
    user_pw varchar(50),
    user_nm varchar(10),
    init_user_id varchar(50) not null,
    init_date date not null,
    updt_user_id varchar(50) not null,
    updt_date date not null
);    
alter table tb_user_info add constraint tb_user_info_pk primary key (user_key);
comment on table tb_user_info is '사용자정보';
select * from tb_user_info;


create table tb_user_req(
    sgb_cd char(7) not null,
    user_id varchar(10) not null,
    user_pw varchar(30) not null,
    user_nm varchar(10) not null,
    appv_yn char(1) default 'N' not null,
    init_user_id varchar(10) not null,
    init_date date not null,
    updt_user_id varchar(10) not null,
    updt_date date not null
);

alter table tb_user_req add constraint tb_user_req_pk primary key (sgb_cd, user_id);    
comment on table tb_user_req is '사용자신청정보';
select * from tb_user_req;

select count(1) from tb_user_req where sgb_cd = '3550000' and user_id = 'enis0001'

create sequence sq_user_key
increment by 1
start with 00000000001
minvalue 00000000001
maxvalue 99999999999
nocycle
nocache;

drop table tb_code_info;
create table tb_code_info(
    cd_id char(7) not null,
    cd_nm varchar(50) not null,
    use_yn char(1) default 'Y' not null,
    init_user_id varchar(50) default 'admin' not null,
    init_date date not null,
    updt_user_id varchar(50) default 'admin' not null,
    updt_date date not null
);

alter table tb_code_info add constraint tb_code_info_pk primary key (cd_id);
comment on table tb_code_info is '코드정보';

drop table tb_dtl_code_info;
create table tb_dtl_code_info(
    cd_id char(7) not null,
    dtl_cd_id varchar(3) not null,
    dtl_cd_nm varchar(50) not null,
    init_user_id varchar(50) default 'admin' not null,
    init_date date not null,
    updt_user_id varchar(50) default 'admin' not null,
    updt_date date not null
);

alter table tb_dtl_code_info add constraint tb_dtl_code_info_pk primary key (cd_id, dtl_cd_id);
comment on table tb_dtl_code_info is '상세코드정보';


create or replace function fn_get_code_name(p_cdId in varchar2, p_dtlCdId in varchar2) 
    return varchar2 
is
    v_dtlCdNm varchar2(50);
begin
    select dtl_cd_nm
      into v_dtlCdNm
      from tb_code_info a, tb_dtl_code_info b 
     where a.cd_id = b.cd_id
       and a.cd_id = p_cdId
       and b.dtl_cd_id = p_dtlCdId;
    return v_dtlCdNm;
end;


-- 납부자정보 테이블
create table tb_pyr_info(
    pyr_mng_no varchar(11) not null,
    pyr_se_cd char(2) not null,
    pyr_stt_cd char(2) not null,
    pyr_nm varchar(50),
    pyr_no varchar(50),
    pyr_brth_ymd char(8),
    del_yn char(1) default 'N',
    init_user_id varchar(50) not null,
    init_date date not null,
    updt_user_id varchar(50) not null,
    updt_date date not null
);

alter table tb_pyr_info add constraint tb_pyr_info_pk primary key (pyr_mng_no);
comment on table tb_pyr_info is '납부자정보';

-- 납부자주소정보 테이블
create table tb_pyr_addr_info(
    pyr_mng_no varchar(11) not null,
    pyr_addr_sn char(6) not null,
    pyr_zip varchar(6),
    pyr_stdg_cd varchar(10),
    pyr_lotno_bac_addr varchar(300),
    pyr_lotno_daddr varchar(300),
    pyr_mtn_se_cd char(2),
    pyr_mno number(4),
    pyr_sno number(4),
    pyr_spcl_dg varchar(15),
    pyr_spcl_ho varchar(30),
    init_user_id varchar(50) not null,
    init_date date not null,
    updt_user_id varchar(50) not null,
    updt_date date not null
);

alter table tb_pyr_addr_info add constraint tb_pyr_addr_info_pk primary key (pyr_mng_no, pyr_addr_sn);
comment on table tb_pyr_addr_info is '납부자주소정보';


-- 물건지정보 테이블
create table tb_gl_info(
    gl_mng_no varchar(11) not null,
    gl_nm varchar(50) not null,
    gl_se_cd char(2),
    gl_zip varchar(6),
    gl_stdg_cd varchar(10),
    gl_lotno_bac_addr varchar(300),
    gl_lotno_daddr varchar(300),
    gl_mtn_se_cd char(2),
    gl_mno number(4),
    gl_sno number(4),
    gl_spcl_dg varchar(15),
    gl_spcl_ho varchar(30),
    init_user_id varchar(50) not null,
    init_date date not null,
    updt_user_id varchar(50) not null,
    updt_date date not null
);

alter table tb_gl_info add constraint tb_gl_info_pk primary key (gl_mng_no);
comment on table tb_gl_info is '물건지정보';
