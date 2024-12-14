package com.ensolution.manager.domain.stack;

import java.time.LocalDate;
import java.sql.Date;
import java.util.Objects;

public class StackDto {
  private Integer stack_id;
  private Integer workplace_id;
  private Integer company_id;
  private String company_name;
  private String workplace_name;
  private String stack_name;
  private String prevention;
  private Date reg_date;
  private String note;
  private Integer sub_factory_id;
  private Integer management_department_id;
  private String sub_factory_name;
  private String department_name;

  public StackDto() {
    this.reg_date = Date.valueOf(LocalDate.now());
  }

  public StackDto(Integer stack_id, Integer workplace_id, Integer company_id, String company_name,
                  String workplace_name, String stack_name, String prevention, Date reg_date,
                  String note, Integer sub_factory_id, Integer management_department_id,
                  String sub_factory_name, String department_name) {
    this.stack_id = stack_id;
    this.workplace_id = workplace_id;
    this.company_id = company_id;
    this.company_name = company_name;
    this.workplace_name = workplace_name;
    this.stack_name = stack_name;
    this.prevention = prevention;
    this.reg_date = reg_date;
    this.note = note;
    this.sub_factory_id = sub_factory_id;
    this.management_department_id = management_department_id;
    this.sub_factory_name = sub_factory_name;
    this.department_name = department_name;
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

  public Integer getCompany_id() {
    return company_id;
  }

  public void setCompany_id(Integer company_id) {
    this.company_id = company_id;
  }

  public String getCompany_name() {
    return company_name;
  }

  public void setCompany_name(String company_name) {
    this.company_name = company_name;
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

  public String getPrevention() {
    return prevention;
  }

  public void setPrevention(String prevention) {
    this.prevention = prevention;
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

  public String getSub_factory_name() {
    return sub_factory_name;
  }

  public void setSub_factory_name(String sub_factory_name) {
    this.sub_factory_name = sub_factory_name;
  }

  public String getDepartment_name() {
    return department_name;
  }

  public void setDepartment_name(String department_name) {
    this.department_name = department_name;
  }

  public Integer getSub_factory_id() {
    return sub_factory_id;
  }

  public void setSub_factory_id(Integer sub_factory_id) {
    this.sub_factory_id = sub_factory_id;
  }

  public Integer getManagement_department_id() {
    return management_department_id;
  }

  public void setManagement_department_id(Integer management_department_id) {
    this.management_department_id = management_department_id;
  }

  @Override
  public String toString() {
    return "StackDto{" +
        "stack_id=" + stack_id +
        ", workplace_id=" + workplace_id +
        ", company_id=" + company_id +
        ", company_name='" + company_name + '\'' +
        ", workplace_name='" + workplace_name + '\'' +
        ", stack_name='" + stack_name + '\'' +
        ", prevention='" + prevention + '\'' +
        ", reg_date=" + reg_date +
        ", note='" + note + '\'' +
        ", sub_factory_id=" + sub_factory_id +
        ", management_department_id=" + management_department_id +
        ", sub_factory_name='" + sub_factory_name + '\'' +
        ", department_name='" + department_name + '\'' +
        '}';
  }
}