package com.dao;

import com.bean.BUser;
import com.bean.Goods;
import com.bean.GoodsType;
import com.utils.DBUtils;

import java.util.List;

public class GoodsDAO {
    public List<Goods> getGoodsList() {
        String sql="select * from goodstable";
        List<Goods> goodsList= DBUtils.getList(Goods.class,sql);
        return goodsList;
    }

    public List<Goods> getGoodsList(int goodsTypeId) {
        String sql="select * from goodstable where goodstype_id=?";
        List<Goods> goodsList= DBUtils.getList(Goods.class,sql,goodsTypeId);
        return goodsList;
    }

    //查询人气TOP9
    public List<Goods> getTopGoodsList() {
        String sql="select * from goodstable order by gstore desc limit 1,9";
        List<Goods> goodsList= DBUtils.getList(Goods.class,sql);
        return goodsList;
    }
//查询销售TOP9
    public List<Goods> getTopSellGoodsList() {
        String sql="select * from goodstable order by grprice asc limit 1,10";
        List<Goods> goodsList= DBUtils.getList(Goods.class,sql);
        return goodsList;
    }

    //获取单个宠物信息
    public Goods getSingleGoods(int id) {
            String sql="select * from goodstable where id=?";
            return DBUtils.getSingleObj(Goods.class,sql, id);
    }

    public GoodsType getGoodsType(int goodsTypeId) {
        String sql="select * from goodstype where goodstype.id=?";
        return DBUtils.getSingleObj(GoodsType.class,sql, goodsTypeId);
    }
    //根据名称查询宠物信息
    public List<Goods> getGoods(String goodsName) {
        String sql="select * from goodstable where gname=?";
        return DBUtils.getList(Goods.class,sql,goodsName);
    }
    //更新宠物库存
    public void updateGoodsNum(int goodsId, int number) {
        String sql="update goodstable set gstore= ? where id= ? ";
        boolean flag= DBUtils.update(sql,number,goodsId);
    }

    public List<Goods> getGoodsListByPage(int currentPage, int pageSize) {
        Integer startRow=(currentPage-1)*pageSize;
        StringBuffer sqlRow=new StringBuffer("select * from goodstable ");
        sqlRow.append("limit ").append(startRow).append(",").append(pageSize);
        List<Goods> goodsList=DBUtils.getList(Goods.class,sqlRow.toString());
        return goodsList;
    }

    public void editGoods(Goods goods) {
        String sql="update goodstable set goprice=?,grprice=?,gstore=?,gpicture=? goodstype_id=？ where id= ? ";
        boolean flag= DBUtils.update(sql,goods.getGoprice(),goods.getGrprice(),goods.getGstore(),goods.getGpicture(),goods.getGoodstype_id(),goods.getId());
    }

    public Boolean addGoods(Goods goods) {
        String sql="insert into goodstable(gname,goprice,grprice,gstore,gpicture,goodstype_id,status)" +
                " values(?,?,?,?,?,?,?)";
        return DBUtils.save(sql,goods.getGname(),goods.getGoprice(),goods.getGrprice(),goods.getGstore(),goods.getGpicture(),goods.getGoodstype_id(),goods.getStatus());
    }

    public Boolean deletePet(int gid) {
        String sql="delete from goodstable where id=?";
        return DBUtils.save(sql,gid);
    }
}
