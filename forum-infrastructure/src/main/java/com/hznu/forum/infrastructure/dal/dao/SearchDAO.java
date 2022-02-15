package com.hznu.forum.infrastructure.dal.dao;

import org.apache.ibatis.annotations.Param;
import com.hznu.forum.infrastructure.dal.dataobject.SearchDO;

import java.util.List;

/**
 * @author LIN
 * @create 2021/12/2
 * @desc
 **/
public interface SearchDAO {

    void insert(SearchDO searchDO);

    void delete(@Param("type") String type, @Param("entityId") Long entityId);

    List<SearchDO> query(SearchDO searchDO);
}
