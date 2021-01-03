package com.dao;

import com.bean.Focus;
import com.utils.DBUtils;

import java.util.List;

public class FocusDAO {
    //保存信息
    public boolean saveFocus(Focus focus) {
        String sql="insert into focustable(bid,gid,gname,gpicture,gprice,focustime) values(?,?,?,?,?,?)";
        return DBUtils.save(sql,focus.getBid(),focus.getGid(),focus.getGname(),focus.getGpicture(),focus.getGprice(),focus.getFocustime());
    }
    public List<Focus> getfocusList() {
        String sql="select * from focustable";
        List<Focus> focusList= DBUtils.getList(Focus.class,sql);
        return focusList;
    }
}
