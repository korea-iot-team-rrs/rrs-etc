CREATE TABLE `COMMUNITY` (
	`COMMUNITY_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`COMM_CATE_NAME`	VARCHAR(50)	NULL	COMMENT '카테고리 이름 ENUM으로',
	`LIKE_COUNT`	int unsigned	NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL,
	`CONTENTS`	VARCHAR(255)	NULL,
	`THUMB_NAIL_IMG_URL`	VARCHAR(255)	NULL
);

CREATE TABLE `USER` (
	`USER_ID`	int unsigned	NOT NULL,
	`NAME`	VARCHAR(50)	NULL,
	`ID`	VARCHAR(30)	NULL,
	`PW`	VARCHAR(30)	NULL,
	`NICK_NAME`	VARCHAR(50)	NULL,
	`BIRTH`	CHAR(8)	NULL,
	`PHONE`	CHAR(11)	NULL,
	`ADDR`	VARCHAR(200)	NULL,
	`ADDR_DETAIL`	VARCHAR(200)	NULL,
	`EMAIL`	VARCHAR(200)	NULL,
	`ANIMAL_REG_STATUS`	CHAR(1)	NULL,
	`PROFILE`	VARCHAR(255)	NULL,
	`GENDER`	CHAR(1)	NULL,
	`DEL_YN`	CHAR(1)	NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL
);

CREATE TABLE `PET_PROFILE` (
	`PET_PROFILE_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`NAME`	VARCHAR(200)	NULL,
	`GENDER`	CHAR(1)	NULL,
	`BIRTH`	CHAR(6)	NULL,
	`WEIGHT`	SMALLINT	NULL,
	`PROFILE`	VARCHAR(255)	NULL,
	`ADD_INFO`	VARCHAR(255)	NULL,
	`NEUTRALITY_YN`	CHAR(1)	NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL
);

CREATE TABLE `USER_DEL_LOG` (
	`USER_DEL_LOG_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`REG_DATE`	DATETIME	NULL
);

CREATE TABLE `INQUERY_AND_REPORT` (
	`INQUERY_AND_REPORT_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`INQUERY_AND_REPORT_CATE_CD_ID`	int unsigned	NOT NULL,
	`TITLE`	VARCHAR(100)	NULL,
	`CONTENT`	VARCHAR(255)	NULL,
	`REPORT_USER_ID`	INT	NULL	COMMENT '문의사항일때는 NULL값 들어감',
	`STATUS`	CHAR(1)	NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL
);

CREATE TABLE `INQUERY_AND_REPORT_CATE_CD` (
	`INQUERY_AND_REPORT_CATE_CD_ID`	int unsigned	NOT NULL,
	`TYPE`	CHAR(1)	NULL	COMMENT '1 : 문의사항
2 : 신고',
	`CATE_CD_NAME`	VARCHAR(30)	NULL
);

CREATE TABLE `RESERVATION_LIST` (
	`RESERVATION_LIST_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`PROVIDERS_ID`	int nusigned	NOT NULL,
	`START_TIME`	DATETIME	NOT NULL,
	`END_TIME`	DATETIME	NOT NULL,
	`REG_DATETIME`	DATETIME	NOT NULL,
	`RESERVATION_STATUS`	CHAR(1)	NOT NULL	COMMENT '0 : 예약대기
1 : 예약수락(진행중)
2 : 예약거절
3 : 예약취소
4 : 완료'
);

CREATE TABLE `PROVIDERS` (
	`PROVIDERS_ID`	int nusigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`NICK_NAME`	VARCHAR(30)	NOT NULL,
	`INTRODUCTION`	VARCHAR(255)	NOT NULL,
	`PROVISION_YN`	CHAR(1)	NOT NULL,
	`REVIEW`	VARCHAR(255)	NOT NULL,
	`MON`	CHAR(1)	NULL,
	`TUE`	CHAR(1)	NULL,
	`WED`	CHAR(1)	NULL,
	`THU`	CHAR(1)	NULL,
	`FRI`	CHAR(1)	NULL,
	`SAT`	CHAR(1)	NULL,
	`SUN`	CHAR(1)	NULL,
	`PROVISION_OPTION`	VARCHAR(50)	NULL	COMMENT '산책, 목욕, 급여'
);

CREATE TABLE `REVIEW` (
	`REVIEW_ID`	int unsigned	NOT NULL,
	`PROVIDERS_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`REVIEW_SCORE`	SMALLINT	NOT NULL,
	`REVIEW_CONTENT`	VARCHAR(255)	NOT NULL
);

