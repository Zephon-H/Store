package com.zephon.mapper;

import com.zephon.pojo.Goods;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.mapper
 * @date 19-5-27 下午1:09
 * @Copyright ©
 */
public interface GoodsMapper {
    @Select("select * from store_goods limit 6")
    List<Goods> selSixGoods();

    @Select("select * from store_goods order by sales desc limit 3")
    List<Goods> selTop3BySale();

    @Select("select * from store_goods")
    List<Goods> selAllGoods();

    @Select("select * from store_goods limit #{arg0},#{arg1}")
    List<Goods> selPage(int pageStart,int pageSize);

    @Select("select * from store_goods order by id limit 3")
    List<Goods> selSlide();

    @Select("select * from store_goods where id=#{arg0}")
    Goods selGoodsById(int id);

    @Select("select * from store_goods where type=#{arg0} limit 5")
    List<Goods> selSimilarByType(String type);

    @Select("select * from store_goods where type like #{arg0} limit #{arg1},#{arg2}")
    List<Goods> selLikeByType(String type,int pageStart,int pageSize);
}
