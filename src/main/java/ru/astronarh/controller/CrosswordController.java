package ru.astronarh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CrosswordController {

    @RequestMapping("/")
    public String indexController(Model model) {
        model.addAttribute("", "");
        return "index";
    }
}
