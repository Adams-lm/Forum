package com.hznu.forum.app.listener;

import org.springframework.stereotype.Component;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.Article;
import com.hznu.forum.domain.entity.Tag;
import com.hznu.forum.domain.repository.ArticleTypeRepository;
import com.hznu.forum.domain.repository.TagRepository;

import javax.annotation.Resource;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author LIN
 * @create 2021/11/4
 * @desc
 **/
@Component
public class ArticleCreateListener extends EventBus.EventHandler<Article> {

    @Resource
    private TagRepository tagRepository;

    @Resource
    private ArticleTypeRepository articleTypeRepository;

    @Override
    public EventBus.Topic topic() {
        return EventBus.Topic.ARTICLE_CREATE;
    }

    @Override
    public void onMessage(Article article) {
        Set<Long> tagIds = article.getTags().stream().map(Tag::getId).collect(Collectors.toSet());
        tagRepository.increaseRefCount(tagIds);

        articleTypeRepository.increaseRefCount(article.getType().getId());
    }
}
