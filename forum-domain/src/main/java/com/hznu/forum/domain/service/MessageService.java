package com.hznu.forum.domain.service;

import com.hznu.forum.domain.entity.Message;

/**
 * @author LIN
 * @create 2021/10/22
 * @desc
 **/
public interface MessageService {

    void send(Message message);

}
