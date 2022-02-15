package com.hznu.forum.infrastructure.dal.dao;

import com.hznu.forum.infrastructure.dal.dataobject.OptLogDO;

import java.util.List;

/**
 * @author LIN
 * @create 2021/12/4
 * @desc
 **/
public interface OptLogDAO {

    void insert(OptLogDO optLogDO);

    List<OptLogDO> query(OptLogDO optLogDO);
}
