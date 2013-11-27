<%!

public class CookieManager {
  
  private HttpServletResponse response;
  private HttpServletRequest request;

  public CookieManager(HttpServletRequest request, HttpServletResponse response) {
    this.request = request;
    this.response = response;
  }

  public Cookie getCookie(String key) {
    for(Cookie c : request.getCookies() ) {
      if(c.getName().equals(key))
        return c;
    }
    return null;
  }

  public String get(String key, String def) {
    Cookie c = this.getCookie(key);
    return c == null ? def : c.getValue();
  }

  public String get(String key) {
    return this.get(key, null);
  }

  public void add(Cookie c) {
    response.addCookie(c);
  }

  public void add(String key, String value, int sec) {
    Cookie c = new Cookie(key, value);
    c.setMaxAge(sec);
    this.add(c);
  }

  public void add(String key, String value) {
    this.add(key, value, 3600);
  }

  public void remove(String key) {
    this.add(key, null, 0);
  }
}

%>