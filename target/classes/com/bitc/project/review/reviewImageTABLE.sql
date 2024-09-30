use project_homepage;
desc review;


CREATE TABLE review_images (
    review_images_id INT PRIMARY KEY AUTO_INCREMENT,
    review_num INT,   -- posts 테이블과의 외래키 관계
    image_url VARCHAR(255),  -- 이미지 파일 경로 또는 URL
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 업로드 시간
    FOREIGN KEY (review_num) REFERENCES review(review_num) 
);

