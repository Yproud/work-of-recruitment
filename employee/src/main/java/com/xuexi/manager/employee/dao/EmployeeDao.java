package com.xuexi.manager.employee.dao;

import com.xuexi.manager.employee.entity.EmployeeEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.xuexi.manager.employee.entity.vo.EmlpoyeeEntityVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * 员工表
 * 
 * @author xiejie
 * @email sunlightcs@gmail.com
 * @date 2021-02-02 16:29:26
 */
@Mapper
public interface EmployeeDao extends BaseMapper<EmployeeEntity> {

    void updateCpId(@Param("cpId") Integer cpId);

    void updateNoEpId(@Param("epId") Integer epId);

    Integer selectNumCount(@Param("cpId") Integer cpId,@Param("nowTime") Date nowTime);

    void select(@Param("education") Integer education,@Param("minMoney") Integer minMoney, @Param("maxMoney") Integer maxMoney);

    void selectNotEdu(@Param("minMoney")Integer minMoney, @Param("maxMoney")Integer maxMoney);

    void saveImages(@Param("epId") Integer epId,@Param("image") String image);

    List<String> selectImagersById(@Param("id") Integer id);

    void deleteImages(@Param("epId") Integer epId);


    void setStatusThree();

    void updateStatus(@Param("epTel") String epTel);

    EmlpoyeeEntityVo selectByName(String username);

    void updateFee(@Param("value") double value,@Param("mobile") String mobile);

    EmlpoyeeEntityVo selectByTel(String mobile);


    void updateByPhone(@Param("salary") Double epSalary,@Param("phone") String phone);

    void updateByName(String user);

    void updateByAddName(@Param("salary")Double epSalary,@Param("upload") Integer upload,@Param("name") String user);

    void saveImagesWX(@Param("epId") Integer epId, @Param("image") String image);

    void updateByAddNameWX(@Param("salary")Double epSalary,@Param("upload") Integer epUpload, @Param("name") String user, @Param("len") int i);
}
