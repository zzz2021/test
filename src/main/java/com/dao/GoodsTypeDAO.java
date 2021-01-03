package com.dao;

import com.bean.BUser;
import com.bean.Goods;
import com.bean.GoodsType;
import com.utils.DBUtils;

import java.util.List;

public class GoodsTypeDAO {
    //查询所有类型
    public List<GoodsType> getGoodsTypeList() {
        String sql="select * from goodstype";
        List<GoodsType> goodsTyeList= DBUtils.getList(GoodsType.class,sql);
        return goodsTyeList;
    }

    public GoodsType getGoodsType(int goodsTypeId) {
        String sql="select * from goodstype where id=?";
        return DBUtils.getSingleObj(GoodsType.class,sql, goodsTypeId);
    }

    public Boolean deleteType(int tid) {
        String sql="delete from goodstype where id= ? ";
        return DBUtils.update(sql,tid);
    }

    //添加类型
    public boolean addType(String typename) {
        String sql="insert into goodstype(typename) values(?)";
        return DBUtils.save(sql,typename);
    }
}
