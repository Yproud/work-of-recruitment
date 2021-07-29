package com.xuexi.manager.company.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.xuexi.manager.to.ParticularsEntityTo;
import com.xuexi.manager.to.SelStaffTo;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.company.entity.ParticularsEntity;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-23 11:33:04
 */
public interface ParticularsService extends IService<ParticularsEntity> {

    PageUtils queryPage(Map<String, Object> params);

    List<ParticularsEntity> getParticularInfoById(String id);

    void saveSubject(ParticularsService particularsService, MultipartFile file);

    PageUtils queryPage1(Map<String, Object> params);



    void update1ById(Integer id);

    void saveExcel(ParticularsEntityTo particularsEntity);

    List<ParticularsEntity> getParticularInfoByIdTo(SelStaffTo selStaffTo);
}

