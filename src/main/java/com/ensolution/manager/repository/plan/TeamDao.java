package com.ensolution.manager.repository.plan;

import com.ensolution.manager.domain.plan.TeamDto;

import java.util.List;

public interface TeamDao {
  TeamDto select(Integer team_id);

  List<TeamDto> selectAll();

  int insert(TeamDto team);

  int update(TeamDto team);

  int deleteItems(List<Integer> team_ids);
}
