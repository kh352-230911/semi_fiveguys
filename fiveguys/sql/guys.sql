-- guys계정 생성 (관리자)
create user guys
identified by "Five_mans240111@"
default tablespace user;

grant connect, resource to guys;

alter user guys quota unlimited on user;

-- 회원테이블
create table user (
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
--drop sequence seq_users_no;

select * from users;

--alter table delete_users  modify (password varchar2(300));
commit;

-- 우진 회원 테이블에 샘플 데이터 추가
insert into user values(
    ('user' || lpad(seq_users_no.nextval,3,0)), 'woojin', '1234a@', '오우진', '우지', 'M', 'woojin@naver.com', '010-1231-1211', 'M', null, default
);

-- 식당 테이블
create table restaurant (
    no varchar2(30),
    users_no varchar2(30) not null,
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
    constraints fk_restaurant_users_no foreign key(users_no) references user(no) on delete cascade,
    constraints uq_restaurant_phone unique(phone),
    constraints ck_restaurant_reserv_possible check(reserv_possible in ('Y', 'N'))
);
create sequence seq_restaurant_no;
drop sequence seq_restaurant_no;
alter table restaurant modify RESERV_POSSIBLE char(1) default 'Y';
alter table restaurant modify content;
commit;

-- 재준 식당 테이블에 식당 승인 컬럼 추가
alter table restaurant add approval char(1) default 'N' not null;
alter table restaurant add constraint ck_restaurant_approval check(approval in ('Y', 'N'));
-- alter table restaurant drop column approval;
-- commit;

-- 재준 식당 테이블, total_star 컬럼 default값 0.0으로 설정 추가
-- alter table restaurant modify reserv_possible default '0';
-- commit;

-- delete from restaurant where name = '1234';

select * from restaurant;

-- 우진 식당 테이블에 샘플 데이터 추가
insert into restaurant values(
     ('rest' || lpad(seq_restaurant_no.nextval,3,0)), 'users001', '캐치마인드', '강남구 테헤란로', '바뀐 데이터베이스에 샘플코드 넣는중', '02-3391-4991', 'it', '9:00', '18:00', default, 5, default
);

-- 재준 식당 테이블에 샘플 데이터 추가
insert into restaurant values(
     ('rest' || lpad(seq_restaurant_no.nextval,3,0)), 'user065', '고에몬', '강남구 테헤란로', '바뀐 데이터베이스에 샘플코드 넣는중', '02-3391-4992', '양식', '9:00', '18:00', default, 5, default, default
);

-- 메뉴 테이블
create table menu (
    no varchar2(30),
    rest_no varchar2(30) not null,
    name varchar2(100) not null,
    content varchar2(500),
    price number not null,
    constraints pk_menu_no primary key(no),
    constraints fk_menu_rest_no foreign key(rest_no) references restaurant(no) on delete cascade
);
alter table menu modify content;
create sequence seq_menu_no;
drop sequence seq_menu_no;
commit;

select * from menu;

-- 메뉴 사진 테이블
create table menu_picture (
    no varchar2(30),
    menu_no varchar2(30) not null,
    renamed_filename varchar2(255) not null,
    constraints pk_menu_picture_no primary key(no),
    constraints fk_menu_picture_menu_no foreign key(menu_no) references menu(no) on delete cascade
);
create sequence seq_menu_picture_no;
drop sequence seq_menu_picture_no;

select * from menu;
select * from menu_picture;

-- 식당-편의시설 브릿지 테이블
create table restaurant_convenience (
    rest_no varchar2(30) not null,
    conven_no varchar2(30) not null,
    constraints pk_restaurant_convenience_rest_conven_no primary key(rest_no, conven_no)
);

select * from restaurant_convenience;

-- 편의시설 테이블
create table convenience (
    no varchar2(30) not null,
    kind varchar2(2000),
    constraints pk_convenience_no primary key(no)
);
create sequence seq_convenience_no;
drop sequence seq_convenience_no;

select * from convenience;

-- 예약 테이블
create table reservations (
    no varchar2(30) not null,
    rest_no varchar2(30) not null,
    users_no varchar2(30) not null,
    reserv_name varchar2(30) not null,
    reserv_date date not null,
    reserv_time date not null,
    reserv_people number default 2 not null,
    request varchar2(100),
    reg_date date default sysdate not null,
    constraints pk_reservation_no primary key(no),
    constraints fk_reservation_rest_no foreign key(rest_no) references restaurant(no) on delete cascade,
    constraints fk_reservation_users_no foreign key(users_no) references user(no) on delete cascade
);
create sequence seq_reservation_no;
drop sequence seq_reservation_no;

select * from reservation;

-- 좋아요 테이블
create table attraction (
    users_no varchar2(30) not null,
    rest_no varchar2(30) not null,
    constraints pk_attraction_users_rest_no primary key(users_no, rest_no)
);

select * from attraction;

-- 리뷰 테이블
create table review (
    no varchar2(30) not null,
    rest_no varchar2(30) not null,
    users_no varchar2(30) not null,
    content varchar2(2000),
    star_grade number,
    reg_date date default sysdate not null,
    constraints pk_review_no primary key(no),
    constraints fk_review_rest_no foreign key(rest_no) references restaurant(no) on delete cascade,
    constraints fk_review_users_no foreign key(users_no) references user(no) on delete cascade,
    constraints ck_review_star_grade check(star_grade in(1, 2, 3, 4, 5))
);
create sequence seq_review_no;
drop sequence seq_review_no;

select * from review;

-- 리뷰 사진 테이블
create table review_picture (
    no varchar2(30) not null,
    review_no varchar2(30) not null,
    renamed_filename varchar2(255),
    reg_date date default sysdate not null,
    constraints pk_review_picture_no primary key(no),
    constraints fk_review_review_no foreign key(review_no) references review(no) on delete cascade
);
create sequence seq_review_picture_no;
drop sequence seq_review_picture_no;

select * from review_picture;

-- 댓글 테이블
create table review_comment (
    no varchar2(30) not null,
    users_no varchar2(30) not null,
    review_no varchar2(30) not null,
    content varchar2(2000) not null,
    comment_level number default 1 not null,
    parent_comment_no varchar2(10),
    reg_date date default sysdate not null,
    constraints pk_review_comment_no primary key(no),
    constraints fk_review_comment_review_no foreign key(review_no) references review(no) on delete cascade,
    constraints fk_review_comment_users_no foreign key(users_no) references user(no) on delete cascade,
    constraints fk_review_comment_parent_comment_no foreign key(parent_comment_no) references review_comment(no) on delete cascade
);
create sequence seq_review_comment_no;
drop sequence seq_review_comment_no;

select * from review_comment;

commit;

-- 알림 테이블
create table notification ( 
    no varchar2(30),
    users_id varchar2(30) not null,
    type varchar2(100) not null,
    content varchar2(2000) not null,
    checked number default 0,
    reg_date date default sysdate,
    constraints pk_notification_no primary key(no),
    constraints fk_notification_users_id foreign key(users_id) references users(id) on delete cascade,
    constraints ck_notification_type check (type in ('NEW_REVIEW', 'NEW_COMMENT', 'RECOGNIZE', 'NEW_FOLLOWER', 'RESERVATION_TIME'))
);
create sequence seq_notification_no;
drop sequence seq_notification_no;
--alter table notification drop column type;
--alter table notification add type varchar2(100);
--alter table notification add constraints ck_notification_type check (type in ('NEW_REVIEW', 'NEW_COMMENT', 'RECOGNIZE', 'NEW_FOLLOWER', 'RESERVATION_CONFIRM'));
--alter table member add constraints uq_member_username unique(username);
select * from notification;

select 
    u.id,
    u.no,
    n.*
from
    user u left join notification n
        on u.no = n.users_no
where
    u.id = 'woojin';
select * from user;
select
    r.no,
    r.name,
    r.address,
    p.renamed_filename
from
    restaurant r left join menu m 
        on r.no = m.rest_no
            left join menu_picture p
                on m.no = p.menu_no
order by
    no;

   

select
    *
from
    user u left join attraction a
        on u.no = a.users_no;

create table attraction (
    users_no varchar2(30) not null,
    rest_no varchar2(30) not null,
    constraints pk_attraction_users_rest_no primary key(users_no, rest_no)
);

create table user (
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


insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'abcd', '1234', '김준호', 'abcd', 'M', 'abcd@naver.com', '01011111111', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'bcde', '1234', '김안녕', 'bcde', 'F', 'bcde@naver.com', '01022222221', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'cdef', '1234', '서지와', 'cdef', 'F', 'cdef@naver.com', '01033333333', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'defg', '1234', '김윤정', 'defg', 'F', 'defg@naver.com', '01044444444', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'efgh', '1234', '박봉철', 'efgh', 'M', 'efgh@naver.com', '0105555555', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'fghi', '1234', '하정운', 'fghi', 'M', 'fghi@naver.com', '01012121212', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'ghij', '1234', '장동준', 'ghij', 'M', 'ghij@naver.com', '01042424242', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'hijk', '1234', '서연', 'hijk', 'F', 'hijk@naver.com', '01015822222', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'ijkl', '1234', '정지운', 'ijkl', 'M', 'ijkl@naver.com', '01077543311', default, null, default);
insert into users
    values (('users' || lpad(seq_users_no.nextval,3,0)), 'jklm', '1234', '이주은', 'jklm', 'F', 'jklm@naver.com', '01044221112', default, null, default);

select * from users order by no desc;

create table restaurant (
    no varchar2(30),
    users_no varchar2(30) not null,
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
    constraints fk_restaurant_users_no foreign key(users_no) references user(no) on delete cascade,
    constraints uq_restaurant_phone unique(phone),
    constraints ck_restaurant_reserv_possible check(reserv_possible in ('Y', 'N'))
);

insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users001', '백소정', '서울시 강남구 역삼동', null, '921-1111', '일식', '10:00', '20:00', default, 5, default); 
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users002', '보슬보슬', '서울시 강남구 역삼동', null, '921-2222', '분식', '10:00', '20:00', default, 5, default); 
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users003', '중리', '서울시 강남구 역삼동', null, '921-3333', '중식', '10:00', '20:00', default, 5, default); 
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users004', '미향', '서울시 강남구 역삼동', null, '921-1241', '분식', '10:00', '20:00', default, 5, default); 
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users005', '백소정1', '서울시 강남구 역삼동', null, '921-4422', '일식', '10:00', '20:00', default, 5, default); 
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users006', '백소정2', '서울시 강남구 역삼동', null, '921-3212', '일식', '10:00', '20:00', default, 5, default); 
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users007', '백소정3', '서울시 강남구 역삼동', null, '921-4242', '일식', '10:00', '20:00', default, 5, default);
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users008', '백소정4', '서울시 강남구 역삼동', null, '921-5555', '일식', '10:00', '20:00', default, 5, default);
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users009', '백소정5', '서울시 강남구 역삼동', null, '921-3532', '일식', '10:00', '20:00', default, 5, default); 
insert into restaurant
    values (('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users010', '백소정', '서울시 강남구 역삼동', null, '921-2466', '일식', '10:00', '20:00', default, 5, default); 

select * from restaurant;

create table menu (
    no varchar2(30),
    rest_no varchar2(30) not null,
    name varchar2(100) not null,
    content varchar2(500),
    price number not null,
    constraints pk_menu_no primary key(no),
    constraints fk_menu_rest_no foreign key(rest_no) references restaurant(no) on delete cascade
);

insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant014', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant015', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant016', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant017', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant018', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant019', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant020', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant021', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant022', '아무거나', null, '9000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant023', '아무거나', null, '9000');

select * from menu;


create table menu_picture (
    no varchar2(30),
    menu_no varchar2(30) not null,
    renamed_filename varchar2(255) not null,
    constraints pk_menu_picture_no primary key(no),
    constraints fk_menu_picture_menu_no foreign key(menu_no) references menu(no) on delete cascade
);

insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu022', '2af3c384-a2bc-4a1f-bb7e-77bee293ea04.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu023', '2af3c384-a2bc-4a1f-bb7e-77bee293ea05.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu024', '2af3c384-a2bc-4a1f-bb7e-77bee293eaw4.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu025', '2af3c384-a2bc-4a1f-bb7e-77bee293eq04.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu026', '2af3c384-a2bc-4a1f-bb7e-77bee293ta04.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu027', '2af3c384-a2bc-4a1f-bb7e-77bee292ea04.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu028', '2af3c384-a2bc-4a1f-bb7e-77bee213ea04.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu029', '2af3c384-a2bc-4a1f-bb7e-77bee693ea04.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu030', '2af3c384-a2bc-4a1f-bb7e-77bet293ea04.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu031', '2af3c384-a2bc-4a1f-bb7e-77bye293ea04.jpg');
    
    
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu022', '20220418_174158873_108.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu023', '20220418_174412447_349.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu024', '20220418_174453770_556.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu025', '20220418_174505657_4.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu026', '20220418_174516697_101.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu027', '20220418_174527327_327.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu028', '20220418_174539548_250.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu029', '20220418_174601509_281.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu030', '20220418_174616171_833.jpg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu031', '20220418_174652399_241.jpg');
    
select * from menu_picture;


commit;


select * from delete_users;

-- 회원 삭제 트리거 테이블
create table delete_users
as
select *
from users
where 1= 0;

create or replace trigger trig_delete_users
    after
    delete on users
    for each row
begin
    if deleting then
        insert into
            delete_users
        values(:old.no, :old.id, :old.password, :old.name, :old.nickname, :old.gender, :old.email, :old.phone, :old.role, :old.category, sysdate);
    end if;
end;
/

select * from users;
delete from users where id = 'asd';
select * from delete_users;

-- 예약 취소 트리거 테이블
create table cancel_reservation
as
select *
from reservation
where
    0 = 1;

select * from attraction;

select
    r.no,
    (select count(*) from attraction where rest_no = r.no) attraction_count
from
    restaurant r;
    
    
select distinct
    r.*,
    m.no menu_no,
    m.rest_no,
    m.name menu_name,
    m.content menu_content,
    m.price,
    p.no pic_no,
    p.menu_no menuNo,
    p.renamed_filename,
    (select count(*) from attraction where rest_no = r.no) attraction_count
from
    restaurant r join menu m
          on r.no = m.rest_no
     join menu_picture p
          on m.no = p.menu_no
     join attraction a
         on r.no = a.rest_no
where
    r.no = 'restaurant014';
    
select * from users;
 
create or replace trigger trig_cancel_reservation
    after
    delete on reservation
    for each row
begin
    if deleting then
        insert into
            cancel_reservation
        values(:old.no, :old.rest_no, :old.users_no, :old.reserv_name, :old.reserv_people, :old.request, sysdate, :old.count, :old.reserv_date, :old.reserv_time);
    end if;
end;
/
delete from reservation where request = 'test';
select * from reservation;
select * from cancel_reservation;
commit;
delete from reservation where reserv_date = null;
insert into reservation
    values (('reservation' || lpad(seq_reservation_no.nextval,3,0)),'restaurant016', 'users003', '김안녕', sysdate, sysdate, default, null, default);

select
    *
from
    restaurant r join menu m
        on r.no = m.rest_no
        join menu_picture p
        on m.no = p.menu_no
where
    r.no = 'restaurant017';
    
select
        r.*,
        m.*,
        p.*,
        m.no menu_no,
        m.name menu_name,
        m.content menu_content,
        p.no pic_no,
        p.renamed_filename
    from
        restaurant r  left join menu m
              on r.no = m.rest_no
         join menu_picture p
              on m.no = p.menu_no
    where
        r.no = 'restaurant043';

-- 식당 테이블 샘플 데이터 추가 - 우진
insert into restaurant values(
     ('restaurant' || lpad(seq_restaurant_no.nextval,3,0)), 'users007', '긴자료코', '서울 강남구 테헤란로20길 19 1동 106호', '완벽한 한끼를 추구하는 긴자료코입니다.', '02-554-5112', '일식', '11:00', '21:00', default, 5, default
);

-- 메뉴 테이블에 샘플 데이터 추가 -우진
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant043', '사케동', null, '13000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant043', '데미그라스 돈까스', null, '10500');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant043', '오야꼬동', '치킨덮밥', '8500');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant043', '가츠동', '돈까스 덮밥', '8500');
    

insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant047', '런치', '1부 12:00 - 13:30 2부 14:00 - 15:30', '70000');
insert into menu
    values (('menu' || lpad(seq_menu_no.nextval,3,0)), 'restaurant047', '디너', '18:00 - 21:00', '150000');

    

-- 메뉴 사진 테이블에 샘플 데이터 추가 - 우진
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu086', '사케동.jpeg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu087', '데미그라스 돈까스.jpeg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu088', '오야꼬동.jpeg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu089', '가츠동.jpeg');
insert into menu_picture
    values (('menu_pic' || lpad(seq_menu_picture_no.nextval,3,0)), 'menu044', '긴자료코메뉴판.jpeg');

delete from menu_picture where  no = 'menu_pic046';
select  * from restaurant;
select * from menu;
select * from menu_picture;

-- 편의시설 테이블에 사진 컬럼 추가 - 우진
ALTER TABLE convenience
ADD convenience_pic VARCHAR2(255);

-- 편의시설 테이블에 값 삽입 - 우진
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '주차가능', 'free-icon-font-parking-9239331.png'
);
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '발렛 서비스', 'free-icon-font-car-alt-6955497.png'
);
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '콜키지 가능', 'free-icon-font-drink-alt-12007630.png'
);
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '무선 인터넷', 'free-icon-font-wifi-9254696.png'
);
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '노키즈존', 'free-icon-font-person-circle-minus-11271888.png'
);
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '반려동물 동반 가능', 'free-icon-font-dog-12436060.png'
);
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '대관 가능', 'free-icon-font-store-alt-7661579.png'
);
insert into convenience values (
        ('con' || lpad(seq_convenience_no.nextval,3,0)), '남/녀 화장실 구분', 'free-icon-toilet-185547.png'
);

