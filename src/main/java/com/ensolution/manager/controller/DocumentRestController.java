package com.ensolution.manager.controller;

import com.ensolution.manager.domain.PollutantDto;
import com.ensolution.manager.service.CalService;
import com.ensolution.manager.service.PollutantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/document")
public class DocumentRestController {
  PollutantService pollutantService;
  CalService calService;

  @Autowired
  public DocumentRestController(PollutantService pollutantService, CalService calService) {
    this.pollutantService = pollutantService;
    this.calService = calService;
  }

  @PostMapping("/abilityScore")
  public ResponseEntity<Map<String, Object>> calScore(@RequestBody List<PollutantDto> pollutantDto, Model m) {
    List<PollutantDto> pollutants = new ArrayList<>();

    for (PollutantDto p : pollutantDto) {
      pollutants.add(pollutantService.getPollutant(p.getPollutant_id()));
    }

    Double score = calService.abilityScoreCal(pollutants);

    Map<String, Object> response = new HashMap<>();
    response.put("score", score);

    return ResponseEntity.ok(response);
  }
}
