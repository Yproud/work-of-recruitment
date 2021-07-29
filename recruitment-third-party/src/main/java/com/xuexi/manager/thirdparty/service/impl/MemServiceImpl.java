package com.xuexi.manager.thirdparty.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

import com.xuexi.manager.thirdparty.service.MemService;
import com.xuexi.manager.thirdparty.utils.CommonVod;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.HashMap;

@Service
public class MemServiceImpl implements MemService {

    @Override
    public boolean send(HashMap<String, Object> hashMap, String phone) {
        if (StringUtils.isEmpty(phone)) return false;
        DefaultProfile profile = DefaultProfile.getProfile("default", CommonVod.KEY_ID, CommonVod.KEY_SECRET);
        DefaultAcsClient client = new DefaultAcsClient(profile);

        //设置参数
        CommonRequest commonRequest = new CommonRequest();
        commonRequest.setMethod(MethodType.POST);
        commonRequest.setDomain("dysmsapi.aliyuncs.com");
        commonRequest.setVersion("2017-05-25");
        commonRequest.setAction("SendSms");

        commonRequest.putQueryParameter("PhoneNumbers",phone);//手机号
        commonRequest.putQueryParameter("SignName","电器之家在线销售网站");//签名名称
        commonRequest.putQueryParameter("TemplateCode","SMS_206737283");//模板code
        commonRequest.putQueryParameter("TemplateParam", JSONObject.toJSONString(hashMap));
        //最终发送
        try {
            CommonResponse response = client.getCommonResponse(commonRequest);
            boolean success = response.getHttpResponse().isSuccess();
            return success;
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return false;
    }
}