select * from convenience;

-- 식당_편의시설 브릿지 테이블에 값 추가
insert into restaurant_convenience values('restaurant043', 'con004');
insert into restaurant_convenience values('restaurant043', 'con005');
insert into restaurant_convenience values('restaurant043', 'con008');

select * from restaurant_convenience;

select
            r.*,
            m.no menu_no,
            m.rest_no,
            m.name menu_name,
            m.content menu_content,
            m.price,
            p.no pic_no,
            p.menu_no menuNo,
            p.renamed_filename,
            rc.*,
            c.*
        from
           restaurant r join menu m
                  on r.no = m.rest_no     
             join menu_picture p
                  on m.no = p.menu_no
            join restaurant_convenience rc
                on r.no = rc.rest_no
            join convenience c
                on rc.conven_no = c.no 
           
        where
            r.no = 'restaurant043';
            
SELECT
    r.*,
    m.no AS menu_no,
    m.rest_no,
    m.name AS menu_name,
    m.content AS menu_content,
    m.price,
    p.no AS pic_no,
    p.menu_no AS menuNo,
    p.renamed_filename,
    c.*
FROM
    restaurant r
JOIN
    menu m ON r.no = m.rest_no
JOIN
    restaurant_convenience rc ON r.no = rc.rest_no
JOIN
    convenience c ON rc.conven_no = c.no
