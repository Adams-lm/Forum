package com.hznu.forum.api.service;

import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.faq.*;
import com.hznu.forum.api.response.faq.FaqHotsResponse;
import com.hznu.forum.api.response.faq.FaqInfoResponse;
import com.hznu.forum.api.response.faq.FaqUserPageResponse;

import java.util.List;

/**
 * @author LIN
 * @create 2021/11/1
 * @desc
 **/
public interface FaqApiService {

    ResultModel<Long> saveFaq(FaqSaveFaqRequest request);

    ResultModel<PageResponseModel<FaqUserPageResponse>> adminPage(PageRequestModel<FaqAdminPageRequest> pageRequestModel);

    ResultModel<PageResponseModel<FaqUserPageResponse>> userPage(PageRequestModel<FaqUserPageRequest> pageRequestModel);

    ResultModel<PageResponseModel<FaqUserPageResponse>> authorPage(PageRequestModel<FaqAuthorPageRequest> pageRequestModel);

    ResultModel<FaqInfoResponse> info(Long id);

    ResultModel<List<FaqHotsResponse>> hots(int size);

    ResultModel solution(FaqSolutionRequest request);
}
