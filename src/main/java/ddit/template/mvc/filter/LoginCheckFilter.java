package ddit.template.mvc.filter;

import lombok.NoArgsConstructor;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@NoArgsConstructor
public class LoginCheckFilter extends GenericFilterBean {
    boolean login;

    public LoginCheckFilter(boolean login) {
        this.login = login;
    }


    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest=(HttpServletRequest)request;
        HttpSession session = httpRequest.getSession(false);
        boolean login = false;
        if (session != null) {
            if (session.getAttribute("MEMBER") != null) {
                login = true;
            }
        }
        if (login) {
            chain.doFilter(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/loginform.jsp");
            dispatcher.forward(request, response);
        }
    }
}
