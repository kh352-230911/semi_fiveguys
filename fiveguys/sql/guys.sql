-- web계정 생성 (관리자)
alter session set "_oracle_script" = true;

create user guys
identified by "Five_mans240111@"
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
    'u' || lpad(123, 5, 0)
from dual;

insert into sample values('user' || lpad(seq_sample_id.nextval,3,0), '안녕하세요');
insert into sample values('user' || lpad(seq_sample_id.nextval,3,0), '안녕하세');
insert into sample values('user' || lpad(seq_sample_id.nextval,3,0), '안녕');
insert into sample values('user' || lpad(seq_sample_id.nextval,3,0), '안');
insert into sample values('user' || lpad(seq_sample_id.nextval,3,0), '안녕하세요12312312');
insert into sample values('user' || lpad(seq_sample_id.nextval,3,0), '안녕하세요12312312312312312312');
insert into sample values('user' || lpad(seq_sample_id.nextval,3,0), '안녕1231123');

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
-- drop table tb_user;
select * from tb_user;

insert into tb_user values ('user' || lpad(seq_tb_user_user_no.nextval,3,0), 'leejj', '1234', '이재준', '재준', default, 'leejj3240@gmail.com', '01096984252', default, null, default);
-- 우진 회원 테이블 샘플 데이터 추가
insert into tb_user 
values ('user' || lpad(seq_tb_user_user_no.nextval,3,0), 'woojin', 'woojin', '오우진', '우진', default, 'woojin@gmail.com',  '010-1234-1231', 'M', null, default);

select * from tb_user;

-- 좋아요 테이블
create table tb_attraction (
    user_no varchar2(50) not null,
    rest_no varchar2(50) not null,
    constraints pk_tb_attraction_user_rest_no primary key(user_no, rest_no)
);

-- 식당 테이블
create table tb_restaurant (
    rest_no varchar2(50) not null,
    user_no varchar2(50) not null,
    rest_name varchar2(100) not null,
    rest_address varchar2(100) not null,
    rest_content varchar2(2000),
    rest_phone varchar2(50) not null,
    rest_category varchar2(50) not null,
    rest_open_time varchar2(50) not null,
    rest_close_time varchar2(50) not null,
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
-- drop table tb_restaurant;
select * from tb_restaurant;

-- 우진 식당 테이블 샘플 데이터 추가
insert into tb_restaurant values('rest' || lpad(seq_tb_rest_no.nextval,3,0), 'user021', '샘플 식당', '강남구 kh정보교육원',
'샘플 데이터 입니다.', '02-3391-4991', 'it', '9:00', '18:00', default, '9:00', 5, default);
insert into tb_restaurant values('rest' || lpad(seq_tb_rest_no.nextval,3,0), 'user021', '샘플 식당2', '강남구 kh정보교육원 3관',
'샘플 데이터2 입니다.', '02-1191-1911', 'it', '9:00', '18:00', default, '9:00', 5, default);


select * from tb_restaurant;

-- 식당-편의시설 브릿지 테이블
create table tb_rest_convenience (
    rest_no varchar2(50) not null,
    conven_no varchar2(50) not null,
    constraints pk_tb_rest_convenience_rest_conven_no primary key(rest_no, conven_no)
);

-- drop table tb_rest_convenience;

-- 편의시설 테이블
create table tb_convenience (
    conven_no varchar2(50) not null,
    conven_kind varchar2(500),
    constraints pk_tb_convenience_conven_no primary key(conven_no)
);
create sequence seq_tb_conven_no;

-- drop table tb_convenience;

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
-- drop table tb_menu;

-- 메뉴 사진 테이블
create table tb_menu_picture (
    menu_pic_no varchar2(50) not null,
    menu_no varchar2(50) not null,
    menu_pic_renamed_filename varchar2(255) not null,
    constraints pk_tb_menu_picture_menu_pic_no primary key(menu_pic_no),
    constraints fk_tb_menu_picture_menu_no foreign key(menu_no) references tb_menu(menu_no) on delete cascade
);
create sequence seq_tb_menu_pic_no;

-- drop table tb_menu_picture;

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

-- drop table tb_reservation;

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

-- drop table tb_review;

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

-- drop table tb_review_picture;

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
    constraints fk_tb_comment_parent_comment_id foreign key(parent_comment_id) references tb_comment(comment_no) on delete cascade
);
create sequence seq_tb_comment_no;
<<<<<<< HEAD



