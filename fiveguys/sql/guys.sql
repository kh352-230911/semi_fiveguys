-- web계정 생성 (관리자)
alter session set "_oracle_script" = true;

create user guys
identified by guys
default tablespace users;

grant connect, resource to guys;

alter user guys quota unlimited on users;

-- sample 데이터 시퀀스 채번 확인
-- drop table sample;
create table sample (
    id varchar2(20) primary key,
    sampledata varchar2(100)
);
create sequence seq_sample_id;

select
    'u'  lpad(123, 5, 0)
from dual;

insert into sample values('user'  lpad(seq_sample_id.nextval,3,0), '안녕하세요');
insert into sample values('user'  lpad(seq_sample_id.nextval,3,0), '안녕하세');
insert into sample values('user'  lpad(seq_sample_id.nextval,3,0), '안녕');
insert into sample values('user'  lpad(seq_sample_id.nextval,3,0), '안');
insert into sample values('user'  lpad(seq_sample_id.nextval,3,0), '안녕하세요12312312');
insert into sample values('user'  lpad(seq_sample_id.nextval,3,0), '안녕하세요12312312312312312312');
insert into sample values('user'  lpad(seq_sample_id.nextval,3,0), '안녕1231123');

select * from sample;

-- 회원테이블
create table tb_user (
    user_no varchar2(50) not null,
    user_id varchar2(50) not null,
    user_password varchar2(50) not null,
    user_name varchar2(30) not null,
    user_nickname varchar2(30) not null,
    user_gender char(1) default 'M',
    user_email varchar2(50),
    user_phone varchar2(50) not null,
    user_role char(1) default 'U' not null,
    user_category varchar2(50),
    user_created_date date default sysdate not null,
    constraints pk_tb_user_user_no primary key(user_no),
    constraints uq_tb_user_user_id unique(user_id),
    constraints uq_tb_user_user_nickname unique(user_nickname),
    constraints uq_tb_user_user_phone unique(user_phone),
    constraints ck_tb_user_user_gender check(user_gender in ('M', 'F')),
    constraints ck_tb_user_user_role check(user_role in ('M', 'O', 'U'))
);
create sequence seq_tb_user_user_no;

select * from tb_user;

insert into tb_user values ('user' || lpad(seq_tb_user_user_no.nextval,3,0), 'leejj', '1234', '이재준', '재준', default, 'leejj3240@gmail.com', '01096984252', default, null, default);

-- 좋아요 테이블
create table tb_attraction (
    user_no varchar2(50) not null,
    rest_no varchar2(50) not null,
    constraints pk_tb_attraction_user_rest_no primary key(user_no, rest_no)
);

select * from tb_attraction;

-- 식당 테이블
create table tb_restaurant (
    rest_no varchar2(50) not null,
    user_no varchar2(50) not null,
    rest_name varchar2(100) not null,
    rest_address varchar2(100) not null,
    rest_content varchar2(2000),
    rest_phone varchar2(50) not null,
    rest_category varchar2(50) not null,
    rest_time varchar2(50) not null,
    rest_reserv char(1) default 'Y' not null,
    rest_reserv_time varchar2(50) not null,
    rest_total_star number,
    rest_created_date date default sysdate not null,
    constraints pk_tb_rest_rest_no primary key(rest_no),
    constraints fk_tb_rest_user_no foreign key(user_no) references tb_user(user_no) on delete cascade,
    constraints uq_tb_rest_rest_phone unique(rest_phone),
    constraints ck_tb_rest_rest_reserv check(rest_reserv in ('Y', 'N')) 
);
create sequence seq_tb_rest_no;

select * from tb_restaurant;

-- 식당-편의시설 브릿지 테이블
create table tb_rest_convenience (
    rest_no varchar2(50) not null,
    conven_no varchar2(50) not null,
    constraints pk_tb_rest_convenience_rest_conven_no primary key(rest_no, conven_no)
);

select * from tb_rest_convenience;

-- 편의시설 테이블
create table tb_convenience (
    conven_no varchar2(50) not null,
    conven_kind varchar2(500),
    constraints pk_tb_convenience_conven_no primary key(conven_no)
);
create sequence seq_tb_conven_no;

select * from tb_convenience;

