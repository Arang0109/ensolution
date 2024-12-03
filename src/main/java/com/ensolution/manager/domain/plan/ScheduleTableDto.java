package com.ensolution.manager.domain.plan;

import java.util.Date;
import java.util.Objects;

public class ScheduleTableDto {
  private String schedule_ids;
  private Integer team_id;
  private Integer stack_measurement_id;
  private String workplace_name;
  private String stack_name;
  private Integer stack_id;
  private String pollutants;
  private String team_name;
  private Date measure_date;
  private Boolean is_completed;

  public ScheduleTableDto() {}

  public ScheduleTableDto(String schedule_ids, Integer team_id, Integer stack_measurement_id,
                          String workplace_name, String stack_name, String pollutants, String team_name,
                          Integer stack_id, Date measure_date, Boolean is_completed) {
    this.schedule_ids = schedule_ids;
    this.team_id = team_id;
    this.stack_measurement_id = stack_measurement_id;
    this.workplace_name = workplace_name;
    this.stack_name = stack_name;
    this.stack_id = stack_id;
    this.pollutants = pollutants;
    this.team_name = team_name;
    this.measure_date = measure_date;
    this.is_completed = is_completed;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    ScheduleTableDto that = (ScheduleTableDto) o;
    return Objects.equals(schedule_ids, that.schedule_ids) && Objects.equals(stack_measurement_id, that.stack_measurement_id);
  }

  @Override
  public int hashCode() {
    return Objects.hash(schedule_ids, stack_measurement_id);
  }

  public String getSchedule_ids() {
    return schedule_ids;
  }

  public void setSchedule_ids(String schedule_ids) {
    this.schedule_ids = schedule_ids;
  }

  public Integer getTeam_id() {
    return team_id;
  }

  public void setTeam_id(Integer team_id) {
    this.team_id = team_id;
  }

  public Integer getStack_measurement_id() {
    return stack_measurement_id;
  }

  public void setStack_measurement_id(Integer stack_measurement_id) {
    this.stack_measurement_id = stack_measurement_id;
  }

  public String getWorkplace_name() {
    return workplace_name;
  }

  public void setWorkplace_name(String workplace_name) {
    this.workplace_name = workplace_name;
  }

  public String getStack_name() {
    return stack_name;
  }

  public void setStack_name(String stack_name) {
    this.stack_name = stack_name;
  }

  public Integer getStack_id() {
    return stack_id;
  }

  public void setStack_id(Integer stack_id) {
    this.stack_id = stack_id;
  }

  public String getPollutants() {
    return pollutants;
  }

  public void setPollutants(String pollutants) {
    this.pollutants = pollutants;
  }

  public String getTeam_name() {
    return team_name;
  }

  public void setTeam_name(String team_name) {
    this.team_name = team_name;
  }

  public Date getMeasure_date() {
    return measure_date;
  }

  public void setMeasure_date(Date measure_date) {
    this.measure_date = measure_date;
  }

  public Boolean getIs_completed() {
    return is_completed;
  }

  public void setIs_completed(Boolean is_completed) {
    this.is_completed = is_completed;
  }

  @Override
  public String toString() {
    return "ScheduleTableDto{" +
        "schedule_ids='" + schedule_ids + '\'' +
        ", team_id=" + team_id +
        ", stack_measurement_id=" + stack_measurement_id +
        ", workplace_name='" + workplace_name + '\'' +
        ", stack_name='" + stack_name + '\'' +
        ", stack_id=" + stack_id +
        ", pollutants='" + pollutants + '\'' +
        ", team_name='" + team_name + '\'' +
        ", measure_date=" + measure_date +
        ", is_completed=" + is_completed +
        '}';
  }
}
