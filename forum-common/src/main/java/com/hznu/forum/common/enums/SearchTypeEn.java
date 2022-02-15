package com.hznu.forum.common.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author LIN
 * @create 2021/12/2
 * @desc
 **/
@Getter
@AllArgsConstructor
public enum SearchTypeEn {
    POSTS("POSTS", "帖子"),
    ;

    private String value;
    private String desc;
}
