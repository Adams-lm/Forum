package com.hznu.forum.infrastructure;

import org.springframework.stereotype.Service;
import com.hznu.forum.common.enums.MessageChannelEn;
import com.hznu.forum.common.enums.MessageContentTypeEn;
import com.hznu.forum.domain.entity.Message;
import com.hznu.forum.domain.repository.MessageRepository;
import com.hznu.forum.domain.service.MailService;
import com.hznu.forum.domain.service.MessageService;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/10/22
 * @desc
 **/
@Service
public class MessageServiceImpl implements MessageService {

    @Resource
    private MessageRepository messageRepository;

    @Resource
    private MailService mailService;

    @Override
    public void send(Message message) {
        // 邮件
        if (MessageChannelEn.MAIL.equals(message.getChannel())) {
            if (MessageContentTypeEn.HTML.equals(message.getContentType())) {
                mailService.sendHtml(message);
            }
            if (MessageContentTypeEn.TEXT.equals(message.getContentType())) {
                mailService.sendText(message);
            }
        }

        messageRepository.save(message);
    }

}
