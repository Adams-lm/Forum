package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.enums.MessageChannelEn;
import com.hznu.forum.common.enums.MessageTypeEn;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.Message;
import com.hznu.forum.domain.entity.User;
import com.hznu.forum.domain.service.MessageService;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/4
 * @desc
 **/
@Component
public class NotifyAdminUserRegisterListener extends EventBus.EventHandler<User> {

    @Resource
    private MessageService messageService;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.USER_REGISTER;
    }

    @Override
    public void onMessage(User user) {

        // 发送消息通知
        messageService.send(Message.builder()
                .channel(MessageChannelEn.MAIL)
                .type(MessageTypeEn.USER_REGISTER_NOTIFY_ADMIN)
//                .sender(IdValue.builder()
//                        .id()
//                        .name()
//                        .type(IdValueTypeEn.MAIL)
//                        .build())
//                .receiver(IdValue.builder()
//                        .id()
//                        .name()
//                        .type(IdValueTypeEn.MAIL)
//                        .build())
                .title("")
                .content("")
                .build());
    }
}
