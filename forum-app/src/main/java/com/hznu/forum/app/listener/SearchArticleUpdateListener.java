package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.app.support.Pair;
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
public class SearchArticleUpdateListener  extends EventBus.EventHandler<Pair<Article>> {

    @Resource
    private SearchService searchService;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.ARTICLE_UPDATE;
    }

    @Override
    public void onMessage(Pair<Article> pair) {
        Article newArticle = pair.getValue1();

        searchService.deleteByPostsId(newArticle.getId());

        searchService.save(Search.builder()
                .content(newArticle.getMarkdownContent())
                .entityId(newArticle.getId())
                .title(newArticle.getTitle())
                .type(SearchTypeEn.POSTS)
                .build());
    }
}
