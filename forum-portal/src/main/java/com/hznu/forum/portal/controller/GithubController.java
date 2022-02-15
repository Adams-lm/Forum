package com.hznu.forum.portal.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.github.GithubOauthLoginRequest;
import com.hznu.forum.api.service.GithubApiService;
import com.hznu.forum.common.constant.Constant;
import com.hznu.forum.common.support.LogUtil;
import com.hznu.forum.portal.support.WebUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author LIN
 * @create 2021/5/15
 * @desc
 **/
@Slf4j
@Controller
@RequestMapping("/github")
public class GithubController {

    @Resource
    private GithubApiService githubApiService;

    @GetMapping("/oauth-callback")
    public String index(GithubOauthLoginRequest request, HttpServletRequest servletRequest, HttpServletResponse response) {
        LogUtil.info(log, "github OauthRequest = {}", request);
        request.setIp(WebUtil.requestIp(servletRequest));
        request.setUa(WebUtil.requestUa(servletRequest));

        ResultModel<String> resultModel = githubApiService.oauthLogin(request);
        if (!resultModel.getSuccess()) {
            return "redirect:/?toast=" + resultModel.getMessage();
        }

        WebUtil.cookieAddSid(response, resultModel.getData());
        return "redirect:/?" + Constant.REQUEST_QUERY_TOKEN_KEY + "=" + resultModel.getData();
    }
}
