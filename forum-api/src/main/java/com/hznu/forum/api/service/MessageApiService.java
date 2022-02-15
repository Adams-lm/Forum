package com.hznu.forum.api.service;

import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.message.MessagePageRequest;
import com.hznu.forum.api.response.message.MessagePageResponse;

/**
 * @author LIN
 * @create 21/7/30
 * @desc
 **/
public interface MessageApiService {

    ResultModel<PageResponseModel<MessagePageResponse>> page(PageRequestModel<MessagePageRequest> request);

    ResultModel markIsRead(Long messageId);

    ResultModel<Long> countUnRead();

}
