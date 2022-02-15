package com.hznu.forum.facade.impl;

import org.springframework.stereotype.Service;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.service.ApprovalApiService;
import com.hznu.forum.app.manager.ApprovalManager;
import com.hznu.forum.facade.support.ResultModelUtil;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/1
 * @desc
 **/
@Service
public class ApprovalApiServiceImpl implements ApprovalApiService {

    @Resource
    private ApprovalManager approvalManager;

    @Override
    public ResultModel<Long> create(Long postsId) {
        return ResultModelUtil.success(approvalManager.create(postsId));
    }

    @Override
    public ResultModel<Long> delete(Long postsId) {
        return ResultModelUtil.success(approvalManager.delete(postsId));
    }

    @Override
    public ResultModel<Boolean> hasApproval(Long postsId) {
        return ResultModelUtil.success(approvalManager.hasApproval(postsId));
    }

}
