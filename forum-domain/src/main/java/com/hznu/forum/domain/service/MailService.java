package com.hznu.forum.domain.service;

import com.hznu.forum.domain.entity.Message;

/**
 * @author LIN
 * @create 2021/12/7
 * @desc
 **/
public interface MailService {

    void sendHtml(Message mailMessage);

    void sendText(Message mailMessage);

}
