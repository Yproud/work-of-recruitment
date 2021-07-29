package com.xuexi.manager.employee.entity.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class WeiXiVo {
    private String out_trade_no;
    private String code_url;
    private BigDecimal total_fee;
}
