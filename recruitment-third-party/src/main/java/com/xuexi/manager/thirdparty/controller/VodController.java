package com.xuexi.manager.thirdparty.controller;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthRequest;
import com.aliyuncs.vod.model.v20170321.GetVideoPlayAuthResponse;

import com.xuexi.manager.thirdparty.service.vodService;
import com.xuexi.manager.thirdparty.utils.CommonVod;
import com.xuexi.manager.thirdparty.utils.InitObject;
import com.xuexi.manager.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController
@RequestMapping("/eduvod/video")
public class VodController {
    @Autowired
    private vodService service;

    @PostMapping("uploadAliVideo")
    public R uploadAliVideo(MultipartFile file){
        //上传文件时的注意事项：
        //1.使用swagger测试时，要修改设置tomcat的默认上传大小
        //2.现在使用nginx进行资源跳转时，nginx也有上传文件的大小限制,因为我们选中文件后，点击确认时，
        // 此时文件是在nginx的请求域，nginx也有上传文件的大小限制，进行跨域请求时，nginx的请求域中内容过大，请求域无法跳转传递成功
        //   conf中http{}加入 client_max_body_size 1024m;

        String videoId=service.uploadVideo(file);//返回视频的id值
        return R.ok().put("videoId",videoId);
    }

    @DeleteMapping("removeAliVideo/{id}")
    public R removeAliVideo(@PathVariable("id") String id){

        //1.根据视频Id删除视频
        //步骤：
        //1.创建初始化对象
        try {
            DefaultAcsClient defaultAcsClient = InitObject.initVodClient(CommonVod.KEY_ID, CommonVod.KEY_SECRET);

            //2.创建删除视频地址request和response
            DeleteVideoRequest request = new DeleteVideoRequest();

            request.setVideoIds(id);

            defaultAcsClient.getAcsResponse(request);
            return R.ok();
        } catch (ClientException e) {
            e.printStackTrace();
            return R.error(e.getMessage());
        }


    }
    //删除多个阿里云视频的方法
    @DeleteMapping("deleteBatch")
    public R deleteBatch(@RequestParam("videoList")List videoList){
        service.removeMoreVideo(videoList);
        return R.ok();
    }
    //根据视频id获取视频凭证
    @GetMapping("getPlayAuth/{id}")
    public String getPlayAuth(@PathVariable String id){
        try {
            //创建初始化对象
            DefaultAcsClient client = InitObject.initVodClient(CommonVod.KEY_ID, CommonVod.KEY_SECRET);
            //创建获取凭证request和response对象
            GetVideoPlayAuthRequest request = new GetVideoPlayAuthRequest();
            //向request设置视频id
            request.setVideoId(id);
            //调用方法得到凭证
            GetVideoPlayAuthResponse response = client.getAcsResponse(request);
            System.out.println(response.getVideoMeta().getCoverURL());
            String playAuth = response.getPlayAuth();
            System.out.println(playAuth);
//            return R.ok().put("playAuth",playAuth);
            return playAuth;
        } catch (ClientException e) {
            e.printStackTrace();
            return e.getMessage();
        }
    }

}
