package com.hznu.forum.domain.repository;

import com.hznu.forum.common.enums.FollowedTypeEn;

import java.util.List;

/**
 * @author LIN
 * @create 2021/12/3
 * @desc
 **/
public interface UserFollowRepository {

    List<Long> getAllFollowerIds(Long follower, FollowedTypeEn type);
}
