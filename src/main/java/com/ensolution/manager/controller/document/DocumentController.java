package com.ensolution.manager.controller.document;

import com.ensolution.manager.service.pollutant.PollutantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/document")
public class DocumentController {
  PollutantService pollutantService;

  @Autowired
  public DocumentController(PollutantService pollutantService) {
    this.pollutantService = pollutantService;
  }

  @GetMapping("/abilityScore")
  public String abilityScore(Model m) {
    m.addAttribute("pollutants", pollutantService.getPollutantList());
    m.addAttribute("pollutantCount", pollutantService.getPollutantCount());
    return "document/abilityScore";
  }
}
