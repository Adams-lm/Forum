package com.hznu.forum.facade.validator;

import com.hznu.forum.api.request.tag.TagCreateRequest;
import com.hznu.forum.common.support.CheckUtil;

/**
 * @author LIN
 * @create 21/7/30
 * @desc
 **/
public class TagValidator {

    public static void create(TagCreateRequest request) {
        CheckUtil.checkParamToast(request, "request");
        CheckUtil.checkParamToast(request.getName(), "name");
        CheckUtil.checkParamToast(request.getGroupName(), "groupName");
        CheckUtil.checkParamToast(request.getDescription(), "description");
    }

}