create table users (
    no varchar2(30),
    id varchar2(30) not null,
    password varchar2(30) not null,
    name varchar2(30) not null,
    nickname varchar2(30) not null,
    gender char(1),
    email varchar2(50),
    phone varchar2(20) not null,
    role char(1) default 'U' not null,
    category varchar2(50),
    reg_date date default sysdate not null,
    constraints pk_users_no primary key(no),
    constraints uq_users_id unique(id),
    constraints uq_users_nickname unique(nickname),
    constraints ck_users_gender check(gender in ('M', 'F')),
    constraints uq_users_phone unique(phone),
    constraints ck_users_role check(role in ('U', 'O', 'M'))
);
create sequence seq_users_no;

insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'honggd', '1234', '홍길동', 'hong', 'M', 'honggd@naver.com', '01011111111', default, '중식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'abcd', '1234', '김준호', 'abcd', 'M', 'abcd@naver.com', '01022222222', default, '중식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'hihiroo', '1234', '김안녕', 'hihiroo', 'F', 'hihiroo@naver.com', '01033333333', default, '일식', default);    
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'bcde', '1234', '서지와', 'bcde', 'F', 'bcde@naver.com', '01044444444', default, '양식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'cdef', '1234', '김윤정', 'cdef', 'F', 'cdef@naver.com', '01055555555', default, '한식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'defg', '1234', '박봉철', 'defg', 'M', 'defg@naver.com', '01066666666', default, '한식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'efgh', '1234', '하정운', 'efgh', 'M', 'efgh@naver.com', '01077777777', default, '중식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'fghi', '1234', '유병송', 'fghi', 'M', 'fghi@naver.com', '01088888888', default, '한식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'ghij', '1234', '노민우', 'ghij', 'M', 'ghij@naver.com', '01099999999', default, '중식', default);
insert into users
    values (('users' || lpad(seq_menu_no.nextval,3,0)), 'hijk', '1234', '김지호', 'hijk', 'M', 'hijk@naver.com', '01012345678', default, '중식', default);


select * from users;

create table restaurant (
    no varchar2(30),
    user_no varchar2(30) not null,
    name varchar2(60) not null,
    address varchar2(100) not null,
    content varchar2(2000),
    phone varchar2(20) not null,
    category varchar2(50) not null,
    open_time varchar2(50) not null,
    close_time varchar2(50) not null,
    reserv_possible char(1) default 'Y' not null,
    total_star number not null,
    reg_date date default sysdate,
    constraints pk_restaurant_no primary key(no),
    constraints fk_restaurant_user_no foreign key(user_no) references users(no) on delete cascade,
    constraints uq_restaurant_phone unique(phone),
    constraints ck_restaurant_reserv_possible check(reserv_possible in ('Y', 'N'))
);
create sequence seq_restaurant_no;

insert into restaurant
    values (('restaurant' || lpad(seq_restautant_no.nextval,3,0)), 'user002', '백소정', '서울시 강남구 역삼동', null, 
    '943-1111', '일식', '10:00', '20:00', default, 5, default);





create table menu (
    no varchar2(30),
    rest_no varchar2(30) not null,
    name varchar2(100) not null,
    content varchar2(500),
    price number not null,
    constraints pk_menu_no primary key(no),
    constraints fk_menu_rest_no foreign key(rest_no) references restaurant(no) on delete cascade
);
create sequence seq_menu_no;

insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 


create table menu_picture (
    no varchar2(30),
    menu_no varchar2(30) not null,
    renamed_filename varchar2(255) not null,
    constraints pk_menu_picture_no primary key(no),
    constraints fk_menu_picture_menu_no foreign key(menu_no) references menu(no) on delete cascade
);
create sequence seq_menu_picture_no;

select
    m.*,
    p.no pic_no,
    p.menu_no,
    p.renamed_filename
from
    menu m join menu_picture p
        on m.no = p.menu_no;
        
select
    count(*)
from
    menu m join menu_picture p
        on m.no = p.menu_no;

commit;

=======
-- drop table tb_comment;
commit;
>>>>>>> 01171a0c0889d613e007f283c8b3454be33995ed
