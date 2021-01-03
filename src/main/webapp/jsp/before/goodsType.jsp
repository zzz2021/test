<%@ page import="com.dao.NoticeDAO" %>
<%@ page import="com.bean.Notice" %>
<%@ page import="java.util.List" %>
<%@ page import="com.dao.GoodsDAO" %>
<%@ page import="com.bean.Goods" %>
<%@ page import="com.bean.GoodsType" %>
<%@ page import="com.dao.GoodsTypeDAO" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<jsp:include page="head.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <title>宠物类型</title>
    <link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
    <link href="css/before/common.css" rel="stylesheet" type="text/css" />
    <link href="css/before/style.css" rel="stylesheet" type="text/css" />
    <style>
        .bloc {
            width: 540px;
            height: 294px;
            border: 1px solid black;
            margin: 0px auto;
            position: relative;
            overflow: hidden;
            box-sizing: border-box;
        }

        .box_big {
            position: absolute;
            width: 4200px;
            height: 400px;
        }

        .nav {
            transition: margin-left 0.5s linear;
        }

        .bo {
            width: 700px;
            height: 400px;
            float: left;
        }

        .spot {
            position: absolute;
            width: 100%;
            text-align: right;
            bottom: 5px;
        }

        .spot_list {
            width: 30px;
            height: 30px;
            font-size: 20px;
            text-align: center;
            border: 1px solid gray;
            border-radius: 5px;
            line-height: 30px;
            font-weight: bolder;
            margin: 10px;
            display: inline-block;
            background: rgba(255, 255, 255, 0.3);
        }

        .btn {
            width: 100%;
            height: 80px;
            position: absolute;
            margin: 0 auto;
            top: 160px;
        }

        .left_btn, .right_btn {
            width: 30px;
            height: 80px;
            z-index: 15;
            background: rgba(255, 255, 255, 0.3);
            text-align: center;
            line-height: 80px;
            border-radius: 8px;
        }

        .left_btn {
            float: left;
        }

        .right_btn {
            float: right;
        }
    </style>
    <script type="text/javascript">
        function openNotice(url) {
            window
                .open(
                    url,
                    '站内公告',
                    'height=400, width=400, top=100, left=100, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=n o, status=no');
        }
    </script>
</head>
<body>
<div class="blank"></div>
<div class="block clearfix">
    <div class="AreaL">
        <!--销售排行-->
        <div class="box">
            <div class="box_2">
                <div class="top10Tit">
                    <span>销售排行</span>
                </div>
                <div class="top10List clearfix">
                    <%
                        GoodsDAO goodsDAO=new GoodsDAO();
                        List<Goods> goods=goodsDAO.getTopSellGoodsList();
                        request.setAttribute("salelist",goods);
                    %>
                    <c:forEach items="${salelist }" var="sg" varStatus="status">
                        <ul class="clearfix">
                            <img class="iteration"
                                 src="images/before/top_${status.index+1 }.gif" />
                            <li class="topimg"><a href="jsp/before/goodsdetail.jsp?id=${sg.id }">
                                <img class="samllimg" alt="" src="/pet/images/pet/${sg.gpicture}" />
                            </a></li>
                            <li class="iteration1"><a href="jsp/before/goodsdetail.jsp?id=${sg.id }">${sg.gname }</a><br />
                                售价：<font class="f1">￥${sg.grprice }元</font><br /></li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!--销售排行 end -->
        <!--人气排行-->
        <div class="blank5"></div>
        <div class="box">
            <div class="box_2">
                <div class="top10Tit">
                    <span>人气排行</span>
                </div>
                <div class="top10List clearfix">
                    <%
                        GoodsDAO goodsDAO2=new GoodsDAO();
                        List<Goods> goods2=goodsDAO2.getTopGoodsList();
                        request.setAttribute("focuslist",goods2);
                    %>
                    <c:forEach items="${focuslist }" var="sg" varStatus="status">
                        <ul class="clearfix">
                            <img class="iteration"
                                 src="images/before/top_${status.index+1 }.gif" />
                            <li class="topimg"><a href="jsp/before/goodsdetail.jsp?id=${sg.id }">
                                <img class="samllimg" alt="" src="/pet/images/pet/${sg.gpicture}" />
                            </a></li>
                            <li class="iteration1"><a href="jsp/before/goodsdetail.jsp?id=${sg.id }">${sg.gname }</a><br />
                                售价：<font class="f1">￥${sg.grprice }元</font><br /></li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!--人气排行 end -->
    </div>
    <div class="AreaR">
        <div class="AreaR">
            <div class="AreaM clearfix">
                <div id="focus">
                    <div class="bloc">
                        <div class="box_big ">
                            <div class="bo">
                                <img src="images/before/image1.jpg" alt="" />
                            </div>
                            <div class="bo">
                                <img src="images/before/image2.jpg" alt="" />
                            </div>
                            <div class="bo">
                                <img src="images/before/image3.jpg" alt="" />
                            </div>
                            <div class="bo">
                                <img src="images/before/image4.jpg" alt="" />
                            </div>
                            <div class="bo">
                                <img src="images/before/image5.jpg" alt="" />
                            </div>
                            <div class="bo">
                                <img src="images/before/image1.jpg" alt="" />
                            </div>
                        </div>
                        <div class="spot">
                            <div class="spot_list">1</div>
                            <div class="spot_list">2</div>
                            <div class="spot_list">3</div>
                            <div class="spot_list">4</div>
                            <div class="spot_list">5</div>
                        </div>
                        <div class="btn">
                            <div class="left_btn">
                                <span> < </span>
                            </div>
                            <div class="right_btn">
                                <span> > </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="AreaRR clearfix">
                <!--公告栏-->
                <div class="box">
                    <div class="box_1">
                        <div class="title_bt">
                            <h3>公告栏</h3>
                        </div>
                        <div class="post_list ared">
                            <ul>
                                <%
                                    NoticeDAO noticeDAO=new NoticeDAO();
                                    List<Notice> notices=noticeDAO.getNoticeList();
                                    request.setAttribute("notices",notices);
                                %>
                                <c:forEach items="${notices}" var="nt">
                                    <li><a
                                            href="javascript:openNotice('/petManagement/selectANotice?id=${nt.id }');">${nt.ntitle }</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <!--公告栏 end-->
            </div>
        </div>
        <div class="AreaR">
            <!--最新商品列表-->
            <div class="blank5"></div>
            <div class="box">
                <div class="box_color ared">

                    <%
                        String x=request.getParameter("id");
                        int goodsId=Integer.parseInt(x);
                        GoodsDAO goodsDAOT=new GoodsDAO();
                        GoodsTypeDAO goodsTypeDAO=new GoodsTypeDAO();
                        GoodsType goodsType=goodsTypeDAO.getGoodsType(goodsId);
                        List<Goods> goodsT=goodsDAOT.getGoodsList(goodsId);
                        request.setAttribute("goodsTypeList",goodsT);
                        request.setAttribute("goodsType",goodsType);
                    %>
                    <div class="title_bt">
                        <h3>${goodsType.typename}</h3>
                    </div>
                    <div class="itemgood_nr clearfix">
                        <ul>
                            <c:forEach items="${goodsTypeList }" var="sg">
                                <li>
                                    <div>
                                        <p class="pic">
                                            <a href="jsp/before/goodsdetail.jsp?id=${sg.id }"> <img
                                                    src="/pet/images/pet/${sg.gpicture}" /></a>
                                        </p>
                                        <p class="wz">
                                            <strong><a href="jsp/before/goodsdetail.jsp?id=${sg.id }">${sg.gname }</a></strong>
                                            <em>现价:<span>￥${sg.grprice}</span></em>
                                        </p>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <!--最新商品列表end-->
        </div>
    </div>