CREATE TABLE `HEALTH_RECORD` (
	`HEALTH_ID`	int unsigned	NOT NULL,
	`PET_PROFILE_ID`	int unsigned	NOT NULL,
	`WEIGHT`	SMALLINT	NULL,
	`AGE`	SMALLINT	NULL,
	`ABNORMAL_SYMPTOMS`	VARCHAR(255)	NULL,
	`MEDICAL_RECORD`	VARCHAR(200)	NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL,
	`ABNORMAL_SYMPTOMS_URL`	VARCHAR(255)	NULL,
	`MEMO`	VARCHAR(200)	NULL
);

CREATE TABLE `ACCOUNT_BOOK` (
	`ACCOUNT_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL,
	`MEMO`	VARCHAR(200)	NULL
);

CREATE TABLE `WALKING_RECORD` (
	`WALK_ID`	int unsigned	NOT NULL,
	`PET_PROFILE_ID`	int unsigned	NOT NULL,
	`DATE_CHOICE`	DATETIME	NULL,
	`DISTANCE`	int unsigned	NULL,
	`WALKING_TIME`	TIME	NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL,
	`MEMO`	VARCHAR(200)	NULL,
	`WALKING_RECORD_IMG_URL`	VARCHAR(255)	NULL
);

CREATE TABLE `TODO` (
	`TODO_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`PREPARATION_CONTENT`	VARCHAR(255)	NULL,
	`REG_DATETIME`	DATETIME	NULL,
	`UPD_DATETIME`	DATETIME	NULL
);

CREATE TABLE `CERTIFICATION_NUMBER` (
	`CERTIFICATION_NUMBER_ID`	int unsigned	NOT NULL,
	`CERT_TYPE`	CHAR(1)	NULL	COMMENT '0 : 휴대폰인증
1 : 이메일인증',
	`EMAIL`	VARCHAR(200)	NULL,
	`PHONE`	CHAR(11)	NULL,
	`CART_NUM`	CHAR(6)	NULL	COMMENT '무조건 6자리 ㅇㅋ',
	`SEND_TIME`	DATETIME	NULL,
	`USER_ID`	int unsigned	NULL	COMMENT '회원정보가 없을 시에는 외래키를 가져올 수 없으므로 외래키로 잡지않았음'
);

CREATE TABLE `COMMUNITY_REPLY` (
	`COMMUNITY_REPLY_ID`	int unsigned	NOT NULL,
	`COMMUNITY_ID`	int unsigned	NOT NULL,
	`USER_ID`	int unsigned	NOT NULL,
	`PARENT_REPLY`	CHAR(1)	NULL	COMMENT '0 :  원댓글
1 : 대댓글',
	`CONTENTS`	VARCHAR(255)	NULL,
	`REG_DATETIME`	DATETIME	NULL
);

CREATE TABLE `COMM_ATTACHMENT` (
	`COMM_ATTACHMENT_ID`	int unsigned	NOT NULL,
	`COMMUNITY_ID`	int unsigned	NOT NULL,
	`IMG_URL`	VARCHAR(255)	NULL,
	`REG_DATETIME`	DATETIME	NULL
);

CREATE TABLE `ATTACHMENT` (
	`ATTACHMENT_ID`	int unsigned	NOT NULL,
	`QUESTION_ID`	int unsigned	NOT NULL,
	`INQUERY_AND_REPORT_CATE_CD_ID`	int unsigned	NOT NULL,
	`URL`	VARCHAR(255)	NULL,
	`REG_DATETIME`	DATETIME	NULL
);

