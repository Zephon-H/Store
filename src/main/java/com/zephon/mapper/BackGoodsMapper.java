package com.zephon.mapper;

import com.zephon.pojo.Goods;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.mapper
 * @date 19-6-7 下午12:43
 * @Copyright ©
 */
public interface BackGoodsMapper {
    @Select("select * from store_goods")
    List<Goods> selAllGoods();
    @Delete("delete from store_goods where id=#{ars0}")
    int deleteByID(int id);
    @Select("select * from store_goods where id=#{args0}")
    Goods selGoodsByID(int id);
    @Update("update store_goods set name=#{name},price=#{price},detail=#{detail},type=#{type},picture=#{picture},sales=#{sales} where id=#{id}")
    int updGoodsByID(Goods goods);
    @Insert("insert into store_goods values(default,#{name},#{price},#{detail},#{type},#{picture},#{sales})")
    int insGoods(Goods goods);
}
