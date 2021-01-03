package com.utils;



import com.bean.BUser;

import java.lang.reflect.Method;

public class Test1 {
    public static void main(String[] args) throws Exception {
        BUser user=new BUser();
        //反射
        Class<BUser> userClass= BUser.class;
        BUser user1=(BUser)userClass.newInstance();

        Method setUsername=userClass.getMethod("setUsername", String.class);
        setUsername.invoke(user1,"jerry");
        System.out.println(user1);

    }
}
