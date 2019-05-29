package com.zephon.util;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.util
 * @date 19-5-29 下午7:01
 * @Copyright ©
 */

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Seven on 2015/6/12.
 */
public class QueryHelper {

    private String nameSpace;
    private String methodId;
    private Object param;
    private Map<String,Object> params;

    /**
     * 设置命名空间.
     * @param nameSpace
     * @return
     */
    public QueryHelper setNameSpace(String nameSpace){
        this.nameSpace = nameSpace;
        return this;
    }

    /**
     * 设置dao方法的ID.
     * @param methodId
     * @return
     */
    public QueryHelper setMethodId(String methodId){
        this.methodId = methodId;
        return this;
    }

    /**
     * 设置一个参数.
     * @param param
     * @return
     */
    public QueryHelper setParam(Object param){
        this.param = param;
        return this;
    }

    /**
     * 设置多个参数.
     * @param key
     * @param value
     * @return
     */
    public QueryHelper setParams(String key,Object value){
        if(params == null){
            params = new HashMap<String, Object>();
        }
        params.put(key,value);
        return this;
    }

    /**
     * 获取一个参数.
     * @return
     */
    public Object getParam(){
        return param;
    }

    /**
     * 获得多个参数.
     * @return
     */
    public Map<String,Object> getParams(){
        return params;
    }

    /**
     * 获取非空的参数.
     * @return
     */
    public Object getRealParams(){
        return param == null ? params : param;
    }


    /**
     * 得到结果.
     * @return
     */
    public String getMethod(){
        return nameSpace+"."+methodId;
    }



}
