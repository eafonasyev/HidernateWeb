package com.eafonasyev.springcourse.entity;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "instractor")
public class Instractor {

    public Instractor() {
    }

    public Instractor(String firstName, String lastName, String email) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "instractor_detail_id")
    private InstractorDetail instractorDetailId;

    @OneToMany(mappedBy = "instractorId",
               fetch = FetchType.LAZY,
               cascade = {CascadeType.REFRESH,CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST})
    private List<Courses> courses;

    public List<Courses> getCourses() {
        return courses;
    }

    public void setCourses(List<Courses> courses) {
        this.courses = courses;
    }

    public void add(Courses courses){
        if(this.courses == null){
            this.courses = new ArrayList<>();
        }
        this.courses.add(courses);
        courses.setInstractorId(this);

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public InstractorDetail getInstractorDetailId() {
        return instractorDetailId;
    }

    public void setInstractorDetailId(InstractorDetail instractorDetailId) {
        this.instractorDetailId = instractorDetailId;
    }
}
