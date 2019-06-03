package com.zephon.pojo;

import java.util.List;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.pojo
 * @date 19-5-28 下午5:03
 * @Copyright ©
 */
public class Cart {
    private Integer cid;
    private String goodsMapJson;
    private Integer num;
    private Integer uid;

    @Override
    public String toString() {
        return "Cart{" +
                "cid=" + cid +
                ", goodsMapJson='" + goodsMapJson + '\'' +
                ", num=" + num +
                ", uid=" + uid +
                '}';
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getGoodsMapJson() {
        return goodsMapJson;
    }

    public void setGoodsMapJson(String goodsMapJson) {
        this.goodsMapJson = goodsMapJson;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }
}