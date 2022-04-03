-- 객체 제거
drop table notice CASCADE CONSTRAINTS;
drop SEQUENCE notice_seq;

create table notice(
no number PRIMARY key,
title varchar2(300) not null,
content varchar2(2000) not null,
startDate date default sysdate,
endDate date default '9999-12-30',
wrriteDate date default sysdate,
updateDate date default sysdate);

create sequence notice_seq;

-- 샘플데이터 - 현재 날짜 : 2021.12.27
-- 지난 공지 - 2021년 성탄절 이벤트 - 2021.11.25 ~ 2021.12.25
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '현재','현재 진행공지','2022-01-30','2022-02-25');

-- 현재 공지 - 2022년 새해 메시지 이벤트 - 2021.12.01 ~ 2022.01.07
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '지난','이미 지난 이벤트','2021-12-01','2022-01-07');

-- 예약 공지 - 2022년 수료 - 2022.03.15 ~ 2022.03.30
insert into notice(no, title, content, startDate, endDate)
values (notice_seq.nextval, '예약','나중에 할 이벤트','2022-03-15','2022-03-30');
commit;

select * from notice;