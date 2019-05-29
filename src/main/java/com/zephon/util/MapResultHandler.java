package com.zephon.util;

import org.apache.ibatis.session.ResultContext;
import org.apache.ibatis.session.ResultHandler;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.util
 * @date 19-5-29 下午6:29
 * @Copyright ©
 */
public class MapResultHandler implements ResultHandler {
    @SuppressWarnings("rawtypes")
    private final Map mappedResults = new HashMap();

    @SuppressWarnings("unchecked")
    @Override
    public void handleResult(ResultContext context) {
        @SuppressWarnings("rawtypes")
        Map map = (Map) context.getResultObject();
        mappedResults.put(map.get("key"), map.get("value"));  // xml 配置里面的property的值，对应的列
    }
    public Map getMappedResults() {
        return mappedResults;
    }
}
