package com.eafonasyev.springcourse.entity;

import javax.persistence.*;

@Entity
@Table(name = "instractor_detail")
public class InstractorDetail {

    public InstractorDetail() {
    }

    public InstractorDetail(String hobby, String youtube) {
        this.hobby = hobby;
        this.youtube = youtube;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "hobby")
    private String hobby;

    @Column(name = "youtube")
    private String youtube;

    @OneToOne(mappedBy = "instractorDetailId",cascade = {
            CascadeType.REFRESH,
            CascadeType.DETACH,
            CascadeType.MERGE,
            CascadeType.REFRESH})
    private Instractor instractor;

    public Instractor getInstractor() {
        return instractor;
    }

    public void setInstractor(Instractor instractor) {
        this.instractor = instractor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getYoutube() {
        return youtube;
    }

    public void setYoutube(String youtube) {
        this.youtube = youtube;
    }
}
