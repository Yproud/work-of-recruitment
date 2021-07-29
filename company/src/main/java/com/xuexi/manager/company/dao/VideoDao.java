package com.xuexi.manager.company.dao;

import com.xuexi.manager.company.entity.VideoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-03-01 13:35:44
 */
@Mapper
public interface VideoDao extends BaseMapper<VideoEntity> {

    void deleteDelById(String id);
}
