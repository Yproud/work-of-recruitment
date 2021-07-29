package com.xuexi.manager.company.handle;


import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.xuexi.manager.company.entity.ParticularsEntity;
import com.xuexi.manager.company.excei.ExcelParticulars;
import com.xuexi.manager.company.service.ParticularsService;
import com.xuexi.manager.exception.GuliException;
import com.xuexi.manager.to.ParticularsEntityTo;
import org.springframework.beans.BeanUtils;

public class SubjectExcelListener extends AnalysisEventListener<ExcelParticulars> {
  //  在web Server容器中，无论是Servlet，Filter，还是Listener都不是Spring容器管理的，
  //  因此我们都无法在这些类中直接使用Spring注解的方式来注入我们需要的对象。
    //因为SubjectExcelListener不能交给spring管理，需要自己new,不能注入其他对象
    //不能实现数据库操作
    private ParticularsService particularsService;
    public SubjectExcelListener(){}
    public SubjectExcelListener(ParticularsService particularsService){
        this.particularsService=particularsService;
    }
    //一行一行读取,每次读取两个值，一级分类 、二级分类
    @Override
    public void invoke(ExcelParticulars excelParticulars, AnalysisContext analysisContext) {
        if (excelParticulars == null) {
            throw new GuliException(20001, "文件不能为空");
        }
        ParticularsEntityTo particularsEntity = new ParticularsEntityTo();
        BeanUtils.copyProperties(excelParticulars,particularsEntity);

        particularsService.saveExcel(particularsEntity);
    }
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }
}
