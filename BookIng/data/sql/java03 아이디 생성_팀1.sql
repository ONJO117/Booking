CREATE USER java03 IDENTIFIED BY java03;

--만들어진 사용자에게 접속, 작업 권한을 준다.
GRANT CONNECT, RESOURCE, create view TO java03;