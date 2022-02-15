package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.enums.SearchTypeEn;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.Article;
import com.hznu.forum.domain.entity.Search;
import com.hznu.forum.domain.service.SearchService;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/2
 * @desc
 **/
@Component
public class SearchArticleCreateListener extends EventBus.EventHandler<Article> {

    @Resource
    private SearchService searchService;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.ARTICLE_CREATE;
    }

    @Override
    public void onMessage(Article article) {
        searchService.deleteByPostsId(article.getId());

        searchService.save(Search.builder()
                .content(article.getMarkdownContent())
                .entityId(article.getId())
                .title(article.getTitle())
                .type(SearchTypeEn.POSTS)
                .build());
    }
}
