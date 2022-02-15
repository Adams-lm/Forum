package com.hznu.forum.infrastructure.transfer;

import org.springframework.util.ObjectUtils;
import com.hznu.forum.common.enums.ArticleTypeScopeEn;
import com.hznu.forum.common.enums.AuditStateEn;
import com.hznu.forum.domain.entity.ArticleType;
import com.hznu.forum.infrastructure.dal.dataobject.ArticleTypeDO;

import java.util.ArrayList;
import java.util.List;

/**
 * @author LIN
 * @create 2021/10/31
 * @desc
 **/
public class ArticleTypeTransfer {

    public static ArticleTypeDO toArticleTypeDO(ArticleType articleType) {
        ArticleTypeDO articleTypeDO = ArticleTypeDO.builder()
                .auditState(ObjectUtils.isEmpty(articleType.getAuditState()) ? null : articleType.getAuditState().getValue())
                .creatorId(articleType.getCreatorId())
                .description(articleType.getDescription())
                .name(articleType.getName())
                .refCount(articleType.getRefCount())
                .scope(ObjectUtils.isEmpty(articleType.getScope()) ? null : articleType.getScope().getValue())
                .build();

        articleTypeDO.initBase();

        return articleTypeDO;
    }

    public static List<ArticleType> toArticleTypes(List<ArticleTypeDO> articleTypeDOS) {
        List<ArticleType> articleTypes = new ArrayList<>();
        if (ObjectUtils.isEmpty(articleTypeDOS)) {
            return articleTypes;
        }

        articleTypeDOS.forEach(articleTypeDO -> articleTypes.add(toArticleType(articleTypeDO)));

        return articleTypes;
    }

    public static ArticleType toArticleType(ArticleTypeDO articleTypeDO) {
        ArticleType articleType = ArticleType.builder()
                .auditState(AuditStateEn.getEntity(articleTypeDO.getAuditState()))
                .creatorId(articleTypeDO.getCreatorId())
                .description(articleTypeDO.getDescription())
                .name(articleTypeDO.getName())
                .refCount(articleTypeDO.getRefCount())
                .scope(ArticleTypeScopeEn.getEntity(articleTypeDO.getScope()))
                .build();
        articleType.setId(articleTypeDO.getId());
        articleType.setCreatorId(articleTypeDO.getCreatorId());
        articleType.setCreateAt(articleTypeDO.getCreateAt());
        articleType.setUpdateAt(articleTypeDO.getUpdateAt());

        return articleType;
    }
}
