package ru.astronarh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import ru.astronarh.model.Cell;
import ru.astronarh.service.CellService;

@Controller
public class CellController {

    @Autowired
    CellService cellService;

    @RequestMapping(value = "/getAllCell", method = RequestMethod.GET, headers = "Accept=application/json")
    public String getCell(Model model) {

        List<Cell> listOfCell = cellService.getAllCell();
        model.addAttribute("cell", new Cell());
        model.addAttribute("listOfCell", listOfCell);
        return "cellDetails";
    }

    @RequestMapping(value = "/getCell/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public Cell getCellById(@PathVariable int id) {
        return cellService.getCell(id);
    }

    @RequestMapping(value = "/addCell", method = RequestMethod.POST, headers = "Accept=application/json")
    public String addCell(@ModelAttribute("cell") Cell cell) {
        if(cell.getId()==0)
        {
            cellService.addCell(cell);
        }
        else
        {
            cellService.updateCell(cell);
        }

        return "redirect:/getAllCell";
    }

    @RequestMapping(value = "/updateCell/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public String updateCell(@PathVariable("id") int id,Model model) {
        model.addAttribute("cell", this.cellService.getCell(id));
        model.addAttribute("listOfCell", this.cellService.getAllCell());
        return "cellDetails";
    }

    @RequestMapping(value = "/deleteCell/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public String deleteCell(@PathVariable("id") int id) {
        cellService.deleteCell(id);
        return "redirect:/getAllCell";

    }
}
