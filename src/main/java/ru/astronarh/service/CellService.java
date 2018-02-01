package ru.astronarh.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.astronarh.dao.CellDAO;
import ru.astronarh.model.Cell;

import java.util.List;

@Service("cellService")
public class CellService {

    @Autowired
    CellDAO cellDao;

    @Transactional
    public List<Cell> getAllCell() {
        return cellDao.getAllCell();
    }

    @Transactional
    public Cell getCell(int id) {
        return cellDao.getCell(id);
    }

    @Transactional
    public void addCell(Cell cell) {
        cellDao.addCell(cell);
    }

    @Transactional
    public void updateCell(Cell cell) {
        cellDao.updateCell(cell);

    }

    @Transactional
    public void deleteCell(int id) {
        cellDao.deleteCell(id);
    }
}
