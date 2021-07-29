package com.xuexi.manager.employee.fegin;

import com.xuexi.manager.to.DepartureEntityTo;
import com.xuexi.manager.to.ParticularsEntityTo;
import com.xuexi.manager.to.PerformenceEntityTo;
import com.xuexi.manager.to.SelStaffTo;
import com.xuexi.manager.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@FeignClient("company")
public interface CompanyFeign {


    @RequestMapping("company/particulars/particular/info/{id}")
    public List<ParticularsEntityTo> ParticularInfo(@PathVariable("id") String id);

    @RequestMapping("company/performence/performence/info/{pfId}")
    public List<PerformenceEntityTo> PerformenceInfoById(@PathVariable("pfId") String pfId);

    @RequestMapping("company/departure/remote/info/{dpId}")
    public List<DepartureEntityTo> departureInfo(@PathVariable("dpId") String dpId);
    @RequestMapping("company/particulars/particular/info/to")
    List<ParticularsEntityTo> ParticularInfoTo(SelStaffTo selStaffTo);
    @RequestMapping("company/performence/performence/info/to")
    List<PerformenceEntityTo> PerformenceInfoByIdTo(SelStaffTo selStaffTo);
    @RequestMapping("company/departure/remote/info/to")
    List<DepartureEntityTo> departureInfoTo(SelStaffTo selStaffTo);
}
