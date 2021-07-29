package com.xuexi.manager.employee.entity.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;
import java.util.List;
@Data
public class DataSearchVo {
    List<Integer> nums;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd")
    List<Date> times;

}
