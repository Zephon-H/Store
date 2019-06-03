
create table store_cart
(
    cid          int(10) auto_increment
        primary key,
    goodsMapJson varchar(100)  null,
    num          int default 0 null,
    uid          int(10)       null
);

INSERT INTO JavaMysql0.store_cart (cid, goodsMapJson, num, uid) VALUES (4, '{"id":1,"name":"1号商品","price":300.0,"detail":"详细信息","type":"类型一","picture":"1","sales":0}', 3, 2);