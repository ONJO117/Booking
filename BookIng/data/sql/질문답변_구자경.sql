-- ģ§ė¬ø ?µė³? ?¤?¤ė§?
DROP TABLE qna;
DROP SEQUENCE qna_seq;

-- ź°ģ²“ ??±
CREATE TABLE qna(
    no NUMBER PRIMARY KEY,
    title VARCHAR2(300) NOT NULL,
    content VARCHAR2(2000) NOT NULL,
    id VARCHAR(20) NOT NULL REFERENCES member(id),
    writeDate DATE DEFAULT SYSDATE,
    hit NUMBER DEFAULT 0,
    refNo NUMBER REFERENCES qna(no), -- ReferencesNo : ģ°øģ”° ?ź³ ģ? źø?ė²ķø (ė§Øģ²?? ?Øģ§? źø?)
    ordNo NUMBER, -- OrderNo : ??ė²ķø ( ??ė”? ė“¤ģ? ? ?¼ ?? ?¬?¼???¼??¤.) 
    levNo NUMBER, -- ?¤?¬?°źø? (ė§Øģ²? ģ§ė¬ø?? ?¤?¬?°źø°ė?? ?ģ§? ???¤. 0 / ?µė³?źø??? +1 ?“? ?¤?¬?°źø? ??¤.)
    parentNo NUMBER REFERENCES qna(no) ON DELETE CASCADE -- ?? źø??“ ?¬?¼ģ§?ė©? ė°ģ ?źø? ?­?  // ė¶?ėŖØķ¤ź°? ?­?  ? ?? ?­?  ?¤? 
);

-- ??øģ¦ ??±
CREATE SEQUENCE qna_seq;

-- »łĒĆ µ„ĄĢÅĶ 
-- 1. Įś¹®ĒĻ±ā 
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo) 
VALUES(qna_seq.NEXTVAL, 'ĒĮ·ĪĮ§Ę®1?', 'ĒĮ·ĪĮ§Ę®ĘĄ', 'test', qna_seq.NEXTVAL, 1, 0);
COMMIT;

-- 2. ?µė³??źø?
-- ģ§ė¬ø? ė³“ź³  ?µė³???¤.
-- ė³“ź³  ?? źø?(1ė²? źø?) : ė¶?ėŖØź?(parentNo) -> 1ė²? źø?
-- ź“?? Ø źø?(refNo) : ģµģ“ ģ§ė¬ø? źø?ė²ķø -> 1ė²?
-- ??ė²ķø(ordNo) : ?°?“?°ė„? ???  ģ§ė¬ø? ?? ź·øģ ??? ?µė³??? ?? ?µė³??“ ?¬?¬ź°ė©“ ģµź·¼? ??±? ?µė³?? ?? ?ģ¹ķź²? ė§ė? ė²ķø
-- ?¤?¬?°źø?(levNo) : ?ė©“ģ ?¼ė§ė ?¤?¬?°źø? ? ģ§?ė„? ? ?? ė²ķø
-- 1¹ųæ” “ėĒŃ “äŗÆ
INSERT INTO qna(no, title, content, id, refNo, ordNo, levNo, parentNo) 
VALUES(qna_seq.NEXTVAL, 'ĒĮ·ĪĮ§Ę®1', 'ĒĮ·ĪĮ§Ę®ĘĄĄĢ“Ł', 'admin', 1, 2, 1, 1);
COMMIT;

--list
SELECT no,title, content, writeDate, hit, refNo, ordNo, levNO, parentNo
FROM qna ORDER BY refNo desc, ordNO;

--ROLLBACK;