package com.xuexi.manager.company.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.company.entity.VideoEntity;

import java.util.Map;

/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-03-01 13:35:44
 */
public interface VideoService extends IService<VideoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void saveOrUpdateVideo(VideoEntity video);

    void removeDelById(String id);
}

