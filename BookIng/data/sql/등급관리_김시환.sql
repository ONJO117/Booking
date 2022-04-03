CREATE TABLE grade(
gradeNo NUMBER(2) PRIMARY KEY,
gradeName VARCHAR2(20)
);

select gradeNo, gradeName from grade order by gradeNo;

INSERT INTO grade(gradeNo, gradeName) VALUES(9, '°ü¸®ÀÚ');

UPDATE grade set gradeName = ? where gradeNo =?;

delete from grade where gradeNo = ?;