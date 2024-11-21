package com.ensolution.manager.controller.document;

import com.ensolution.manager.domain.pollutant.PollutantDto;
import com.ensolution.manager.service.document.CalService;
import com.ensolution.manager.service.pollutant.PollutantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
  public ResponseEntity<Map<String, Object>> calScore(@RequestBody List<PollutantDto> pollutantDto) {
    List<PollutantDto> pollutants = new ArrayList<>();

    for (PollutantDto p : pollutantDto) {
      pollutants.add(pollutantService.getPollutant(p.getPollutant_id()));
    }

    Map map = calService.abilityScoreCal(pollutants);

    Map<String, Object> response = new HashMap<>();
    response.put("score", map.get("score"));

    return ResponseEntity.ok(response);
  }
}
