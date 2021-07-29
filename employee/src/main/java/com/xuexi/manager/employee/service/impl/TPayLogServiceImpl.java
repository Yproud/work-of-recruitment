package com.xuexi.manager.employee.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.wxpay.sdk.WXPayUtil;
import com.xuexi.manager.employee.entity.TOrderEntity;
import com.xuexi.manager.employee.service.EmployeeService;
import com.xuexi.manager.employee.service.TOrderService;
import com.xuexi.manager.employee.utils.HttpClient;
import com.xuexi.manager.exception.GuliException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.employee.dao.TPayLogDao;
import com.xuexi.manager.employee.entity.TPayLogEntity;
import com.xuexi.manager.employee.service.TPayLogService;


@Service("tPayLogService")
public class TPayLogServiceImpl extends ServiceImpl<TPayLogDao, TPayLogEntity> implements TPayLogService {

    @Autowired
    private TOrderService tOrderService;
    @Autowired
    EmployeeService employeeService;
    @Override
    public Map createNative(String orderNo) {
        try {
            //1.根据订单号查询订单信息
            QueryWrapper<TOrderEntity> wrapper = new QueryWrapper<>();
            wrapper.eq("order_no",orderNo);
            TOrderEntity order = tOrderService.getOne(wrapper);
            //2.使用map设置生成二维码需要的参数
            HashMap m = new HashMap();
            m.put("appid","wx74862e0dfcf69954");
            // m.put("appid", ConstantWxUtils.WX_PAY_APPID);
            m.put("mch_id", "1558950191");
            //   m.put("mch_id", ConstantWxUtils.WX_PAY_PARTNER);
            m.put("nonce_str", WXPayUtil.generateNonceStr());
            m.put("body", order.getNickname()); //支付用户名称
            m.put("out_trade_no", orderNo); //订单号
            m.put("total_fee", order.getTotalFee().multiply(new BigDecimal("100")).longValue()+"");//价格
            m.put("spbill_create_ip", "127.0.0.1");//项目的域名
            m.put("notify_url", "http://guli.shop/api/order/weixinPay/weixinNotify\n");
            // m.put("notify_url", ConstantWxUtils.WX_PAY_NOTIFYURL);
            m.put("trade_type", "NATIVE");
            //3.发送httpClient请求，传递参数xml格式，微信支付提供的固定的地址
            HttpClient client = new HttpClient("https://api.mch.weixin.qq.com/pay/unifiedorder");
            client.setXmlParam(WXPayUtil.generateSignedXml(m,"T6m9iK73b0kn9g5v426MKfHQH7X8rKwb"));
            client.setHttps(true);//设置支持https:
            client.post();//执行请求发送
            //4.得到发送请求返回结果
            //返回的内容，是使用xml格式返回
            String xml = client.getContent();
            //把xml格式转换成map集合,里面包含二维码地址，但我们还需要其他信息，
            Map<String, String> map1 = WXPayUtil.xmlToMap(xml);
            //但我们还需要其他信息，
            Map map=new HashMap();
            map.put("out_trade_no", orderNo);
//            map.put("course_id", order.getCourseId());
            map.put("total_fee", order.getTotalFee());
            map.put("result_code", map1.get("result_code"));  //返回二维码操作状态码
            map.put("code_url", map1.get("code_url"));        //二维码地址

                System.out.println("结果是："+map1);
            return map;
        } catch (Exception e) {
            e.printStackTrace();
            throw new GuliException();
        }
    }

    //查询支付状态
    @Override
    public Map<String, String> queryPayStatus(String orderNo) {
        try {
            //1、封装参数
            Map m = new HashMap<>();
            //  m.put("appid", ConstantWxUtils.WX_PAY_APPID);
            m.put("appid", "wx74862e0dfcf69954");
            m.put("mch_id", "1558950191");
            //   m.put("mch_id", ConstantWxUtils.WX_PAY_PARTNER);
            m.put("out_trade_no", orderNo);
            m.put("nonce_str", WXPayUtil.generateNonceStr());

            //2 发送httpclient，另一个固定地址
            HttpClient client = new HttpClient("https://api.mch.weixin.qq.com/pay/orderquery");
            //  client.setXmlParam(WXPayUtil.generateSignedXml(m,ConstantWxUtils.WX_PAY_PARTNERKEY));
            client.setXmlParam(WXPayUtil.generateSignedXml(m,"T6m9iK73b0kn9g5v426MKfHQH7X8rKwb"));
            client.setHttps(true);
            client.post();

            //3 得到请求返回内容
            String xml = client.getContent();
            Map<String, String> resultMap = WXPayUtil.xmlToMap(xml);
            //6、转成Map再返回
            //  System.out.println(resultMap);
            return resultMap;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //添加记录,map中存在订单id
    @Override
    public void updateOrderStatus(Map<String, String> map) {

        //获取订单id，查询订单信息
        String orderNo = map.get("out_trade_no");
        QueryWrapper<TOrderEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no",orderNo);
        TOrderEntity order = tOrderService.getOne(wrapper);
        //更新状态，1:已支付
        if(order.getStatus().intValue()==1){
            return;
        }
        order.setStatus(1);//已支付
        tOrderService.updateById(order);
        //添加金额到employee表中
        employeeService.addFee(order.getTotalFee(),order.getMobile());
        //向支付表添加支付记录
        TPayLogEntity payLog = new TPayLogEntity();
        payLog.setOrderNo(orderNo);//设置订单
        payLog.setPayTime(new Date()); //订单完成时间
        payLog.setPayType(1);//支付类型 1微信
        payLog.setTotalFee(order.getTotalFee());//总金额(分)

        payLog.setTradeState(map.get("trade_state"));//支付状态
        payLog.setTransactionId(map.get("transaction_id")); //流水号
//        payLog.setAttr(JSONObject.toJSONString(map));//以json方式存入其他数据
        baseMapper.insert(payLog);

    }
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TPayLogEntity> page = this.page(
                new Query<TPayLogEntity>().getPage(params),
                new QueryWrapper<TPayLogEntity>()
        );

        return new PageUtils(page);
    }

}