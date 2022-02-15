package com.hznu.forum.api.service;

import com.hznu.forum.api.model.ResultModel;

/**
 * @author LIN
 * @create 2021/12/1
 * @desc
 **/
public interface ApprovalApiService {

    ResultModel<Long> create(Long postsId);

    ResultModel<Long> delete(Long postsId);

    ResultModel<Boolean> hasApproval(Long postsId);

}
