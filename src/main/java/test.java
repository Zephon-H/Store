import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zephon.pojo.Goods;
import com.zephon.pojo.User;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Zephon
 * @version V1.0
 * @Package PACKAGE_NAME
 * @date 19-5-29 下午12:47
 * @Copyright ©
 */
public class test {
    public static void main(String[] args) throws IOException {
        Goods goods = new Goods();
        goods.setId(123);
        goods.setName("asdzcv");
        ObjectMapper mapper = new ObjectMapper();
        //map<String,User>转json
        HashMap<Goods, Integer> umap = new HashMap();
        umap.put(goods, 123);
        String mmjson = mapper.writeValueAsString(umap);
        System.out.println("mmjson"+mmjson);


        JavaType jvt = mapper.getTypeFactory().constructParametricType(HashMap.class,String.class,Integer.class);
        Map<Goods,User> urMap = mapper.readValue(mmjson, jvt);
        System.out.println(urMap);
        System.out.println(urMap.keySet().iterator().next());

        /*String j = mapper.writeValueAsString(goods);

        System.out.println("Json--"+json);
        User user = new User();

        String js = mapper.writeValueAsString(user);
        System.out.println(js);
        //json转对象
        User uuser = mapper.readValue(js, User.class);
        System.out.println(uuser);
        Goods g = mapper.readValue(json, Goods.class);
        System.out.println(g);*/

    }
}
