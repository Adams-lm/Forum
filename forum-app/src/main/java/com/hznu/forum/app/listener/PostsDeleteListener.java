package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.enums.PostsCategoryEn;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.BasePosts;
import com.hznu.forum.domain.repository.ArticleTypeRepository;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/11/25
 * @desc
 **/
@Component
public class PostsDeleteListener extends EventBus.EventHandler<BasePosts> {

    @Resource
    private ArticleTypeRepository articleTypeRepository;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.POSTS_DELETE;
    }

    @Override
    public void onMessage(BasePosts basePosts) {
        // 文章类别引用数减
        if (PostsCategoryEn.ARTICLE.equals(basePosts.getCategory())) {
            articleTypeRepository.decreaseRefCount(basePosts.getTypeId());
        }
    }
}
