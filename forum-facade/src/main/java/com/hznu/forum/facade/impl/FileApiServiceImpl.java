package com.hznu.forum.facade.impl;

import org.springframework.stereotype.Service;
import com.hznu.forum.api.model.ResultModel;
import com.hznu.forum.api.request.file.FileUploadImgRequest;
import com.hznu.forum.api.service.FileApiService;
import com.hznu.forum.app.manager.FileManager;
import com.hznu.forum.facade.support.ResultModelUtil;
import com.hznu.forum.facade.validator.FileValidator;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/11/23
 * @desc
 **/
@Service
public class FileApiServiceImpl implements FileApiService {

    @Resource
    private FileManager fileManager;

    @Override
    public ResultModel<String> uploadImg(FileUploadImgRequest request) {
        FileValidator.uploadImg(request);

        return ResultModelUtil.success(fileManager.uploadImg(request));
    }
}
