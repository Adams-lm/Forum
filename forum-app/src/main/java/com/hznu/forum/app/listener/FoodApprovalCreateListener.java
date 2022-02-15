package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.app.support.Pair;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.UserFood;
import com.hznu.forum.domain.repository.UserFoodRepository;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;

/**
 * @author LIN
 * @create 2021/12/3
 * @desc
 **/
@Component
public class FoodApprovalCreateListener extends EventBus.EventHandler<Pair<Long>> {

    @Resource
    private UserFoodRepository userFoodRepository;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.APPROVAL_CREATE;
    }

    @Override
    public void onMessage(Pair<Long> pair) {
        Long userId = pair.getValue0();
        Long postsId = pair.getValue1();

        List<UserFood> userFoods = Arrays.asList(UserFood.builder()
                .postsId(postsId)
                .userId(userId)
                .build());

        userFoodRepository.batchSave(userFoods);
    }
}
