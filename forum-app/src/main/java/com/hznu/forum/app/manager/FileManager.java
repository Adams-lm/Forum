package com.hznu.forum.app.manager;

import org.springframework.stereotype.Component;
import com.hznu.forum.api.request.file.FileUploadImgRequest;
import com.hznu.forum.app.support.IsLogin;
import com.hznu.forum.domain.service.FileService;

import javax.annotation.Resource;

/**
 * @author LIN
 * @create 2021/11/23
 * @desc
 **/
@Component
public class FileManager {

    @Resource
    private FileService fileService;

    @IsLogin
    public String uploadImg(FileUploadImgRequest request) {
        return fileService.uploadImg(request.getBase64(), request.getFileName());
    }
}
