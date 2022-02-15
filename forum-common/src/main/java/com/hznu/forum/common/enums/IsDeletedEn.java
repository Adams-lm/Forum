package com.hznu.forum.common.enums;

import lombok.Getter;

/**
 * @author LIN
 * @create 21/7/23
 * @desc
 **/
public enum IsDeletedEn {
    DELETED(1),
    NOT_DELETED(0),
    ;

    @Getter
    private Integer value;

    IsDeletedEn(Integer value) {
        this.value = value;
    }
}
