package com.eafonasyev.springcourse.entity;

import javax.persistence.*;
import javax.print.attribute.standard.MediaSize;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "cources")
public class Courses {

    public Courses(){

    }
    public Courses(String title) {
        this.title = title;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "title")
    private String title;

    @ManyToOne(cascade = {CascadeType.REFRESH,CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST})
    @JoinColumn(name = "instractor_id")
    private Instractor instractorId;

    @OneToMany(cascade = CascadeType.ALL,
               fetch = FetchType.LAZY)
    @JoinColumn(name = "courses_id")
    private List<Review> reviews;

    public void  add(Review reviews){
        if(this.reviews == null)
            this.reviews = new ArrayList<>();
        this.reviews.add(reviews);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Instractor getInstractorId() {
        return instractorId;
    }

    public void setInstractorId(Instractor instractorId) {
        this.instractorId = instractorId;
    }

    @Override
    public String toString() {
        return "Courses{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", instractorId=" + instractorId +
                '}';
    }
}
