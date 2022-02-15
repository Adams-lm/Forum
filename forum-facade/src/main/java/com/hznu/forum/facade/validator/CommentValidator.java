package com.hznu.forum.facade.validator;

import com.hznu.forum.api.request.comment.CommentCreateRequest;
import com.hznu.forum.common.support.CheckUtil;

/**
 * @author LIN
 * @create 2021/11/6
 * @desc
 **/
public class CommentValidator {

    public static void create(CommentCreateRequest request) {
        CheckUtil.checkParamToast(request, "request");
        CheckUtil.checkParamToast(request.getPostsId(), "postsId");
        CheckUtil.checkParamToast(request.getContent(), "content");
    }
}
