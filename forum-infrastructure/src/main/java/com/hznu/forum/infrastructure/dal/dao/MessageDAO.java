package com.hznu.forum.infrastructure.dal.dao;

import org.apache.ibatis.annotations.Param;
import com.hznu.forum.infrastructure.dal.dataobject.MessageDO;

import java.util.List;

/**
 * @author LIN
 * @create 2021/12/5
 * @desc
 **/
public interface MessageDAO {

    void insert(MessageDO messageDO);

    MessageDO get(Long id);

    List<MessageDO> query(MessageDO messageDO);

    void updateToRead(MessageDO messageDO);

    Long countUnRead(@Param("receiver") String receiver, @Param("read") String read);

    void deleteInTypesAndTitle(@Param("types") List<String> types, @Param("title") String title);
}
