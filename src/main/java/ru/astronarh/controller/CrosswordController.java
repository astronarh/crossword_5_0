package ru.astronarh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.astronarh.model.Cell;
import ru.astronarh.model.Cells;
import ru.astronarh.model.Crossword;
import ru.astronarh.model.User;
import ru.astronarh.service.CellService;
import ru.astronarh.service.CrosswordService;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
public class CrosswordController {

    @Autowired
    CellService cellService;

    @Autowired
    CrosswordService crosswordService;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setAutoGrowCollectionLimit(1024);
    }

    @RequestMapping("/")
    public String indexController() {
        return "index";
    }

    @RequestMapping("/about")
    public String aboutController() {
        return "about";
    }

    @RequestMapping("/login")
    public String loginPage() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView loginController(@ModelAttribute(value = "user")String user, @ModelAttribute(value = "login")String login) {
        ModelAndView model = new ModelAndView();
        model.setViewName("login");
        System.out.println(user + " " + login);
        return model;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView createController(@RequestParam(value = "column", required = false) String column, @RequestParam(value = "lines", required = false) String lines) {
        ModelAndView model = new ModelAndView();
        model.setViewName("create");
        List<Integer> horizontal = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        List<Integer> vertical = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        model.addObject("horizontal", horizontal);
        model.addObject("vertical", vertical);
        if (column != null && lines != null) {
            model.addObject("column", IntStream.range(0, Integer.parseInt(column)).boxed().collect(Collectors.toList()));
            model.addObject("lines", IntStream.range(0, Integer.parseInt(lines)).boxed().collect(Collectors.toList()));
        }
        return model;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView saveController(@ModelAttribute(value = "cells")Cells cells, @ModelAttribute(value = "size")String size) {
        ModelAndView model = new ModelAndView();
        model.setViewName("create");
        List<Integer> horizontal = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        List<Integer> vertical = IntStream.range(1, 20).boxed().collect(Collectors.toList());
        model.addObject("horizontal", horizontal);
        model.addObject("vertical", vertical);
        int rows = Integer.parseInt(size.split(" ")[1]);
        int columns = Integer.parseInt(size.split(" ")[0]);
        int lasId = 0;
        try { lasId = cellService.lastId(); } catch (Exception e) { e.fillInStackTrace(); }
        Crossword crossword = new Crossword(rows, columns, lasId + 1, lasId + (rows * columns));
        crosswordService.addCrossword(crossword);
        cells.getCells().forEach(x -> cellService.addCell(x));
        return model;
    }

    @RequestMapping(value = "/crossword/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public ModelAndView loadCrossword(@PathVariable int id) {
        ModelAndView model = new ModelAndView();
        model.setViewName("crossword");
        Crossword crossword = crosswordService.getCrossword(id);
        List<Cell> allCell = cellService.getAllCell();
        //List<Cell> cellListList = allCell.stream().skip(crossword.getIdBegin() - 1).limit(crossword.getIdEnd()).collect(Collectors.toList());
        List<Cell> cellListList = new ArrayList<>();
        allCell.forEach(x -> { if (x.getId() >= crossword.getIdBegin() && x.getId() <= crossword.getIdEnd()) cellListList.add(x); });
        Cell[][] cells = new Cell[crossword.getRows()][crossword.getColumns()];
        int counter = 0;
        for (int i = 0; i < crossword.getRows(); i++) {
            for (int j = 0; j < crossword.getColumns(); j++) {
                cells[i][j] = cellListList.get(counter++);
            }
        }
        model.addObject("cells", cells);
        model.addObject("cellList", cellListList);
        model.addObject("crossword", crossword);
        return model;
    }

    @RequestMapping("/crossword")
    public ModelAndView crosswordController(@RequestParam(required = false) Integer page) {
        ModelAndView model = new ModelAndView();
        model.setViewName("crossword");
        List<Crossword> crosswordList = crosswordService.getAllCrossword();
        //model.addObject("crosswordList", crosswordList);

        PagedListHolder<Crossword> pagedListHolder = new PagedListHolder<>(crosswordList);
        pagedListHolder.setPageSize(10);
        model.addObject("maxPages", pagedListHolder.getPageCount());
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()) page = 1;
        model.addObject("page", page);
        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            model.addObject("crosswordList", pagedListHolder.getPageList());
        }
        else if(page <= pagedListHolder.getPageCount()) {
            pagedListHolder.setPage(page-1);
            model.addObject("crosswordList", pagedListHolder.getPageList());
        }

        return model;
    }

    @RequestMapping(value = "/crosswordDelete/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public ModelAndView crosswordDelete(@PathVariable int id) {
        ModelAndView model = new ModelAndView();
        model.setViewName("redirect:/crossword");
        Crossword crossword = crosswordService.getCrossword(id);
        for (int i = crossword.getIdBegin(); i <= crossword.getIdEnd(); i++) cellService.deleteCell(i);
        crosswordService.deleteCrossword(id);
        return model;
    }
}
