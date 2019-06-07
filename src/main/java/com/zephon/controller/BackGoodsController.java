package com.zephon.controller;

import com.zephon.pojo.Goods;
import com.zephon.service.BackGoodsService;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.UUID;

/**
 * @author Zephon
 * @version V1.0
 * @Package com.zephon.controller
 * @date 19-6-7 下午12:03
 * @Copyright ©
 */
@Controller
public class BackGoodsController {
    @Resource
    private BackGoodsService backGoodsServiceImpl;
    private Logger logger = Logger.getLogger(BackUserController.class);

    @RequestMapping("backTables")
    public String backTables(HttpServletRequest request) {
        request.setAttribute("goodsList", backGoodsServiceImpl.getAllGoods());
        return "backstage/tables";
    }

    @RequestMapping("backDelete")
    public String backDelete(int id, HttpServletRequest request) {
        logger.debug("删除了id="+id+"的商品");
        int index = backGoodsServiceImpl.deleteByID(id);
        if (index > 0) {
            request.setAttribute("deleteStatus", "ok");
        }
        return "redirect:backTables";
    }

    @RequestMapping("backModify")
    public String backModify(int id, HttpServletRequest request) {
        request.setAttribute("goods", backGoodsServiceImpl.getGoodsByID(id));
        return "backstage/modify";
    }

    @RequestMapping("backModifyConfirm")
    public String backModifyConfirm(Goods goods, MultipartFile file, HttpServletRequest request) {
        System.out.println("modify");
        logger.debug("修改了id="+goods.getId()+"的商品");
        if (file == null) {
            goods.setPicture(backGoodsServiceImpl.getGoodsByID(goods.getId()).getPicture());
        } else {
            String fileName = UUID.randomUUID().toString() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String path = request.getServletContext().getRealPath("images") + "/" + fileName;
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
            } catch (IOException e) {
                e.printStackTrace();
            }
            goods.setPicture(fileName);
        }
        int index = backGoodsServiceImpl.modify(goods);
        if (index > 0) {
            request.setAttribute("modifyStatus", "ok");
        }
        return "redirect:backTables";

    }

    @RequestMapping("backAddGoods")
    public String backAddGoods() {
        return "backstage/addGoods";
    }

    @RequestMapping("backAddGoodsConfirm")
    public String backAddGoodsConfirm(Goods goods, MultipartFile file, HttpServletRequest request) {
        System.out.println("addGoods");
        logger.debug("添加了id="+goods.getId()+"的商品");
        String fileName = UUID.randomUUID().toString() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String path = request.getServletContext().getRealPath("images") + "/" + fileName;
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        goods.setPicture(fileName);
        goods.setSales(0);
        int index = backGoodsServiceImpl.addGoods(goods);
        if (index > 0) {
            request.setAttribute("addGoodsStatus", "ok");
        }
        return "redirect:backTables";

    }

    @RequestMapping("backMain")
    public String backMain(HttpServletRequest request) {
        request.setAttribute("goodsList", backGoodsServiceImpl.getAllGoods());
        return "backstage/main";
    }
    @RequestMapping("backLogShow")
    public String backLogShow(HttpServletRequest request){
        try {
            ClassLoader classLoader = Thread.currentThread()
                    .getContextClassLoader();
            if (classLoader == null) {
                classLoader = ClassLoader.getSystemClassLoader();
            }
            java.net.URL url = classLoader.getResource("");
            String ROOT_CLASS_PATH = url.getPath() + "/";
            File rootFile = new File(ROOT_CLASS_PATH);
            String WEB_INFO_DIRECTORY_PATH = rootFile.getParent() + "/";
            File webInfoDir = new File(WEB_INFO_DIRECTORY_PATH);
            String SERVLET_CONTEXT_PATH = webInfoDir.getParent() + "/";

            //这里 SERVLET_CONTEXT_PATH 就是WebRoot的路径

            String path = SERVLET_CONTEXT_PATH + "/logs/store.log";
            path = path.replaceAll("%20", " ");
            File file = new File(path);
            StringBuilder sb = new StringBuilder();
            if(file.isFile() && file.exists()) {
                InputStreamReader isr = new InputStreamReader(new FileInputStream(file), "utf-8");
                BufferedReader br = new BufferedReader(isr);
                String lineTxt = null;
                while ((lineTxt = br.readLine()) != null) {
                    System.out.println(lineTxt);
                    sb.append(lineTxt+"<br>");
                }
                request.setAttribute("log",sb);
                br.close();
            } else {
                System.out.println("文件不存在!");
            }
        } catch (Exception e) {
            System.out.println("文件读取错误!");
        }
        return "backstage/logShow";
    }

}

