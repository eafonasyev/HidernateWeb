package com.eafonasyev.springcourse.entity;

import javax.persistence.*;

@Entity
@Table(name = "review")
public class Review {

    public Review(){};

    public Review(String comments) {
        this.comments = comments;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "comments")
    private String comments;

    @ManyToOne
    @JoinColumn(name = "courses_id")
    private Courses coursesId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public Courses getCoursesId() {
        return coursesId;
    }

    public void setCoursesId(Courses coursesId) {
        this.coursesId = coursesId;
    }

    @Override
    public String  toString() {
        return "Review{" +
                "id=" + id +
                ", comments='" + comments + '\'' +
                ", coursesId=" + coursesId +
                '}';
    }
}
