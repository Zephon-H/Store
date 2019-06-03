create table store_user
(
    uid   int(10) auto_increment
        primary key,
    uname varchar(20) null,
    pwd   varchar(20) null,
    phone varchar(15) null,
    email varchar(20) null
);

INSERT INTO JavaMysql0.store_user (uid, uname, pwd, phone, email) VALUES (1, 'q123', '123123', '15284982388', '123@qq.com');
INSERT INTO JavaMysql0.store_user (uid, uname, pwd, phone, email) VALUES (2, 'admin', '123123', '15284982388', '1528498238@qq.com');