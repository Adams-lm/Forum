package com.hznu.forum.portal.controller;

import com.google.common.collect.Sets;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.response.config.ConfigResponse;
import com.hznu.forum.api.response.user.UserPageResponse;
import com.hznu.forum.api.service.ConfigApiService;
import com.hznu.forum.api.service.PostsApiService;
import com.hznu.forum.api.service.UserApiService;
import com.hznu.forum.api.vo.PostsVO;
import com.hznu.forum.common.constant.Constant;
import com.hznu.forum.common.enums.ConfigTypeEn;
import com.hznu.forum.common.support.SafesUtil;
import com.hznu.forum.portal.request.BasePageRequest;
import com.hznu.forum.common.support.GlobalViewConfig;
import com.hznu.forum.portal.support.ViewException;
import com.hznu.forum.portal.support.WebConst;
import com.hznu.forum.portal.support.WebUtil;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author LIN
 * @create 2021/12/3
 * @desc
 **/
@Controller
@RequestMapping("/interest")
public class InterestController {

    @Resource
    private PostsApiService postsApiService;

    @Resource
    private WebUtil webUtil;

    @Resource
    private UserApiService userApiService;

    @Resource
    private GlobalViewConfig globalViewConfig;

    @Resource
    private ConfigApiService configApiService;

    @GetMapping
    public String index(BasePageRequest pageRequest, Model model, HttpServletRequest request) {
        if (ObjectUtils.isEmpty(WebUtil.cookieGetSid(request))) {
            throw ViewException.build("用户未登录");
        }

        request.setAttribute(Constant.REQUEST_HEADER_TOKEN_KEY, WebUtil.cookieGetSid(request));

        model.addAttribute("currentDomain", WebConst.DOMAIN_INTEREST);
        ResultModel<PageResponseModel<PostsVO>> pageResponseModelResultModel = postsList(pageRequest);
        if (!pageResponseModelResultModel.getSuccess()) {
            throw ViewException.build(pageResponseModelResultModel.getMessage());
        }

        if (!ObjectUtils.isEmpty(pageResponseModelResultModel.getData())) {
            PageResponseModel<PostsVO> pageResponseModel = pageResponseModelResultModel.getData();

            model.addAttribute("postsList", webUtil.buildPostsList(pageResponseModel.getList()));
            model.addAttribute("pager", pager(pageRequest, pageResponseModel));
        } else {
            model.addAttribute("postsList", webUtil.buildArticles(new ArrayList<>()));

            PageResponseModel pageResponseModel = new PageResponseModel();
            pageResponseModel.setTotal(0L);
            model.addAttribute("pager", pager(pageRequest, pageResponseModel));
        }
        model.addAttribute("activeUsers", activeUsers());
        model.addAttribute("usedTags", webUtil.usedTags());

        ResultModel<List<ConfigResponse>> configResult = configApiService.queryAvailable(Sets.newHashSet(ConfigTypeEn.SIDEBAR_CAROUSEL.getValue()));
        if (configResult.getSuccess() && !ObjectUtils.isEmpty(configResult.getData())) {
            model.addAttribute("sideCarouselList", webUtil.carouselList(configResult.getData(), ConfigTypeEn.SIDEBAR_CAROUSEL));
        } else {
            model.addAttribute("sideCarouselList", new ArrayList<>());
        }

        return "interest";
    }

    private List<Map<String, Object>> activeUsers() {
        List<Map<String, Object>> userList = new ArrayList<>();

        PageRequestModel pageRequestModel = new PageRequestModel<>();
        pageRequestModel.setPageNo(1);
        pageRequestModel.setPageSize(12);
        ResultModel<PageResponseModel<UserPageResponse>> resultModel = userApiService.pageActive(pageRequestModel);
        if (!resultModel.getSuccess()) {
            return userList;
        }

        PageResponseModel<UserPageResponse> pageResponsePageResponseModel = resultModel.getData();
        SafesUtil.ofList(pageResponsePageResponseModel.getList()).forEach(userPageResponse -> {
            Map<String, Object> user = new HashMap<>();
            user.put("id", userPageResponse.getId());
            user.put("name", userPageResponse.getNickname());
            user.put("headImg", userPageResponse.getAvatar());
            userList.add(user);
        });

        return userList;
    }

    private ResultModel<PageResponseModel<PostsVO>> postsList(BasePageRequest pageRequest) {
        PageRequestModel pageRequestModel = new PageRequestModel();
        pageRequestModel.setPageSize(globalViewConfig.getPageSize());
        pageRequestModel.setPageNo(pageRequest.getPageNo());

        return postsApiService.pagePostsFood(pageRequestModel);
    }

    private Map<String, Object> pager(BasePageRequest pageRequest, PageResponseModel pageResponseModel) {
        String queryPath = "?" + WebConst.PAGE_NO_NAME + "=";
        return webUtil.buildPager(pageRequest.getPageNo(), queryPath, pageResponseModel);
    }

}
