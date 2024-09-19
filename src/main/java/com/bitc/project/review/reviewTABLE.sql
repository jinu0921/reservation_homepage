
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
        select * from review r NATURAL JOIN member m;
    drop table review;
    