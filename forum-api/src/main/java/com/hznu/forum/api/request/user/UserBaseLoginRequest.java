package com.hznu.forum.api.request.user;

import lombok.Data;

import java.io.Serializable;

/**
 * @author LIN
 * @create 2021/12/4
 * @desc
 **/
@Data
public class UserBaseLoginRequest implements Serializable {

    private String ua;

    private String ip;

}
