package com.eafonasyev.springcourse;


import com.eafonasyev.springcourse.entity.InstractorDetail;
import com.eafonasyev.springcourse.entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class TestJdbc {
    public static void main(String[] args) {

     SessionFactory factory = new Configuration().
                 configure("hibernate.cfg.xml").
                 addAnnotatedClass(Instractor.class).
                 addAnnotatedClass(InstractorDetail.class).
                 addAnnotatedClass(Courses.class).
                 addAnnotatedClass(Review.class).
                 buildSessionFactory();

     Session session = factory.getCurrentSession();

        try {

            session.beginTransaction();
            int id = 22;

            Courses courses = session.get(Courses.class,id);


            session.delete(courses);


            session.getTransaction().commit();
            System.out.println("Done!!!");

        } catch (Exception e) {
            System.out.println("error: " + e);
            e.printStackTrace();
        }
        finally {
            session.close();
            factory.close();
        }
    }
}
