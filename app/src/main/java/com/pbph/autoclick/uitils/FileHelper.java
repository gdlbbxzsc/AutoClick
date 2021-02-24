package com.pbph.autoclick.uitils;


import android.os.Environment;
import android.text.TextUtils;
import android.util.Log;

import com.pbph.autoclick.BuildConfig;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


/**
 * file=ROOT+appPath+fileSubPath+fileName
 **/
public final class FileHelper {

    private static final String ROOT = Environment.getExternalStorageDirectory().getAbsolutePath() + File.separator;

    private final String NAME = "autoclick";

    private String rootMainPath;
    private String fileSubPath;
    private String fileName;

    public static FileHelper getInstance() {
        return new FileHelper();
    }

    ///////////
    public FileHelper toAppPath() {
        rootMainPath = NAME + File.separator;
        return this;
    }

    public FileHelper toCameraPath() {
        rootMainPath = Environment.DIRECTORY_DCIM + File.separator + "Camera" + File.separator;
        return this;
    }

    public FileHelper fileSubPath(String fileSubPath) {
        this.fileSubPath = fileSubPath;
        return this;
    }

    public FileHelper fileName(String fileName) {
        this.fileName = fileName;
        return this;
    }

    public File create() {
        return create(true);
    }

    public File create(boolean delIfExists) {
        try {
            StringBuilder sb = new StringBuilder();
            sb.append(ROOT);
            sb.append(rootMainPath);

            if (!TextUtils.isEmpty(fileSubPath)) {
                if (fileSubPath.charAt(0) == '/') fileSubPath = fileSubPath.substring(1);
                sb.append(fileSubPath);
                if (fileSubPath.charAt(fileSubPath.length() - 1) != '/') sb.append(File.separator);
            }

            sb.append(fileName);

            String path = sb.toString();
            Log.e("====>",path);
            return FileUtils.createFile(path, delIfExists);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }





    public static String read(String fileName) {
        try {
            File file = FileHelper.getInstance().toAppPath().fileName(fileName).create(true);
            BufferedReader br = new BufferedReader(new FileReader(file));
            String readline = "";
            StringBuffer sb = new StringBuffer();
            while ((readline = br.readLine()) != null) {
                sb.append(readline);
            }
            br.close();
            return sb.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static void write(String fileName, String info) {
        try {
            File file = FileHelper.getInstance().toAppPath().fileName(fileName).create(true);
            com.pbph.autoclick.uitils.Logger.e(file.getAbsolutePath());
            //第二个参数意义是说是否以append方式添加内容
            BufferedWriter bw = new BufferedWriter(new FileWriter(file, true));
            bw.write(info);
            bw.flush();
            bw.close();
            Logger.e("写入成功" + file.getAbsolutePath());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
