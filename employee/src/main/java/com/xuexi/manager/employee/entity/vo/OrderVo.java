package com.xuexi.manager.employee.entity.vo;

import lombok.Data;

import java.math.BigDecimal;
@Data
public class OrderVo {
    private String orderNo;
    private String nickname;
    private BigDecimal totalFee;
}
