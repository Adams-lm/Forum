package com.hznu.forum.api.service;

import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.file.FileUploadImgRequest;

/**
 * @author LIN
 * @create 2021/11/23
 * @desc
 **/
public interface FileApiService {

    ResultModel<String> uploadImg(FileUploadImgRequest request);

}
