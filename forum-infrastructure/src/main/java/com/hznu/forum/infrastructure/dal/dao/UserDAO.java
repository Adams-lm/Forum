package com.hznu.forum.infrastructure.dal.dao;

import org.apache.ibatis.annotations.Param;
import com.hznu.forum.infrastructure.dal.dataobject.UserDO;

import java.util.List;
import java.util.Set;

/**
 * @author LIN
 * @create 2021/10/29
 * @desc
 **/
public interface UserDAO {

    void insert(UserDO userDO);

    UserDO get(@Param("id") Long id);

    UserDO getByEmail(@Param("email") String email);

    void update(UserDO userDO);

    List<UserDO> queryInIds(@Param("ids") Set<Long> ids);

    List<UserDO> queryOrderLastLoginTime();

    List<UserDO> query(UserDO userDO);
}
