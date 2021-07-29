package com.xuexi.manager.company.handle;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component//加入aop中，进行管理
public class MyMetaObjectHandler implements MetaObjectHandler {
    //(metaObject是)元数据：mybatis_plus库中user表id字段中的1、2、3等数据
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName("createTime",new Date(),metaObject);//
        this.setFieldValByName("modifyTime",new Date(),metaObject);
    }
    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("modifyTime",new Date(),metaObject);
    }
}
