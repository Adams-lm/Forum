package com.hznu.forum.facade.impl;

import org.springframework.stereotype.Service;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.github.GithubOauthLoginRequest;
import com.hznu.forum.api.service.GithubApiService;
import com.hznu.forum.app.manager.GithubManager;
import com.hznu.forum.common.support.CheckUtil;
import com.hznu.forum.facade.support.ResultModelUtil;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/5/15
 * @desc
 **/
@Service
public class GithubApiServiceImpl implements GithubApiService {

    @Resource
    private GithubManager githubManager;

    @Override
    public ResultModel<String> oauthLogin(GithubOauthLoginRequest request) {
        CheckUtil.checkParamToast(request, "request");
        CheckUtil.checkParamToast(request.getCode(), "code");

        return ResultModelUtil.success(githubManager.oauthLogin(request));
    }
}
