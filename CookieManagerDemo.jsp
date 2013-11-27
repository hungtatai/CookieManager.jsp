
<%@include file = "lib/CookieManager.jsp"%>
<%
  CookieManager cm = new CookieManager(request, response);
  
  cm.add("hello", "world");
  out.println(cm.get("hello", "hihi") + "<br />");
  out.println(cm.get("name", "default name") + "<br />");

  // cm.remove("hello");
%>