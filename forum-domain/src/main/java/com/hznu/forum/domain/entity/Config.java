package com.hznu.forum.domain.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.hznu.forum.common.enums.AuditStateEn;
import com.hznu.forum.common.enums.ConfigTypeEn;

import java.util.Date;

/**
 * @author LIN
 * @create 2021/12/26
 * @desc
 **/
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Config extends BaseEntity {

    private AuditStateEn state;

    private ConfigTypeEn type;

    private String name;

    private String content;

    private Date startAt;

    private Date endAt;

    private Long creator;
}
