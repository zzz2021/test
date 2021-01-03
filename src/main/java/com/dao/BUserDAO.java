package com.dao;

import com.bean.BUser;
import com.bean.Cart;
import com.utils.DBUtils;

import java.util.List;

public class BUserDAO {
    //根据账户和password查询用户
    public BUser getUserByNameAndPass(String applicatEmail, String applicatPwd) {
        String sql="select * from buser where bname=? and bpwd=?";
        return DBUtils.getSingleObj(BUser.class,sql, applicatEmail,applicatPwd);
    }
    //保存用户信息
    public boolean saveApplicant(BUser applicant) {
        String sql="insert into buser(bemail,bname,bpwd,sex,phone,address)" +
                " values(?,?,?,?,?,?)";
        return DBUtils.save(sql,applicant.getBemail(),applicant.getBname(),applicant.getBpwd(),applicant.getSex(),applicant.getPhone(),applicant.getAddress());
    }

    public Integer selectApplicantEmailCount(String applicatEmail) {
        String sql="select count(*) from buser a where a.bemail=?";
        Integer count = DBUtils.getCount(sql,applicatEmail);
        return count;
    }

    public List<BUser> getBUserList() {
            String sql="select * from buser";
            List<BUser> usersList= DBUtils.getList(BUser.class,sql);
            return usersList;
    }

    public List<BUser> getBUserListByPage(int currentPage,int pageSize) {

        Integer startRow=(currentPage-1)*pageSize;
        StringBuffer sqlRow=new StringBuffer("select * from buser ");
        sqlRow.append("limit ").append(startRow).append(",").append(pageSize);
        List<BUser> usersList=DBUtils.getList(BUser.class,sqlRow.toString());
        return usersList;
    }

    public void editBUser(String bname, Integer usex, String phone, String email, String address) {
            String sql="update buser set sex=?,phone=?,bemail=?,address=? where bname= ? ";
            boolean flag= DBUtils.update(sql,usex,phone,email,address,bname);
    }

    public Boolean editBUserPswd(String bname, String newpassword) {
        String sql="update buser set bpwd=? where bname= ? ";
        return DBUtils.update(sql,newpassword,bname);
    }

    public Boolean deleteBUserByBid(int bid) {
        String sql="delete from buser where bid= ? ";
        return DBUtils.update(sql,bid);
    }

    public void deleteAllBUser() {
        String sql="delete from buser";
        boolean flag= DBUtils.update(sql);
    }
}
