package com.dao;

import com.bean.Focus;
import com.bean.Order;
import com.utils.DBUtils;

import java.util.List;

public class OrderDAO {
    //保存信息
    public boolean saveOrder(Order order) {
        String sql="insert into ordertable(b_id,g_id,count,state,ordate) values(?,?,?,?,?)";
        return DBUtils.save(sql,order.getB_id(),order.getG_id(),order.getCount(),order.getState(),order.getOrdate());
    }
    public List<Order> getOrderList() {
        String sql="select * from ordertable";
        List<Order> orderList= DBUtils.getList(Order.class,sql);
        return orderList;
    }
    public Order getOrder(int id) {
        String sql="select * from ordertable where g_id=?";
        return DBUtils.getSingleObj(Order.class,sql,id);
    }
}