LEFT JOIN
    menu_picture p ON m.no = p.menu_no
WHERE
    r.no = 'restaurant043';
    
select
            r.*,
            rc.rest_no,
            rc.conven_no,
            conven.no convenience_no,
            conven.kind,
            conven.convenience_pic
        from
            restaurant r join restaurant_convenience rc
                              on r.no = rc.rest_no
                         join convenience conven
                              on rc.conven_no = conven.no
        where
            r.no = 'restaurant043';
commit;

select
            r.*,
            m.no menu_no,
            m.rest_no,
            m.name menu_name,
            m.content menu_content,
            m.price,
            p.no pic_no,
            p.menu_no menuNo,
            p.renamed_filename
        from
            restaurant r join menu m
                  on r.no = m.rest_no
             join menu_picture p
                  on m.no = p.menu_no;

select * from notification;

insert into notification
values (('noti' || lpad(seq_notification_no.nextval,3,0)), 'woojin', '<a href = "${pageContext.request.contextPath}/admin/adminApprovalList">q1w2e3</a>님이 승인요청을 하였습니다', default, default, 'RECOGNIZE');

update
    notification
set
    content = '<a href = "admin/adminApprovalList">q1w2e3</a>님이 승인요청을 하였습니다'
where
    content = '<a href = "${pageContext.request.contextPath}/admin/adminApprovalList">q1w2e3</a>님이 승인요청을 하였습니다';
    
