package com.hznu.forum.infrastructure;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;
import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.common.support.SafesUtil;
import com.hznu.forum.domain.entity.Article;
import com.hznu.forum.domain.entity.ArticleType;
import com.hznu.forum.domain.entity.Tag;
import com.hznu.forum.domain.entity.User;
import com.hznu.forum.domain.entity.value.PostsPageQueryValue;
import com.hznu.forum.domain.repository.ArticleRepository;
import com.hznu.forum.infrastructure.dal.dao.*;
import com.hznu.forum.infrastructure.dal.dataobject.*;
import com.hznu.forum.infrastructure.transfer.ArticleTypeTransfer;
import com.hznu.forum.infrastructure.transfer.PostsTransfer;
import com.hznu.forum.infrastructure.transfer.TagTransfer;
import com.hznu.forum.infrastructure.transfer.UserTransfer;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * @author LIN
 * @create 2021/10/31
 * @desc
 **/
@Repository
public class ArticleRepositoryImpl implements ArticleRepository {

    @Resource
    private PostsDAO postsDAO;

    @Resource
    private ArticleTypeDAO articleTypeDAO;

    @Resource
    private TagPostsMappingDAO tagPostsMappingDAO;

    @Resource
    private TagDAO tagDAO;

    @Resource
    private UserDAO userDAO;

    @Override
    public void save(Article article) {
        PostsDO postsDO = PostsTransfer.toPostsDO(article);
        postsDO.setCreateAt(new Date());

        postsDAO.insert(postsDO);

        tagPostsMappingDAO.batchInsert(SafesUtil.ofSet(article.getTags()).stream().map(tag -> {
            TagPostsMappingDO tagPostsMappingDO = TagPostsMappingDO.builder()
                    .tagId(tag.getId())
                    .postsId(postsDO.getId())
                    .build();
            tagPostsMappingDO.initBase();
            return tagPostsMappingDO;
        }).collect(Collectors.toList()));

        article.setId(postsDO.getId());
    }

    @Override
    public Article get(Long id) {
        PostsDO postsDO = postsDAO.get(id);
        if (ObjectUtils.isEmpty(postsDO)) {
            return null;
        }

        UserDO userDO = userDAO.get(postsDO.getAuthorId());
        if (ObjectUtils.isEmpty(userDO)) {
            return null;
        }
        User user = UserTransfer.toUser(userDO);

        ArticleType articleType = ArticleTypeTransfer.toArticleType(articleTypeDAO.get(postsDO.getTypeId()));

        List<TagPostsMappingDO> tagPostsMappingDOS = tagPostsMappingDAO.query(TagPostsMappingDO.builder()
                .postsId(id)
                .build());
        Set<Long> tagIds = SafesUtil.ofList(tagPostsMappingDOS).stream()
                .map(TagPostsMappingDO::getTagId)
                .collect(Collectors.toSet());
        if (ObjectUtils.isEmpty(tagIds)) {
            return PostsTransfer.toArticle(postsDO, user, articleType, new ArrayList<>());
        }

        List<Tag> tags = TagTransfer.toTags(tagDAO.queryInIds(tagIds));

        return PostsTransfer.toArticle(postsDO, user, articleType, tags);
    }

    @Override
    public void update(Article article) {
        postsDAO.update(PostsTransfer.toPostsDO(article));

        List<TagPostsMappingDO> tagPostsMappingDOS = SafesUtil.ofSet(article.getTags()).stream().map(tag -> {
            TagPostsMappingDO tagPostsMappingDO = TagPostsMappingDO.builder()
                    .postsId(article.getId())
                    .tagId(tag.getId())
                    .build();
            tagPostsMappingDO.initBase();
            return tagPostsMappingDO;
        }).collect(Collectors.toList());
        tagPostsMappingDAO.batchInsert(tagPostsMappingDOS);
    }

    @Override
    public PageResult<Article> page(Integer pageNo, Integer pageSize, PostsPageQueryValue pageQueryValue) {
        PageHelper.startPage(pageNo, pageSize);

        List<PostsDO> postsDOS = postsDAO.queryByValue(pageQueryValue);
        PageInfo<PostsDO> pageInfo = new PageInfo<>(postsDOS);

        if (ObjectUtils.isEmpty(postsDOS)) {
            return PageResult.build(pageInfo.getTotal(), pageInfo.getSize(), new ArrayList<>());
        }

        Set<Long> userIds = SafesUtil.ofList(postsDOS).stream().map(PostsDO::getAuthorId).collect(Collectors.toSet());
        List<User> users = UserTransfer.toUsers(userDAO.queryInIds(userIds));

        Set<Long> postsIds = SafesUtil.ofList(postsDOS).stream().map(PostsDO::getId).collect(Collectors.toSet());
        List<TagPostsMappingDO> tagPostsMappingDOS = tagPostsMappingDAO.queryInPostsIds(postsIds);

        if (ObjectUtils.isEmpty(tagPostsMappingDOS)) {
            List<Article> articles = PostsTransfer.toArticles(postsDOS, users, tagPostsMappingDOS, new ArrayList<>());
            return PageResult.build(pageInfo.getTotal(), pageInfo.getSize(), articles);
        }

        Set<Long> tagIds = SafesUtil.ofList(tagPostsMappingDOS).stream().map(TagPostsMappingDO::getTagId).collect(Collectors.toSet());
        List<Tag> tags = TagTransfer.toTags(tagDAO.queryInIds(tagIds));

        List<Article> articles = PostsTransfer.toArticles(postsDOS, users, tagPostsMappingDOS, tags);

        return PageResult.build(pageInfo.getTotal(), pageInfo.getSize(), articles);
    }

}
