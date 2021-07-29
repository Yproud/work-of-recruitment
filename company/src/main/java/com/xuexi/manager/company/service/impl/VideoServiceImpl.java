package com.xuexi.manager.company.service.impl;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.company.dao.VideoDao;
import com.xuexi.manager.company.entity.VideoEntity;
import com.xuexi.manager.company.service.VideoService;


@Service("videoService")
public class VideoServiceImpl extends ServiceImpl<VideoDao, VideoEntity> implements VideoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<VideoEntity> page = this.page(
                new Query<VideoEntity>().getPage(params),
                new QueryWrapper<VideoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void saveOrUpdateVideo(VideoEntity video) {
        QueryWrapper<VideoEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("cp_id",video.getCpId());
        List<VideoEntity> list = baseMapper.selectList(wrapper);
        if(list.isEmpty()||list.size()==0){
            baseMapper.insert(video);
        }else {
            VideoEntity videoEntity = list.get(0);
            videoEntity.setVideoOriginalName(video.getVideoOriginalName());
            videoEntity.setVideoSourceId(video.getVideoSourceId());
            baseMapper.updateById(videoEntity);
        }
    }

    @Override
    public void removeDelById(String id) {
        baseMapper.deleteDelById(id);
    }

}