select
    u.role,
    n.*
from
    users u left join notification n
        on u.id = n.users_id
where
    r.no = 'restaurant043';

-- 식당에 따른 별점 개수
select
    count(re.star_grade)
from
    restaurant r join review re
        on r.no = re.rest_no
where
    r.no = 'restaurant043';
    
    
select
    round(
        (select sum(re.star_grade)
         from restaurant r
              join review re on r.no = re.rest_no
         where r.no = 'restaurant043') /
        (select count(re.star_grade)
         from restaurant r
              join review re on r.no = re.rest_no
         where r.no = 'restaurant043'),
         1
    ) as average_rating
from dual;

select * from review;

select
    round(avg(re.star_grade),1)
from
    restaurant r join review re
        on r.no = re.rest_no
where
    r.no = 'restaurant043';
    
    
    
    select
    where
        date = 12  || r.count < 6
    
    
    insert into valeus()
    
   
        
select * from reservation;
        
select
            u.no,
            u.id,
            u.name,
            u.nickname,
            u.email,
            u.phone,
            u.category,
            re.no review_no,
            re.rest_no,
            re.users_no,
            re.content review_content,
            re.star_grade,
            re.reg_date,
            r.no restaurant_no,
            r.name restaurant_name,
            r.address restaurant_address,
            r.phone restaurant_phone,
            r.category restaurant_category,
            r.approval
        from
            users u join review re
                on u.no = re.users_no
            join restaurant r
                on re.rest_no = r.no
        where
            u.no = 'user049'
        order by
            re.reg_date desc;
            

    role = 'M';
    
