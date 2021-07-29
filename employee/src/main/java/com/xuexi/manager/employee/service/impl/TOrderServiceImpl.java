package com.xuexi.manager.employee.service.impl;

import com.xuexi.manager.employee.entity.vo.OrderVo;
import com.xuexi.manager.employee.entity.vo.WeiXiVo;
import com.xuexi.manager.employee.utils.OrderNoUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.Query;

import com.xuexi.manager.employee.dao.TOrderDao;
import com.xuexi.manager.employee.entity.TOrderEntity;
import com.xuexi.manager.employee.service.TOrderService;


@Service("tOrderService")
public class TOrderServiceImpl extends ServiceImpl<TOrderDao, TOrderEntity> implements TOrderService {



    @Override
    public void createOrder(TOrderEntity tOrderEntity) {

        //创建order订单，向order中设置数据
        TOrderEntity order = new TOrderEntity();
        order.setOrderNo(OrderNoUtil.getOrderNo());//订单号
        order.setNickname(tOrderEntity.getNickname());
        order.setMobile(tOrderEntity.getMobile());
        order.setTotalFee(tOrderEntity.getTotalFee());
//        order.setCourseId(courseId); //课程id
//        order.setCourseTitle(courseInfoOrder.getTitle());
//        order.setCourseCover(courseInfoOrder.getCover());
//        order.setTeacherName(courseInfoOrder.getTeacherName());
//        order.setTotalFee(courseInfoOrder.getPrice());
//       // order.setMemberId(memberIdToken);
//        order.setMobile(memberOrderVo.getMobile());
//        order.setNickname(memberOrderVo.getNickname());
        order.setStatus(0);  //订单状态（0：未支付 1：已支付）
        order.setPayType(1);  //支付类型 ，微信1
        baseMapper.insert(order);
    }

    @Override
    public OrderVo selectByName(String username) {
        TOrderEntity tOrderEntity = baseMapper.selectByName(username);
        OrderVo orderVo = new OrderVo();
        orderVo.setNickname(tOrderEntity.getNickname());
        orderVo.setOrderNo(tOrderEntity.getOrderNo());
        orderVo.setTotalFee(tOrderEntity.getTotalFee());
        return orderVo;

    }

    @Override
    public WeiXiVo getByPhone(String phone) {
        TOrderEntity tOrderEntity=baseMapper.selectPhone(phone);
        WeiXiVo weiXiVo = new WeiXiVo();
        weiXiVo.setOut_trade_no(tOrderEntity.getOrderNo());
        weiXiVo.setTotal_fee(tOrderEntity.getTotalFee());
        return weiXiVo;
    }


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<TOrderEntity> page = this.page(
                new Query<TOrderEntity>().getPage(params),
                new QueryWrapper<TOrderEntity>()
        );

        return new PageUtils(page);
    }


}