package com.hznu.forum.app.transfer;

import org.springframework.util.ObjectUtils;
import com.hznu.forum.api.request.user.UserOptLogPageRequest;
import com.hznu.forum.common.enums.OptLogTypeEn;
import com.hznu.forum.domain.entity.OptLog;

/**
 * @author LIN
 * @create 2021/12/9
 * @desc
 **/
public class OptLogTransfer {

    public static OptLog toOptLog(UserOptLogPageRequest request) {
        return OptLog.builder()
                .operatorId(request.getOperatorId())
                .type(ObjectUtils.isEmpty(request.getType()) ? null : OptLogTypeEn.getEntity(request.getType()))
                .build();
    }

}
