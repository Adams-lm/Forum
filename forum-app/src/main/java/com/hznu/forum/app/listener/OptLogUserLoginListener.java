package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.OptLog;
import com.hznu.forum.domain.repository.OptLogRepository;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/4
 * @desc
 **/
@Component
public class OptLogUserLoginListener extends EventBus.EventHandler<OptLog> {

    @Resource
    private OptLogRepository optLogRepository;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.USER_LOGIN;
    }

    @Override
    public void onMessage(OptLog optLog) {
        optLogRepository.save(optLog);
    }
}
