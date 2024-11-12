package com.ensolution.manager.domain;

import java.time.LocalDate;
import java.util.Date;
import java.util.Objects;

public class StackDto {
  private Integer stack_id;
  private Integer workplace_id;
  private String stack_name;
  private Date reg_date;
  private String note;

  public StackDto() {
    this.reg_date = java.sql.Date.valueOf(LocalDate.now());
  }

  public StackDto(Integer stack_id, Integer workplace_id, String stack_name, Date reg_date) {
    this.stack_id = stack_id;
    this.workplace_id = workplace_id;
    this.stack_name = stack_name;
    this.reg_date = reg_date;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;
    StackDto stackDto = (StackDto) o;
    return Objects.equals(stack_id, stackDto.stack_id) && Objects.equals(stack_name, stackDto.stack_name);
  }

  @Override
  public int hashCode() {
    return Objects.hash(stack_id, stack_name);
  }

  public Integer getStack_id() {
    return stack_id;
  }

  public void setStack_id(Integer stack_id) {
    this.stack_id = stack_id;
  }

  public Integer getWorkplace_id() {
    return workplace_id;
  }

  public void setWorkplace_id(Integer workplace_id) {
    this.workplace_id = workplace_id;
  }

  public String getStack_name() {
    return stack_name;
  }

  public void setStack_name(String stack_name) {
    this.stack_name = stack_name;
  }

  public Date getReg_date() {
    return reg_date;
  }

  public void setReg_date(Date reg_date) {
    this.reg_date = reg_date;
  }

  public String getNote() {
    return note;
  }

  public void setNote(String note) {
    this.note = note;
  }

  @Override
  public String toString() {
    return "StackDto{" +
        "stack_id=" + stack_id +
        ", workplace_id=" + workplace_id +
        ", stack_name='" + stack_name + '\'' +
        ", reg_date=" + reg_date +
        ", note='" + note + '\'' +
        '}';
  }
}