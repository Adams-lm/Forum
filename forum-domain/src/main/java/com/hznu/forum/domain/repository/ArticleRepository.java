package com.hznu.forum.domain.repository;

import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Article;
import com.hznu.forum.domain.entity.value.PostsPageQueryValue;

/**
 * @author LIN
 * @create 2021/10/31
 * @desc
 **/
public interface ArticleRepository {

    void save(Article article);

    Article get(Long id);

    void update(Article article);

    PageResult<Article> page(Integer pageNo, Integer pageSize, PostsPageQueryValue pageQueryValue);
}
