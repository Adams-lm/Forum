package com.hznu.forum.facade.impl;

import org.springframework.stereotype.Service;
import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.comment.CommentCreateRequest;
import com.hznu.forum.api.response.comment.CommentPageResponse;
import com.hznu.forum.api.service.CommentApiService;
import com.hznu.forum.app.manager.CommentManager;
import com.hznu.forum.facade.support.ResultModelUtil;
import com.hznu.forum.facade.validator.CommentValidator;
import com.hznu.forum.facade.validator.PageRequestModelValidator;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/11/6
 * @desc
 **/
@Service
public class CommentApiServiceImpl implements CommentApiService {

    @Resource
    private CommentManager commentManager;

    @Override
    public ResultModel create(CommentCreateRequest request) {
        CommentValidator.create(request);

        commentManager.create(request);

        return ResultModelUtil.success();
    }

    @Override
    public ResultModel<PageResponseModel<CommentPageResponse>> page(PageRequestModel<Long> pageRequest) {
        PageRequestModelValidator.validator(pageRequest);

        return ResultModelUtil.success(commentManager.page(pageRequest));
    }
}
