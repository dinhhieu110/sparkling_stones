package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

import dao.UserDAO;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter extends HttpFilter implements Filter {
       
    /**
     * @see HttpFilter#HttpFilter()
     */
    public LoginFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;

		String url = httpRequest.getServletPath();

		HttpSession session = httpRequest.getSession();
		User user = (User) session.getAttribute("user");

		if (user == null) {
			String email = null;
			String password = null;
			Cookie cookies[] = httpRequest.getCookies();
			if (cookies != null) {
				for (Cookie cookie : cookies) {
					String cookieName = cookie.getName();
					if (cookieName.equals("userC")) {
						email = cookie.getValue();
					}
					if (cookieName.equals("passC")) {
						password = cookie.getValue();
					}
				}
			}

			if (email != null && password != null) {
				UserDAO dao = new UserDAO();
				user = dao.getUserByEmail(email);

				if (password.equals(user.getPassword())) {
					session.setAttribute("user", user);
				}

				dao.close();
			}
		} else {
			if (url.endsWith("login") || url.endsWith("register")) {
				httpResponse.sendRedirect(httpRequest.getContextPath());
			}
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