</div>
<script>
    //首先获取元素，这里获取了所有需要的元素。
    var box = document.getElementsByClassName("box_big")[0];
    var spot = document.getElementsByClassName("spot_list");
    var block = document.getElementsByClassName("bloc")[0];
    var left_btn = document.getElementsByClassName("left_btn")[0];
    var right_btn = document.getElementsByClassName("right_btn")[0];
    var time = null;
    spot[0].style.background = "rgba(91,91,91,0.8)";
    var count = 0;
    showtime();
    //鼠标进入计时器停止
    block.onmouseenter = function() {
        clearInterval(time);
    };
    //鼠标出来计时器打开
    block.onmouseleave = function() {
        showtime();
    };
    //点的事件
    for (var i = 0; i < spot.length; i++) {
        spot[i].index = i;
        spot[i].onmouseenter = function() {
            spot[count].style.background = "rgba(255, 255, 255, 0.3)";
            this.style.background = "rgba(91,91,91,0.8)";
            count = this.index;
            box.style.marginLeft = (count * -700) + "px";
        }

    }
    //图片左边划
    left_btn.onclick = function() {
        mate();
    };
    //图片右边划
    right_btn.onclick = function() {
        spot[count].style.backgroundColor = "rgba(255,255,255,0.3)";
        count--;
        if (count < 0) {
            box.className = "box_big";
            count = box.children.length - 2;
            box.style.marginLeft = "-3500px";
        }
        setTimeout(function() {
            box.className = "box_big nav";
            box.style.marginLeft = (-700 * count) + "px";
            spot[count].style.backgroundColor = "rgba(91,91,91,0.8)";
        }, 1);
    };
    //计时器
    function showtime() {
        time = setInterval(function() {
            mate();
        }, 5000);
    }
    //正常滚动
    function mate() {
        box.className = "box_big nav";
        spot[count].style.background = "rgba(255, 255, 255, 0.3)";
        count++;
        spot[count > box.children.length - 2 ? 0 : count].style.background = "rgba(91,91,91,0.8)";
        box.style.marginLeft = (count * -700) + "px";
        setTimeout(function() {
            if (count > box.children.length - 2) {
                count = 0;
                box.className = "box_big";
                box.style.marginLeft = "0px"
            }
        }, 10000)
    }
</script>
</body>
</html>
