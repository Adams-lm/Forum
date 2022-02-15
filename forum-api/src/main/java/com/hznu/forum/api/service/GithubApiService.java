package com.hznu.forum.api.service;

import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.github.GithubOauthLoginRequest;

/**
 * @author LIN
 * @create 2021/5/15
 * @desc
 **/
public interface GithubApiService {

    ResultModel<String> oauthLogin(GithubOauthLoginRequest request);

}
