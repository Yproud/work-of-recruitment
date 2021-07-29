package com.xuexi.manager.employee.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.util.Date;
@Data
public class UploadImages {
    @TableId
    private Integer id;
    private String images;
    private Integer epId;
    @TableField(fill = FieldFill.INSERT)
    private Date createTime;
    private Integer epStatus;
}
