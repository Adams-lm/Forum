package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.app.support.Pair;
import com.hznu.forum.common.enums.SearchTypeEn;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.Faq;
import com.hznu.forum.domain.entity.Search;
import com.hznu.forum.domain.service.SearchService;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/2
 * @desc
 **/
@Component
public class SearchFaqUpdateListener extends EventBus.EventHandler<Pair<Faq>> {

    @Resource
    private SearchService searchService;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.FAQ_UPDATE;
    }

    @Override
    public void onMessage(Pair<Faq> pair) {
        Faq newFaq = pair.getValue1();

        searchService.deleteByPostsId(newFaq.getId());

        searchService.save(Search.builder()
                .content(newFaq.getMarkdownContent())
                .entityId(newFaq.getId())
                .title(newFaq.getTitle())
                .type(SearchTypeEn.POSTS)
                .build());
    }
}