ALTER TABLE `COMMUNITY` ADD CONSTRAINT `PK_COMMUNITY` PRIMARY KEY (
	`COMMUNITY_ID`,
	`USER_ID`
);

ALTER TABLE `USER` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`USER_ID`
);

ALTER TABLE `PET_PROFILE` ADD CONSTRAINT `PK_PET_PROFILE` PRIMARY KEY (
	`PET_PROFILE_ID`,
	`USER_ID`
);

ALTER TABLE `USER_DEL_LOG` ADD CONSTRAINT `PK_USER_DEL_LOG` PRIMARY KEY (
	`USER_DEL_LOG_ID`,
	`USER_ID`
);

ALTER TABLE `INQUERY_AND_REPORT` ADD CONSTRAINT `PK_INQUERY_AND_REPORT` PRIMARY KEY (
	`INQUERY_AND_REPORT_ID`,
	`USER_ID`,
	`INQUERY_AND_REPORT_CATE_CD_ID`
);

ALTER TABLE `INQUERY_AND_REPORT_CATE_CD` ADD CONSTRAINT `PK_INQUERY_AND_REPORT_CATE_CD` PRIMARY KEY (
	`INQUERY_AND_REPORT_CATE_CD_ID`
);

ALTER TABLE `RESERVATION_LIST` ADD CONSTRAINT `PK_RESERVATION_LIST` PRIMARY KEY (
	`RESERVATION_LIST_ID`,
	`USER_ID`,
	`PROVIDERS_ID`
);

ALTER TABLE `PROVIDERS` ADD CONSTRAINT `PK_PROVIDERS` PRIMARY KEY (
	`PROVIDERS_ID`,
	`USER_ID`
);

ALTER TABLE `REVIEW` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`REVIEW_ID`,
	`PROVIDERS_ID`,
	`USER_ID`
);

ALTER TABLE `HEALTH_RECORD` ADD CONSTRAINT `PK_HEALTH_RECORD` PRIMARY KEY (
	`HEALTH_ID`,
	`PET_PROFILE_ID`
);

ALTER TABLE `ACCOUNT_BOOK` ADD CONSTRAINT `PK_ACCOUNT_BOOK` PRIMARY KEY (
	`ACCOUNT_ID`,
	`USER_ID`
);

ALTER TABLE `WALKING_RECORD` ADD CONSTRAINT `PK_WALKING_RECORD` PRIMARY KEY (
	`WALK_ID`,
	`PET_PROFILE_ID`
);

ALTER TABLE `TODO` ADD CONSTRAINT `PK_TODO` PRIMARY KEY (
	`TODO_ID`,
	`USER_ID`
);

ALTER TABLE `CERTIFICATION_NUMBER` ADD CONSTRAINT `PK_CERTIFICATION_NUMBER` PRIMARY KEY (
	`CERTIFICATION_NUMBER_ID`
);

ALTER TABLE `COMMUNITY_REPLY` ADD CONSTRAINT `PK_COMMUNITY_REPLY` PRIMARY KEY (
	`COMMUNITY_REPLY_ID`,
	`COMMUNITY_ID`,
	`USER_ID`
);

ALTER TABLE `COMM_ATTACHMENT` ADD CONSTRAINT `PK_COMM_ATTACHMENT` PRIMARY KEY (
	`COMM_ATTACHMENT_ID`,
	`COMMUNITY_ID`
);

ALTER TABLE `ATTACHMENT` ADD CONSTRAINT `PK_ATTACHMENT` PRIMARY KEY (
	`ATTACHMENT_ID`,
	`QUESTION_ID`,
	`INQUERY_AND_REPORT_CATE_CD_ID`
);

