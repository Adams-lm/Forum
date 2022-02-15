package com.hznu.forum.facade.validator;

import com.hznu.forum.api.model.PageRequestModel;
import com.hznu.forum.common.support.CheckUtil;

/**
 * @author LIN
 * @create 21/9/9
 * @desc
 **/
public class PageRequestModelValidator {

    public static void validator(PageRequestModel pageRequestModel) {
        CheckUtil.checkParamToast(pageRequestModel, "pageRequestModel");
        CheckUtil.checkParamToast(pageRequestModel.getPageNo(), "pageNo");
        CheckUtil.checkParamToast(pageRequestModel.getPageSize(), "pageSize");
        CheckUtil.checkParamToast(pageRequestModel.getFilter(), "filter");
    }

}
