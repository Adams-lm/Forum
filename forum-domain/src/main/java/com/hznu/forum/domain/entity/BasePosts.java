package com.hznu.forum.domain.entity;

import lombok.Data;
import com.hznu.forum.common.enums.AuditStateEn;
import com.hznu.forum.common.enums.ContentTypeEn;
import com.hznu.forum.common.enums.PostsCategoryEn;

import java.util.Set;

/**
 * @author LIN
 * @create 2021/10/31
 * @desc
 **/
@Data
public class BasePosts extends BaseEntity {

    private AuditStateEn auditState;

    private PostsCategoryEn category;

    private User author;

    private String title;

    private ContentTypeEn contentType;

    private String markdownContent;

    private String htmlContent;

    private Set<Tag> tags;

    private Long views;

    private Long approvals;

    private Long comments;

    private Long typeId;

    private Long authorId;

    private Boolean official;

    private Boolean top;

    private Long sort;

    private Boolean marrow;
}
