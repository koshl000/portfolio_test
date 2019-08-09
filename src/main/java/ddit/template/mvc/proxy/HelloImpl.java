package ddit.template.mvc.proxy;

public class HelloImpl implements Hello {
    @Override
    public String sayHello(String str) {
        return str+" Hello!";
    }

    @Override
    public String sayHi(String str) {
        return str+" Hi!";
    }
}
