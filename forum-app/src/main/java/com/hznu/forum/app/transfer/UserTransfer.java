package com.hznu.forum.app.transfer;

import com.alibaba.fastjson.JSONObject;
import org.springframework.util.ObjectUtils;
import com.hznu.forum.api.request.user.UserAdminPageRequest;
import com.hznu.forum.api.request.user.UserRegisterRequest;
import com.hznu.forum.api.request.user.UserUpdateInfoRequest;
import com.hznu.forum.api.response.user.UserInfoResponse;
import com.hznu.forum.api.response.user.UserOptLogPageResponse;
import com.hznu.forum.api.response.user.UserPageResponse;
import com.hznu.forum.common.enums.UserRoleEn;
import com.hznu.forum.common.enums.UserSexEn;
import com.hznu.forum.common.enums.UserSourceEn;
import com.hznu.forum.common.enums.UserStateEn;
import com.hznu.forum.common.support.DateUtil;
import com.hznu.forum.common.support.SafesUtil;
import com.hznu.forum.common.support.StringUtil;
import com.hznu.forum.domain.entity.OptLog;
import com.hznu.forum.domain.entity.User;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author LIN
 * @create 2021/9/8
 * @desc
 **/
public class UserTransfer {

    public static List<UserOptLogPageResponse> toUserOptLogPageResponses(List<OptLog> optLogs, List<User> userList) {
        return SafesUtil.ofList(optLogs).stream().map(optLog -> {
            UserOptLogPageResponse response = UserOptLogPageResponse.builder()
                    .content(optLog.getContent())
                    .createAt(DateUtil.toyyyyMMddHHmmss(optLog.getCreateAt()))
                    .type(optLog.getType().getDesc())
                    .build();
            SafesUtil.ofList(userList).forEach(user -> {
                if (user.getId().equals(optLog.getOperatorId())) {
                    response.setAvatar(user.getAvatar());
                    response.setEmail(user.getEmail());
                    response.setNickname(user.getNickname());
                    response.setUserId(user.getId());
                }
            });

            return response;
        }).collect(Collectors.toList());
    }

    public static UserInfoResponse toUserInfoResponse(User user) {
        return UserInfoResponse.builder()
                .avatar(user.getAvatar())
                .email(user.getEmail())
                .id(user.getId())
                .nickname(user.getNickname())
                .role(user.getRole().getValue())
                .sex(user.getSex().getDesc())
                .signature(user.getSignature())
                .createAt(user.getCreateAt())
                .lastLoginTime(user.getLastLoginTime())
                .build();
    }

    public static List<UserPageResponse> toUserPageResponses(List<User> users) {
        if (ObjectUtils.isEmpty(users)) {
            return new ArrayList<>();
        }

        return users.stream().map(UserTransfer::buildUserPageResponse).collect(Collectors.toList());
    }

    public static User toGithubUser(JSONObject githubUser, String email, String nickname, String signature, String avatar) {
        return User.builder()
                .email(email)
                .state(UserStateEn.UN_ACTIVATION)
                .source(UserSourceEn.GITHUB)
                .nickname(nickname)
                .password(StringUtil.md5UserPassword(email))
                .signature(signature)
                .role(UserRoleEn.USER)
                .avatar(avatar)
                .sex(UserSexEn.UNKNOWN)
                .githubUser(githubUser)
                .lastLoginTime(new Date())
                .build();
    }

    public static User toUser(UserRegisterRequest request) {
        return User.builder()
                .email(request.getEmail())
                .state(UserStateEn.UN_ACTIVATION)
                .source(UserSourceEn.REGISTER)
                .nickname(request.getNickname())
                .password(StringUtil.md5UserPassword(request.getPassword()))
                .signature("")
                .role(UserRoleEn.USER)
                .avatar("")
                .sex(UserSexEn.MAN)
                .lastLoginTime(new Date())
                .build();
    }

    public static User toUser(User user, UserUpdateInfoRequest request) {
        user.setNickname(request.getNickname());
        user.setSignature(request.getSignature());
        user.setEmail(request.getEmail());

        return user;
    }

    public static User toUser(UserAdminPageRequest request) {
        User user = User.builder()
                .nickname(request.getNickname())
                .email(request.getEmail())
                .build();
        user.setRole(UserRoleEn.getEntity(request.getRole()));
        user.setState(UserStateEn.getEntity(request.getState()));

        return user;
    }

    private static UserPageResponse buildUserPageResponse(User user) {
        return UserPageResponse.builder()
                .avatar(user.getAvatar())
                .email(user.getEmail())
                .id(user.getId())
                .nickname(user.getNickname())
                .role(user.getRole().getDesc())
                .sex(user.getSex().getDesc())
                .signature(user.getSignature())
                .state(user.getState().getDesc())
                .createAt(DateUtil.toyyyyMMddHHmmss(user.getCreateAt()))
                .updateAt(DateUtil.toyyyyMMddHHmmss(user.getUpdateAt()))
                .build();
    }


}