-- 재준 reservation 셀렉트문 실험
select * from reservation;

select
    *
from
    reservation
where
    rest_no = 'restaurant043' and reserv_date = '2024/01/07 09:42:29' and reserv_time = '2024/01/07 09:42:29' and count < 6;

select
    rest_no
    , reserv_date
    , reserv_time
from
    (
    select
        *
    from (
        select
            *
        from
            reservation
        where
            rest_no = 'restaurant043'
    )
    where
        reserv_date = '2024-01-24'
    )
where
    reserv_time = '15:00';
    
select
    rest_no
    , reserv_date
    , reserv_time
    , reserv_count
    , (select count(*) from(select * from reservation where rest_no = 'restaurant043') where reserv_date = '2024-01-24' group by reserv_time) reserve_count
from
    (
    select
        *
    from (
        select
            *
        from
            reservation
        where
            rest_no = 'restaurant043'
    )
    where
        reserv_date = '2024-01-24'
    );
where
    rest_no = 'restaurant043'
    and reserv_date = '2024-01-24';
    
    
select * from reservation;
    
select
    *
from
    reservation
where
    rest_no = 'restaurant043' and reserv_date = '2024-01-24' and reserv_time = '15:00' and count < 5 ;

select
    *
from
    reservation
where
    rest_no = 'restaurant043' and users_no = 'user065' and reserv_date = '2024/01/07 09:42:29' and reserv_time = '2024/01/07 09:42:29' and count < 5 ;

alter table reservation drop column reserv_time;
alter table reservation add reserv_time varchar2(10);

select * from reservation;

select 
    *
from
    restaurant r join reservation re
        on r.no = re.rest_no
where
    r.users_no = 'users007';


select * from restaurant;
select * from reservation;

select * from users where role = 'M';
select * from notification;
select * from restaurant;

select
    *
from
    reservation
where
    rest_no = 'restaurant043'
order by
    no desc;

update
    restaurant
set
    users_no = 'user065'
where
    name in ('백소정3', '스시히로아키');
    
select
    t.name,
    r.*
from
    restaurant t join reservation r
                           on t.no = r.rest_no
order by 
    r.reg_date desc;

select * from restaurant;

-- 사용자가 선호하는 카테고리에 맞게 정렬
WITH UserCategories AS (
    SELECT TRIM(REGEXP_SUBSTR(category, '[^,]+', 1, LEVEL)) AS category
    FROM users
    WHERE no = 'user0083'
    CONNECT BY LEVEL <= REGEXP_COUNT(category, ',') + 1
)
, RankedPictures AS (
    SELECT
        r.no AS restaurant_no,
        r.name,
        r.address,
        r.category,
        p.renamed_filename,
        ROW_NUMBER() OVER (PARTITION BY r.no ORDER BY p.renamed_filename) AS rn
    FROM
        restaurant r
    LEFT JOIN menu m ON r.no = m.rest_no
    LEFT JOIN menu_picture p ON m.no = p.menu_no
)
SELECT
    restaurant_no AS no,
    name,
    address,
    category, 
    renamed_filename
FROM
    RankedPictures
WHERE
    rn = 1
    AND address LIKE '%역삼%'
ORDER BY
    CASE
        WHEN category IN (SELECT category FROM UserCategories) THEN 0
        ELSE 1
    END,
    category,
    no DESC,
    renamed_filename;


select * from users;
select * from reservation;
select * from menu_picture;
select * from reservation where rest_no = 'restaurant043';
select * from restaurant;




<where>
            rn = 1
            <if test="searchKeyword != null and searchKeyword != '' and searchType != null and searchType != ''">
                and
                ${searchType} like '%' || #{searchKeyword} || '%'
            </if>
        </where>

SELECT
    rest_no,
    reserv_date,
    reserv_time,
    reserve_count
FROM (
    SELECT
        res.rest_no,
        res.reserv_date,
        res.reserv_time,
        (
            SELECT COUNT(*)
            FROM reservation subres
            WHERE subres.rest_no = res.rest_no
                AND subres.reserv_date = res.reserv_date
            GROUP BY subres.reserv_time
        ) AS reserve_count
    FROM reservation res
    WHERE res.rest_no = 'restaurant043'
        AND res.reserv_date = '2024-01-24'
) AS subquery
WHERE reserve_count > 1;

select
    m.*
    , p.*
from
    menu m join menu_picture p
        on m.no = p.menu_no
where
    m.no = 'menu085';

commit;

-- 무진형
select * from users;
select * from reservation;

-- 재준
select * from restaurant;
select * from menu;
select * from menu_picture;

-- 우진
select * from review;
select * from review_picture;
select * from review_comment;

select * from notification;
select * from convenience;
select * from restaurant_convenience;
select  * from attraction;


