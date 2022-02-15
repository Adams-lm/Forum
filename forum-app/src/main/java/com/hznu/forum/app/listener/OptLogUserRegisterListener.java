package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.OptLog;
import com.hznu.forum.domain.entity.User;
import com.hznu.forum.domain.repository.OptLogRepository;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/10/22
 * @desc
 **/
@Component
public class OptLogUserRegisterListener extends EventBus.EventHandler<User> {

    @Resource
    private OptLogRepository optLogRepository;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.USER_REGISTER;
    }

    @Override
    public void onMessage(User user) {

        // 保存操作记录
        optLogRepository.save(OptLog.createUserRegisterRecordLog(user.getId(), user));
    }
}
