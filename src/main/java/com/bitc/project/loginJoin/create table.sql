create schema project3;

use project3;

create table member(
	member_num INT PRIMARY KEY AUTO_INCREMENT,
    id VARCHAR(300) NOT NULL,
    password VARCHAR(300) NOT NULL,
    uname VARCHAR(15) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    join_date  TIMESTAMP NOT NULL DEFAULT now(),
    email VARCHAR(200) NOT NULL,
	address VARCHAR(300) NOT NULL,
    points INT DEFAULT 0
);

create table lesson(
	lesson_num INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(300) NOT NULL,
    phone VARCHAR(300) NOT NULL,
    myLevel VARCHAR(15) NOT NULL,
    message TEXT,
    time VARCHAR(200) NOT NULL,
    status TINYINT DEFAULT 0,
	date TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE IF NOT EXISTS reservation (
    reservation_num INT PRIMARY KEY AUTO_INCREMENT,  					-- 예약 번호
    member_phoneNum VARCHAR(15) NOT NULL,           					-- 예약자 전화번호
    reservation_date VARCHAR(12) NOT NULL,                 				-- 예약 날짜 (YYYYMMDD 형식)
    piano VARCHAR(1) NOT NULL,                             				-- 예약한 연습실 번호
    reservation_time TEXT NOT NULL,                 					-- 예약 시간
	reservation_status ENUM('pending','confirmed','canceled') NOT NULL, -- 예약 상태
    created_at TIMESTAMP NOT NULL DEFAULT now(),							-- 예약이 생성된 시간
    member_num int NOT NULL,
    member_name VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS piano(
	piano INT PRIMARY KEY AUTO_INCREMENT,
    price int not null ,
    weekend_price int
);

CREATE TABLE IF NOT EXISTS points(
	point INT PRIMARY KEY AUTO_INCREMENT,
	member_num INT NOT NULL,
    price INT NOT NULL,
    status ENUM('pending','confirmed','canceled') NOT NULL,
    time TIMESTAMP NOT NULL DEFAULT now()
);

CREATE TABLE review(
	member_num int,
	review_num int PRIMARY KEY auto_increment,	-- 게시글 번호
	title VARCHAR(200) NOT NULL,				-- 제목
	content TEXT null,							-- 내용
	regdate TIMESTAMP NOT NULL default now(),	-- 글 등록시간
	viewcnt INT default 0,						-- 조회수
	rating int not null,
	FOREIGN KEY (member_num) REFERENCES member(member_num)
);
    
CREATE TABLE review_images (
    review_images_id INT PRIMARY KEY AUTO_INCREMENT,
    review_num INT,   -- posts 테이블과의 외래키 관계
    image_url VARCHAR(255),  -- 이미지 파일 경로 또는 URL
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 업로드 시간
    FOREIGN KEY (review_num) REFERENCES review(review_num) 
);
insert into piano values(null,5000,5000);
