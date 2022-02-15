package com.hznu.forum.infrastructure.dal.dao;

import org.apache.ibatis.annotations.Param;
import com.hznu.forum.infrastructure.dal.dataobject.ArticleTypeDO;
import java.util.List;

/**
 * @author LIN
 * @create 2021/10/31
 * @desc
 **/
public interface ArticleTypeDAO {

    void insert(ArticleTypeDO articleTypeDO);

    List<ArticleTypeDO> query(ArticleTypeDO articleTypeDO);

    List<ArticleTypeDO> queryInScopesAndState(@Param("scopes") List<String> scopes, @Param("auditState") String auditState);

    void update(ArticleTypeDO articleTypeDO);

    ArticleTypeDO get(@Param("id") Long id);

    void increaseRefCount(@Param("id") Long id);

    void decreaseRefCount(@Param("id") Long id);
}