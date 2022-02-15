package com.hznu.forum.portal.controller.admin;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.AdminBooleanRequest;
import com.hznu.forum.api.request.config.ConfigAddRequest;
import com.hznu.forum.api.request.config.ConfigPageRequest;
import com.hznu.forum.api.request.config.ConfigUpdateRequest;
import com.hznu.forum.api.response.config.ConfigResponse;
import com.hznu.forum.api.service.ConfigApiService;
import com.hznu.forum.common.constant.Constant;
import com.hznu.forum.portal.support.WebUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author LIN
 * @create 2021/12/26
 * @desc
 **/
@RestController
@RequestMapping("/admin-rest/config")
public class AdminRestConfigController {

    @Resource
    private ConfigApiService configApiService;

    @PostMapping("/add")
    public ResultModel add(@RequestBody ConfigAddRequest addRequest, HttpServletRequest request) {
        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));

        return configApiService.add(addRequest);
    }

    @PostMapping("/update")
    public ResultModel update(@RequestBody ConfigUpdateRequest updateRequest, HttpServletRequest request) {
        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));

        return configApiService.update(updateRequest);
    }

    @PostMapping("/state")
    public ResultModel state(@RequestBody AdminBooleanRequest booleanRequest, HttpServletRequest request) {
        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));

        return configApiService.state(booleanRequest);
    }

    @PostMapping("/page")
    public ResultModel<PageResponseModel<ConfigResponse>> page(@RequestBody PageRequestModel<ConfigPageRequest> pageRequestModel, HttpServletRequest request) {
        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));

        return configApiService.page(pageRequestModel);
    }

}
