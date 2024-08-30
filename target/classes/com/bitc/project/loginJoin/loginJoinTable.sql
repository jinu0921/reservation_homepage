use project_homepage;
desc member;
create table member(
	member_num int auto_increment primary key,
    id varchar(300) not null unique,
    password varchar(200) not null,
    nickname varchar(12) not null
);