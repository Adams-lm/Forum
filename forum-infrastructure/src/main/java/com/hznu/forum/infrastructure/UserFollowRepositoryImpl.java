package com.hznu.forum.infrastructure;

import org.springframework.stereotype.Repository;
import com.hznu.forum.common.enums.FollowedTypeEn;
import com.hznu.forum.domain.repository.UserFollowRepository;
import com.hznu.forum.infrastructure.dal.dao.UserFollowDAO;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author LIN
 * @create 2021/12/3
 * @desc
 **/
@Repository
public class UserFollowRepositoryImpl implements UserFollowRepository {

    @Resource
    private UserFollowDAO userFollowDAO;

    @Override
    public List<Long> getAllFollowerIds(Long follower, FollowedTypeEn type) {
        return userFollowDAO.getAllFollowerIds(follower, type.getValue());
    }
}
