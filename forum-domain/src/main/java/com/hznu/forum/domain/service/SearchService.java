package com.hznu.forum.domain.service;

import com.hznu.forum.common.model.PageRequest;
import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Posts;
import com.hznu.forum.domain.entity.Search;

/**
 * @author LIN
 * @create 2021/12/2
 * @desc
 **/
public interface SearchService {

    void deleteByPostsId(Long postsId);

    void save(Search search);

    PageResult<Posts> pagePosts(PageRequest<String> pageRequest);

}
