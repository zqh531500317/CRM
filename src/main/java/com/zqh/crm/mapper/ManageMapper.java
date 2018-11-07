package com.zqh.crm.mapper;

import com.zqh.crm.pojo.Manage;

public interface ManageMapper {
    /**
     * 通过姓名查询
     * @param manageName
     * @return
     */
    Manage getManageByName(String manageName);
}
