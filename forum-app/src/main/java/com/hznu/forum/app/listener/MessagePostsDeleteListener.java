package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.enums.MessageTypeEn;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.BasePosts;
import com.hznu.forum.domain.repository.MessageRepository;

import javax.annotation.Resource;
import java.util.Arrays;

/**
 * @author LIN
 * @create 2021/12/5
 * @desc
 **/
@Component
public class MessagePostsDeleteListener extends EventBus.EventHandler<BasePosts> {

    @Resource
    private MessageRepository messageRepository;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.POSTS_DELETE;
    }

    @Override
    public void onMessage(BasePosts basePosts) {
        messageRepository.deleteInTypesAndTitle(Arrays.asList(MessageTypeEn.APPROVAL_ARTICLE
                , MessageTypeEn.APPROVAL_FAQ
                , MessageTypeEn.COMMENT_ARTICLE
                , MessageTypeEn.COMMENT_FAQ), basePosts.getId().toString());
    }
}
