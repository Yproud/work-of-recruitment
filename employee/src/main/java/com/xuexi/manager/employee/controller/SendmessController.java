package com.xuexi.manager.employee.controller;

import java.util.Arrays;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.xuexi.manager.employee.entity.SendmessEntity;
import com.xuexi.manager.employee.service.SendmessService;
import com.xuexi.manager.utils.PageUtils;
import com.xuexi.manager.utils.R;



/**
 * 
 *
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-04-12 19:43:03
 */
@RestController
@RequestMapping("employee/sendmess")
public class SendmessController {
    @Autowired
    private SendmessService sendmessService;



    /**
     * 列表/list12
     */
    @RequestMapping("/list12")
    public R list12(@RequestParam Map<String, Object> params){
        PageUtils page = sendmessService.queryPage12(params);

        return R.ok().put("page", page);
    }
    /**
     * 列表/list12   listById
     */
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = sendmessService.queryPage(params);

        return R.ok().put("page", page);
    }

    /**
     * 列表/list12   listById
     */
    @RequestMapping("/listById")
    public R listById(@RequestParam Map<String, Object> params){
        PageUtils page = sendmessService.queryPageById(params);

        return R.ok().put("page", page);
    }
    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Integer id){
		SendmessEntity sendmess = sendmessService.getById(id);

        return R.ok().put("sendmess", sendmess);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody SendmessEntity sendmess){
		sendmessService.save(sendmess);

        return R.ok();
    }

    /**
     * 修改/update/${id}  /updateByHandle1/${id}
     */
    @RequestMapping("/updateByHandle2/{id}")
    public R updateByHandle2(@PathVariable("id") Integer id){
        sendmessService.updateByHandle2(id);

        return R.ok();
    }
    /**
     * 修改/update/${id}  /updateByHandle1/${id}
     */
    @RequestMapping("/updateByHandle1/{id}")
    public R updateByHandle1(@PathVariable("id") Integer id){
        sendmessService.updateByHandle1(id);

        return R.ok();
    }

    /**
     * 修改/update/${id}  /updateByHandle1/${id}
     */
    @RequestMapping("/update/{id}")
    public R updateSendById(@PathVariable("id") Integer id){
        sendmessService.updateSendById(id);

        return R.ok();
    }
    /**
     * 修改/update/${id}
     */
    @RequestMapping("/update")
    public R update(@RequestBody SendmessEntity sendmess){
		sendmessService.updateById(sendmess);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Integer[] ids){
		sendmessService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
