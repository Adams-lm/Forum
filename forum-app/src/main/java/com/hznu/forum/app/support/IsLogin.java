package com.hznu.forum.app.support;

import com.hznu.forum.common.enums.UserRoleEn;

import java.lang.annotation.*;

/**
 * @author LIN
 * @create 2021/10/19
 * @desc
 **/
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface IsLogin {

    /**
     * 登录角色
     * @return
     */
    UserRoleEn role() default UserRoleEn.USER;

}