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
    /**
     * @Author Zephon
     * @Description 从商品中选择6个商品
     * @Date 19-6-3 下午6:11
     * @Param []
     * @return java.util.List<com.zephon.pojo.Goods>
     **/
    @Select("select * from store_goods limit 6")
    List<Goods> selSixGoods();

    /**
     * @Author Zephon
     * @Description 从商品先选择销量排行前三的
     * @Date 19-6-3 下午6:11
     * @Param []
     * @return java.util.List<com.zephon.pojo.Goods>
     **/
    @Select("select * from store_goods order by sales desc limit 3")
    List<Goods> selTop3BySale();

    /**
     * @Author Zephon
     * @Description 从商品中选择所有商品
     * @Date 19-6-3 下午6:12
     * @Param []
     * @return java.util.List<com.zephon.pojo.Goods>
     **/
    @Select("select * from store_goods")
    List<Goods> selAllGoods();

    /**
     * @Author Zephon
     * @Description 从商品中选择一页，从pageStart开始，每页pageSize个商品
     * @Date 19-6-3 下午6:12
     * @Param [pageStart, pageSize]
     * @return java.util.List<com.zephon.pojo.Goods>
     **/
    @Select("select * from store_goods limit #{arg0},#{arg1}")
    List<Goods> selPage(int pageStart,int pageSize);

    /**
     * @Author Zephon
     * @Description 选择3个商品(用于轮播)
     * @Date 19-6-3 下午6:12
     * @Param []
     * @return java.util.List<com.zephon.pojo.Goods>
     **/
    @Select("select * from store_goods order by id limit 3")
    List<Goods> selSlide();

    /**
     * @Author Zephon
     * @Description 通过id选择商品
     * @Date 19-6-3 下午6:13
     * @Param [id]
     * @return com.zephon.pojo.Goods
     **/
    @Select("select * from store_goods where id=#{arg0}")
    Goods selGoodsById(int id);

    /**
     * @Author Zephon
     * @Description 从商品中选择5个类型模糊匹配为type的商品
     * @Date 19-6-3 下午6:13
     * @Param [type]
     * @return java.util.List<com.zephon.pojo.Goods>
     **/
    @Select("select * from store_goods where type like #{arg0} limit 5")
    List<Goods> selSimilarByType(String type);

    /**
     * @Author Zephon
     * @Description 选择一页类型模糊匹配为type的商品
     * @Date 19-6-3 下午6:14
     * @Param [type, pageStart, pageSize]
     * @return java.util.List<com.zephon.pojo.Goods>
     **/
    @Select("select * from store_goods where type like #{arg0} limit #{arg1},#{arg2}")
    List<Goods> selLikeByType(String type,int pageStart,int pageSize);
}
