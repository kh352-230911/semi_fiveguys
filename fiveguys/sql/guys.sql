-- guys계정 생성 (관리자)
create user guys
identified by "Five_mans240111@"
default tablespace users;

grant connect, resource to guys;

alter user guys quota unlimited on users;

-- 회원테이블
create table users (
    no varchar2(30),
    id varchar2(30) not null,
    password varchar2(300) not null,
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

select * from  users;

--alter table delete_users  modify (password varchar2(300));
commit;

-- 우진 회원 테이블에 샘플 데이터 추가
insert into users values(
    ('users' || lpad(seq_users_no.nextval,3,0)), 'woojin', '1234a@', '오우진', '우지', 'M', 'woojin@naver.com', '010-1231-1211', 'M', null, default
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
    constraints fk_restaurant_users_no foreign key(users_no) references users(no) on delete cascade,
    constraints uq_restaurant_phone unique(phone),
    constraints ck_restaurant_reserv_possible check(reserv_possible in ('Y', 'N'))
);
create sequence seq_restaurant_no;

select * from restaurant;

-- 우진 식당 테이블에 샘플 데이터 추가
insert into restaurant values(
     ('rest' || lpad(seq_restaurant_no.nextval,3,0)), 'users001', '캐치마인드', '강남구 테헤란로', '바뀐 데이터베이스에 샘플코드 넣는중', '02-3391-4991', 'it', '9:00', '18:00', default, 5, default
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
create table reservation (
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
    constraints fk_reservation_users_no foreign key(users_no) references users(no) on delete cascade
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
    constraints fk_review_users_no foreign key(users_no) references users(no) on delete cascade,
    constraints ck_review_star_grade check(star_grade in(1, 2, 3, 4, 5))
);
create sequence seq_review_no;

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
    constraints fk_review_comment_users_no foreign key(users_no) references users(no) on delete cascade,
    constraints fk_review_comment_parent_comment_no foreign key(parent_comment_no) references review_comment(no) on delete cascade
);
create sequence seq_review_comment_no;

select * from review_comment;

commit;

select
    r.no,
    r.name,
    r.address,
    r.category,
    p.renamed_filename
from
    restaurant r left join menu m 
        on r.no = m.rest_no
            left join menu_picture p
                on m.no = p.menu_no
where
    category like '%일식%';
order by
    no;

select
    count(*)
from
    restaurant r left join menu m 
        on r.no = m.rest_no
            left join menu_picture p
                on m.no = p.menu_no
where
    category like '%분%';

select
    m.*,
    p.no pic_no,
    p.menu_no,
    p.renamed_filename
from
    menu m left join menu_picture p
                on m.no = p.menu_no;

select
    *
from
    users u left join attraction a
        on u.no = a.users_no;

create table attraction (
    users_no varchar2(30) not null,
    rest_no varchar2(30) not null,
    constraints pk_attraction_users_rest_no primary key(users_no, rest_no)
);

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

--alter table users modify (password varchar2(300));
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
    constraints fk_restaurant_users_no foreign key(users_no) references users(no) on delete cascade,
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
    
select * from menu_picture;

commit;


select * from delete_users;
select * from users;

update
    users
set
    password = 'S0NLwMHt0Wp+riazlX7lDq6r/B2iz2hRwVi1jzVfpKydrywrCKsjB6YFuKE8o/zbbqMla1NjwQDRJyynCHEuPw=='
where
    id = 'woojin';