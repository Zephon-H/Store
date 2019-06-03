package com.zephon.mapper;

import com.zephon.pojo.Cart;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Property;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.mapper
 * @date 19-5-28 下午5:10
 * @Copyright ©
 */
public interface CartMapper {
    @Delete("delete from store_cart")
    int delAll();

    @Select("select goodsMapJson,num from store_cart where uid=uid")
    List<Cart> selAllCart(int uid);

    @Insert("insert into store_cart (goodsMapJson,num,uid) values (#{arg0},#{arg1},#{arg2})")
    int insCart(String goodsMapJson,int num,int uid);

    @Update("update store_cart set GoodsMapJson=#{arg0},num=#{arg1}")
    int updCart(String goodsMapJson,int num);
}