--delete from users;
--delete from restaurant;
--delete from restaurant_convenience;
--delete from attraction;

-- 리뷰 테이블 데이터 값 넣기
-- 뽕쪽 
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest029', 'users041', '진짜 야들야들 부드럽고 존맛탱.... 불닭 못먹는 맵찔이지만 매운거 좋아하는데 맛있게 매웠어용 ㅎㅎㅎ',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest029', 'users042', '정말 맛있네요!!!!',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest029', 'users043', '1시간 기다렸습니다. 그러나 재방문의사 200프로 제 인생 족발 등극ㅋㅋㅋ 진짜 맛있어요 겉절이도 최고',5,default
);

--송희네 족발
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest030', 'users044', '족발과 막국수 먹었어요. 음식 너무 맛있었습니다. 친구 회사 근처라 또 먹으러 갑니당',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest030', 'users045', '근처 오향 족발이 영업종료해서 갔는데 솔직히 기대 이하였어요... 김치와 냅킨, 물에서 약간 냄새가 났어요',2,default
);

-- 촌집
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest031', 'users047', '가게 앞 족발 보쌈 집인데 점심때 고등어구이 등 식사메뉴도 잘 나와서 좋습니다',4,default
);

-- 영등족발
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest032', 'users050', '명불허전 정말 맛있습니다!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest032', 'users037', '고기가 쫄깃하고 잡내도 없고 맛있었다 여기 쟁반국수는 존맛탱 다른 국수와 비슷하면서 차별적이고, 소수가 정말 맛있다',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest032', 'users038', '굿',4,default
);

-- 보승회관
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest033', 'users039', '살면서 가본 음식점 중 최악입니다. 들어갈때부터 자리 안내도 안하길래 서 있었더니 그냥 앉으면 되지 왜 서 있냐고 하네요',1,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest033', 'users040', '설 출장와서 순대국밥~~ 부산하곤 다르네요~~',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest033', 'users041', '순대국밥 한그릇이면 든든한 한끼가 됩니다.',5,default
);

-- 장터순대국
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest034', 'users042', '기대가 컷던 탓일까?? 아쉬운걸??',2,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest034', 'users043', '왜 손님이 많은 줄 알았어요 고기도 냄새 없구 비린내도 안나고 바로바로 끓여주고 최고입니다',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest034', 'users044', '메뉴 모두 상당히 퀄리티 높은 국밥집',4,default
);

-- 농민 백암순대
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest035', 'users045', '워낙 유명한 곳이라 언젠가는 한번 가보고 싶었는데 역시나.. 명성에 걸맞는 최고의 음식점이었어요.',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest035', 'users047', '진득한 순대국의 정석',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest035', 'users050', '요즘 순대국밥 지존',5,default
);

-- 도곡 한우소머리 국밥
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest036', 'users037', '1700개 이상의 리뷰를 써온 솔직 블로거로써 저도 근처 주민으로서 가끔 자주 가는 맛집',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest036', 'users038', '소머리 국밥은 양념없이 맑은 국으로 먹는게 더 맛있는거 같아요',4,default
);

-- 카츠8
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest037', 'users039', '굿',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest037', 'users040', '강남역 바로 이어져 있어 아주 좋았어요 ㅎㅎ',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest037', 'users041', '이번에 새로 나온 얼큰 명란 먹어봤는데 진짜 맛있었어요!!!!! 강추 별 5개',5,default
);

-- 소노야
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest038', 'users042', '추운날 따뜻한 김치 냄비우동을 먹으니 넘 맛있네요',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest038', 'users043', '미소라멘, 오뎅꼬치우동 모두 맛있어요. 특히 국물이 깔끔하고 맛있습니다.',4,default
);

-- 백소정
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest039', 'users044', '평일 저녁에 마제소바 혼밥했어요 혼밥하는 사람들 많았고 10분정도 웨이팅 했네요 면이 탱글탱글 굿굿',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest039', 'users045', '늘 지나가다 보이는 백소정 맛있습니다',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest039', 'users047', '점심시간에 사람이 너무 많아요ㅠㅠ 하지만 맛있었어요',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest039', 'users050', '밥에 마제소바 비벼먹으면 밥도둑',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest039', 'users041', '정말 맛있습니다!!!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest039', 'users042', '내 삶의 유일한 낙',5,default
);

-- 규베규카츠
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest040', 'users043', '닭과 고기가 맛있고 면발도 좋았어요.',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest040', 'users044', '규카츠가 입에서 살살 녹습니다',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest040', 'users045', '너무 맛있어요 ㅠㅠㅠㅠ',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest040', 'users045', '재방문 의사 100프로 강추입니둥',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest040', 'users047', '개꿀맛 존맛탱',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest040', 'users050', '닭과 고기가 맛있고 면발도 좋았어요.',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest040', 'users038', '규카츠가 입에서 살살 녹아서 완전 맛있어요 불닭 크림 볶음 우동은 매콤함과 쫄깃함이 규카츠와 같이 먹으니 완맛이예요',5,default
);

-- 갓덴스시
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users038', '회가 입에서 살살 녹아서 완전 맛있어요',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users039', '유자고추 맛있고, 계란마요는 늘 맛있습니다.',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users040', '사케하나 들고 방문했어요 콜키지 3만원 겨울한정으로 나온 방어 역시 맛있네요 키조개 암염구이는 너무 질기고 비리고 정말 돈 아깝네요 다신 안 먹을거 같아요.',1,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users041', '여기는 민물장어가 대박입니다!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users042', '개 존맛탱탱구리',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users043', '또 왔다 또 왔다 내가 또 왔다.',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users044', '정말 맛있습니다!!!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users045', '회전 초밥집 치고 나쁘지 않았습니다',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest041', 'users047', '정말 맛있게 잘 먹고 가요',5,default
);

