package com.dao;

import com.bean.BUser;
import com.bean.Cart;
import com.bean.Goods;
import com.utils.DBUtils;

import java.util.List;

public class CartDAO {
    //保存信息
    public boolean saveCart(Cart cart) {
        String sql="insert into carttable(buser_id,goods_id,goodsNum,goods_name,picture,price,total) values(?,?,?,?,?,?,?)";
        return DBUtils.save(sql,cart.getBuser_id(),cart.getGoods_id(),cart.getGoodsNum(),cart.getGoods_name(),cart.getPicture(),cart.getPrice(),cart.getTotal());
    }
    public List<Cart> getCartList() {
        String sql="select * from carttable";
        List<Cart> cartList= DBUtils.getList(Cart.class,sql);
        return cartList;
    }
    //删除购物车中的一条数据
    public void deleteCartGoods(int id) {
        String sql="delete from carttable where id= ? ";
        boolean flag= DBUtils.update(sql,id);
    }

    //删除购物车所有数据
    public void deleteCartAllGoods() {
        String sql="delete from carttable";
        boolean flag= DBUtils.update(sql);
    }

    public void updatecart(int id) {
        String sql="delete from carttable where goods_id= ? ";
        boolean flag= DBUtils.update(sql,id);
    }
}
