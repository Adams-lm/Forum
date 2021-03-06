package com.hznu.forum.api.response.article;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.hznu.forum.api.vo.TagVO;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author LIN
 * @create 2021/11/1
 * @desc
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ArticleUserPageResponse implements Serializable {

    private Long id;

    private String auditState;

    private String category;

    private String categoryDesc;

    private Boolean official;

    private Boolean top;

    private Boolean marrow;

    private String title;

    private String introduction;

    private String headImg;

    private Long authorId;

    private String authorNickname;

    private String authorAvatar;

    private String createAt;

    private String updateAt;

    private Long views;

    private Long approvals;

    private Long comments;

    private List<TagVO> tags;

}
