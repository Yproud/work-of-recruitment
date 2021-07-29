package com.xuexi.manager.employee.controller;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

import com.xuexi.manager.employee.entity.vo.WeiXiVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.xuexi.manager.employee.entity.TPayLogEntity;
import com.xuexi.manager.employee.service.TPayLogService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 支付日志表
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-05 21:05:55
 */
@RestController
@RequestMapping("employee/tpaylog")
public class TPayLogController {
    @Autowired
    private TPayLogService tPayLogService;


    //3.生成微信支付的二维码接口,参数是订单号
    @RequestMapping("createNative/{orderNo}")
    public R createNative(@PathVariable String orderNo){
        //返回信息中，包含许多需要的信息，（包括需要返回的二维码信息）
        Map map=tPayLogService.createNative(orderNo);
        System.out.println("二维码"+map);
        WeiXiVo weiXiVo = new WeiXiVo();
        weiXiVo.setOut_trade_no((String) map.get("out_trade_no"));
        weiXiVo.setCode_url((String)map.get("code_url"));
        weiXiVo.setTotal_fee((BigDecimal)map.get("total_fee"));
        return R.ok().put("weixi",weiXiVo);
    }

    //4.查询订单支付状态接口,参数是订单号
    @GetMapping("queryPayStatus/{orderNo}")
    public R queryPayStatus(@PathVariable String orderNo){
        Map<String,String> map=tPayLogService.queryPayStatus(orderNo);
        System.out.println("支付状态"+map);
        if (map==null){
            return R.error();
        }

        while (!map.get("trade_state").equals("SUCCESS")){
            //添加记录到支付表，更新订单表的订单支付状态

        }
      //  if (map.get("trade_state").equals("SUCCESS")){
            //添加记录到支付表，更新订单表的订单支付状态
            tPayLogService.updateOrderStatus(map);
            return R.ok().put("mess",1);
      //  }
       // return R.ok();//在支付中，也就是二维码加载了，但还没有扫描支付状态
    }
    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = tPayLogService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") String id){
		TPayLogEntity tPayLog = tPayLogService.getById(id);

        return R.ok().put("tPayLog", tPayLog);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody TPayLogEntity tPayLog){
		tPayLogService.save(tPayLog);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody TPayLogEntity tPayLog){
		tPayLogService.updateById(tPayLog);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] ids){
		tPayLogService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
