package com.sh.guys.convenience.model.entity;

public class Convenience {
    private String no;
    private String kind;
    private String conveniencePic;

    public Convenience() {
    }

    public Convenience(String no, String kind, String conveniencePic) {
        this.no = no;
        this.kind = kind;
        this.conveniencePic = conveniencePic;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public String getConveniencePic() {
        return conveniencePic;
    }

    public void setConveniencePic(String conveniencePic) {
        this.conveniencePic = conveniencePic;
    }

    @Override
    public String toString() {
        return "convenience{" +
                "no='" + no + '\'' +
                ", kind='" + kind + '\'' +
                ", conveniencePic='" + conveniencePic + '\'' +
                '}';
    }
}