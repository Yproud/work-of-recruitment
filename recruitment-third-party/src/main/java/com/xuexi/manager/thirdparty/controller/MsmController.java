package com.xuexi.manager.thirdparty.controller;


import com.xuexi.manager.thirdparty.service.MemService;
import com.xuexi.manager.utils.R;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/edumsm/msm")
public class MsmController {

    @Autowired
    private MemService memService;

    //发送方式：
    //1.从redis中查询有无验证码，如果有，则从redis中取数据
    @GetMapping("/send/{phone}")
    public R sendMsm(@PathVariable String phone){

        HashMap<String, Object> hashMap = new HashMap<>();
        hashMap.put("code",phone);
        //调用发送的方法，注意：阿里云短信服务仅仅只是传递短信，短信自己生成
        boolean isSend=memService.send(hashMap,phone);
        if (isSend) {
            return R.ok();
        }else {
            return R.error();
        }
    }
}
