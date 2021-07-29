package com.xuexi.manager.employee.entity.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Data;

import java.util.Date;
@Data
public class StaffEntityVo {
    /**
     * 主键id
     */

    private Integer epId;
    /**
     * 姓名
     */
    private String epName;
    /**
     * 性别(1：男，）
     */
    private Integer epSex;
    /**
     * 年龄
     */
    private Integer epAge;
    /**
     * 电话号码
     */
    private String epTel;
    /**
     * 邮箱
     */
    private String epEmail;
    /**
     * 学历（2.本科  1：高中，3：研究生）
     */
    private Integer epEducation;
    /**
     * 申诉原因
     */
    private String epIntroduction;
    /**
     * 处理状态（1.已提交 2.审核中，3审核完成  ）
     */
    private Integer epEmpoyeeStatus;
    /**
     * 员工头像
     */
    private String epPortrait;
    /**
     * 创建时间
     */

    private Date createTime;
    /**
     * 更新时间
     */

    private Date modifyTime;
    /**
     * 其他（证明材料，证书等）
     */
    private String epOther;
    /**
     * 逻辑删除 1（true）已删除， 0（false）未删除
     */

    private Integer epIsDeleted;
    /**
     * 排序
     */
    private Integer epSort;
    private String epMessage;
    private String[] images;
}
