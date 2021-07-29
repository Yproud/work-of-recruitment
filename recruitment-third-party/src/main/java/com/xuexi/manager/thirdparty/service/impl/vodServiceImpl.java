package com.xuexi.manager.thirdparty.service.impl;

import com.aliyun.vod.upload.impl.UploadVideoImpl;
import com.aliyun.vod.upload.req.UploadStreamRequest;
import com.aliyun.vod.upload.resp.UploadStreamResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.vod.model.v20170321.DeleteVideoRequest;

import com.xuexi.manager.thirdparty.service.vodService;
import com.xuexi.manager.thirdparty.utils.CommonVod;
import com.xuexi.manager.thirdparty.utils.InitObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@Service
public class vodServiceImpl implements vodService {

    @Override
    public void removeMoreVideo(List videoList) {
        //1.根据视频Id删除视频
        //步骤：
        //1.创建初始化对象
        try {
            DefaultAcsClient defaultAcsClient = InitObject.initVodClient(CommonVod.KEY_ID, CommonVod.KEY_SECRET);

            //2.创建删除视频地址request和response
            DeleteVideoRequest request = new DeleteVideoRequest();

            //将videoList值转换成1，2，3格式
            String join = StringUtils.join(videoList.toArray(), ",");
            request.setVideoIds(join);

            defaultAcsClient.getAcsResponse(request);
        } catch (ClientException e) {
            e.printStackTrace();
        }


    }

    @Override
    public String uploadVideo(MultipartFile file) {
        try {

            String fileName=file.getOriginalFilename();
//            fileName.lastIndexOf(".")作用：得到filename的最后一次出现的字符'.'的下标
            String title=fileName.substring(0,fileName.lastIndexOf("."));
            InputStream inputStream=file.getInputStream();
            //title:阿里云中显示的名称（一般与filename一样)
            //fileName:文件上传的原始名称
            //inputStream:文件上传的输入流
            UploadStreamRequest request = new UploadStreamRequest(CommonVod.KEY_ID, CommonVod.KEY_SECRET,
                    title, fileName, inputStream);
            UploadVideoImpl uploader = new UploadVideoImpl();
            UploadStreamResponse response = uploader.uploadStream(request);
            System.out.print("RequestId=" + response.getRequestId() + "\n");  //请求视频点播服务的请求ID
            String videoId="";
            if (response.isSuccess()) {
                videoId=response.getVideoId();
            } else { //如果设置回调URL无效，不影响视频上传，可以返回VideoId同时会返回错误码。其他情况上传失败时，VideoId为空，此时需要根据返回错误码分析具体错误原因
                videoId=response.getVideoId();
            }
            return videoId;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
}
