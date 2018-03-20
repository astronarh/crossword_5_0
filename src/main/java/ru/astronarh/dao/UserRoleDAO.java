package ru.astronarh.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.astronarh.model.UserRoles;

@Repository
public class UserRoleDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
        this.sessionFactory = sf;
    }

    public UserRoles addUserRole(UserRoles userRoles) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(userRoles);
        return userRoles;
    }

    public UserRoles getUserRole(int id) {
        return null;
    }

    public boolean deleteUserRole(int id) {
        return false;
    }
}
