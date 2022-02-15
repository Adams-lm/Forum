package com.hznu.forum.domain.repository;

import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Comment;

import java.util.List;
import java.util.Set;

/**
 * @author LIN
 * @create 2021/11/5
 * @desc
 **/
public interface CommentRepository {

    void save(Comment comment);

    Comment get(Long id);

    List<Comment> queryByPostsId(Long postsId);

    List<Comment> queryInReplyIds(Set<Long> replyIds);

    PageResult<Comment> page(Integer pageNo, Integer pageSize, Long postsId);

    void deleteByPostsId(Long postsId);

    List<Comment> queryInIds(Set<Long> ids);
}
