package com.dao;

import com.bean.GoodsType;
import com.bean.Notice;
import com.utils.DBUtils;

import java.util.List;

public class NoticeDAO {
    //查询所有类型
    public List<Notice> getNoticeList() {
        String sql="select * from noticetable";
        List<Notice> noticeList= DBUtils.getList(Notice.class,sql);
        return noticeList;
    }
}
