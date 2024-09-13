package com.wheelchair.wym.controller;

import com.wheelchair.wym.entity.Chair;
import com.wheelchair.wym.entity.Wheelchair;
import com.wheelchair.wym.service.IChairService;
import com.wheelchair.wym.service.IWheelchairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Controller
public class AddWheelchairController {

    private final String dirPath = "D:/file/";
    // 简介图片地址
    private String simplePath = "";
    // 详细图片地址
    private final StringBuilder detailsPath = new StringBuilder();

    @Autowired
    private IWheelchairService service;

    @Autowired
    private IChairService chairService;

    @RequestMapping("/MultipleUpload")
    @ResponseBody
    public Map<String, Object> upload(@RequestParam("file") List<MultipartFile> file, HttpServletRequest req) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (!file.isEmpty() && file.size() > 0) {
            for (MultipartFile f : file) {
                try {
                    // 文件名
                    String filename = UUID.randomUUID() + f.getOriginalFilename().substring(f.getOriginalFilename().lastIndexOf("."));
                    // 存储虚拟路径
                    String localPath = "http://localhost:8090/images/" + filename;
                    System.out.println(localPath);
                    detailsPath.append(localPath + "~");

                    File filePath = new File(dirPath);
                    if (!filePath.exists()) {
                        filePath.mkdirs();
                    }
                    // 上传
                    f.transferTo(new File(dirPath + filename));

                } catch (Exception e) {
                    map.put("code", 1);
                    map.put("msg", "上传失败");
                    e.printStackTrace();
                }
            }
            map.put("code", 0);
            map.put("msg", "上传成功");
        }
        return map;
    }

    @RequestMapping("/singleUpload")
    @ResponseBody
    public Map<String, Object> singleUpload(@RequestParam("file") MultipartFile file, HttpServletRequest req, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            String suffixName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            String filename = UUID.randomUUID() + suffixName;
            File filePath = new File(dirPath);
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            // 创建虚拟路径存储
            simplePath = "http://localhost:8090/images/" + filename;
            map.put("image", simplePath);
            file.transferTo(new File(dirPath + filename));
            map.put("code", 0);
            map.put("msg", "上传成功");
        } catch (Exception e) {
            map.put("code", 1);
            map.put("msg", "上传失败");
            e.printStackTrace();
        }
        return map;
    }

    @RequestMapping("/addWheelchair")
    public String addWheelchair() {
        return "addwheelchair";
    }

    @RequestMapping("/addWheelchairRecord")
    @ResponseBody
    public String addWheelchair(Wheelchair wheelchair) {
        if (wheelchair.getPublisher() == null || "".equals(wheelchair.getPublisher())) {
            wheelchair.setPublisher("管理员");
        }
        wheelchair.setWheelchairImage(simplePath);
        wheelchair.setWheelchairDetailsImg(detailsPath.toString());
        int n = service.addNewWheelchair(wheelchair);
        if (n > 0) {
            detailsPath.delete(0, detailsPath.length());

            // 获取插入后的品类hID (如果是自增主键)
            int hID = wheelchair.gethID(); // 这里需要确保hID被正确设置或通过方法返回
            if (hID == 0) {
                hID = service.getLastInsertedHID();  // 假设service中有这样的方法来获取最新插入的hID
            }

            // 自动生成对应数量的轮椅单品记录到t_chair表中
            for (int i = 0; i < wheelchair.getWheelchairType(); i++) {
                Chair chair = new Chair();
                chair.sethID(hID);
                chair.setStatus(0); // 0为空闲
                chair.setLastMaintenanceDate(null);
                chair.setChairNo(wheelchair.getWheelchairFloor() + '-' + (i + 1));
                chairService.addNewChair(chair);
            }

            return "OK";
        }
        return "FAIL";
    }
}
