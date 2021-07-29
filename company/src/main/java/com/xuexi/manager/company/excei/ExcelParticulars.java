package com.xuexi.manager.company.excei;

import com.alibaba.excel.annotation.ExcelProperty;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;

import java.util.Date;

@Data
public class ExcelParticulars {
    /**
     * 主键id
     */
//    @TableId
//    private Integer id;
    /**
     * 重大事件
     */
    @ExcelProperty(index = 0)
    private String particualrs;
    /**
     * 创建时间
     */
    @ExcelProperty(index = 1)
    private Date createTime;
    /**
     * 更新时间
     */
    @ExcelProperty(index = 2)
    private Date modifyTime;
    /**
     * 逻辑删除
     */
    @ExcelProperty(index = 3)
    @TableLogic
    private Integer isDeleted;
    /**
     * 电话号码
     */
    @ExcelProperty(index = 4)
    private String telephone;
}
