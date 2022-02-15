package com.hznu.forum.domain.service;

import com.alibaba.fastjson.JSONObject;

/**
 * @author LIN
 * @create 2021/5/15
 * @desc
 **/
public interface GithubService {

    JSONObject getUserInfo(String code);

}
