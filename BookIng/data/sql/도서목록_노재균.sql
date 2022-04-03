DROP TABLE bookBoard CASCADE CONSTRAINTS;
DROP SEQUENCE bookBoard_seq;

CREATE TABLE bookBoard(
  bookNo NUMBER PRIMARY KEY,
  genre VARCHAR2(30) NOT NULL,
  title VARCHAR2(300) NOT NULL,
  writer VARCHAR2(300) NOT NULL,
  publisher VARCHAR2(300) NOT NULL,
  pubDate DATE NOT NULL,
  summary VARCHAR2(2000) NOT NULL,
  price NUMBER default 0,
  cover VARCHAR2(100) default '/upload/cover/noCover.png'
  );

CREATE SEQUENCE bookBoard_seq;

INSERT INTO bookBoard(bookNo, genre, title, writer, publisher, pubDate, summary, price, cover)
VALUES(bookBoard_seq.NEXTVAL, '장르', '책제목', '작가', '출판사', '1963-03-22', '줄거리', '10000', '/upload/cover/noCover.png');

COMMIT;

SELECT * FROM bookBoard;