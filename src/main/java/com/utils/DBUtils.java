package com.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import org.apache.commons.beanutils.BeanUtils;
import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.*;
import java.util.Date;
import java.util.*;

public class DBUtils {
    public static Connection getConnection() throws Exception {
        //读取配置文件
        //1.加载配置文件
       Properties properties=new Properties();
        InputStream in = DBUtils.class.getClassLoader().getResourceAsStream("db.properties");
      //  InputStream in= DBUtils.class.getContextClassLoader().getResourceAsStream("config/db.properties");
        properties.load(in);

        DataSource dataSource= DruidDataSourceFactory.createDataSource(properties);
        return dataSource.getConnection();
    }

    //返回用户集合
    public static <T> List<T> getList(Class<T> clazz, String sql, Object...args){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        List<T> userList=null;
        try{
            conn= DBUtils.getConnection();
            //  String sql="select id,username,birthday from users where id=? and username=?";
            ps=conn.prepareStatement(sql);

            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }


            rs=ps.executeQuery();

            //获取结果集元数据
            ResultSetMetaData rsmd=rs.getMetaData();
            //获取当前结果集的列数
            int colnum=rsmd.getColumnCount();

            userList=new ArrayList<T>();

            while(rs.next()){

                Map<String,Object> rowMap=new HashMap<String,Object>();
                for(int i=1;i<=colnum;i++){
                    String columnName=rsmd.getColumnName(i);
                    Object columnValue=rs.getObject(columnName);
                    if(columnValue instanceof java.sql.Date){
                        java.sql.Date date=(java.sql.Date)columnValue;
                        columnValue=new Date(date.getTime());
                    }
                    rowMap.put(columnName,columnValue);
                }
                T bean=clazz.newInstance();

                for(Map.Entry<String,Object> entry:rowMap.entrySet()){
                    String propertyName=entry.getKey();
                    Object propertyValue=entry.getValue();
                    BeanUtils.setProperty(bean,propertyName,propertyValue);
                }

                userList.add(bean);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }
        return userList;
    }
    //保存
    public static boolean save(String sql, Object...args){
        Connection conn=null;
        PreparedStatement ps=null;
        Integer count =null;
        try{
            conn= DBUtils.getConnection();
            ps=conn.prepareStatement(sql);

            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }
           count=ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, null);
        }
        return count!=null&&count>0?true:false;
    }

    public static void close(Connection conn, Statement ps, ResultSet rs) {
        if(rs!=null){
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(ps!=null){
            try {
                ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn!=null){
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    //查询单个用户
    public static <T> T getSingleObj(Class<T> clazz, String sql, Object...args){
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        T bean=null;
        try{
            conn= DBUtils.getConnection();
            ps=conn.prepareStatement(sql);

            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }
            rs=ps.executeQuery();

            //获取结果集元数据
            ResultSetMetaData rsmd=rs.getMetaData();
            //获取当前结果集的列数
            int colnum=rsmd.getColumnCount();

            while(rs.next()){

                Map<String,Object> rowMap=new HashMap<String,Object>();
                for(int i=1;i<=colnum;i++){
                    String columnName=rsmd.getColumnName(i);
                    Object columnValue=rs.getObject(columnName);
                    if(columnValue instanceof java.sql.Date){
                        java.sql.Date date=(java.sql.Date)columnValue;
                        columnValue=new Date(date.getTime());
                    }
                    rowMap.put(columnName,columnValue);
                }
                bean=clazz.newInstance();

                for(Map.Entry<String,Object> entry:rowMap.entrySet()){
                    String propertyName=entry.getKey();
                    Object propertyValue=entry.getValue();
                    BeanUtils.setProperty(bean,propertyName,propertyValue);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }

        return bean;
    }

    public static Integer getCount(String sql, Object...args) {
        Connection conn=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        Integer count=0;
        try{
            conn= DBUtils.getConnection();
            ps=conn.prepareStatement(sql);

            if(args!=null&&args.length>0){
                for(int i=0;i<args.length;i++){
                    ps.setObject(i+1,args[i]);
                }
            }
            rs=ps.executeQuery();
            while(rs.next()){
                count=rs.getInt(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            close(conn, ps, rs);
        }
        return count;
    }

    //更新操作
    public static boolean update(String sql, Object...args)  {

        Connection connection=null;
        PreparedStatement ps=null;
        Integer count=0;
        try{

            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql);
            if(args!=null&&args.length>0) {
                for (int i = 0; i < args.length; i++) {
                    //判断当前类型，是不是java.util.Date,转换成java.sql.Date
                    if(args[i] instanceof Date){
                        Date date=(Date) args[i];
                        //转换成java.sql.Date
                        args[i]=new java.sql.Date(date.getTime());
                    }

                    ps.setObject(i + 1,args[i]);
                }
            }


            count = ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally{
            close(connection, ps, null);
        }
        return count>0?true:false;
    }

    //更新操作
    public static Integer updateForPrimary(String sql, Object...args)  {

        Connection connection=null;
        PreparedStatement ps=null;
//		Integer count=0;
        Integer primaryKey=null;
        ResultSet rs=null;
        try{

            connection = DBUtils.getConnection();
            ps = connection.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            if(args!=null&&args.length>0) {
                for (int i = 0; i < args.length; i++) {
                    //判断当前类型，是不是java.util.Date,转换成java.sql.Date
                    if(args[i] instanceof Date){
                        Date date=(Date) args[i];
                        //转换成java.sql.Date
                        args[i]=new Date(date.getTime());
                    }

                    ps.setObject(i + 1,args[i]);
                }
            }


            ps.executeUpdate();

            rs= ps.getGeneratedKeys();

            if(rs.next()){
                primaryKey = rs.getInt(1);
            }

        }catch (Exception e){
            e.printStackTrace();
        }finally{
            close(connection,ps,rs);
        }
        return primaryKey;
    }
}
