package com.hznu.forum.app.manager;

import org.springframework.stereotype.Component;
import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.api.model.PageResponseModel;
import com.hznu.forum.api.vo.PostsVO;
import com.hznu.forum.app.support.IsLogin;
import com.hznu.forum.app.support.LoginUserContext;
import com.hznu.forum.app.support.PageUtil;
import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Posts;
import com.hznu.forum.domain.repository.UserFoodRepository;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/11/25
 * @desc
 **/
@Component
public class PostsManager extends AbstractPostsManager {

    @Resource
    private UserFoodRepository userFoodRepository;

    @IsLogin
    public PageResponseModel<PostsVO> pagePostsFood(PageRequestModel pageRequestModel) {
        PageResult<Posts> pageResult = userFoodRepository.pagePosts(PageUtil.buildPageRequest(pageRequestModel, LoginUserContext.getUser().getId()));

        return pagePostsVO(pageResult);
    }
}
