
<%@page import = "java.util.*"%>

<%!

public class CookieManager {
	
	private HttpServletResponse response;
  	private HttpServletRequest request;

  	private ArrayList<javax.servlet.http.Cookie> cookies;

	public CookieManager(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.cookies = new ArrayList<javax.servlet.http.Cookie>();
		
		for(javax.servlet.http.Cookie c : request.getCookies() ) 
			this.cookies.add(c);
	}

	public javax.servlet.http.Cookie getCookie(String key) {
		/*if(request.getCookies() == null)
			return null;*/
		for(javax.servlet.http.Cookie c : this.cookies ) {
			if(c.getName().equals(key))
				return c;
		}
		return null;
	}

	public String get(String key, String def) {
		javax.servlet.http.Cookie c = this.getCookie(key);
		return c == null ? def : c.getValue();
	}

	public String get(String key) {
		return this.get(key, null);
	}

	public void add(javax.servlet.http.Cookie c) {
		response.addCookie(c);
		this.cookies.add(c);
	}

	public void add(String key, String value, int sec) {
		javax.servlet.http.Cookie c = new javax.servlet.http.Cookie(key, value);
		c.setMaxAge(sec);
		this.add(c);
	}

	public void add(String key, String value) {
		this.add(key, value, 3600);
	}

	public void update(String key, String value) {
		this.remove(key);
		this.add(key, value);
	}

	public void remove(String key) {
		this.add(key, null, 0);
		try {
			Iterator<javax.servlet.http.Cookie> iter = this.cookies.iterator();  
	        while (iter.hasNext()) {
	        	javax.servlet.http.Cookie c = iter.next();
	        	if(c.getName().equals(key)) {
					iter.remove();
				} 
	        } 
	    } catch(ConcurrentModificationException cmfe) {
	    	// do nothing
	    }
	}
}

%>