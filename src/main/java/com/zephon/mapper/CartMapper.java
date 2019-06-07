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
 * @Description 购物车mapper层
 * @date 19-5-28 下午5:10
 * @Copyright ©
 */
public interface CartMapper {
    /**
     * @Author Zephon
     * @Description 清空购物车
     * @Date 19-6-3 下午6:08
     * @Param []
     * @return int
     **/
    @Delete("delete from store_cart")
    int delAll();

    /**
     * @Author Zephon
     * @Description 根据uid选择购物车
     * @Date 19-6-3 下午6:08
     * @Param [uid]
     * @return java.util.List<com.zephon.pojo.Cart>
     **/
    @Select("select goodsMapJson,num from store_cart where uid=uid")
    List<Cart> selAllCart(int uid);

    /**
     * @Author Zephon
     * @Description 将由商品转换的json字符串、对应的数量、uid添加到数据库
     * @Date 19-6-3 下午6:09
     * @Param [goodsMapJson, num, uid]
     * @return int
     **/
    @Insert("insert into store_cart (goodsMapJson,num,uid) values (#{arg0},#{arg1},#{arg2})")
    int insCart(String goodsMapJson,int num,int uid);

    /**
     * @Author Zephon
     * @Description 更新数据库中的json和数量
     * @Date 19-6-3 下午6:10
     * @Param [goodsMapJson, num]
     * @return int
     **/
    @Update("update store_cart set GoodsMapJson=#{arg0},num=#{arg1}")
    int updCart(String goodsMapJson,int num);
}
