package com.xuexi.manager.thirdparty.feign;

import com.xuexi.manager.to.ParticularsEntityTo;
import com.xuexi.manager.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient("employee")
public interface EmployeeFeign {
    @RequestMapping("employee/employee/update/addName")
    public R updateAddName();
}
