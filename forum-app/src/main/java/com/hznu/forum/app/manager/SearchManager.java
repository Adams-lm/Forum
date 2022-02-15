package com.hznu.forum.app.manager;

import org.springframework.stereotype.Component;
import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.vo.PostsVO;
import com.hznu.forum.app.support.PageUtil;
import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Posts;
import com.hznu.forum.domain.service.SearchService;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/2
 * @desc
 **/
@Component
public class SearchManager extends AbstractPostsManager {

    @Resource
    private SearchService searchService;

    public PageResponseModel<PostsVO> pagePostsSearch(PageRequestModel<String> pageRequestModel) {
        PageResult<Posts> pageResult = searchService.pagePosts(PageUtil.buildPageRequest(pageRequestModel, pageRequestModel.getFilter()));

        return pagePostsVO(pageResult);
    }
}
