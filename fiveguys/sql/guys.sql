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
create sequence seq_menu_no;

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
select * from review;

select * from restaurant;

insert into review 
    values  (('review' || lpad(seq_review_no.nextval,3,0)), 'restaurant043 ' , 'users004' , '굿입니다' , 5 , default);
insert into review
    values  (('review' || lpad(seq_users_no.nextval,3,0)), 'users003' , 'restaurant015' , '별로입니다' , '3' , sysdate);    
    
    insert into review
    values  (('review' || lpad(seq_users_no.nextval,3,0)), 'restaurant015' , 'users003' , '아주맛나요굿굿' , '3' , sysdate);  
commit;
--리뷰 사진 테이블
--insert into review_picture (no, review_no, renamed_filename, reg_date)
--values ('review_pic' || lpad(seq_users_no.nextval, 3, '0'), 'review1', '2af3c384-a2bc-4a1f-bb7e-77bee293ea04.jpg', sysdate);
--
--insert into review_picture (no, review_no, renamed_filename, reg_date)
--values ('review_pic' || lpad(seq_users_no.nextval, 3, '0'), 'review2', '2af3c384-a2bc-4a1f-bb7e-77bee293ea04.jpg', sysdate);
    

--댓글테이블
--insert into review_comment (no, users_no, review_no, content, comment_level, parent_comment_no, reg_date)
--values ('review_com' || lpad(seq_users_no.nextval, 3, '0'), '1', 'review1', '굿입니다', 1, null, sysdate);
--
--insert into review_comment (no, users_no, review_no, content, comment_level, parent_comment_no, reg_date)
--values ('review_com' || lpad(seq_users_no.nextval, 3, '0'), '2', 'review2', '별로입니다', 2, 'null', sysdate);

select
    r.*,
    (select count(*) from review_picture where review_no = r.no)  attach_count,
    (select count(*) from review_comment where review_no = r.no)  comment_count
from
    review r
order by
    no desc;

select * from review_picture;
select * from review_comment;
select * from review;
select * from users;

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
select * from users;

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
    id = 'woojin';
    
    
    
        select
        b.*,
        (select count(*) from attachment where board_id = b.id) attach_count,
        (select count(*) from board_comment where board_id = b.id) comment_count
      from
        board b
      order by
        id desc;
    
    select * from  review;
    
    select * from  review_picture;
    
    select * from review_comment;
    
    
      select
    r.*,
    v.no  review_no,
    v.users_no,
    v.content,
    v.reg_date,
    rp.no  review_pic_no,
    rp.renamed_filename,
    u.no user_no,
    u.id,
    u.nickname,
     rc.no comment_no,
     rc.users_no comment_users_no
from
    restaurant r
join
    review v on r.no = v.rest_no
left join
    review_picture rp on v.no = rp.review_no
join
    users u on v.users_no = u.no
left join
    review_comment rc on v.no = rc.review_no
where
 v.no = 'review013';
 
 update 
    review
   set
    content=  '개별로'
   where
     no = 'review015' ;
     
     select * from review;
    
    select 
    *
    from
        review
    where
     no ='review013';
     

  select *from review;
   select *from restaurant;
   
    
     select
            *
        from
            review
        where
          rest_no = 'restaurant015' ;
    
update
    review
set
    rest_no = 'restaurant023'
where
    no = 'review051';
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

