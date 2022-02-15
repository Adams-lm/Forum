//package com.hznu.forum.infrastructure.fix;
//
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//import org.springframework.util.ObjectUtils;
//import com.hznu.forum.common.support.SafesUtil;
//import com.hznu.forum.infrastructure.dal.dao.UserDAO;
//import com.hznu.forum.infrastructure.dal.dataobject.UserDO;
//
//import javax.annotation.Resource;
//import java.util.List;
//
///**
// * @author LIN
// * @create 2021/5/5
// * @desc
// **/
//@Component
//public class UserAvatarFix {
//
//    @Resource
//    private UserDAO userDAO;
//
//    @Scheduled(cron = "0/30 * * * * ? ")
//    public void task() {
//        List<UserDO> userDOS = userDAO.query(UserDO.builder().build());
//        SafesUtil.ofList(userDOS).forEach(userDO -> {
//            if (!ObjectUtils.isEmpty(userDO.getAvatar())) {
//                String avatar = userDO.getAvatar();
//                userDO.setAvatar(avatar.replaceAll("www.gravatar.com", "sdn.geekzu.org"));
//
//                userDAO.update(userDO);
//            }
//        });
//    }
//}
