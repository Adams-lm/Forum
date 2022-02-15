package com.hznu.forum.api.service;

import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.AdminBooleanRequest;
import com.hznu.forum.api.request.tag.TagCreateRequest;
import com.hznu.forum.api.request.tag.TagPageRequest;
import com.hznu.forum.api.response.tag.TagPageResponse;
import com.hznu.forum.api.response.tag.TagQueryResponse;
import com.hznu.forum.api.vo.PostsVO;

import java.util.List;
import java.util.Set;

/**
 * @author LIN
 * @create 21/7/30
 * @desc
 **/
public interface TagApiService {

    ResultModel<List<TagQueryResponse>> queryAllRef();

    ResultModel create(TagCreateRequest request);

    ResultModel<TagQueryResponse> getByName(String name);

    ResultModel<List<TagQueryResponse>> queryAll();

    ResultModel<List<TagQueryResponse>> queryInIds(Set<Long> ids);

    ResultModel<PageResponseModel<PostsVO>> pagePosts(PageRequestModel<Long> pageRequestModel);

    ResultModel<PageResponseModel<PostsVO>> pagePostsByTagIds(PageRequestModel<Set<Long>> pageRequestModel);

    ResultModel<PageResponseModel<TagPageResponse>> page(PageRequestModel<TagPageRequest> pageRequestModel);

    ResultModel auditState(AdminBooleanRequest booleanRequest);
}
