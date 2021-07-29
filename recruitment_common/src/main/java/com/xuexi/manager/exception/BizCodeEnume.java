package com.xuexi.manager.exception;
/*
* 规定各个模块报错的不同的状态码：
* 10：通用
*    000：系统未知异常
*    001：参数格式校验异常
* 11：商品
* 12：订单
* 13：购物车
* 14：物流
* */
public enum BizCodeEnume {
    UNKNOW_EXCEPTION(10000,"系统未知异常"),
    VALUE_EXCEPTION(10001,"参数格式校验异常"),
    ;
    private int code;
    private String msg;

    BizCodeEnume(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
