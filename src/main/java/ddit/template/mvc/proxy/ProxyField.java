package ddit.template.mvc.proxy;

import java.lang.reflect.Proxy;

public class ProxyField {
    Hello proxiedHello=(Hello) Proxy.newProxyInstance(
            getClass().getClassLoader(),
            new Class[]{Hello.class},
            new InvokeHandler(new HelloImpl())
    );

    public Hello getProxiedHello(){
        return proxiedHello;
    }
}
