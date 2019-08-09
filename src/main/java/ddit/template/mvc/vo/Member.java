package ddit.template.mvc.vo;

public class Member {
    private String name;
    private String location;
    private String hobby;

    public Member(String name){
        this(name,"출신지역 비공개","취미 비공개");
    }
    public Member(String name,String location){
        this(name,location,"취미 비공개");
    }
    public Member(String name,String location,String hobby){
        this.name=name;
        this.location=location;
        this.hobby=hobby;
    }
}
