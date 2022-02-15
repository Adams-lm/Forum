package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.BasePosts;
import com.hznu.forum.domain.repository.UserFoodRepository;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/4
 * @desc
 **/
@Component
public class FoodPostsDeleteListener extends EventBus.EventHandler<BasePosts> {

    @Resource
    private UserFoodRepository userFoodRepository;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.POSTS_DELETE;
    }

    @Override
    public void onMessage(BasePosts basePosts) {
        userFoodRepository.deleteByPostsId(basePosts.getId());
    }
}
