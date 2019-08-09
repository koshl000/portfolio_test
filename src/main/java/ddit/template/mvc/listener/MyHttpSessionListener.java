package ddit.template.mvc.listener;

import ddit.template.security.handler.LoginSuccessHandler;
import org.springframework.beans.BeansException;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MyHttpSessionListener implements HttpSessionListener {
    private String temp;

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("세션 생성 : "+ se.getSession().getId());
        temp=String.valueOf(System.currentTimeMillis());
        se.getSession().setAttribute("id",temp);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        WebApplicationContext context=WebApplicationContextUtils.getWebApplicationContext(se.getSession().getServletContext());
        try {
            LoginSuccessHandler login=(LoginSuccessHandler) context.getBean("logined");
        } catch (BeansException e) {
            e.printStackTrace();
        }
        System.out.println("세션 파괴");
    }
}
