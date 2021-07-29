package com.xuexi.manager.thirdparty.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface vodService {


     void removeMoreVideo(List videoList);


    String uploadVideo(MultipartFile file);
}
