package com.hznu.forum.portal.controller.rest;

import org.springframework.web.bind.annotation.*;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.faq.FaqSaveFaqRequest;
import com.hznu.forum.api.request.faq.FaqSolutionRequest;
import com.hznu.forum.api.response.faq.FaqInfoResponse;
import com.hznu.forum.api.service.FaqApiService;
import com.hznu.forum.common.constant.Constant;
import com.hznu.forum.portal.support.WebUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author LIN
 * @create 2021/11/1
 * @desc
 **/
@RestController
@RequestMapping("/faq-rest")
public class FaqRestController {

    @Resource
    private FaqApiService faqApiService;

    @PostMapping("/save")
    public ResultModel<Long> save(@RequestBody FaqSaveFaqRequest faqRequest, HttpServletRequest request) {
        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));

        return faqApiService.saveFaq(faqRequest);
    }

    @PostMapping("/{id}")
    public ResultModel<FaqInfoResponse> get(@PathVariable("id") Long id, HttpServletRequest request) {
        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));
        return faqApiService.info(id);
    }

    @PostMapping("/solution")
    public ResultModel solution(@RequestBody FaqSolutionRequest solutionRequest, HttpServletRequest request) {
        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));

        return faqApiService.solution(solutionRequest);
    }
}
