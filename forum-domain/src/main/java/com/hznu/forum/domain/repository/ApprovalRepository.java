package com.hznu.forum.domain.repository;

import com.hznu.forum.domain.entity.Approval;

/**
 * @author LIN
 * @create 2021/12/1
 * @desc
 **/
public interface ApprovalRepository {

    void save(Approval approval);

    void delete(Long approvalId);

    Approval get(Long postsId, Long userId);

}
