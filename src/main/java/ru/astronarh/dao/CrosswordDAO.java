package ru.astronarh.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.astronarh.model.Crossword;

import java.util.List;

@Repository
public class CrosswordDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public void addCrossword(Crossword crossword) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(crossword);
    }

    public Crossword getCrossword(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        return (Crossword) session.get(Crossword.class, id);
    }

    public List<Crossword> getAllCrossword() {
        Session session = this.sessionFactory.getCurrentSession();
        return (List<Crossword>) session.createCriteria(Crossword.class).list();
    }

    public void deleteCrossword(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Crossword crossword = (Crossword) session.load(Crossword.class, id);
        if (null != crossword) session.delete(crossword);
    }
}
