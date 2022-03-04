/* test_boards 테이블 생성 */
CREATE TABLE test_boards(
boardNum NUMBER(6) PRIMARY KEY,
boardWriter VARCHAR2(25) NOT NULL,
boardTitle VARCHAR2(1000) NOT NULL,
boardContent VARCHAR2(4000)NOT NULL,
boardRegdate DATE DEFAULT SYSDATE,
boardPwd VARCHAR2(15) NOT NULL,
boardCount NUMBER(10) DEFAULT 0
);


/* test_boards 시퀀스 */
CREATE SEQUENCE test_boards_seq
START WITH 101
NOCACHE;


/* test_boards샘플 데이터 */
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'가영','공부공부','가나다라마바사','2020-09-15','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'나영','공부','공부해요','2020-09-30','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'다영','호호','하하호호하하하호호','2021-01-30','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'라영','안녕하세요','집이좋다','2021-02-01','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'마영','반가워요','집이좋다','2021-02-02','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'바영','질문이있어요','집이좋다','2021-02-03','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'사영','뭐하시나요','집이좋다','2021-02-04','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'아영','날이풀렸네요','날씨가 따수워요','2021-09-30','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'자영','점심뭐드시나요','고민중입니다.','2021-09-30','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'차영','저녁뭐드시나요','저는 아직 고민중입니다.','2021-10-30','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'카영','2022년의목표는','다들 무엇인가요','2021-11-01','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'타영','공부합시다','집이최고다','2021-11-02','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'파영','아이시스 물','맛있나요','2021-11-15','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'하영','커피를 좋아합니다','저도 커피를 매우좋아해요','2021-12-06','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'탱크','아이스크림 좋아하시나요','저는 별로 안좋아해요','2021-12-08','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'누구','파스타요리하는법','면을 삶습니다','2021-12-15','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'익명','쌀국수 맛있게먹는법','칠리소스를 넣으면 맛있어요','2022-01-01','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'우하하','고구마를 좋아합니다','감자는 별로네요','2020-09-30','1234',0);
INSERT INTO test_boards
VALUES(test_boards_seq.NEXTVAL,'겅부','맛집추천','비밀입니다.','2020-09-30','1234',0);

DROP TABLE TEST_BOARDS;

select * from test_boards;
