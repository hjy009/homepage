<%@ taglib prefix="ww" uri="webwork" %>
<%@ page import="java.util.*"%>
<%@ page import="cn.com.netmovie.util.*"%>
<%
List imageList = (List)request.getAttribute("imageList");
Pagination pageUtil = (Pagination)request.getAttribute("pages");
List list = (List)pageUtil.getList();
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="keywords" content="新华昌集团有限公司" />
<meta name="description" content="新华昌集团有限公司" />
<meta name="author" content="yellow" />
<title>新华昌集团有限公司-搜索</title>
<link rel="stylesheet" type="text/css" href="/chinese/css/style.css" />
<!--[if lte IE 6]>
<SCRIPT src="../js/iepng.js" type="text/javascript"></SCRIPT>
 <![endif]-->
<SCRIPT src="/chinese/js/tab.js" type="text/javascript"></SCRIPT>
</head>
<body>
<div class="footbg">
<div class="wrap">
  <jsp:include flush="true" page="/chinese/head.jsp"></jsp:include>
  <!-- nav -->
  <div class="nav">
    <ul class="navlist">
      <li style="width:80px;" ><a href="/chinese/index.do" class="ahome">首页</a></li>
      <li ><a href="/chinese/introWeb.do">新华昌简介</a></li>
      <li ><a href="/chinese/cultureWeb.do?id=29">企业文化</a></li>
      <li><a href="/chinese/queryQiyeNews.do">新闻中心</a></li>
      <li ><a href="/chinese/queryEmployess.do">员工与招聘</a></li>
      <li  class="hover"><a href="/chinese/queryProduct.do?categoryId=1">产品与客户</a></li>
      <li class="nobg" ><a href="/chinese/queryModelContact.do">联系我们</a></li>
    </ul>
    <div class="cls"></div>
  
    <div class="subnav">
    <a href="/chinese/queryProduct.do?categoryId=1">主要产品</a>      
    <a href="/chinese/queryCategoryById.do?categoryId=11">主要客户</a>      
  
    </div>
    
    
   <jsp:include flush="true" page="/chinese/time.jsp"></jsp:include>
  </div>
  <!-- nav end -->
  
  <div class="mban">
    <%if(imageList!=null&&imageList.size()>0){
				Map imageMap = (Map)imageList.get(0);
			%> 
				 <img src="/<%=imageMap.get("path")%>" width="990" height="245" />
				 <%if(imageMap.get("link")!=null&&((String)imageMap.get("link")).length()>0){%>
	  				<a href="<%=imageMap.get("link")%>" target="_blank"><img src="/chinese/images/columnLink.gif" width="990" height="245" /></a>
				<%}%>
	<%}%>		
   </div>
  
  
  <!-- main -->
  <div class="mmain">
  		<div class="mleft">
            <h2>
            	<span class="sp_t1">产品与客户</span>
                <span class="sp_t2">PRODUCTS AND CUSTOMER</span>
            </h2>
            
            <div class="mleftbox">
            	<ul class="leftlist">
               
                    	<li class="hover"><a href="#">主要产品</a>
                        
                        		<ul>
                                	<li class="hover"><a href="/chinese/queryProduct.do?categoryId=1">国际标准集装箱</a></li> 
									<li ><a href="/chinese/querySpeciaIndex.do?categoryId=4">特种干货集装箱</a></li>  
									<li ><a href="/chinese/queryPottypeIndex.do?categoryId=10">罐式集装箱</a></li> 
                                
                                </ul>
                        
                        
                        </li>
                        <li><a href="/chinese/queryCategoryById.do?categoryId=11&productName=船运公司">主要客户</a></li>
                     			
                				
                </ul>
            
            </div>
            
           <div class="leftad"><a href="#"><img src="/chinese/images/mleft1.png" width="291" height="90" /></a></div>
            
            <div class="leftad"><a href="#"><img src="/chinese/images/mleft2.png" width="291" height="90" /></a></div>
        
      </div>
    
    
    <!-- mright -->
    	<div class="mright">
        		 <div class="curr">
                 	您的位置-<a href="#">主要产品</a>-国际标准集装箱
                 
                 </div>
                 
                 <div class="mtitle">
                 	<h2> 国际标准集装箱</h2><span>INTERNATIONAL STANDARD CONTAINER</span>
                 </div>
                 
                 
                 <div class="mcon2">
                      <ul class="prolist">
                       <%if(list!=null&&list.size()>0){%>
			  				<%for(int i=0;i<list.size();i++){
								Map map = (Map)list.get(i);
							%>
                      	<li <%if(i!=0&&i%2==0) {%> class="noright" <%=i%><%} %>>
                        <p class="pimg"><a href="/chinese/queryProductById.do?productId=<%=map.get("id") %>"><img src="/<%=map.get("small_image") %>" width="187" height="121" /></a></p> 
                        
                        <p class="plist"><a href="/chinese/queryProductById.do?productId=<%=map.get("id") %>"><%=map.get("name") %></a></p>
                        </li>
                      	<%} %> 
                      <%} %>  
                        
                      
                      </ul>
                      <div class="cls"></div>
                      
                      
                      <div class="pages">
                      
                      <%if(pageUtil.getPageNumber()<2){%><a class="fanye fyover">上一页</a><%}else{%><a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)" >上一页</a><%}%>
	 						<%if((pageUtil.getPageNumber()-2)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-2%>)"><%=pageUtil.getPageNumber()-2%></a>
	 						<%}%>&nbsp;<%if((pageUtil.getPageNumber()-1)>=1){%>
	 						<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()-1%>)"><%=pageUtil.getPageNumber()-1%></a>
	 						<%}%>
							<%=pageUtil.getPageNumber()%>
							<%if((pageUtil.getPageNumber()+1)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)"><%=pageUtil.getPageNumber()+1%></a><%}%>
							&nbsp;<%if((pageUtil.getPageNumber()+2)<=pageUtil.getPageCount()){%>
							<a class="bl" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+2%>)"><%=pageUtil.getPageNumber()+2%></a><%}%>
                                
                                <!--下一页-->	
	 					<%if(pageUtil.getPageCount()<pageUtil.getPageNumber()+1){%>
	 					<a class="fanye fyover" >下一页</a><%}else{%>
	 					<a  class="fanye" href="javascript:gotoPage(<%=pageUtil.getPageNumber()+1%>)" >下一页</a>
	 					<%}%> 
	 					总<%=pageUtil.getTotalCount()%>条  当前<%=pageUtil.getPageNumber()%>/<%=pageUtil.getPageCount()%>页
                      
                  
                      </div>
                      
                      
                 </div>
        
        </div>
    <!-- mright end -->
    
    
  </div>
  <!-- main end -->
  <!-- foot -->
  <jsp:include flush="true" page="/chinese/foot.jsp"></jsp:include>
  <!-- foot end -->
  
  
</div>
</div>
</body>
</html>
