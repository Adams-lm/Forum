package com.hznu.forum.domain.service;

/**
 * @author LIN
 * @create 2021/11/23
 * @desc
 **/
public interface FileService {

    String uploadImg(byte[] base64, String fileName);
}
