package com.hznu.forum.api.service;

import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.comment.CommentCreateRequest;
import com.hznu.forum.api.response.comment.CommentPageResponse;

/**
 * @author LIN
 * @create 2021/11/6
 * @desc
 **/
public interface CommentApiService {

    ResultModel create(CommentCreateRequest request);

    ResultModel<PageResponseModel<CommentPageResponse>> page(PageRequestModel<Long> pageRequest);

}
