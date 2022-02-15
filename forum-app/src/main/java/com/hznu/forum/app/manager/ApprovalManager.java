package com.hznu.forum.app.manager;

import org.springframework.stereotype.Component;
import com.hznu.forum.app.support.IsLogin;
import com.hznu.forum.app.support.LoginUserContext;
import com.hznu.forum.app.support.Pair;
import com.hznu.forum.common.enums.ErrorCodeEn;
import com.hznu.forum.common.support.CheckUtil;
import com.hznu.forum.common.support.EventBus;
import com.hznu.forum.domain.entity.Approval;
import com.hznu.forum.domain.entity.BasePosts;
import com.hznu.forum.domain.repository.ApprovalRepository;
import com.hznu.forum.domain.repository.PostsRepository;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/12/1
 * @desc
 **/
@Component
public class ApprovalManager {

    @Resource
    private ApprovalRepository approvalRepository;

    @Resource
    private PostsRepository postsRepository;

    @IsLogin
    public Long create(Long postsId) {
        Approval approval = approvalRepository.get(postsId, LoginUserContext.getUser().getId());
        CheckUtil.isNotEmpty(approval, ErrorCodeEn.REPEAT_OPERATION);

        BasePosts basePosts = postsRepository.get(postsId);
        CheckUtil.isEmpty(basePosts, ErrorCodeEn.POSTS_NOT_EXIST);

        approvalRepository.save(Approval.builder()
                .postsId(postsId)
                .userId(LoginUserContext.getUser().getId())
                .build());
        postsRepository.increaseApproval(postsId, basePosts.getUpdateAt());

        EventBus.emit(EventBus.Topic.APPROVAL_CREATE, Pair.build(LoginUserContext.getUser().getId(), postsId));

        return basePosts.getApprovals() + 1;
    }

    @IsLogin
    public Long delete(Long postsId) {
        Approval approval = approvalRepository.get(postsId, LoginUserContext.getUser().getId());
        CheckUtil.isEmpty(approval, ErrorCodeEn.OPERATION_DATA_NOT_EXIST);

        BasePosts basePosts = postsRepository.get(postsId);
        CheckUtil.isEmpty(basePosts, ErrorCodeEn.POSTS_NOT_EXIST);

        approvalRepository.delete(approval.getId());
        postsRepository.decreaseApproval(postsId, basePosts.getUpdateAt());

        return basePosts.getApprovals() - 1;
    }

    @IsLogin
    public Boolean hasApproval(Long postsId) {
        Approval approval = approvalRepository.get(postsId, LoginUserContext.getUser().getId());

        return approval != null;
    }

}
