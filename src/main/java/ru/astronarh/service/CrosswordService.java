package ru.astronarh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.astronarh.dao.CrosswordDAO;
import ru.astronarh.model.Crossword;

import java.util.List;

@Service("crosswordService")
public class CrosswordService {

    @Autowired
    CrosswordDAO crosswordDAO;

    @Transactional
    public void addCrossword(Crossword crossword) {
        crosswordDAO.addCrossword(crossword);
    }

    @Transactional
    public Crossword getCrossword(int id) {
        return crosswordDAO.getCrossword(id);
    }

    @Transactional
    public List<Crossword> getAllCrossword() {
        return crosswordDAO.getAllCrossword();
    }

    @Transactional
    public void deleteCrossword(int id) {
        crosswordDAO.deleteCrossword(id);
    }
}