-- 은행골
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest042', 'users047', '정말 맛있습니다!!!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest042', 'users050', '은행골은 워낙 맛집이라 맛은 말해뭐해인데 강남역점 서비스도 좋고 너무 친절했습니다 ㅠㅠ',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest042', 'users041', '제 나이대면 초밥 맛집의 대표중 하나가 은행골이라거 다들 아실텐데요~!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest042', 'users037', '믿고 먹는 은행골',5,default
);

-- 상무초밥
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest043', 'users037', '이상무!!',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest043', 'users038', '점심특선 진짜 맛있습니다!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest043', 'users039', '혼밥하려고 오래간만에 방문했는데 예전 보다 맛이 더 좋아졌네요',4,default
);

-- 스시마이우
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest044', 'users040', '초밥이 땡길 때 늘 가장 먼저 선택하는 단골 초밥집입니다...',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest044', 'users041', '신선한 회초밥의 맛보다는 각종 소슷로 과하지 않고 맛있게 즐길 수 있는 초밥!!!',5,default
);

-- 고에몬
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest045', 'users042', '7년째 미각의 환기가 필요할때마다 가눈 제 마음속 강남 파스타 맛집 1위',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest045', 'users043', '맛이있어용',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest045', 'users044', '역시 수플레 오믈렛 맛나여~~ 갠적으로 스파게티보다는 리조또가 더 맛있는듯??',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest045', 'users045', 'as usual very enjoyable meal, quality always very good and service is fast, nice decorate restaurant, clean and courteous staff..not much you can ask from this kind of restaurant, never disappointed and indeed will keep coming back. highly recommend omulet risotto :)',4,default
);

-- 82올리언즈
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest046', 'users047', '82올리언즈 포에버',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest046', 'users050', '미국 레트로 감성 입니다',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest046', 'users037', '난 누구 맛집은 어디냐 찾아보자꾸나',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest046', 'users038', '정말 미국에 온 것 같은 분위기와 맛이었어요(미국 가 본적 없음ㅋㅋ)',5,default
);

-- 나폴리회관
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest047', 'users038', '조명이 전구라 아늑한 느낌이고, 저는 4인 방문했는데 단체손님도 많은 것 같았어요',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest047', 'users045', '결혼기념일을 맞아 아이와 함께 오프런으로 입장',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest047', 'users041', '마르게리따 피자 정말 맛져요!!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest047', 'users042', '여긴 진짜 파스타도 맛있지만 피자가 대박 맛있어요!!',5,default
);

-- 마녀 주방
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest048', 'users042', '대학생때부터 종종 방문하던 강남역 마녀식당!!',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest048', 'users043', '인테리어도 넘나 멋지고 음식들 다 맛있고 양도 짱많아',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest048', 'users044', '할로윈 컨셉 확실',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest048', 'users045', '가성비 굿',5,default
);

-- 중리
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest049', 'users037', 'KH정보교육원에서 왔다 그러면 1000원 할인해 줍니다',2,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest049', 'users038', '가성비 좋지만 간이 쌥니다',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest049', 'users039', '헉 꿀맛',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest049', 'users040', '점심 급하게 때울때 먹는 곳 맛은 기대하지 않습니다',2,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest049', 'users041', '양 많고 맛있어요',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest049', 'users042', '오늘의 메뉴 새우 볶음밥 제 최애 입니다.',5,default
);

-- 보배반점
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest050', 'users042', '밤 9시쯤 갔는데도 사람이 엄청 많았어요 가볍게 한 잔 하면서 술자리하기 좋은 분위기 입니다.',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest050', 'users043', '일하다가 점심 먹으러 왔는데도 깨끗하고 친절하네요',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest050', 'users044', '보배반점 점보짬뽕 도장깨기!!!',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest050', 'users045', '저는 다시 안 갈거 같아요....',1,default
);

update restaurant set close_time = '24:00' where no = 'rest051';
commit;

-- 짬뽕지존
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest051', 'users045', '손에 꼽는 짬뽕 넘 맛있어요.',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest051', 'users047', '진하고 풍성한 맛의 여러가지 짬뽕을 맛볼수 있는 역삼동 짬뽕 맛집으로 얼큰하면서 시원한 맛이 매력',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest051', 'users050', '주차하기 편한 곳이라 참 좋습니다.',4,default
);

-- 무궁화 반점
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest052', 'users050', '인생 최대의 고민이자 난제 짜장면이냐 짬뽕이냐 짬짜면으로 해결 난제도 해결',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,4,0), 'rest052', 'users037', '무궁화반점 강남점 반주로 먹었는데 굿굿',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest052', 'users038', '지나가다 깔끔해보이는 중국집이 생겼길래 왔어요 아주 맛있습니다요',4,default
);

-- 코다차야
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest053', 'users039', '친구들이랑 한번씩은 꼭! 오는 곳!!',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest053', 'users040', '안주 종류도 많고 자유롭게 이용할 수 있어서 좋아요',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest053', 'users041', '김치볶음밥 나가사끼 짬뽕 맛있어요~~ 술 종류가 엄청 다양해요',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest053', 'users042', '대체 오래오 튀김이 왜 맛있어요??',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest053', 'users043', '좋은점 1. 역시 코다차야 김볶밥 2. 다양한 주류와 음식 아쉬운점 1. 위생 2.소음 ',3,default
);