-- 메뉴 테이블
create table tb_menu (
    menu_no varchar2(50) not null,
    rest_no varchar2(50) not null,
    menu_name varchar2(500) not null,
    menu_content varchar2(2000),
    menu_price number not null,
    constraints pk_tb_menu_menu_no primary key(menu_no),
    constraints fk_tb_menu_rest_no foreign key(rest_no) references tb_restaurant(rest_no) on delete cascade
);
create sequence seq_tb_menu_menu_no;

select * from tb_menu;

insert into tb_menu values ('menu' || lpad(seq_tb_menu_no.nextval,3,0), 'rest002', '떡볶이', '고추장을 떡과 볶아서 먹는 맛있는 한국 요리', 3000);

insert into
            tb_menu
        values (
            ('menu' || lpad(seq_tb_menu_menu_no.nextval,3,0)), 'rest002', '순대', '아침에 먹어도 맛있는 순대', 3500);
        )

-- 메뉴 사진 테이블
create table tb_menu_picture (
    menu_pic_no varchar2(50) not null,
    menu_no varchar2(50) not null,
    menu_pic_renamed_filename varchar2(255) not null,
    constraints pk_tb_menu_picture_menu_pic_no primary key(menu_pic_no),
    constraints fk_tb_menu_picture_menu_no foreign key(menu_no) references tb_menu(menu_no) on delete cascade
);
create sequence seq_tb_menu_pic_no;

select * from tb_menu_picture;

-- 예약 테이블
create table tb_reservation (
    reserv_no varchar2(50) not null,
    rest_no varchar2(50) not null,
    user_no varchar2(50) not null,
    reserv_name varchar2(50) not null,
    reserv_date date not null,
    reserv_time date not null,
    reserv_people number default 2 not null,
    reserv_req varchar2(50),
    reserv_reg_date date default sysdate not null,
    constraints pk_tb_reservation_reserv_no primary key(reserv_no),
    constraints fk_tb_reservation_rest_no foreign key(rest_no) references tb_restaurant(rest_no) on delete cascade,
    constraints fk_tb_reservation_user_no foreign key(user_no) references tb_user(user_no) on delete cascade
);
create sequence seq_tb_reserv_no;

select * from tb_reservation;

-- 리뷰 테이블
create table tb_review (
    review_no varchar2(50) not null,
    rest_no varchar2(50) not null,
    user_no varchar2(50) not null,
    review_content varchar2(2000),
    review_star_grade number,
    review_reg_date date default sysdate not null,
    constraints pk_tb_review_review_no primary key(review_no),
    constraints fk_tb_review_rest_no foreign key(rest_no) references tb_restaurant(rest_no) on delete cascade,
    constraints fk_tb_review_user_no foreign key(user_no) references tb_user(user_no) on delete cascade,
    constraints ck_tb_review_review_star_grade check(review_star_grade in(1, 2, 3, 4, 5))
);
create sequence seq_tb_review_no;

select * from tb_review;

-- 리뷰 사진 테이블
create table tb_review_picture (
    review_pic_no varchar2(50) not null,
    review_no varchar2(50) not null,
    review_pic_renamed_filename varchar2(255),
    review_pic_reg_date date default sysdate,
    constraints pk_tb_review_picture_review_pic_no primary key(review_pic_no),
    constraints fk_tb_review_review_no foreign key(review_no) references tb_review(review_no) on delete cascade
);
create sequence seq_tb_review_pic_no;

select * from tb_review_picture;

-- 댓글 테이블
create table tb_comment (
    comment_no varchar2(50) not null,
    user_no varchar2(50) not null,
    review_no varchar2(50) not null,
    comment_content varchar2(2000) not null,
    comment_level number default 1 not null,
    parent_comment_id number,
    comment_reg_date date default sysdate,
    constraints pk_tb_comment_comment_no primary key(comment_no),
    constraints fk_tb_comment_user_no foreign key(user_no) references tb_user(user_no) on delete cascade,
    constraints fk_tb_comment_review_no foreign key(review_no) references tb_review(review_no) on delete cascade,
    constraints fk_tb_comment_parent_comment_id foreign key(_parent_comment_id) references tb_comment(comment_no) on delete cascade
);
create sequence seq_tb_comment_no;

select * from tb_comment;

