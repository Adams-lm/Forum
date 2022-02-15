package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.BasePosts;
import com.hznu.forum.domain.service.SearchService;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/3
 * @desc
 **/
@Component
public class SearchPostsDeleteListener extends EventBus.EventHandler<BasePosts> {

    @Resource
    private SearchService searchService;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.POSTS_DELETE;
    }

    @Override
    public void onMessage(BasePosts basePosts) {
        searchService.deleteByPostsId(basePosts.getId());
    }
}
