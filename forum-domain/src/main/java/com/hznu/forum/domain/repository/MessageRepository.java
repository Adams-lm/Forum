package com.hznu.forum.domain.repository;

import com.hznu.forum.common.enums.MessageTypeEn;
import com.hznu.forum.common.model.PageRequest;
import com.hznu.forum.common.model.PageResult;
import com.hznu.forum.domain.entity.Message;

import java.util.List;

/**
 * @author LIN
 * @create 2021/10/22
 * @desc
 **/
public interface MessageRepository {

    void save(Message message);

    Message get(Long id);

    PageResult<Message> page(PageRequest<Message> pageRequest);

    void updateToRead(Message message);

    Long countUnRead(Long receiver);

    void deleteInTypesAndTitle(List<MessageTypeEn> typeEns, String title);
}
