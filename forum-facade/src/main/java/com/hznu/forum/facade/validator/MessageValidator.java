package com.hznu.forum.facade.validator;

import com.hznu.forum.api.request.message.MessagePageRequest;
import com.hznu.forum.common.enums.MessageTypeEn;
import com.hznu.forum.common.support.CheckUtil;

/**
 * @author LIN
 * @create 2021/12/5
 * @desc
 **/
public class MessageValidator {

    public static void page(MessagePageRequest request) {
        CheckUtil.checkParamToast(request, "request");
        CheckUtil.checkParamToast(request.getTypeDesc(), "typeDesc");
        CheckUtil.checkParamToast(MessageTypeEn.getEntityByDesc(request.getTypeDesc()), "不存在的消息类型");
    }
}
