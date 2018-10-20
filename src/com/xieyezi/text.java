package com.xieyezi;

import com.xieyezi.Record_operation;

import java.text.SimpleDateFormat;
import java.util.Date;
/*为了测试系统，专门写的测试函数*/
public class text {
    public static void adduser(){
        String id="";
        for (int i=0;i<18;i++){
            int a= (int)(Math.random()*10);
            id+=a+"";
        }
        String name="测试名";
        int machineid=1+ (int) (Math.random()*149);
        Machine_operation machine_operation =new Machine_operation();
        while (machine_operation.isBusy(machineid)){
            machineid=1+ (int) (Math.random()*149);
        }
        int money=(int)(Math.random()*100);
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String startTime=dateFormat.format(new Date());
        Record_operation record_operation =new Record_operation();
        record_operation.insertRecord(id,name,startTime,machineid,money);
        record_operation.closeConnection();
    }
}

