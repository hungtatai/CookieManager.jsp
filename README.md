CookieManager.jsp
=================

easy to manage cookie on jsp (Servlet)

## Usage


```java

  <%@include file = "lib/CookieManager.jsp"%>
  <%
    CookieManager cm = new CookieManager(request, response);
    
    // add a cookie
    cm.add("hello", "world");
    
    // get value by key
    out.println(cm.get("hello", "hihi") + "<br />");
    
    // get value by key (or get default value)
    out.println(cm.get("name", "default name") + "<br />");
    
    // max age = 60 sec
    cm.add("test", "val", 60);
    
    // get cookie by key
    Cookie test = cm.getCookie("test");
    
    // cm.remove("hello");
  %>
```
