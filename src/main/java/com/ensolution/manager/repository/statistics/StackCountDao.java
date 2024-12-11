package com.ensolution.manager.repository.statistics;

import com.ensolution.manager.domain.statistics.StackCountDto;

import java.util.List;

public interface StackCountDao {
  List<StackCountDto> stackCntAll();

  List<StackCountDto> stackCntNonComplete();

  List<StackCountDto> stackCntAllOfWp(List<Integer> workplace_ids);

  List<StackCountDto> stackCntNonCompleteOfWp(List<Integer> workplace_ids);
}
