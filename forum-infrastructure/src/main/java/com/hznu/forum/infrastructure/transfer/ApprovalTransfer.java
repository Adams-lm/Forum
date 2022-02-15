package com.hznu.forum.infrastructure.transfer;

import com.hznu.forum.common.enums.FollowedTypeEn;
import com.hznu.forum.domain.entity.Approval;
import com.hznu.forum.infrastructure.dal.dataobject.UserFollowDO;

/**
 * @author LIN
 * @create 2021/12/1
 * @desc
 **/
public class ApprovalTransfer {

    public static UserFollowDO toUserFollowDO(Approval approval) {
        return UserFollowDO.builder()
                .followedType(FollowedTypeEn.POSTS.getValue())
                .followed(approval.getPostsId())
                .follower(approval.getUserId())
                .build();
    }

    public static Approval toApproval(UserFollowDO userFollowDO) {
        Approval approval = Approval.builder()
                .userId(userFollowDO.getFollower())
                .postsId(userFollowDO.getFollowed())
                .build();
        approval.setCreateAt(userFollowDO.getCreateAt());
        approval.setId(userFollowDO.getId());
        approval.setUpdateAt(userFollowDO.getUpdateAt());

        return approval;
    }
}