-- 더 긴사이
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest054', 'users044', '무엇보다 고급스럽게 음식이 나와서 우와했어요 ',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest054', 'users045', '비주얼이 진짜 넘사입니다!!  연인끼리 오는거 강추!!',5,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest054', 'users047', '하이볼이랑 아사히 생맥주 짱!!! 닭날개랑 오뎅탕 먹으러 자주 가는데 오늘은 더 맛있었네요 크으~~',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest054', 'users050', '음식이 맛있고 분위기가 좋습니다 그리고 친절해요',3,default
);

-- 이자카야 탄
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest055', 'users050', '카레우동 맛있어요!!',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest055', 'users037', '아주 알찬 냉소바 세트',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest055', 'users038', '나베 맛있어요',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest055', 'users047', '회사 앞 가성비 끝판왕!! 회사 사람들이랑 자주 가는데 갈때마다 너무 맛있어요!! 사장님이 너무 친절하십니다 ㅠㅠㅠ',5,default
);

-- 모로미쿠시
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest056', 'users037', '맛있긴 한데 예약 할 정도로 특별한 맛인가에 대해서는 아리송했습니다. ',3,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest056', 'users038', '나베 시키면 따뜻하게 먹을 수 있게 해줘서 좋습니다',4,default
);
insert into review values(
    'review' || lpad(seq_review_no.nextval,3,0), 'rest056', 'users039', '분위기가 너무 좋아용',4,default
);

-- 식당 편의시설 브릿지 테이블
insert into restaurant_convenience values('rest029','con007');
insert into restaurant_convenience values('rest029','con008');
insert into restaurant_convenience values('rest030','con007');
insert into restaurant_convenience values('rest030','con008');
insert into restaurant_convenience values('rest031','con001');
insert into restaurant_convenience values('rest031','con002');
insert into restaurant_convenience values('rest031','con007');
insert into restaurant_convenience values('rest032','con001');
insert into restaurant_convenience values('rest032','con004');
insert into restaurant_convenience values('rest032','con008');
insert into restaurant_convenience values('rest033','con001');
insert into restaurant_convenience values('rest033','con002');
insert into restaurant_convenience values('rest034','con001');
insert into restaurant_convenience values('rest034','con004');
insert into restaurant_convenience values('rest035','con007');
insert into restaurant_convenience values('rest035','con008');
insert into restaurant_convenience values('rest036','con007');
insert into restaurant_convenience values('rest036','con008');
insert into restaurant_convenience values('rest037','con001');
insert into restaurant_convenience values('rest037','con002');
insert into restaurant_convenience values('rest038','con001');
insert into restaurant_convenience values('rest038','con002');
insert into restaurant_convenience values('rest038','con007');
insert into restaurant_convenience values('rest038','con008');
insert into restaurant_convenience values('rest039','con001');
insert into restaurant_convenience values('rest039','con008');
insert into restaurant_convenience values('rest040','con003');
insert into restaurant_convenience values('rest040','con004');
insert into restaurant_convenience values('rest040','con008');
insert into restaurant_convenience values('rest041','con003');
insert into restaurant_convenience values('rest041','con008');
insert into restaurant_convenience values('rest042','con001');
insert into restaurant_convenience values('rest042','con008');
insert into restaurant_convenience values('rest043','con003');
insert into restaurant_convenience values('rest043','con005');
insert into restaurant_convenience values('rest043','con008');
insert into restaurant_convenience values('rest044','con001');
insert into restaurant_convenience values('rest044','con008');
insert into restaurant_convenience values('rest045','con007');
insert into restaurant_convenience values('rest045','con008');
insert into restaurant_convenience values('rest046','con007');
insert into restaurant_convenience values('rest046','con008');
insert into restaurant_convenience values('rest047','con003');
insert into restaurant_convenience values('rest047','con007');
insert into restaurant_convenience values('rest047','con008');
insert into restaurant_convenience values('rest048','con003');
insert into restaurant_convenience values('rest048','con004');
insert into restaurant_convenience values('rest048','con006');
insert into restaurant_convenience values('rest049','con001');
insert into restaurant_convenience values('rest049','con007');
insert into restaurant_convenience values('rest050','con001');
insert into restaurant_convenience values('rest050','con007');
insert into restaurant_convenience values('rest050','con008');
insert into restaurant_convenience values('rest051','con001');
insert into restaurant_convenience values('rest051','con004');
insert into restaurant_convenience values('rest052','con004');
insert into restaurant_convenience values('rest053','con001');
insert into restaurant_convenience values('rest053','con004');
insert into restaurant_convenience values('rest053','con008');
insert into restaurant_convenience values('rest054','con001');
insert into restaurant_convenience values('rest054','con003');
insert into restaurant_convenience values('rest054','con004');
insert into restaurant_convenience values('rest055','con001');
insert into restaurant_convenience values('rest055','con004');
insert into restaurant_convenience values('rest056','con003');
insert into restaurant_convenience values('rest056','con004');
insert into restaurant_convenience values('rest056','con008');

-- 무진형
select * from users;
select * from review_picture;

-- 재준
select * from restaurant;
select * from menu;
select * from menu_picture;

-- 우진
select * from review;
select * from convenience;
select * from restaurant_convenience;

select * from reservation;
select * from review_comment;
select * from notification;
select  * from attraction;

update restaurant set approval = 'N' where no ='rest143';

commit;