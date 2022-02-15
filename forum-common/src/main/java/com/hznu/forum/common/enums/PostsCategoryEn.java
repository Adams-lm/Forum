package com.hznu.forum.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author LIN
 * @create 2021/10/31
 * @desc
 **/
@Getter
@AllArgsConstructor
public enum PostsCategoryEn {
    ARTICLE("ARTICLE", "文章"),
    FAQ("FAQ", "问答"),
    ;
    private String value;
    private String desc;
}
