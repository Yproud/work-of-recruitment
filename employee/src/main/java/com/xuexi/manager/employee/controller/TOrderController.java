package com.xuexi.manager.employee.controller;

import java.util.Arrays;
import java.util.Map;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xuexi.manager.employee.entity.vo.WeiXiVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

import com.xuexi.manager.employee.entity.TOrderEntity;
import com.xuexi.manager.employee.service.TOrderService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;

import javax.servlet.http.HttpServletRequest;


/**
 * 订单
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-05 21:05:55
 */
@RestController
@RequestMapping("employee/torder")
public class TOrderController {
    @Autowired
    private TOrderService tOrderService;
    @Autowired
    RedisTemplate<String,String> redisTemplate;
    //1.第一个接口 生成订单接口。
    // 此时，需要课程信息， 远程调用service-edu接口方法（课程id查询）
    //此时，需要用户信息， 远程调用service-ucenter接口方法（用户id(cokie中)查询）
    //，远程调用时，在调用端需要创建两个接口，去调用其他服务
    @PostMapping("createOrder")
    public R saveOrder(@RequestBody TOrderEntity tOrderEntity){
        //返回订单号，用于订单支付
//        String orderId=tOrderService.createOrder(courseId, JwtUtils.getMemberIdToken(request));//根据cookie获取用户id
         tOrderService.createOrder(tOrderEntity);
        return R.ok();
    }
    //2.第二个接口，根据订单id查询订单信息
    @GetMapping("getOrderInfo/{orderId}")
    public R getOrderInfo(@PathVariable String orderId){
        QueryWrapper<TOrderEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("order_no",orderId);
        TOrderEntity order = tOrderService.getOne(wrapper);
        return R.ok().put("order",order);
    }
    //3.生成微信支付的二维码接口
    //4.查询订单支付状态接口

    //5.根据课程id和用户id查询订单表中订单状态,因为在详情页面显示立即观看或立即购买，
    //所以，需要修改课程详情查询接口，返回是否立即购买，
    @GetMapping("/isBuyCourse/{courseId}/{memberId}")
    public boolean isBuyCourse(@PathVariable String courseId,@PathVariable String memberId){
        QueryWrapper<TOrderEntity> wrapper = new QueryWrapper<>();
      //  wrapper.eq("course_id",courseId);
      //  wrapper.eq("member_id",memberId);
        wrapper.eq("status",1);
        int count = tOrderService.count(wrapper);
        if (count>0){
            return true;
        }else {
            return false;
        }
    }

    /**
     * 列表
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = tOrderService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/order")
    public R infoOrder(){
        String user = redisTemplate.opsForValue().get("user");
        WeiXiVo tOrder = tOrderService.getByPhone(user);

        return R.ok().put("tOrder", tOrder);
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		TOrderEntity tOrder = tOrderService.getById(id);

        return R.ok().put("tOrder", tOrder);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody TOrderEntity tOrder){
		tOrderService.save(tOrder);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    public R update(@RequestBody TOrderEntity tOrder){
		tOrderService.updateById(tOrder);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody String[] ids){
		tOrderService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