ALTER TABLE `COMMUNITY` ADD CONSTRAINT `FK_USER_TO_COMMUNITY_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `PET_PROFILE` ADD CONSTRAINT `FK_USER_TO_PET_PROFILE_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `USER_DEL_LOG` ADD CONSTRAINT `FK_USER_TO_USER_DEL_LOG_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `INQUERY_AND_REPORT` ADD CONSTRAINT `FK_USER_TO_INQUERY_AND_REPORT_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `INQUERY_AND_REPORT` ADD CONSTRAINT `FK_INQUERY_AND_REPORT_CATE_CD_TO_INQUERY_AND_REPORT_1` FOREIGN KEY (
	`INQUERY_AND_REPORT_CATE_CD_ID`
)
REFERENCES `INQUERY_AND_REPORT_CATE_CD` (
	`INQUERY_AND_REPORT_CATE_CD_ID`
);

ALTER TABLE `RESERVATION_LIST` ADD CONSTRAINT `FK_USER_TO_RESERVATION_LIST_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `RESERVATION_LIST` ADD CONSTRAINT `FK_PROVIDERS_TO_RESERVATION_LIST_1` FOREIGN KEY (
	`PROVIDERS_ID`
)
REFERENCES `PROVIDERS` (
	`PROVIDERS_ID`
);

ALTER TABLE `PROVIDERS` ADD CONSTRAINT `FK_USER_TO_PROVIDERS_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `REVIEW` ADD CONSTRAINT `FK_PROVIDERS_TO_REVIEW_1` FOREIGN KEY (
	`PROVIDERS_ID`
)
REFERENCES `PROVIDERS` (
	`PROVIDERS_ID`
);

ALTER TABLE `REVIEW` ADD CONSTRAINT `FK_USER_TO_REVIEW_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `HEALTH_RECORD` ADD CONSTRAINT `FK_PET_PROFILE_TO_HEALTH_RECORD_1` FOREIGN KEY (
	`PET_PROFILE_ID`
)
REFERENCES `PET_PROFILE` (
	`PET_PROFILE_ID`
);

ALTER TABLE `ACCOUNT_BOOK` ADD CONSTRAINT `FK_USER_TO_ACCOUNT_BOOK_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `WALKING_RECORD` ADD CONSTRAINT `FK_PET_PROFILE_TO_WALKING_RECORD_1` FOREIGN KEY (
	`PET_PROFILE_ID`
)
REFERENCES `PET_PROFILE` (
	`PET_PROFILE_ID`
);

ALTER TABLE `TODO` ADD CONSTRAINT `FK_USER_TO_TODO_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `COMMUNITY_REPLY` ADD CONSTRAINT `FK_COMMUNITY_TO_COMMUNITY_REPLY_1` FOREIGN KEY (
	`COMMUNITY_ID`
)
REFERENCES `COMMUNITY` (
	`COMMUNITY_ID`
);

ALTER TABLE `COMMUNITY_REPLY` ADD CONSTRAINT `FK_USER_TO_COMMUNITY_REPLY_1` FOREIGN KEY (
	`USER_ID`
)
REFERENCES `USER` (
	`USER_ID`
);

ALTER TABLE `COMM_ATTACHMENT` ADD CONSTRAINT `FK_COMMUNITY_TO_COMM_ATTACHMENT_1` FOREIGN KEY (
	`COMMUNITY_ID`
)
REFERENCES `COMMUNITY` (
	`COMMUNITY_ID`
);

ALTER TABLE `ATTACHMENT` ADD CONSTRAINT `FK_INQUERY_AND_REPORT_TO_ATTACHMENT_1` FOREIGN KEY (
	`QUESTION_ID`
)
REFERENCES `INQUERY_AND_REPORT` (
	`INQUERY_AND_REPORT_ID`
);

ALTER TABLE `ATTACHMENT` ADD CONSTRAINT `FK_INQUERY_AND_REPORT_TO_ATTACHMENT_2` FOREIGN KEY (
	`INQUERY_AND_REPORT_CATE_CD_ID`
)
REFERENCES `INQUERY_AND_REPORT` (
	`INQUERY_AND_REPORT_CATE_CD_ID`
);
