package com.hznu.forum.portal.request;

import lombok.Data;

/**
 * @author LIN
 * @create 2021/12/2
 * @desc
 **/
@Data
public class SearchRequest extends BasePageRequest {

    private String key;
}
