package com.zqh.crm.utils;


import java.io.*;
import java.util.Date;

/**
 * 文件操作相关的工具类
 */
public class FileUtil {
    private FileUtil() {
    }
    public static boolean upload(String fileDestStr,String fileName, InputStream is){
        File file=new File(fileDestStr+'/'+fileName+'.'+new Date().getTime());
        BufferedOutputStream bos=null;
        byte[] bytes=new byte[1024];
        int len=0;
        try {
            bos=new BufferedOutputStream(new FileOutputStream(file));
            if((len = is.read(bytes))!=-1){
                bos.write(bytes,0,len);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }finally {
            close(bos);
            close(is);
        }
        return true;
    }
    //关闭流
    private static void close(BufferedOutputStream bos){
        try {
            bos.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private static void close(InputStream is){
        try {
            is.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
