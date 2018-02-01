package ru.astronarh.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.astronarh.model.Cell;

import java.util.List;

@Repository
public class CellDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public List<Cell> getAllCell() {
        Session session = this.sessionFactory.getCurrentSession();
        //List<Cell> cellList = session.createQuery("from Cell").list();

        //List<Products> list = session.createCriteria(Products.class).list();

        return (List<Cell>) session.createCriteria(Cell.class).list();
    }

    public Cell getCell(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Cell cell = (Cell) session.get(Cell.class, new Integer(id));
        return cell;
    }

    public Cell addCell(Cell cell) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(cell);
        return cell;
    }

    public void updateCell(Cell cell) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(cell);
    }

    public void deleteCell(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Cell p = (Cell) session.load(Cell.class, new Integer(id));
        if (null != p) {
            session.delete(p);
        }
    }
}
