package com.hznu.forum.common.support;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author LIN
 * @create 2021/12/8
 * @desc
 **/
public class DateUtil {

    public static String toyyyyMMddHHmmss(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
    }

    public static String toyyyyMMddHHmmss(String date)  {
        Date time = null;
        try {
            time = new SimpleDateFormat("yyyy-MM-dd").parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return new SimpleDateFormat("yyyy年MM月dd日").format(time);
    }

    public static String toyyyyMMdd(Date date)  {
        return new SimpleDateFormat("yyyy年MM月dd日").format(date);
    }
}
