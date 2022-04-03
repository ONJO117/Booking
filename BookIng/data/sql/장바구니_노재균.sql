DROP TABLE bookCart cascade CONSTRAINTS;
DROP SEQUENCE bookCart_seq;

create table bookCart(
cartNo number not null primary key,
id varchar2(20) NOT NULL REFERENCES member(id),
bookNo number NOT NULL REFERENCES bookBoard(bookNo),
quantity number default 1
);

CREATE SEQUENCE bookCart_seq;

INSERT INTO bookCart(cartNo, id, bookNo, quantity)
VALUES(bookCart_seq.NEXTVAL, 'test', '1', '2');

INSERT INTO bookCart(cartNo, id, bookNo, quantity)
VALUES(bookCart_seq.NEXTVAL, 'test', '4', '3');

INSERT INTO bookCart(cartNo, id, bookNo, quantity)
VALUES(bookCart_seq.NEXTVAL, 'test', '5', '1');

INSERT INTO bookCart(cartNo, id, bookNo, quantity)
VALUES(bookCart_seq.NEXTVAL, 'test', '20', '1');

INSERT INTO bookCart(cartNo, id, bookNo, quantity)
VALUES(bookCart_seq.NEXTVAL, 'admin', '1', '2');

INSERT INTO bookCart(cartNo, id, bookNo, quantity)
VALUES(bookCart_seq.NEXTVAL, 'admin', '3', '2');

INSERT INTO bookCart(cartNo, id, bookNo, quantity)
VALUES(bookCart_seq.NEXTVAL, 'admin', '5', '1');

COMMIT;

select m.id, b.title, b.writer, b.price, c.quantity, b.price*c.quantity totalPrice
from member m, bookBoard b, bookCart c
where (m.id = c.id) and (b.bookNo = c.bookNo);
