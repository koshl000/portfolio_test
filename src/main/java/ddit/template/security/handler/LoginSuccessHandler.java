package ddit.template.security.handler;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletRequest.getSession().setAttribute("id",authentication.getPrincipal());
        for(GrantedAuthority au:authentication.getAuthorities()){
            if(au.getAuthority().equals("ROLE_MEMBER")){
                httpServletResponse.sendRedirect("/sample/member");
            }
            else {
                httpServletResponse.sendRedirect("/sample/admin");
            }
        }
    }
}
