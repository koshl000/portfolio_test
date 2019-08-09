package ddit.template.mvc.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class InvokeHandler implements InvocationHandler {
    Hello target;

    public InvokeHandler(Hello target){
        this.target=target;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        if(method.getName().startsWith("sayHello")){
            String rt=(String) method.invoke(target,args);
            return rt+("Hello".length());
        }
        if(method.getName().startsWith("Hi")){
            String rt=(String) method.invoke(target,args);
            return rt+("Hi".length());
        }
        return null;
    }
}
